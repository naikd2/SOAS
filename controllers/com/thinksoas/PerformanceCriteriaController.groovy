package com.thinksoas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PerformanceCriteriaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PerformanceCriteria.list(params), model:[performanceCriteriaInstanceCount: PerformanceCriteria.count()]
    }

    def show(PerformanceCriteria performanceCriteriaInstance) {
        respond performanceCriteriaInstance
    }

    def create() {
        respond new PerformanceCriteria(params)
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
                redirect performanceCriteriaInstance
            }
            '*' { respond performanceCriteriaInstance, [status: CREATED] }
        }
    }

    def edit(PerformanceCriteria performanceCriteriaInstance) {
        respond performanceCriteriaInstance
    }

    @Transactional
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

        performanceCriteriaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PerformanceCriteria.label', default: 'PerformanceCriteria'), performanceCriteriaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
