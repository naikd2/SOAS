package com.thinksoas

class CourseObjective {

	Course course
	String prefix
	String description

	List<StudentOutcome> introduceOutcomes = []
	List<StudentOutcome> reinforceOutcomes = []
	List<StudentOutcome> emphasizeOutcomes = []		

    static constraints = {
    	prefix(blank:false)
    	description(blank:false)
    }

	static belongsTo = [course: Course]
	static  hasMany = [introduceOutcomes:StudentOutcome ,reinforceOutcomes:StudentOutcome ,emphasizeOutcomes:StudentOutcome ]

    static mapping = {
    	introduceOutcomes joinTable: [name: 'objective_introduce']
    	reinforceOutcomes joinTable: [name: 'objective_reinforce']
    	emphasizeOutcomes joinTable: [name: 'objective_emphasize']
        description sqlType:"text"
    }

	def beforeUpdate(){
		println("----This is before an Update----")
	}

	String toString() {
       "$prefix: $description"
    }
    
    enum Level {
	NONE,
	INTRODUCE,
	REINFORCE,
	EMPHASIZE
	} 
}
