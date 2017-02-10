package com.thinksoas.course.report

import com.thinksoas.Class
import com.thinksoas.CourseObjective
import com.thinksoas.Semester
import com.thinksoas.User

class CourseReport {

    Class section
    List<CourseReportDetail> details = []

    CourseReport(Class section) {
        this()
        this.section = section
    }

    static belongsTo = [section: Class]
    static hasMany = [details: CourseReportDetail]

    static constraints = {

    }

    String toString() {
        "$section - report"
    }

}
