package com.thinksoas

import com.thinksoas.Report.StudentOutcome.PerformanceCriteria
import com.thinksoas.Report.StudentOutcome.SO_Report
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class PerformanceCriteriaController {

    static allowedMethods = [save: "POST", update: "PUT"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PerformanceCriteria.list(params), model:[performanceCriteriaInstanceCount: PerformanceCriteria.count()]
    }

    def show(PerformanceCriteria performanceCriteriaInstance) {
        respond performanceCriteriaInstance
    }

    def create() {

        def report = SO_Report.findById(params.reportId)

        def selectedOutcome = report.outcome

        def queryReinforce = CourseObjective.findAll {
            reinforceOutcomes.prefix == selectedOutcome.prefix
        }
        def queryEmpasized = CourseObjective.findAll {
            emphasizeOutcomes.prefix == selectedOutcome.prefix
        }
        def objectives = queryReinforce + queryEmpasized

        respond new PerformanceCriteria(params), model:[objectiveQuery: objectives, soReport: report.id]
    }

    @Transactional
    def save(PerformanceCriteria performanceCriteriaInstance) {
        if (performanceCriteriaInstance == null) {
            notFound()
            return
        }

        if (performanceCriteriaInstance.hasErrors()) {
            respond performanceCriteriaInstance.errors, view:'create'
            return
        }

        performanceCriteriaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'performanceCriteria.label', default: 'PerformanceCriteria'), performanceCriteriaInstance.id])
                redirect (controller: "SO_Report", action: "index")
            }
            '*' { respond performanceCriteriaInstance, [status: CREATED] }
        }
    }

    def edit(PerformanceCriteria performanceCriteriaInstance) {
        respond performanceCriteriaInstance
    }

   // @Transactional
    def update(PerformanceCriteria performanceCriteriaInstance) {
        if (performanceCriteriaInstance == null) {
            notFound()
            return
        }

        if (performanceCriteriaInstance.hasErrors()) {
            respond performanceCriteriaInstance.errors, view:'edit'
            return
        }

        performanceCriteriaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PerformanceCriteria.label', default: 'PerformanceCriteria'), performanceCriteriaInstance.id])
                redirect performanceCriteriaInstance
            }
            '*'{ respond performanceCriteriaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PerformanceCriteria performanceCriteriaInstance) {

        if (performanceCriteriaInstance == null) {
            notFound()
            return
        }
        def reportId = performanceCriteriaInstance.reportId

        performanceCriteriaInstance.report.removeFromCriteria(performanceCriteriaInstance)
        performanceCriteriaInstance.delete flush:true

        forward (controller: "SO_Report", action: "show", id: reportId)

    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'performanceCriteria.label', default: 'PerformanceCriteria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
