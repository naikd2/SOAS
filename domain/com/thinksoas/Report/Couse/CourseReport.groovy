package com.thinksoas.Report.Couse

import com.thinksoas.Class

class CourseReport {

    Class section
    List<CourseReportObjective> objectives = []

    CourseReport(Class section) {
        this()
        this.section = section
    }

    static belongsTo = [section: Class]
    static hasMany = [objectives: CourseReportObjective]

    static constraints = {

    }

    String toString() {
        "$section - Report"
    }

}
