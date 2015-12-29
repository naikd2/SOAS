package com.thinksoas

class Class {

	String section
    Course course
    User user

	static belongsTo = [course: Course, user: User]

	static fetchMode = [user: 'eager']

    static constraints = {
    	section(blank:false)
    }


    String toString() {
        "$course - $section"
    }
}
