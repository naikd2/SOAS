package com.thinksoas.course.report

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class CourseReportController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CourseReport.list(params), model:[courseReportInstanceCount: CourseReport.count()]
    }

    def show(CourseReport courseReportInstance) {
        respond courseReportInstance
    }

    def create() {
        respond new CourseReport(params)
    }

    @Transactional
    def save(CourseReport courseReportInstance) {
        if (courseReportInstance == null) {
            notFound()
            return
        }

        if (courseReportInstance.hasErrors()) {
            respond courseReportInstance.errors, view:'create'
            return
        }

        courseReportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'courseReport.label', default: 'CourseReport'), courseReportInstance.id])
                redirect courseReportInstance
            }
            '*' { respond courseReportInstance, [status: CREATED] }
        }
    }

    def edit(CourseReport courseReportInstance) {
        respond courseReportInstance
    }

    @Transactional
    def update(CourseReport courseReportInstance) {
        if (courseReportInstance == null) {
            notFound()
            return
        }

        if (courseReportInstance.hasErrors()) {
            respond courseReportInstance.errors, view:'edit'
            return
        }

        courseReportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CourseReport.label', default: 'CourseReport'), courseReportInstance.id])
                redirect courseReportInstance
            }
            '*'{ respond courseReportInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CourseReport courseReportInstance) {

        if (courseReportInstance == null) {
            notFound()
            return
        }

        courseReportInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CourseReport.label', default: 'CourseReport'), courseReportInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseReport.label', default: 'CourseReport'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
