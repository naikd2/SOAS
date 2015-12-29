package com.thinksoas

class Course {

	String subject
	String number
	String name
	String description
	String units
	String offered
    String program
    List<CourseObjective> objectives = []
    
	static  hasMany = [prereqs: Course, classes: Class, objectives: CourseObjective]

    static constraints = {
    	subject(blank:false)
    	number(blank:false)
    	name(blank:false)
    	description(blank:false)
    	units(blank:false)
    	offered(blank:false)
        program(blank:false)
    }

    String toString() {
        "$name"
    }
}