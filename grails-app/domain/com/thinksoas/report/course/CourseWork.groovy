package com.thinksoas.report.course

class CourseWork {

    CourseReport report
    String filename
    String fullPath
    Date uploadDate = new Date()

    CourseWork(CourseReport report) {
        this()
        this.report = report
    }

    static belongsTo = [report: CourseReport]

    static constraints = {
        filename(blank:false,nullable:false)
        fullPath(blank:false,nullable:false)
    }
}
