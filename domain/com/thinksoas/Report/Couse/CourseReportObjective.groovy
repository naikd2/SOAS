package com.thinksoas.Report.Couse

import com.thinksoas.CourseObjective

class CourseReportObjective {

    CourseReport report
    CourseObjective objective
    String instrument
    BigDecimal min
    BigDecimal max
    List<CourseReportOutcome> outcomes = []

    static belongsTo = [report: CourseReport]
    static hasMany = [outcomes: CourseReportOutcome]

    CourseReportObjective(CourseReport report, CourseObjective objective) {
        this()
        this.report = report
        this.objective = objective
    }
    static constraints = {
    }


    String toString() {
        "$report - $objective"
    }
}
