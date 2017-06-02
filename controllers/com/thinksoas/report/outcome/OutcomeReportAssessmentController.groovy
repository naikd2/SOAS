package com.thinksoas.report.outcome



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class OutcomeReportAssessmentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OutcomeReportAssessment.list(params), model:[outcomeReportAssessmentInstanceCount: OutcomeReportAssessment.count()]
    }

    def show(OutcomeReportAssessment outcomeReportAssessmentInstance) {
        respond outcomeReportAssessmentInstance
    }

    def create() {
        respond new OutcomeReportAssessment(params)
    }

    @Transactional
    def save(OutcomeReportAssessment outcomeReportAssessmentInstance) {
        if (outcomeReportAssessmentInstance == null) {
            notFound()
            return
        }

        if (outcomeReportAssessmentInstance.hasErrors()) {
            respond outcomeReportAssessmentInstance.errors, view:'create'
            return
        }

        outcomeReportAssessmentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'outcomeReportAssessment.label', default: 'OutcomeReportAssessment'), outcomeReportAssessmentInstance.id])
                redirect outcomeReportAssessmentInstance
            }
            '*' { respond outcomeReportAssessmentInstance, [status: CREATED] }
        }
    }

    def edit(OutcomeReportAssessment outcomeReportAssessmentInstance) {
        respond outcomeReportAssessmentInstance
    }

    @Transactional
    def update(OutcomeReportAssessment outcomeReportAssessmentInstance) {
        if (outcomeReportAssessmentInstance == null) {
            notFound()
            return
        }

        if (outcomeReportAssessmentInstance.hasErrors()) {
            respond outcomeReportAssessmentInstance.errors, view:'edit'
            return
        }

        outcomeReportAssessmentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OutcomeReportAssessment.label', default: 'OutcomeReportAssessment'), outcomeReportAssessmentInstance.id])
                redirect outcomeReportAssessmentInstance
            }
            '*'{ respond outcomeReportAssessmentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OutcomeReportAssessment outcomeReportAssessmentInstance) {

        if (outcomeReportAssessmentInstance == null) {
            notFound()
            return
        }

        outcomeReportAssessmentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OutcomeReportAssessment.label', default: 'OutcomeReportAssessment'), outcomeReportAssessmentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'outcomeReportAssessment.label', default: 'OutcomeReportAssessment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
