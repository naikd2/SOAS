package com.thinksoas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
import com.thinksoas.Course
import com.thinksoas.CourseObjective

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class SO_ReportController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {

        params.max = Math.min(max ?: 10, 100)
        respond SO_Report.list(params), model:[SO_ReportInstanceCount: SO_Report.count()]
    }

    def show(SO_Report SO_ReportInstance) {


        respond SO_ReportInstance
    }

    def create() {

        respond new SO_Report(params)
    }


    @Transactional
    def save(SO_Report SO_ReportInstance) {
        if (SO_ReportInstance == null) {
            notFound()
            return
        }

        if (SO_ReportInstance.hasErrors()) {
            respond SO_ReportInstance.errors, view:'create'
            return
        }

        SO_ReportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'SO_Report.label', default: 'SO_Report'), SO_ReportInstance.id])
                redirect SO_ReportInstance
            }
            '*' { respond SO_ReportInstance, [status: CREATED] }
        }
    }

    def edit(SO_Report SO_ReportInstance) {
        respond SO_ReportInstance
    }

    @Transactional
    def update(SO_Report SO_ReportInstance) {
        if (SO_ReportInstance == null) {
            notFound()
            return
        }

        if (SO_ReportInstance.hasErrors()) {
            respond SO_ReportInstance.errors, view:'edit'
            return
        }

        SO_ReportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SO_Report.label', default: 'SO_Report'), SO_ReportInstance.id])
                redirect SO_ReportInstance
            }
            '*'{ respond SO_ReportInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SO_Report SO_ReportInstance) {

        if (SO_ReportInstance == null) {
            notFound()
            return
        }

        SO_ReportInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SO_Report.label', default: 'SO_Report'), SO_ReportInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'SO_Report.label', default: 'SO_Report'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
