package com.thinksoas

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class ClassController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def classService
    def semesterService
    def messageService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Class.list(params), model:[classInstanceCount: Class.count()]
    }

    def show(Class classInstance) {
        respond classInstance
    }

    def create() {
        respond new Class(params), model:[activeSemester : semesterService.getActiveSemester()]
    }

    @Transactional
    def save(Class classInstance) {
        if (classInstance == null) {
            notFound()
            return
        }

        classInstance.setSemester(semesterService.getActiveSemester())

        if (classInstance.hasErrors()) {
            respond classInstance.errors, view:'create'
            return
        }

        // Create Class
        classInstance.save flush:true
        // Create Report
        def report = classService.generateCourseReport(classInstance.getId())
        report.save()
        // Create Message for user input
        messageService.createMessagesForClassReport(classInstance.getId(), classInstance.professor)
        flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'class.label', default: 'Class'), classInstance.id])
                redirect action:"index", method:"GET"
            }
            '*' { respond classInstance, [status: CREATED] }
        }
    }

    def edit(Class classInstance) {
        respond classInstance
    }

    @Transactional
    def update(Class classInstance) {
        if (classInstance == null) {
            notFound()
            return
        }

        if (classInstance.hasErrors()) {
            respond classInstance.errors, view:'edit'
            return
        }

        classInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Class.label', default: 'Class'), classInstance.id])
                redirect classInstance
            }
            '*'{ respond classInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Class classInstance) {

        if (classInstance == null) {
            notFound()
            return
        }

        classInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Class.label', default: 'Class'), classInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'class.label', default: 'Class'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
