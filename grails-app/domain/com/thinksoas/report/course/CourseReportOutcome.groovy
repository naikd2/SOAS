package com.thinksoas.report.course

import com.thinksoas.data.StudentOutcome

class CourseReportOutcome {

    CourseReportObjective objective
    StudentOutcome outcome
    String notes = ""
    String actionItems = ""
    List<CourseReportMethod> methods = []

    static belongsTo = [objective: CourseReportObjective]
    static hasMany = [methods : CourseReportMethod]

    CourseReportOutcome(CourseReportObjective objective, StudentOutcome outcome) {
        this()
        this.objective = objective
        this.outcome = outcome
    }

    static mapping = {
        notes sqlType:"text"
        actionItems sqlType:"text"
    }

    static constraints = {
        notes(nullable: true)
        actionItems(nullable: true)
    }

    String toString() {
        "$objective - $outcome"
    }
}
