package com.thinksoas.report.course

import com.thinksoas.data.Course
import com.thinksoas.data.CourseObjective
import com.thinksoas.data.StudentOutcome
import com.thinksoas.report.viewmodel.ChartModel
import com.thinksoas.report.viewmodel.Dataset
import com.thinksoas.report.viewmodel.ChartColor

import grails.transaction.Transactional

import grails.converters.JSON

import java.math.MathContext

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class CourseReportController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", checkJquery: "POST"]

    def improvementReportService

    def courseReportService

    def semesterService

    def modal() {

    }

    def modal2() {
        redirect action: "index"
    }

    def index(Integer max) {
        //exportChart()
        params.max = Math.min(max ?: 10, 100)
        respond CourseReport.list(params), model: [courseReportInstanceCount: CourseReport.count()]
    }

    def checkJquery() {
        def jsonObj = request.JSON

        println(jsonObj)
        respond view:'chartjs'
    }

    def show(CourseReport courseReportInstance) {
        respond courseReportInstance, model:[report: courseReportInstance, objectives: courseReportInstance.objectives]
    }

    def create() {
        respond new CourseReport(params)
    }

    def report(CourseReport courseReportInstance) {
        String report = createTable(courseReportInstance)

        def tabs = []
        Map<StudentOutcome, ChartModel> chartMap = new HashMap<>()

        for (StudentOutcome outcome : StudentOutcome.findAll()) {
            for (CourseReportObjective reportObjective : courseReportInstance.objectives) {
                if (objectiveHasOutcome(reportObjective, outcome)) {
                    tabs.add(outcome)
                    break
                }
            }
        }

        for (StudentOutcome outcome : courseReportService.findAllReleventOutcomes(courseReportInstance.getId())) {
            chartMap.put(outcome, new ChartModel())
        }

        Queue<ChartColor> colors = new LinkedList<>(Arrays.asList(ChartColor.BLUE, ChartColor.RED))
        Map<String, ChartColor> methodToColor = new HashMap<>()

        for (CourseReportObjective rObjective: courseReportInstance.objectives) {
            for (CourseReportOutcome rOutcome : rObjective.outcomes) {
                ChartModel chart = chartMap.get(rOutcome.outcome)
                chart.addToLabels(rObjective.objective.prefix)
                BigDecimal delta = 0.0
                for (CourseReportMethod method : rOutcome.methods) {
                    String methodLabel = method.getMethod()
                    ChartColor color
                    if (methodToColor.containsKey(methodLabel)) {
                        color = methodToColor.get(methodLabel)
                    } else {
                        color = colors.pop()
                        methodToColor.put(methodLabel, color)
                    }
                    BigDecimal value = method.percentage
                    delta = delta.subtract(value).abs()
                    chart.addToDataSet(methodLabel, value.toPlainString(), color)
                }
                chart.addToDataSet("Delta", delta.toPlainString(), ChartColor.YELLOW)
            }
        }

        [courseReportInstance: courseReportInstance, report: report, tabs: tabs, reportSemester : courseReportInstance.section.semester, chartData: chartMap]
    }

    def prevSemester(CourseReport courseReportInstance) {
        // Previous Semester to show
        def prevSemesterInstance = courseReportInstance.section.semester.id - 1

        // Cycle through reports, find reports for the current course and the semester determined above
        for (CourseReport report : CourseReport.findAll()) {
            if (report.section.semester.id == prevSemesterInstance && report.section.course.id == courseReportInstance.section.course.id) {
                redirect(action: "report", courseReportInstance.id)
            }
        }

        redirect(action: "report", courseReportInstance.id)
    }

    def nextSemester(CourseReport courseReportInstance) {
        def nextSemesterInstance = courseReportInstance.section.semester.id + 1

        // Cycle through reports, find reports for the current course and the semester determined above
        for (CourseReport report : CourseReport.findAll()) {
            if (report.section.semester.id == nextSemesterInstance && report.section.course.id == courseReportInstance.section.course.id) {
                redirect(action: "report", courseReportInstance.id)
            }
        }

        redirect(action: "report", courseReportInstance.id)
    }

    @Transactional
    def SO() {
        improvementReportService.calculate()
    }

    @Transactional
    def save(CourseReport courseReportInstance) {
        if (courseReportInstance == null) {
            notFound()
            return
        }

        if (courseReportInstance.hasErrors()) {
            respond courseReportInstance.errors, view: 'create'
            return
        }

        courseReportInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'courseReport.label', default: 'CourseReport'), courseReportInstance.id])
                redirect courseReportInstance
            }
            '*' { respond courseReportInstance, [status: CREATED] }
        }
    }

    def edit(CourseReportObjective objective) {
        respond objective, model: [objective: objective]
    }

    def chartjs() {
        respond view:'chartjs'
    }

    def exportWord(CourseReport courseReportInstance) {
        def objectives = courseReportInstance.getObjectives()
        def filename ="test" + ".xlsx"

        Map<StudentOutcome, Map<CourseObjective, ObjectiveRow>> excelmap = new HashMap<StudentOutcome, Map<CourseObjective, ObjectiveRow>>()

        for (CourseReportObjective objective : objectives) {
            def outcomes = objective.outcomes
            def courseObj = objective.objective
            for (CourseReportOutcome outcome : outcomes) {
                def methods = outcome.methods
                def so = outcome.outcome
                for (CourseReportMethod method : methods) {
                    def sheet
                    def rows
                    if (excelmap.containsKey(so)) {
                        sheet = excelmap.get(so)
                    } else {
                        sheet = new HashMap<CourseObjective, ObjectiveRow>()
                        excelmap.put(so, sheet)
                    }
                    if (sheet.containsKey(courseObj)) {
                        rows = sheet.get(courseObj)
                    } else {
                        rows = new ObjectiveRow()
                        sheet.put(courseObj, rows)
                    }
                    if (rows.a == null) {
                        rows.setA(method.percentage/100.00)
                    } else {
                        rows.setB(method.percentage/100.00)
                        rows.setDelta(Math.abs(rows.a - rows.b))
                        rows.setOutcome(so)
                    }
                }
            }
        }


        new pl.touk.excel.export.WebXlsxExporter('/workspace/templates/OutcomeReportTemplate.xlsx').with {
            setResponseHeaders(response)
            int i = 1

            for (Map<CourseObjective, ObjectiveRow> r : excelmap.values()) {
                def rows = r.values()
                def sheetname = 'Outcome ' + i

                ObjectiveRow row0 = rows[0]
                ObjectiveRow row1 = rows[1]
                sheet(sheetname).with {
                    putCellValue(0, 1, row0.outcome.prefix)
                    putCellValue(1, 1, row0.outcome.description)

                    putCellValue(3, 1, row0.a)
                    putCellValue(3, 2, row0.b)
                    putCellValue(3, 3, row1.delta)
                    putCellValue(4, 1, row1.a)
                    putCellValue(4, 2, row1.b)
                    putCellValue(4, 3, row1.delta)

                }
                i++
            }

            save(response.outputStream)
        }

    }

    def createRows(List<ObjectiveRow> rows) {
        int rowNumber = 3

        for (ObjectiveRow row : rows) {
            println(row)
            putCellValue(rowNumber, 1, 10)
            putCellValue(rowNumber, 2, 10)
            rowNumber++
        }

        def filename = courseReportInstance.section.toString() + ".docx"
        wordMLPackage.save(new java.io.File(System.getProperty("user.home"), "Desktop/" + filename))
        redirect action: "index", method: "GET"
    }

    @Transactional
    def update(CourseReportObjective courseReportInstance) {
        println(courseReportInstance)
        if (courseReportInstance == null) {
            notFound()
            return
        }

        if (courseReportInstance.hasErrors()) {
            respond courseReportInstance.errors, view: 'edit'
            return
        }

        //   courseReportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CourseReport.label', default: 'CourseReport'), courseReportInstance.id])
                redirect courseReportInstance
            }
            '*' { respond courseReportInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CourseReport courseReportInstance) {

        if (courseReportInstance == null) {
            notFound()
            return
        }

        courseReportInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CourseReport.label', default: 'CourseReport'), courseReportInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseReport.label', default: 'CourseReport'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def createTable(CourseReport courseReportInstance) {
        String table = ""

        //int graph_number = 0

        // Emphasize outcomes
        table += createOutcomes(courseReportInstance)

        return table
    }

    def createOutcomes(CourseReport courseReportInstance) {
        String table = ""
        String buttons = "<div class=\"tab\" style=\"text-align: center\">"

        int graph_number = 0

        //table+= "</br><div id=\"Report\" style=\"text-align: center\"><span style=\"font-weight:bold; font-size: 24px\">Outcomes</span></br></br>"

        for (StudentOutcome studentOutcome : StudentOutcome.getAll()) { // Iterate through all outcomes
            buttons += createButtons(courseReportInstance, studentOutcome)
            table += addMethodData(courseReportInstance, studentOutcome, graph_number)
            graph_number = graph_number + 100
        }

        // table += "</div>"

        buttons += "</div></br>" + table

        return buttons
    }

    def createButtons(CourseReport courseReportInstance, StudentOutcome outcome) {

        String buttons = ""

        for (CourseReportObjective reportObjective : courseReportInstance.objectives) {
            if (objectiveHasOutcome(reportObjective, outcome)) {
                println("Hello")
                buttons += "<button class=\"tablinks\" onclick=\"SetupTabs(event, 'Student Performance " + outcome.prefix + "')\">Student Performance " + outcome.prefix + "</button>"
                return buttons
            }
        }

        return buttons
    }

    def addMethodData(CourseReport courseReportInstance, StudentOutcome outcome, int graph_number) {
        String returner = ""
        String returner2 = ""

        String graph = "<div id=\"graphs\">"
        boolean table_started = false // To make sure headers aren't created multiple times

        boolean create_score_subnote = false // whether or not to make a footnote about a low %
        boolean create_delta_subnote = false // whether or not to make a footnote about a high delta
        def settings = com.thinksoas.data.Program.findBySettings("SETTINGS")


        BigDecimal target = settings.performanceTarget
        BigDecimal deltaTarget = settings.deltaValue

        for (CourseReportObjective reportObjective : courseReportInstance.objectives) {
            if (objectiveHasOutcome(reportObjective, outcome)) {

                if (!table_started) { // If table header hasn't been generated yet.
                    returner += "<div id=\"Student Performance " + outcome.prefix + "\" class=\"tabcontent\" style=\"font-size: 20px; text-align: center; padding-top: 65px\">Student Performance " + outcome + "</span></br></br>"
                    // Create title
                    returner += "<div id=\"ReportTable\"><table style=\"font-size: 16px; text-align: center; width:70%; margin-left:15%; margin-right:15%;\" border=\"1\" class=\"fixed\"><tr><th>Objective</th><th>Faculty Evaluations</th><th>Student Surveys</th><th>Delta</th></tr>"
                    // Begin table
                    table_started = true
                }


                returner += "<tr><td>" + reportObjective.objective.prefix + "</td>"
                for (CourseReportOutcome reportOutcome : reportObjective.outcomes) {
                    if (reportOutcome.outcome == outcome) {

                        int score1 = -1
                        int score2 = -1

                        for (CourseReportMethod reportMethod : reportOutcome.methods) {
                            if (reportMethod.percentage < target) {
                                returner += "<td><span style=\"font-weight:bold; color: red\">" + reportMethod.percentage + "%</span> <sup>1</sup></td>"
                                create_score_subnote = true
                            } else {
                                returner += "<td>" + reportMethod.percentage + "%</td>"
                            }
                            if (score1 == -1) {
                                score1 = reportMethod.percentage
                            } else {
                                score2 = reportMethod.percentage
                            }
                        }

                        BigDecimal delta = findDelta(reportOutcome)

                        if (delta > deltaTarget) {
                            returner += "<td><span style=\"font-weight:bold; color: red\">" + delta.toString() + "%</span> <sup>2</sup></td></tr>"
                            create_delta_subnote = true
                        } else {
                            returner += "<td>" + delta.toString() + "%</td></tr>"
                        }

                        graph += createBarGraph(graph_number, reportObjective.objective.prefix, score1, score2, delta, "Method 1", "Method 2")
                        graph_number++
                        returner2 += "<form action=\"/soas/courseReport/myExampleAction/${reportOutcome.id}\">"
                        // returner2 += "</br>Objective ${reportObjective.objective.prefix}:</br><a href=\"${createLink(action: 'myExampleAction', id: "")}\">save</a>"

                        returner2 += "</br>Notes/Action Items: Objective ${reportOutcome.objective.objective.prefix}</br>" +
                                "<textarea class=\"form-control\" rows=\"5\" name=\"notes\">${reportOutcome.notes} </textarea>"
                        returner2 += "<input type=\"submit\" name=\"create\" class=\"btn btn-primary btn-block\" value=\"Save\" id=\"create\">"
                        returner2 += "</form>"

                    }
                }
            }
        }

        if (table_started) {
            graph += "</br><span style=\"text-align: center; color: blue; font-weight:bold; font-size: 16px\">Faculty Evaluation</span></br>"
            graph += "<span style=\"text-align: center; color: Orange; font-weight:bold; font-size: 16px\">Student Surveys</span></br>"
            graph += "<span style=\"text-align: center; color: Green; font-weight:bold; font-size: 16px\">Delta</span></br>"

            returner += "</table>"



            if (create_score_subnote) {
                returner += "<span style=\"font-size: 12px\">1: This result does not meet expectations of " +
                        target +
                        "% or greater.</span></br>"
            }

            if (create_delta_subnote) {
                returner += "<span style=\"font-size: 12px\">2: In all cases delta must be " +
                        deltaTarget +
                        "% or less.</span></br>"
            }

            returner += "</br>" + graph + "</div>"
            returner += returner2

            returner += "</div></div>"

        }

        return returner
    }

    @Transactional
    def myExampleAction(long id) {
        def rOutcome = CourseReportOutcome.findById(id)
        rOutcome.setNotes(params.notes)
        rOutcome.setActionItems(params.notes)
        rOutcome.save(flush: true)
        println(rOutcome)
        println("my action:" + params.notes)
        println("my id:" + id)
        redirect(action: index())
    }

    @Transactional
    def myExampleAction2(long id) {
        def rImprovement = com.thinksoas.report.improvement.ImprovementReport.findById(id)
        rImprovement.setNotes(params.notes)
        rImprovement.setActionItem(params.actionitems)
        rImprovement.save(flush: true)
        println(rImprovement)
        println("my action:" + params.notes)
        println("my id:" + id)
        redirect(action: SO())
    }

    def createBarGraph(int graph_number, String label, BigDecimal score1, BigDecimal score2, BigDecimal delta, String Method1Label, String Method2Label) {
        String graph = ""
        graph += "<div id=\"graphDiv" + graph_number
        graph += "\" style=\"top: 50%; left: 50%; display: inline-block; padding-right: 50px; padding-left: 50px; text-align: center\"><script>(function () {function createCanvas(divName) {var div = document.getElementById(divName);var canvas = document.createElement('canvas');div.appendChild(canvas);if (typeof G_vmlCanvasManager !== 'undefined') {canvas = G_vmlCanvasManager.initElement(canvas);}var ctx = canvas.getContext(\"2d\");return ctx;}var ctx = createCanvas(\"graphDiv" + graph_number
        graph += "\");var graph = new BarGraph(ctx);graph.xAxisLabelArr = [\"\",\"" + label
        graph += "\", \"\"];graph.update([" + score1
        graph += ", " + score2
        graph += ", " + delta
        graph += "]);}());  </script></div>"

        // Labels under graph


        return graph
    }


    def findDelta(CourseReportOutcome outcome) {
        BigDecimal delta = 0.0
        for (CourseReportMethod reportMethod : outcome.methods) {
            delta = reportMethod.percentage - delta
        }
        if (delta < 0) {
            delta = delta * -1
        }
        return delta
    }

    def findDeltaFromScores(BigDecimal score1, BigDecimal score2) {
        BigDecimal delta = 0.0
        delta = score1 - score2
        if (delta < 0) {
            delta = delta * -1
        }
        return delta
    }


    def objectiveHasOutcome(CourseReportObjective reportObjective, StudentOutcome outcome) {
        for (CourseReportOutcome reportOutcome : reportObjective.outcomes) {
            if (reportOutcome.getOutcome() == outcome) {
                return true
            }
        }
        return false
    }

    def createStudentOutcomeReport() {

    }

    def createFullButtonOverlay() {
        String buttons = ""

        for (StudentOutcome studentOutcome : StudentOutcome.getAll()) { // Iterate through all outcomes
            buttons += "<button class=\"tablinks\" onclick=\"SetupTabs(event, 'Student Performance " + studentOutcome.prefix + "')\">Student Performance " + studentOutcome.prefix + "</button>"
        }

        return buttons
    }

    def checkIfCourseHasOutcome(Course course, StudentOutcome outcome) {
        for (CourseObjective Objective : course.objectives) {
            for (StudentOutcome otcm : Objective.reinforceOutcomes) {
                if (otcm == outcome) {
                    return true
                }
            }
            for (StudentOutcome otcm : Objective.emphasizeOutcomes) {
                if (otcm == outcome) {
                    return true
                }
            }
        }

        return false
    }

    def checkIfCourseReportHasCourse(Course course, CourseReport csreport) {
        if (csreport.section.course == course) {
            return true
        }

        return false
    }

    def createSOReport() {


        returner += createSOReportDetails(DataForSO, graph_number, so)

        return returner
    }

    def createSOReportDetails(List<SOReportData> Datas, Integer graph_number, StudentOutcome outcome) {
        String returner = ""
        String graph = "<div id=\"graphs\">"

        def create_score_subnote = false
        def create_delta_subnote = false


        returner += "<div id=\"Student Performance " + outcome.prefix + "\" class=\"tabcontent\" style=\"font-size: 20px; text-align: center; padding-top: 65px\">Student Performance " + outcome + "</span></br></br>"

        if (Datas.size() == 0) {
            returner += "<span style=\"font-style: italic; font-size: 16px;\">There doesn't seem to be any courses assigned to this outcome in the system.</span></div>"
            return returner
        }

        // Create title
        returner += "<div id=\"ReportTable\"><table style=\"font-size: 16px; text-align: center; width:70%; margin-left:15%; margin-right:15%;\" border=\"1\" class=\"fixed\"><tr><th>Course</th><th>Faculty Evaluations</th><th>Student Surveys</th><th>Delta</th></tr>"



        Datas.each { SOReportData datas ->
            returner += "<tr><td>" + datas.name + "</td>"
            if (datas.score1 < 70) {
                returner += "<td><span style=\"font-weight:bold; color: red\">" + datas.score1 + "%</span> <sup>1</sup></td>"
                create_score_subnote = true
            } else {
                returner += "<td>" + datas.score1 + "%</td>"
            }

            if (datas.score2 < 70) {
                returner += "<td><span style=\"font-weight:bold; color: red\">" + datas.score2 + "%</span> <sup>1</sup></td>"
                create_score_subnote = true
            } else {
                returner += "<td>" + datas.score2 + "%</td>"
            }

            if (datas.delta > 15) {
                returner += "<td><span style=\"font-weight:bold; color: red\">" + datas.delta + "%</span> <sup>2</sup></td></tr>"
                create_delta_subnote = true
            } else {
                returner += "<td>" + datas.delta + "%</td></tr>"
            }


            graph += createBarGraph(graph_number, datas.name, datas.score1, datas.score2, datas.delta, "Method 1", "Method 2")
            graph_number++
        }




        graph += "</br><span style=\"text-align: center; color: blue; font-weight:bold; font-size: 16px\">Faculty Evaluation</span></br>"
        graph += "<span style=\"text-align: center; color: Orange; font-weight:bold; font-size: 16px\">Student Surveys</span></br>"
        graph += "<span style=\"text-align: center; color: Green; font-weight:bold; font-size: 16px\">Delta</span></br>"


        returner += "</table>"

        if (create_score_subnote) {
            returner += "<span style=\"font-size: 12px\">1: This result does not meet expectations of 70% or greater.</span></br>"
        }

        if (create_delta_subnote) {
            returner += "<span style=\"font-size: 12px\">2: In all cases delta must be 15% or less.</span></br>"
        }

        returner += "</br>" + graph + "</div>"

        returner += "</br><form>Notes:</br><textarea style=\"width: 75%; height: 96px; word-wrap: break-word;\"></textarea>"
        returner += "</br><form>Action Items:</br><textarea style=\"width: 75%; height: 96px; word-wrap: break-word;\"></textarea>"
        returner += "</div></div>"



        return returner

    }

    def createSOReportData(List<CourseReport> lister, StudentOutcome StudentOutcomeToBeAssessed) {

        BigDecimal scores1 = 0
        BigDecimal scores2 = 0

        BigDecimal studentcount1 = 0
        BigDecimal studentcount2 = 0

        BigDecimal avg1 = 0
        BigDecimal avg2 = 0

        def coursename = ""

        lister.each { CourseReport csreport ->
            csreport.objectives.each { CourseReportObjective obj ->
                if (objectiveHasOutcome(obj, StudentOutcomeToBeAssessed)) {
                    obj.outcomes.each { CourseReportOutcome stdo ->
                        if (stdo.outcome == StudentOutcomeToBeAssessed) {
                            scores1 += (stdo.methods[0].percentage * csreport.section.students)
                            scores2 += (stdo.methods[1].percentage * csreport.section.students)

                            studentcount1 += csreport.section.students
                            studentcount2 += csreport.section.students

                            coursename = csreport.section.course.name
                        }
                    }
                }


            }
        }

        avg1 = scores1.divide(studentcount1)
        avg2 = scores2.divide(studentcount2)

        avg1 = avg1.round(new MathContext(4))
        avg2 = avg2.round(new MathContext(4))

        def returner = new SOReportData()

        returner.name = coursename
        returner.score1 = avg1
        returner.score2 = avg2
        returner.delta = findDeltaFromScores(avg1, avg2)


        return returner
    }


    private class SOReportData {
        String name = ""
        def score1 = 0
        def score2 = 0
        def delta = 0
    }

    def multiSave = { MultipleMethodCommand command ->
        command.method.each { p ->
            if (p != null) {
                if (p.percentage != null) {
                    CourseReportMethod method = CourseReportMethod.get(p.id)
                    method.properties = p.properties
                    method.percentage = p.percentage.toDouble()
                    method.save flush: true
                }

                if (p.max != null) {
                    CourseReportObjective o = CourseReportObjective.get(p.id)
                    o.properties = p.properties
                    o.instrument = p.instrument
                    o.max = p.max.toDouble()
                    o.min = p.min.toDouble()
                    o.save flush: true
                }
            }
        }

        redirect(controller: 'courseReport', action: 'index')
    }
}

class SingleMethodCommand {
    Integer id
    String percentage = null
    String min = null
    String max = null
    String instrument = null
    CourseReport CourseReportInstance
}

class MultipleMethodCommand {
    List<SingleMethodCommand> method = [].withDefault({ new SingleMethodCommand() })
}

class ObjectiveRow {
    BigDecimal a = null
    BigDecimal b = null
    BigDecimal delta = null
    StudentOutcome outcome = null
}