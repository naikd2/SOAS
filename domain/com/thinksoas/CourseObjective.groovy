package com.thinksoas

class CourseObjective {

	String prefix
	String description
	boolean deleted

	List<StudentOutcome> introduceOutcomes = []
	List<StudentOutcome> reinforceOutcomes = []
	List<StudentOutcome> emphasizeOutcomes = []		

    static constraints = {
    	prefix(blank:false)
    	description(blank:false)
    }

	static  hasMany = [introduceOutcomes:StudentOutcome ,reinforceOutcomes:StudentOutcome ,emphasizeOutcomes:StudentOutcome ]

    static mapping = {
    	introduceOutcomes joinTable: [name: 'objective_introduce']
    	reinforceOutcomes joinTable: [name: 'objective_reinforce']
    	emphasizeOutcomes joinTable: [name: 'objective_emphasize']
        description sqlType:"text"
    }   

	static transients = [ 'deleted' ]


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
