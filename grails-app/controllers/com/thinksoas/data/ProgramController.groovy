package com.thinksoas.data

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class ProgramController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def show(Program programInstance) {
        respond programInstance
    }

    def settings() {
        def programsInstance = Program.findBySettings("SETTINGS")
        respond programsInstance, model:[program: programsInstance]
    }

    @Transactional
    def update(Program program) {
        println("Before..")

        if (program == null) {
            println("null..")
            notFound()
            return
        }
        if (program.hasErrors()) {
            println("errors..")
            respond program.errors, view:'edit'
            return
        }
//        println("Updating..")
//        program.setAssessmentPeriod(params.assessmentPeriod)
//        program.setPerformanceThreshold(params.performanceThreshold)
//        program.setPerformanceTarget(params.performanceTarget)
//        program.setDeltaValue(params.deltaValue)
//        println("Saving..")

        program.save(flush: true)

        println("Saved")

        redirect(uri:'/')
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
