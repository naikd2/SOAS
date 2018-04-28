package com.thinksoas.report.improvement
import com.thinksoas.data.Course
import com.thinksoas.data.CourseObjective
import com.thinksoas.report.outcome.OutcomeReportCriteria


class ImprovementReportCourse {

    ImprovementReport report
    CourseObjective courseObjective
    OutcomeReportCriteria criteria
    List<ImprovementReportMethod> methods = []

    ImprovementReportCourse(ImprovementReport report, CourseObjective courseObjective, OutcomeReportCriteria criteria) {
        this()
        this.report = report
        this.courseObjective = courseObjective
        this.criteria = criteria
    }

    static belongsTo = [report: ImprovementReport]
    static hasMany = [methods: ImprovementReportMethod]

    static constraints = {
    }

}

