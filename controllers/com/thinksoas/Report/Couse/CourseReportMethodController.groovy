package com.thinksoas.Report.Couse



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class CourseReportMethodController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CourseReportMethod.list(params), model:[courseReportMethodInstanceCount: CourseReportMethod.count()]
    }

    def show(CourseReportMethod courseReportMethodInstance) {
        respond courseReportMethodInstance
    }

    def create() {
        respond new CourseReportMethod(params)
    }

    @Transactional
    def save(CourseReportMethod courseReportMethodInstance) {
        if (courseReportMethodInstance == null) {
            notFound()
            return
        }

        if (courseReportMethodInstance.hasErrors()) {
            respond courseReportMethodInstance.errors, view:'create'
            return
        }

        courseReportMethodInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'courseReportMethod.label', default: 'CourseReportMethod'), courseReportMethodInstance.id])
                redirect courseReportMethodInstance
            }
            '*' { respond courseReportMethodInstance, [status: CREATED] }
        }
    }

    def edit(CourseReportMethod courseReportMethodInstance) {
        respond courseReportMethodInstance
    }

    @Transactional
    def update(CourseReportMethod courseReportMethodInstance) {
        if (courseReportMethodInstance == null) {
            notFound()
            return
        }

        if (courseReportMethodInstance.hasErrors()) {
            respond courseReportMethodInstance.errors, view:'edit'
            return
        }

        courseReportMethodInstance.save flush:true

        def report = courseReportMethodInstance.outcome.objective.report

        redirect(controller: 'courseReport', action: 'show', id: report.id)
    }

    @Transactional
    def delete(CourseReportMethod courseReportMethodInstance) {

        if (courseReportMethodInstance == null) {
            notFound()
            return
        }

        courseReportMethodInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CourseReportMethod.label', default: 'CourseReportMethod'), courseReportMethodInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseReportMethod.label', default: 'CourseReportMethod'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
