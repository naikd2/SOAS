package com.thinksoas

class CourseObjective {

	String prefix
	String description
	boolean deleted
				
	static transients = [ 'deleted' ]

	static hasMany = [objOut: ObjectiveOutcome]

	  String toString() {
       "$prefix: $description"
    }

    static constraints = {
    	prefix(blank:false)
    	description(blank:false)
    }
}
