package com.thinksoas

class Programs {

	String programName

    static constraints = {
    	programName(blank:false)
    }

    String toString() {
    	"$programName"
    }
}
