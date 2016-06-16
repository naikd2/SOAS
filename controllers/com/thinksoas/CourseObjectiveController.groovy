package com.thinksoas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class CourseObjectiveController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CourseObjective.list(params), model:[courseObjectiveInstanceCount: CourseObjective.count()]
    }

    def show(CourseObjective courseObjectiveInstance) {
        respond courseObjectiveInstance
    }

    def create() {
        respond new CourseObjective(params)
    }

    @Transactional
    def save(CourseObjective courseObjectiveInstance) {
        if (courseObjectiveInstance == null) {
            notFound()
            return
        }

        if (courseObjectiveInstance.hasErrors()) {
            respond courseObjectiveInstance.errors, view:'create'
            return
        }

        courseObjectiveInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'courseObjective.label', default: 'CourseObjective'), courseObjectiveInstance.id])
                redirect courseObjectiveInstance
            }
            '*' { respond courseObjectiveInstance, [status: CREATED] }
        }
    }

    def edit(CourseObjective courseObjectiveInstance) {
        respond courseObjectiveInstance
    }

    @Transactional
    def update(CourseObjective courseObjectiveInstance) {
        if (courseObjectiveInstance == null) {
            notFound()
            return
        }

        if (courseObjectiveInstance.hasErrors()) {
            respond courseObjectiveInstance.errors, view:'edit'
            return
        }

        courseObjectiveInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CourseObjective.label', default: 'CourseObjective'), courseObjectiveInstance.id])
                redirect courseObjectiveInstance
            }
            '*'{ respond courseObjectiveInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CourseObjective courseObjectiveInstance) {

        if (courseObjectiveInstance == null) {
            notFound()
            return
        }

        courseObjectiveInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CourseObjective.label', default: 'CourseObjective'), courseObjectiveInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseObjective.label', default: 'CourseObjective'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
