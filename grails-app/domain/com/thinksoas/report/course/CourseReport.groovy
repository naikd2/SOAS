package com.thinksoas.report.course

import com.thinksoas.data.Class

class CourseReport {

    Class section
    List<CourseReportObjective> objectives = []
    List<CourseWork> works = []
    List<CourseGraph> graphs = []

    CourseReport(Class section) {
        this()
        this.section = section
    }

    static belongsTo = [section: Class]
    static hasMany = [objectives: CourseReportObjective, works:CourseWork, graphs:CourseGraph]

    static constraints = {
    }

    String toString() {
        "$section-Report"
    }
}
