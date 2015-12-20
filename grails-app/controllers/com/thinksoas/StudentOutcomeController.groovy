package com.thinksoas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StudentOutcomeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond StudentOutcome.list(params), model:[studentOutcomeInstanceCount: StudentOutcome.count()]
    }

    def show(StudentOutcome studentOutcomeInstance) {
        respond studentOutcomeInstance
    }

    def create() {
        respond new StudentOutcome(params)
    }

    @Transactional
    def save(StudentOutcome studentOutcomeInstance) {
        if (studentOutcomeInstance == null) {
            notFound()
            return
        }

        if (studentOutcomeInstance.hasErrors()) {
            respond studentOutcomeInstance.errors, view:'create'
            return
        }

        studentOutcomeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'studentOutcome.label', default: 'StudentOutcome'), studentOutcomeInstance.id])
                redirect studentOutcomeInstance
            }
            '*' { respond studentOutcomeInstance, [status: CREATED] }
        }
    }

    def edit(StudentOutcome studentOutcomeInstance) {
        respond studentOutcomeInstance
    }

    @Transactional
    def update(StudentOutcome studentOutcomeInstance) {
        if (studentOutcomeInstance == null) {
            notFound()
            return
        }

        if (studentOutcomeInstance.hasErrors()) {
            respond studentOutcomeInstance.errors, view:'edit'
            return
        }

        studentOutcomeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'StudentOutcome.label', default: 'StudentOutcome'), studentOutcomeInstance.id])
                redirect studentOutcomeInstance
            }
            '*'{ respond studentOutcomeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(StudentOutcome studentOutcomeInstance) {

        if (studentOutcomeInstance == null) {
            notFound()
            return
        }

        studentOutcomeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'StudentOutcome.label', default: 'StudentOutcome'), studentOutcomeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentOutcome.label', default: 'StudentOutcome'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
