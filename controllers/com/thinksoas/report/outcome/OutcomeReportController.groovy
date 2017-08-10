package com.thinksoas.report.outcome



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import com.thinksoas.data.Program

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class OutcomeReportController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def outcomeReportService


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OutcomeReport.list(params), model:[outcomeReportInstanceCount: OutcomeReport.count()]
    }

    def show(OutcomeReport outcomeReportInstance) {




        def program = Program.findBySettings("SETTINGS")
        respond outcomeReportInstance,   model:[settings: program]
    }

    def create() {
        respond new OutcomeReport(params)
    }

    @Transactional
    def save(OutcomeReport outcomeReportInstance) {

        if (outcomeReportInstance == null) {
            notFound()
            return
        }

        if (outcomeReportInstance.hasErrors()) {
            respond outcomeReportInstance.errors, view:'create'
            return
        }

        outcomeReportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'outcomeReport.label', default: 'OutcomeReport'), outcomeReportInstance.id])
                redirect outcomeReportInstance
            }
            '*' { respond outcomeReportInstance, [status: CREATED] }
        }
    }

    def createCriteria() {
        def report = OutcomeReport.findById(params.reportId)

        def selectedOutcome = report.outcome

        def queryReinforce = com.thinksoas.data.CourseObjective.findAll {
            reinforceOutcomes.prefix == selectedOutcome.prefix
        }
        def queryEmpasized = com.thinksoas.data.CourseObjective.findAll {
            emphasizeOutcomes.prefix == selectedOutcome.prefix
        }
        def objectives = queryReinforce + queryEmpasized

        respond new OutcomeReportCriteria(params), model:[objectiveQuery: objectives, soReport: report.id]
    }

    @Transactional
    def saveCriteria(OutcomeReportCriteria outcomeReportCriteriaInstance) {

        if (outcomeReportCriteriaInstance == null) {
            notFound()
            return
        }

        if (outcomeReportCriteriaInstance.hasErrors()) {
            respond outcomeReportCriteriaInstance.errors, view:'create'
            return
        }

        def reportId = outcomeReportCriteriaInstance.reportId

        outcomeReportCriteriaInstance.save()
        saveMethodsToObjectives(outcomeReportCriteriaInstance)

        outcomeReportService.updateImprovementReport(outcomeReportCriteriaInstance.report)

        redirect (controller: "outcomeReport", action: "show", id: reportId)

    }

    @Transactional
    def saveMethodsToObjectives(OutcomeReportCriteria outcomeReportCriteriaInstance) {
        com.thinksoas.data.CourseObjective obj = outcomeReportCriteriaInstance.objective
        obj.method1 = params.objMethodOne
        obj.method2 = params.objMethodTwo

        obj.save()
    }


    @Transactional
    def deleteCriteria(OutcomeReportCriteria outcomeReportCriteriaInstance) {
        if (outcomeReportCriteriaInstance == null) {
            notFound()
            return
        }
        def reportId = outcomeReportCriteriaInstance.reportId

        outcomeReportCriteriaInstance.delete flush:true


        outcomeReportService.updateImprovementReport(OutcomeReport.findById(reportId))


        redirect (controller: "outcomeReport", action: "show", id: reportId)
    }

    def objectiveChanged() {
        com.thinksoas.data.CourseObjective objective = com.thinksoas.data.CourseObjective.findById(params.objective)
        def settings = Program.findBySettings("SETTINGS")
        render(view: "_objectiveChanged", model: [desc: objective.description, methods: settings.methods])
    }


    def edit(OutcomeReport outcomeReportInstance) {
        respond outcomeReportInstance
    }

    @Transactional
    def update(OutcomeReport outcomeReportInstance) {
        if (outcomeReportInstance == null) {
            notFound()
            return
        }

        if (outcomeReportInstance.hasErrors()) {
            respond outcomeReportInstance.errors, view:'edit'
            return
        }

        outcomeReportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OutcomeReport.label', default: 'OutcomeReport'), outcomeReportInstance.id])
                redirect outcomeReportInstance
            }
            '*'{ respond outcomeReportInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OutcomeReport outcomeReportInstance) {

        if (outcomeReportInstance == null) {
            notFound()
            return
        }

        outcomeReportInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OutcomeReport.label', default: 'OutcomeReport'), outcomeReportInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'outcomeReport.label', default: 'OutcomeReport'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
