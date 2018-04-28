package com.thinksoas.data

class Program {

    String programName = "Program Name"
    BigDecimal performanceTarget
    BigDecimal assessmentPeriod
    BigDecimal performanceThreshold
    BigDecimal deltaValue
    String settings = "SETTINGS"
    List methods = new ArrayList()



    static hasMany = [ methods: String ]

    static constraints = {
    }

    def beforeInsert() {
        def s = "Faculty Evaluations"
        this.methods.add(s)
        def s1 = "Student Surveys"
        this.methods.add(s1)
        println("----insert----")
    }

    String toString() {
        "$programName"
    }
}
