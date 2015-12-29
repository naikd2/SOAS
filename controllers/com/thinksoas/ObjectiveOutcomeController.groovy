package com.thinksoas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ObjectiveOutcomeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ObjectiveOutcome.list(params), model:[objectiveOutcomeInstanceCount: ObjectiveOutcome.count()]
    }

    def show(ObjectiveOutcome objectiveOutcomeInstance) {
        respond objectiveOutcomeInstance
    }

    def create() {
        respond new ObjectiveOutcome(params)
    }

    @Transactional
    def save(ObjectiveOutcome objectiveOutcomeInstance) {
        if (objectiveOutcomeInstance == null) {
            notFound()
            return
        }

        if (objectiveOutcomeInstance.hasErrors()) {
            respond objectiveOutcomeInstance.errors, view:'create'
            return
        }

        objectiveOutcomeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'objectiveOutcome.label', default: 'ObjectiveOutcome'), objectiveOutcomeInstance.id])
                redirect objectiveOutcomeInstance
            }
            '*' { respond objectiveOutcomeInstance, [status: CREATED] }
        }
    }

    def edit(ObjectiveOutcome objectiveOutcomeInstance) {
        respond objectiveOutcomeInstance
    }

    @Transactional
    def update(ObjectiveOutcome objectiveOutcomeInstance) {
        if (objectiveOutcomeInstance == null) {
            notFound()
            return
        }

        if (objectiveOutcomeInstance.hasErrors()) {
            respond objectiveOutcomeInstance.errors, view:'edit'
            return
        }

        objectiveOutcomeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ObjectiveOutcome.label', default: 'ObjectiveOutcome'), objectiveOutcomeInstance.id])
                redirect objectiveOutcomeInstance
            }
            '*'{ respond objectiveOutcomeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ObjectiveOutcome objectiveOutcomeInstance) {

        if (objectiveOutcomeInstance == null) {
            notFound()
            return
        }

        objectiveOutcomeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ObjectiveOutcome.label', default: 'ObjectiveOutcome'), objectiveOutcomeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'objectiveOutcome.label', default: 'ObjectiveOutcome'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
