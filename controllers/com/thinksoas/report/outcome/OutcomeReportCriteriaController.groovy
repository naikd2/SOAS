package com.thinksoas.report.outcome



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import com.thinksoas.data.*


@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class OutcomeReportCriteriaController {

    static allowedMethods = [save: "POST", update: "PUT"]
    def outcomeReportService


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OutcomeReportCriteria.list(params), model:[outcomeReportCriteriaInstanceCount: OutcomeReportCriteria.count()]
    }

    def show(OutcomeReportCriteria outcomeReportCriteriaInstance) {
        respond outcomeReportCriteriaInstance
    }

    def create() {
        def report = OutcomeReport.findById(params.reportId)

        def selectedOutcome = report.outcome

        def queryReinforce = CourseObjective.findAll {
            reinforceOutcomes.prefix == selectedOutcome.prefix
        }
        def queryEmpasized = CourseObjective.findAll {
            emphasizeOutcomes.prefix == selectedOutcome.prefix
        }
        def objectives = queryReinforce + queryEmpasized

        respond new OutcomeReportCriteria(params), model:[objectiveQuery: objectives, soReport: report.id]
    }

    @Transactional
    def save(OutcomeReportCriteria outcomeReportCriteriaInstance) {
        if (outcomeReportCriteriaInstance == null) {
            notFound()
            return
        }

        if (outcomeReportCriteriaInstance.hasErrors()) {
            respond outcomeReportCriteriaInstance.errors, view:'create'
            return
        }

        outcomeReportCriteriaInstance.save()

        println("REPORT SAVED ")
        outcomeReportService.updateImprovementReport(outcomeReportCriteriaInstance.report)
        println("REPORT SAVED ")
        //redirect (controller: "outcomeReport", action: "index")
    }

    def edit(OutcomeReportCriteria outcomeReportCriteriaInstance) {
        respond outcomeReportCriteriaInstance
    }

    @Transactional
    def update(OutcomeReportCriteria outcomeReportCriteriaInstance) {
        if (outcomeReportCriteriaInstance == null) {
            notFound()
            return
        }

        if (outcomeReportCriteriaInstance.hasErrors()) {
            respond outcomeReportCriteriaInstance.errors, view:'edit'
            return
        }

        outcomeReportCriteriaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OutcomeReportCriteria.label', default: 'OutcomeReportCriteria'), outcomeReportCriteriaInstance.id])
                redirect outcomeReportCriteriaInstance
            }
            '*'{ respond outcomeReportCriteriaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OutcomeReportCriteria outcomeReportCriteriaInstance) {
        if (outcomeReportCriteriaInstance == null) {
            notFound()
            return
        }
        def reportId = outcomeReportCriteriaInstance.reportId

        outcomeReportCriteriaInstance.report.removeFromCriteria(outcomeReportCriteriaInstance)
        outcomeReportCriteriaInstance.delete flush:true

        outcomeReportService.updateImprovementReport(OutcomeReport.findById(reportId))


        redirect (controller: "outcomeReport", action: "show", id: reportId)
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'outcomeReportCriteria.label', default: 'OutcomeReportCriteria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
