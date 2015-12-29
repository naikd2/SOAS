package com.thinksoas

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