package com.thinksoas

import com.thinksoas.Class
import com.thinksoas.CourseObjective

class Course {

	String subject
	String number
	String name
	String description
	String units
	String offered
    List<CourseObjective> objectives = []
    
	static  hasMany = [classes: Class, objectives: CourseObjective]

    static constraints = {
    	subject(blank:false)
    	number(blank:false)
    	name(blank:false)
    	description(blank:false)
    	units(blank:false)
    	offered(blank:false)
    }

    static mapping = {
        objectives cascade:"all-delete-orphan"    
        description sqlType:"text"
    }   

    String toString() {
        "$subject: $number"
    }
}