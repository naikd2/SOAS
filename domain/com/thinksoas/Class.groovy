package com.thinksoas

class Class {

    Semester semester
    Course course
    User professor
    String section
    int students

	static belongsTo = [semester: Semester, course: Course, professor: User]

	static fetchMode = [professor: 'eager']

    static constraints = {
        semester(blank:false)
        course(blank:false)
        professor(blank:false)
        section(blank:false)
        students(blank:false)
    }


    String toString() {
        "$course - $section"
    }
}
