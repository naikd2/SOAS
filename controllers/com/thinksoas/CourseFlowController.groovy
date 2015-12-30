package com.thinksoas

class CourseFlowController {

    def index() { 
    	redirect(action: "create")
    }

    //	1) create a course
    //	2) ask how many objectives to create
    //	3) fill in data about objectives 

    def createFlow = {

    	enterCourse {
    		redirect(controller: "course", action: "create")
    	}

    	// numberObjectives {
    	// 	on("next") {
    	// 		//capture nummber
    	// 	}.to("enterObjectives")
    	// 	on("previous").to("enterCourse")
    	// }

    	// enterObjectives {
    	// 	on("next") {
    	// 		//capture Objectives
    	// 	}.to("displayCourse")
    	// 	on("previous").to("numberObjectives")
    	// }

    	// displayCourse {
    	// 	//displayCourse
    	// 	on("finished").to("finish")
    	// }

    	finish {
    		redirect(uri: '/')
    	}

    }


}