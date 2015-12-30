package com.thinksoas

class ObjectiveOutcome {

	CourseObjective objective
	StudentOutcome outcome
	String level

    static constraints = {
    	objective(nullable:false)
    	outcome(nullable:false)
    	level(inList:["High","Medium","Low"])
    	
    }
}
