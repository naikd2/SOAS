package com.thinksoas.report.improvement

class ImprovementReportMethod {

    ImprovementReportCourse reportCourse
    String method
    BigDecimal percentage

    ImprovementReportMethod(ImprovementReportCourse reportCourse, String method, BigDecimal percentage) {
        this()
        this.reportCourse = reportCourse
        this.method = method
        this.percentage = percentage
    }

    static belongsTo = [reportCourse: ImprovementReportCourse]

    static constraints = {
    }

}
