package com.thinksoas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClassController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Class.list(params), model:[classInstanceCount: Class.count()]
    }

 @Transactional
    def signUpClass(String section, String course) {
        println section
        println course
        Course course1 = Course.findByName(course)
        print course1.id
        def user = session.user
        new Class(section:section,course:course1, user:user).save()

        redirect controller:'Class', action:'index'
    }




    def show(Class classInstance) {
        respond classInstance
    }

    def create() {
        respond new Class(params)
    }

    @Transactional
    def save(Class classInstance) {
        if (classInstance == null) {
            notFound()
            return
        }

        if (classInstance.hasErrors()) {
            respond classInstance.errors, view:'create'
            return
        }

        classInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'class.label', default: 'Class'), classInstance.id])
                redirect classInstance
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
