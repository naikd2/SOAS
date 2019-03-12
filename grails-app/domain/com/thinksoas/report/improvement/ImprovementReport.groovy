package com.thinksoas.report.improvement
import com.thinksoas.report.outcome.*
import com.thinksoas.data.*

class ImprovementReport {

    StudentOutcome outcome
    String notes = ""
    String actionItem = ""
    List<ImprovementReportCourse> courses = []

    ImprovementReport(StudentOutcome outcome) {
        this()
        this.outcome = outcome
    }

    static hasMany = [courses: ImprovementReportCourse]

    static mapping = {
        notes sqlType:"text"
        actionItem sqlType:"text"
    }

    static constraints = {
        notes(nullable: true)
        actionItem(nullable: true)

    }
}
