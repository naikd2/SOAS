package com.thinksoas

class PerformanceCriteria {

    SO_Report report
    CourseObjective objective
    List<MOAssessments> assessments = []

    static belongsTo = [report: SO_Report]
    static hasMany = [assessments: MOAssessments]

    static constraints = {
    }

    String toString() {
        "$report"
    }
}
