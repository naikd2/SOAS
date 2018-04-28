package com.thinksoas.report.outcome

import com.thinksoas.data.CourseObjective

class OutcomeReportCriteria {

    OutcomeReport report
    CourseObjective objective
    String description

    static belongsTo = [report: OutcomeReport]

    static constraints = {
    }

    static mapping = {
        description sqlType:"text"
    }

}
