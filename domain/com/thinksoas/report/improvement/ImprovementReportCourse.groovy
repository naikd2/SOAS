package com.thinksoas.report.improvement
import com.thinksoas.data.Course

class ImprovementReportCourse {

    ImprovementReport report
    Course course
    List<ImprovementReportMethod> methods = []

    ImprovementReportCourse(ImprovementReport report, Course course) {
        this()
        this.report = report
        this.course = course
    }

    static belongsTo = [report: ImprovementReport]
    static hasMany = [methods: ImprovementReportMethod]

    static constraints = {
    }

}

