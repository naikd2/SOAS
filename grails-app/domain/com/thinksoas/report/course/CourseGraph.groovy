package com.thinksoas.report.course

import com.thinksoas.data.StudentOutcome

class CourseGraph {

    CourseReport report
    StudentOutcome outcome
    String image

    CourseGraph(CourseReport report, StudentOutcome outcome) {
        this()
        this.report = report
        this.outcome = outcome
    }

    static belongsTo = [report: CourseReport]

    static constraints = {
        image sqlType:"text"
    }

}



