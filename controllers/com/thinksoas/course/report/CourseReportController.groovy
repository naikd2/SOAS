package com.thinksoas.course.report

import com.thinksoas.Report.Couse.*
import com.thinksoas.StudentOutcome
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class CourseReportController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CourseReport.list(params), model:[courseReportInstanceCount: CourseReport.count()]
    }

    def show(CourseReport courseReportInstance) {
        println(com.thinksoas.StudentOutcome.list().size())

        respond courseReportInstance, model:[report: courseReportInstance, objectives: courseReportInstance.objectives]
    }

    def create() {
        respond new CourseReport(params)
    }

    def report(CourseReport courseReportInstance) {
        String report = createTable(courseReportInstance)
        [courseReportInstance: courseReportInstance, report: report]
    }

    @Transactional
    def save(CourseReport courseReportInstance) {
        if (courseReportInstance == null) {
            notFound()
            return
        }

        if (courseReportInstance.hasErrors()) {
            respond courseReportInstance.errors, view:'create'
            return
        }

        courseReportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'courseReport.label', default: 'CourseReport'), courseReportInstance.id])
                redirect courseReportInstance
            }
            '*' { respond courseReportInstance, [status: CREATED] }
        }
    }

    def edit(CourseReportObjective objective) {
        respond objective, model:[objective: objective]
    }

    @Transactional
    def update(CourseReportObjective courseReportInstance) {
        println(courseReportInstance)
        if (courseReportInstance == null) {
            notFound()
            return
        }

        if (courseReportInstance.hasErrors()) {
            respond courseReportInstance.errors, view:'edit'
            return
        }

     //   courseReportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CourseReport.label', default: 'CourseReport'), courseReportInstance.id])
                redirect courseReportInstance
            }
            '*'{ respond courseReportInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CourseReport courseReportInstance) {

        if (courseReportInstance == null) {
            notFound()
            return
        }

        courseReportInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CourseReport.label', default: 'CourseReport'), courseReportInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseReport.label', default: 'CourseReport'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def createBarGraph(int graph_number, String label, BigDecimal score1, BigDecimal score2, BigDecimal delta) {
        String graph = ""
        graph += "<div id=\"graphDiv" + graph_number
        graph += "\"/><script>(function () {function createCanvas(divName) {var div = document.getElementById(divName);var canvas = document.createElement('canvas');div.appendChild(canvas);if (typeof G_vmlCanvasManager !== 'undefined') {canvas = G_vmlCanvasManager.initElement(canvas);}var ctx = canvas.getContext(\"2d\");return ctx;}var ctx = createCanvas(\"graphDiv" + graph_number
        graph += "\");var graph = new BarGraph(ctx);graph.xAxisLabelArr = [\"\",\"" + label
        graph += "\", \"\"];graph.update([" + score1
        graph += ", " + score2
        graph += ", " + delta
        graph += "]);}());  </script></br>"
        return graph
    }

    def createReinforceOutcomes(CourseReport courseReportInstance) {
        String table = ""

        table+= "<div style=\"text-align: center; font-size: 200%;\"></br><span style=\"font-weight:bold\">Reinforce Outcomes</span></br>"

        for (int i = 0; i < courseReportInstance.details[0].objective.reinforceOutcomes.size(); i++) {
            table+= "Student Performance (" + courseReportInstance.details[0].objective.reinforceOutcomes[i].prefix + ")</br>"

            table += "<span style= \"font-size: 50%; font-style: italic;\">" + courseReportInstance.details[0].objective.reinforceOutcomes[i].description + "</span></br>"

            int delta = courseReportInstance.details[0].max - courseReportInstance.details[0].min

            table+= "<table style=\"text-align: center; font-size: 75%;  width:50%; margin-left:25%; margin-right:25%;\" border=\"1\" class=\"fixed\"><tr><td></td><th>" + courseReportInstance.details[0].instrument +  "</th><th>" + courseReportInstance.details[0].instrument + "</th><th>Delta</th></tr>"

            delta = courseReportInstance.details[0].max - courseReportInstance.details[0].min

            table+= "<tr><td>Objective " + courseReportInstance.details[0].objective.prefix + "</td><td>" + courseReportInstance.details[0].max + "</td><td>" + courseReportInstance.details[0].min + "</td><td>" + String.valueOf(delta) +  "</td></tr>"

            for (int j = 1; j < courseReportInstance.details.size(); j++) {
                if (objectiveHasOutcome(courseReportInstance.details[j].objective, courseReportInstance.details[0].objective.reinforceOutcomes[i].prefix)) {
                    delta = courseReportInstance.details[j].max - courseReportInstance.details[j].min
                    table+= "<tr><td>Objective " + courseReportInstance.details[j].objective.prefix + "</td><td>" + courseReportInstance.details[j].max + "</td><td>" + courseReportInstance.details[j].min + "</td><td>" + String.valueOf(delta) +  "</td></tr>"
                }
            }
            table += "</table></br>"

            table += createBarGraph(graph_number, "Objective " + courseReportInstance.details[0].objective.prefix, courseReportInstance.details[0].max, courseReportInstance.details[0].min, courseReportInstance.details[0].max - courseReportInstance.details[0].min)
            graph_number = graph_number + 1
        }

        return table
    }
    def createEmphasizeOutcomes(CourseReport courseReportInstance) {
        String table = ""

        table+= "</br><span style=\"font-weight:bold\">Emphasize Outcomes</span></br>"

        for (int i = 0; i < courseReportInstance.details[0].objective.emphasizeOutcomes.size(); i++) {
            table+= "Student Performance (" + courseReportInstance.details[0].objective.emphasizeOutcomes[i].prefix + ")</br>"

            table += "<span style= \"font-size: 50%; font-style: italic;\">" + courseReportInstance.details[0].objective.emphasizeOutcomes[i].description + "</span></br>"

            table+= "<table style=\"text-align: center; font-size: 75%;  width:50%; margin-left:25%; margin-right:25%;\" border=\"1\" class=\"fixed\"><tr><td></td><th>" + courseReportInstance.details[0].instrument +  "</th><th>" + courseReportInstance.details[0].instrument + "</th><th>Delta</th></tr>"

            int delta = courseReportInstance.details[0].max - courseReportInstance.details[0].min

            table+= "<tr><td>Objective " + courseReportInstance.details[0].objective.prefix + "</td><td>" + courseReportInstance.details[0].max + "</td><td>" + courseReportInstance.details[0].min + "</td><td>" + String.valueOf(delta) +  "</td></tr>"

            for (int j = 1; j < courseReportInstance.details.size(); j++) {
                if (objectiveHasOutcome(courseReportInstance.details[j].objective, courseReportInstance.details[0].objective.emphasizeOutcomes[i].prefix)) {
                    delta = courseReportInstance.details[j].max - courseReportInstance.details[j].min
                    table+= "<tr><td>Objective " + courseReportInstance.details[j].objective.prefix + "</td><td>" + courseReportInstance.details[j].max + "</td><td>" + courseReportInstance.details[j].min + "</td><td>" + String.valueOf(delta) +  "</td></tr>"
                }
            }
            table += "</table></br>"

            table += createBarGraph(graph_number, "Objective " + courseReportInstance.details[0].objective.prefix, courseReportInstance.details[0].max, courseReportInstance.details[0].min, courseReportInstance.details[0].max - courseReportInstance.details[0].min)
            graph_number = graph_number + 1
        }

        return table
    }

    def createTable(CourseReport courseReportInstance) {
        String table = ""

        //int graph_number = 0


        // Emphasize outcomes
        table += createOutcomes(courseReportInstance)

        return table
    }

    def lookForMissingOutcomes(CourseReport courseReportInstance, String[] OutcomeList) {

    }


    def createOutcomes(CourseReport courseReportInstance) {
        String table = ""

        table+= "</br><span style=\"font-weight:bold\">Outcomes</span></br>"

        for (StudentOutcome studentOutcome : StudentOutcome.getAll()) { // Iterate through all outcomes
            table+= "Student Performance (" + studentOutcome + ")</br>" // Create title

            boolean table_started = false // To make sure headers aren't created multiple times

            for (CourseReportObjective reportObjective : courseReportInstance.objectives) {
                if (objectiveHasOutcome(reportObjective, studentOutcome)) {

                    if (!table_started) { // If table header hasn't been generated yet.
                        table+= "<table style=\"text-align: center; font-size: 75%;  width:50%; margin-left:25%; margin-right:25%;\" border=\"1\" class=\"fixed\"><tr><td></td><td>Method 1</td><td>Method 2</td><td>Delta</td></tr>" // Begin table
                        table_started = true
                    }

                    table+= "<tr><td>" + reportObjective.objective.prefix + "</td>"
                    table+= addMethodData(reportObjective, studentOutcome)
                }
            }
            table += "</table></br>"
        }

        return table
    }


    def addMethodData(CourseReportObjective reportObjective, StudentOutcome outcome) {
        String returner = ""
        for (CourseReportOutcome reportOutcome : reportObjective.outcomes) {
            if (reportOutcome.outcome == outcome) {
                for (CourseReportMethod reportMethod : reportOutcome.methods) {
                    returner += "<td>" + reportMethod.percentage + "</td>"
                }

                returner += "<td>" + findDelta(reportOutcome).toString() + "</td></tr>"
            }
        }
        return returner
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


    def objectiveHasOutcome(CourseReportObjective reportObjective, StudentOutcome outcome) {
        for (CourseReportOutcome reportOutcome : reportObjective.outcomes) {
            if (reportOutcome.getOutcome() == outcome) {
                return true
            }
        }
        return false
    }

}
