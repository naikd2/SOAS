package com.thinksoas

class Program {

	String programName
	Integer numOfStudentOutcomes
	boolean currentProgram 
    static constraints = {
    	programName(blank:false)
    	numOfStudentOutcomes(range:1..24)
    }

    static mapping = {
        currentProgram(default:true)
    }

    String toString() {
    	"$programName"
    }
}
