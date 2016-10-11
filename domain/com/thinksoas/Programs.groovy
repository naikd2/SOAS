package com.thinksoas

class Programs {

    String programName = "Program Name"
    String performanceTarget
    String assessmentPeriod
    String performanceThreshold
    String deltaValue
    String settings = "SETTINGS"
    List methods = new ArrayList()

    static hasMany = [ methods: String ]
    static constraints = {
    }

    def beforeInsert() {
//        this.methods.add(sdd)
//        String s = "Student Surveys"
//        this.methods.add(s)
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
