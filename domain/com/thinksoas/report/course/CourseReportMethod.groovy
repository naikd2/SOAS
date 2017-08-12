package com.thinksoas.report.course

class CourseReportMethod {

    CourseReportOutcome outcome
    String method
    BigDecimal percentage

    static belongsTo = [outcome: CourseReportOutcome]

    CourseReportMethod(CourseReportOutcome outcome) {
        this.outcome = outcome
    }

    static constraints = {
    }
}
