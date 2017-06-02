package com.thinksoas.report.course

import com.thinksoas.data.StudentOutcome

class CourseReportOutcome {

    CourseReportObjective objective
    StudentOutcome outcome
    List<CourseReportMethod> methods = []

    static belongsTo = [objective: CourseReportObjective]
    static hasMany = [methods : CourseReportMethod]

    CourseReportOutcome(CourseReportObjective objective, StudentOutcome outcome) {
        this()
        this.objective = objective
        this.outcome = outcome
    }

    static constraints = {
    }

    String toString() {
        "$objective - $outcome"
    }
}
