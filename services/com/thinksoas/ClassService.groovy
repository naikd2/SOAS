package com.thinksoas

import com.thinksoas.course.report.CourseReport
import com.thinksoas.course.report.CourseReportDetail
import grails.transaction.Transactional

class ClassException extends RuntimeException {
    // String message
    // Class class
}

@Transactional
class ClassService {

	// Class createClass(String userId, String section, String name) {
	// 	def user = User.findByUserId(userId)
	// 	def course = Course.findByName(name)
	// 	if (user) {
	// 		def class = new Class(section: section)
	// 		user.addToClass
	// 	}


	// }

    Semester getActiveSemester() {
        def semesterList = Semester.findAll();
        for (Semester s : semesterList) {
            if(s.active) {
                return s
            }
        }
        return null
    }

    Course getCourse(Long classId) {
        def s = Class.findById(classId)
        if (s != null) {
            return s.getCourse();
        }
    }

    CourseReport generateCourseReport(Long classId) {
        def s = Class.findById(classId)
        if (s != null) {
            def report = new CourseReport(section: s)
            // now generate the details with course information
            def c = getCourse(classId)
            def cObjs = c.getObjectives()
            def details = []
            for (CourseObjective o : cObjs) {
                def d = new CourseReportDetail(report: report, objective: o)
                d.max = 0.0
                d.min = 0.0
                d.instrument = "todo"
                details.add(d)
            }
            report.details = details

            return report
        }
    }





}




   // Post createPost(String loginId, String content) {
   //      def user = User.findByLoginId(loginId)
   //      if (user) {
   //          def post = new Post(content: content)
   //          user.addToPosts(post)
   //          if (post.validate() && user.save()) {
   //              return post
   //          } else {
   //              throw new PostException(
   //                  message: "Invalid or empty post", post: post)
   //          }
   //      }
   //      throw new PostException(message: "Invalid User Id")
   //  }