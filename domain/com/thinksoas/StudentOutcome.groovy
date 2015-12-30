package com.thinksoas

class StudentOutcome {

    String program
	String prefix
	String description 

	static hasMany = [objOut: ObjectiveOutcome]


    static constraints = {
    	prefix(blank:false)
    	description(blank:false)
        program(blank:false)
    }

    String toString() {
        "$prefix: $description"
    }
}
