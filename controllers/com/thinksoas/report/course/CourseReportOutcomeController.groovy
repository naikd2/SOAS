package com.thinksoas.report.course



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class CourseReportOutcomeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CourseReportOutcome.list(params), model:[courseReportOutcomeInstanceCount: CourseReportOutcome.count()]
    }

    def show(CourseReportOutcome courseReportOutcomeInstance) {
        respond courseReportOutcomeInstance
    }

    def create() {
        respond new CourseReportOutcome(params)
    }

    @Transactional
    def save(CourseReportOutcome courseReportOutcomeInstance) {
        if (courseReportOutcomeInstance == null) {
            notFound()
            return
        }

        if (courseReportOutcomeInstance.hasErrors()) {
            respond courseReportOutcomeInstance.errors, view:'create'
            return
        }

        courseReportOutcomeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'courseReportOutcome.label', default: 'CourseReportOutcome'), courseReportOutcomeInstance.id])
                redirect courseReportOutcomeInstance
            }
            '*' { respond courseReportOutcomeInstance, [status: CREATED] }
        }
    }

    def edit(CourseReportOutcome courseReportOutcomeInstance) {
        respond courseReportOutcomeInstance
    }

    @Transactional
    def update(CourseReportOutcome courseReportOutcomeInstance) {
        if (courseReportOutcomeInstance == null) {
            notFound()
            return
        }

        if (courseReportOutcomeInstance.hasErrors()) {
            respond courseReportOutcomeInstance.errors, view:'edit'
            return
        }

        courseReportOutcomeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CourseReportOutcome.label', default: 'CourseReportOutcome'), courseReportOutcomeInstance.id])
                redirect courseReportOutcomeInstance
            }
            '*'{ respond courseReportOutcomeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CourseReportOutcome courseReportOutcomeInstance) {

        if (courseReportOutcomeInstance == null) {
            notFound()
            return
        }

        courseReportOutcomeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CourseReportOutcome.label', default: 'CourseReportOutcome'), courseReportOutcomeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseReportOutcome.label', default: 'CourseReportOutcome'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
