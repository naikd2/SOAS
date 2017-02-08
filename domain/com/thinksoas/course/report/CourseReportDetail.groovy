package com.thinksoas.course.report

import com.thinksoas.CourseObjective

class CourseReportDetail {

    CourseReport report
    CourseObjective objective
    String instrument
    Double min
    Double max

    static belongsTo = [report: CourseReport]
    static constraints = {

    }

}
