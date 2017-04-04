package com.thinksoas

import com.thinksoas.Report.StudentOutcome.MOAssessments
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class MOAssessmentsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MOAssessments.list(params), model:[MOAssessmentsInstanceCount: MOAssessments.count()]
    }

    def show(MOAssessments MOAssessmentsInstance) {
        respond MOAssessmentsInstance
    }

    def create() {
        respond new MOAssessments(params)
    }

    @Transactional
    def save(MOAssessments MOAssessmentsInstance) {
        if (MOAssessmentsInstance == null) {
            notFound()
            return
        }

        if (MOAssessmentsInstance.hasErrors()) {
            respond MOAssessmentsInstance.errors, view:'create'
            return
        }

        MOAssessmentsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'MOAssessments.label', default: 'MOAssessments'), MOAssessmentsInstance.id])
                redirect MOAssessmentsInstance
            }
            '*' { respond MOAssessmentsInstance, [status: CREATED] }
        }
    }

    def edit(MOAssessments MOAssessmentsInstance) {
        respond MOAssessmentsInstance
    }

    @Transactional
    def update(MOAssessments MOAssessmentsInstance) {
        if (MOAssessmentsInstance == null) {
            notFound()
            return
        }

        if (MOAssessmentsInstance.hasErrors()) {
            respond MOAssessmentsInstance.errors, view:'edit'
            return
        }

        MOAssessmentsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MOAssessments.label', default: 'MOAssessments'), MOAssessmentsInstance.id])
                redirect MOAssessmentsInstance
            }
            '*'{ respond MOAssessmentsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MOAssessments MOAssessmentsInstance) {

        if (MOAssessmentsInstance == null) {
            notFound()
            return
        }

        MOAssessmentsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MOAssessments.label', default: 'MOAssessments'), MOAssessmentsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'MOAssessments.label', default: 'MOAssessments'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
