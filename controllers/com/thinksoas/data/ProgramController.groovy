package com.thinksoas.data



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class ProgramController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Program.list(params), model:[programInstanceCount: Program.count()]
    }

    def show(Program programInstance) {
        respond programInstance
    }

    def create() {
        respond new Program(params)
    }

    def settings() {
        def programsInstance = Program.findBySettings("SETTINGS")

        respond programsInstance
    }

    @Transactional
    def save(Program programInstance) {
        if (programInstance == null) {
            notFound()
            return
        }

        if (programInstance.hasErrors()) {
            respond programInstance.errors, view:'create'
            return
        }

        programInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'program.label', default: 'Program'), programInstance.id])
                redirect programInstance
            }
            '*' { respond programInstance, [status: CREATED] }
        }
    }

    def edit(Program programInstance) {
        respond programInstance
    }

    @Transactional
    def update(Program programInstance) {
        if (programInstance == null) {
            notFound()
            return
        }

        if (programInstance.hasErrors()) {
            respond programInstance.errors, view:'edit'
            return
        }

        programInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Program.label', default: 'Program'), programInstance.id])
                redirect programInstance
            }
            '*'{ respond programInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Program programInstance) {

        if (programInstance == null) {
            notFound()
            return
        }

        programInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Program.label', default: 'Program'), programInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Transactional
    def newMethod(String name) {
        println("hello: " + params.name)
        println("hello2: " + name)

        redirect action:"index", method:"GET"
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'program.label', default: 'Program'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
