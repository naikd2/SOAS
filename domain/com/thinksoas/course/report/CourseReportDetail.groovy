package com.thinksoas.course.report

import com.thinksoas.CourseObjective

class CourseReportDetail {

    CourseReport report
    CourseObjective objective
    String instrument
    BigDecimal min
    BigDecimal max

    static belongsTo = [report: CourseReport]
    static constraints = {

    }

}
