package com.thinksoas

import com.thinksoas.Report.Couse.CourseReport
import com.thinksoas.Report.Couse.CourseReportObjective
import com.thinksoas.Report.Couse.CourseReportOutcome
import com.thinksoas.Report.Couse.CourseReportMethod
import grails.transaction.Transactional

class ClassException extends RuntimeException {


}

@Transactional
class ClassService {

    Semester getActiveSemester() {
        def semesterList = Semester.findAll();
        for (Semester s : semesterList) {
            if(s.active) {
                return s
            }
        }
        return null
    }

    Course getCourse(Long classId) {
        def s = Class.findById(classId)
        if (s != null) {
            return s.getCourse();
        }
    }

    CourseReport generateCourseReport2(Long classId) {
        def courseSection = Class.findById(classId)
        def report = new CourseReport(section: courseSection)
        println(report)
        def course = getCourse(classId)
        def courseObjectives = course.getObjectives()
        def reportObjectives = []
        for (CourseObjective courseObjective : courseObjectives) {
            def reportObjective = new CourseReportObjective(report: report, objective: courseObjective)
            reportObjective.max = BigDecimal.ZERO
            reportObjective.min = BigDecimal.ZERO
            reportObjective.instrument = ""
            println(reportObjective)

            def reportOutcomes = []
            def combinedList = courseObjective.reinforceOutcomes + courseObjective.emphasizeOutcomes
            for (StudentOutcome so : combinedList) {
                def reportOutcome = new CourseReportOutcome(objective: reportObjective, outcome: so)
                def reportDetails = []

                def detail1 = new CourseReportMethod(outcome: reportOutcome)
                detail1.method = courseObjective.method1
                detail1.percentage = BigDecimal.ZERO
                reportDetails.add(detail1)

                def detail2 = new CourseReportMethod(outcome: reportOutcome)
                detail2.method = courseObjective.method2
                detail2.percentage = BigDecimal.ZERO
                reportDetails.add(detail2)

                reportOutcome.methods = reportDetails
                reportOutcomes.add(reportOutcome)
            }
            reportObjective.outcomes = reportOutcomes
            reportObjectives.add(reportObjective)
        }
        report.objectives = reportObjectives
        return report
    }

    List<String> getReportRow(CourseReport report) {

    }

}