package com.thinksoas

class StudentOutcome {

	String prefix
	String description 

    static constraints = {
    	prefix(blank:false)
    	description(blank:false)
    }

    String toString() {
        "$prefix: $description"
    }
}