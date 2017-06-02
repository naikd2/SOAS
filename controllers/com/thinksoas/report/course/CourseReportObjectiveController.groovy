package com.thinksoas.report.course



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class CourseReportObjectiveController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CourseReportObjective.list(params), model:[courseReportObjectiveInstanceCount: CourseReportObjective.count()]
    }

    def show(CourseReportObjective courseReportObjectiveInstance) {
        respond courseReportObjectiveInstance
    }

    def create() {
        respond new CourseReportObjective(params)
    }

    def inlineEdit() {

        println("in: " + params.objective)
        redirect action:"index", method:"GET"
    }

    @Transactional
    def save(CourseReportObjective courseReportObjectiveInstance) {
        if (courseReportObjectiveInstance == null) {
            notFound()
            return
        }

        if (courseReportObjectiveInstance.hasErrors()) {
            respond courseReportObjectiveInstance.errors, view:'create'
            return
        }

        courseReportObjectiveInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'courseReportObjective.label', default: 'CourseReportObjective'), courseReportObjectiveInstance.id])
                redirect courseReportObjectiveInstance
            }
            '*' { respond courseReportObjectiveInstance, [status: CREATED] }
        }
    }

    def edit(CourseReportObjective courseReportObjectiveInstance) {
        respond courseReportObjectiveInstance
    }

    @Transactional
    def update(CourseReportObjective courseReportObjectiveInstance) {
        if (courseReportObjectiveInstance == null) {
            notFound()
            return
        }

        if (courseReportObjectiveInstance.hasErrors()) {
            respond courseReportObjectiveInstance.errors, view:'edit'
            return
        }

        courseReportObjectiveInstance.save flush:true
        def report = courseReportObjectiveInstance.report

        redirect(controller: 'courseReport', action: 'show', id: report.id)
    }

    @Transactional
    def delete(CourseReportObjective courseReportObjectiveInstance) {

        if (courseReportObjectiveInstance == null) {
            notFound()
            return
        }

        courseReportObjectiveInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CourseReportObjective.label', default: 'CourseReportObjective'), courseReportObjectiveInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseReportObjective.label', default: 'CourseReportObjective'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
