package com.thinksoas.data



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class CourseController {

    static allowedMethods = [save: "POST", update: "PUT"]

    def index(Integer max) {
        params.max = Math.min(max  ?: 10, 100)
        respond Course.list(params), model:[courseInstanceCount: Course.count()]
    }

    def show(Course courseInstance) {
        respond courseInstance
    }

    def create() {
        def settings = Program.findBySettings("SETTINGS")
//        def s = "Faculty Evaluations"
//        settings.methods.add(s)
//        def s1 = "Student Surveys"
//        settings.methods.add(s1)
        println(settings.methods)
        respond new Course(params), model:[methods : settings.methods]
    }

    @Transactional
    def save(Course courseInstance) {
        if (courseInstance == null) {
            notFound()
            return
        }

        if (courseInstance.hasErrors()) {
            respond courseInstance.errors, view:'create'
            return
        }

        courseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])
                redirect action:"index", method:"GET"
            }
            '*' { respond courseInstance, [status: CREATED] }
        }
    }

    def edit(Course courseInstance) {
        respond courseInstance
    }

    @Transactional
    def update(Course courseInstance) {
        if (courseInstance == null) {
            notFound()
            return
        }

        if (courseInstance.hasErrors()) {
            respond courseInstance.errors, view:'edit'
            return
        }

        //  courseInstance.objectives.clear()
        courseInstance.properties = params

        courseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Course.label', default: 'Course'), courseInstance.id])
                redirect courseInstance
            }
            '*'{ respond courseInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Course courseInstance) {

        if (courseInstance == null) {
            notFound()
            return
        }

        courseInstance.delete flush:true
        redirect action:"index", method:"GET"

        // request.withFormat {
        //     form multipartForm {
        //         flash.message = message(code: 'default.deleted.message', args: [message(code: 'Course.label', default: 'Course'), courseInstance.id])
        //         redirect action:"index", method:"GET"
        //     }
        //     '*'{ render status: NO_CONTENT }
        // }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
