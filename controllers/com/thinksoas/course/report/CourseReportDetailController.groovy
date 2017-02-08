package com.thinksoas.course.report

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class CourseReportDetailController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CourseReportDetail.list(params), model:[courseReportDetailInstanceCount: CourseReportDetail.count()]
    }

    def show(CourseReportDetail courseReportDetailInstance) {
        respond courseReportDetailInstance
    }

    def create() {
        respond new CourseReportDetail(params)
    }

    @Transactional
    def save(CourseReportDetail courseReportDetailInstance) {
        if (courseReportDetailInstance == null) {
            notFound()
            return
        }

        if (courseReportDetailInstance.hasErrors()) {
            respond courseReportDetailInstance.errors, view:'create'
            return
        }

        courseReportDetailInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'courseReportDetail.label', default: 'CourseReportDetail'), courseReportDetailInstance.id])
                redirect courseReportDetailInstance
            }
            '*' { respond courseReportDetailInstance, [status: CREATED] }
        }
    }

    def edit(CourseReportDetail courseReportDetailInstance) {
        respond courseReportDetailInstance
    }

    @Transactional
    def update(CourseReportDetail courseReportDetailInstance) {
        if (courseReportDetailInstance == null) {
            notFound()
            return
        }

        if (courseReportDetailInstance.hasErrors()) {
            respond courseReportDetailInstance.errors, view:'edit'
            return
        }

        courseReportDetailInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CourseReportDetail.label', default: 'CourseReportDetail'), courseReportDetailInstance.id])
                redirect controller: "courseReport", action: "index", method:"GET"
            }
            '*'{ respond courseReportDetailInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CourseReportDetail courseReportDetailInstance) {

        if (courseReportDetailInstance == null) {
            notFound()
            return
        }

        courseReportDetailInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CourseReportDetail.label', default: 'CourseReportDetail'), courseReportDetailInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseReportDetail.label', default: 'CourseReportDetail'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
