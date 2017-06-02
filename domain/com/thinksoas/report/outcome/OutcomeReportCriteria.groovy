package com.thinksoas.report.outcome

import com.thinksoas.data.CourseObjective

class OutcomeReportCriteria {

    OutcomeReport report
    CourseObjective objective
    List<OutcomeReportAssessment> assessments = []

    static belongsTo = [report: OutcomeReport]
    static hasMany = [assessments: OutcomeReportAssessment]

    static constraints = {
    }

    String toString() {
        "$report"
    }
}
