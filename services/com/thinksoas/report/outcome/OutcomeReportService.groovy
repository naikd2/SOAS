package com.thinksoas.report.outcome

import grails.transaction.Transactional
import com.thinksoas.report.improvement.ImprovementReport
import com.thinksoas.report.improvement.ImprovementReportCourse
import com.thinksoas.report.improvement.ImprovementReportMethod

import com.thinksoas.report.course.CourseReport
import com.thinksoas.data.*

@Transactional
class OutcomeReportService {


    def updateImprovementReport(OutcomeReport outcomeReport) {

        ImprovementReport improvementReport = ImprovementReport.findByOutcome(outcomeReport.outcome)

        // clear current details from report

        improvementReport.notes = ""
        improvementReport.actionItem = ""
        if (improvementReport.courses.size() != 0) {
            for (ImprovementReportCourse reportCourse: improvementReport.courses) {
                reportCourse.delete()
            }
        }

        def courseReports = []
        for (OutcomeReportCriteria criteria : outcomeReport.criteria) {
            def course = criteria.objective.course
            //def methods = Arrays.asList(criteria.objective.method1, criteria.objective.method2)
            def reportCourse = new ImprovementReportCourse(report: improvementReport, course: course)
            def method1 = new ImprovementReportMethod(reportCourse: reportCourse, method: criteria.objective.method1, percentage: BigDecimal.ZERO)
            def method2 = new ImprovementReportMethod(reportCourse: reportCourse, method: criteria.objective.method2, percentage: BigDecimal.ZERO)

            reportCourse.methods = Arrays.asList(method1, method2)
            courseReports.add(reportCourse)
        }

        improvementReport.courses = courseReports

        def v = improvementReport.save()
    }

}
