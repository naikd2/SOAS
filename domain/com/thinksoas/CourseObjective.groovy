package com.thinksoas

class CourseObjective {

	String prefix
	String description
	boolean deleted
	Level a
	Level b
	Level c
	Level d	
	Level e
	Level f
	Level g
	Level h
	Level i
	Level j
	Level k				
	static transients = [ 'deleted' ]

	static hasMany = [objOut: ObjectiveOutcome]

	  String toString() {
       "$prefix: $description"
    }

    static constraints = {
    	prefix(blank:false)
    	description(blank:false)
    }

    enum Level {
	
	LOW,
	MEDIUM,
	HIGH
	} 
}
