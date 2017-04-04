package com.thinksoas

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ProgramsController {

    static allowedMethods = [save: "POST", update: "PUT"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
    }

    def show(Programs programsInstance) {
        respond programsInstance
    }

    def create() {
        respond new Programs(params)
    }

    def settings() {
        def programsInstance = Programs.findBySettings("SETTINGS")

        respond programsInstance
    }

    @Transactional
    def save(Programs programsInstance) {
        if (programsInstance == null) {
            notFound()
            return
        }

        if (programsInstance.hasErrors()) {
            respond programsInstance.errors, view:'create'
            return
        }

        programsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                //flash.message = message(code: 'default.created.message', args: [message(code: 'programs.label', default: 'Programs'), programsInstance.id])
                redirect(uri: "/")
            }
            '*' { respond programsInstance, [status: CREATED] }
        }
    }

    def edit(Programs programsInstance) {
        respond programsInstance
    }

    @Transactional
    def update(Programs programsInstance) {

        if (programsInstance == null) {
            notFound()
            return
        }

        if (programsInstance.hasErrors()) {
            respond programsInstance.errors, view:'edit'
            return
        }
        programsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Programs.label', default: 'Programs'), programsInstance.id])
                redirect(uri: "/")
            }
            '*'{ respond programsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Programs programsInstance) {

        if (programsInstance == null) {
            notFound()
            return
        }

        programsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Programs.label', default: 'Programs'), programsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'programs.label', default: 'Programs'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
