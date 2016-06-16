package com.thinksoas

class Programs {

    String programName
    String performanceTarget
    String assessmentPeriod
    String performanceThreshold
    String deltaValue

    static constraints = {
    	programName(blank:false)
    }

    String toString() {
    	"$programName"
    }
}
