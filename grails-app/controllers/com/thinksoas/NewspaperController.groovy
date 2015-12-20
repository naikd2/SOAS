package com.thinksoas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NewspaperController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Newspaper.list(params), model:[newspaperInstanceCount: Newspaper.count()]
    }

    def show(Newspaper newspaperInstance) {
        respond newspaperInstance
    }

    def create() {
        respond new Newspaper(params)
    }

    @Transactional
    def save(Newspaper newspaperInstance) {
        if (newspaperInstance == null) {
            notFound()
            return
        }

        if (newspaperInstance.hasErrors()) {
            respond newspaperInstance.errors, view:'create'
            return
        }

        newspaperInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'newspaper.label', default: 'Newspaper'), newspaperInstance.id])
                redirect newspaperInstance
            }
            '*' { respond newspaperInstance, [status: CREATED] }
        }
    }

    def edit(Newspaper newspaperInstance) {				
        respond newspaperInstance
    }

    @Transactional
    def update(Newspaper newspaperInstance) {
				
        if (newspaperInstance == null) {
            notFound()
            return
        }

        if (newspaperInstance.hasErrors()) {			
            respond newspaperInstance.errors, view:'edit'			
            return
        }
		
		newspaperInstance.articles.clear()
		newspaperInstance.properties = params
								
		newspaperInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Newspaper.label', default: 'Newspaper'), newspaperInstance.id])
                redirect newspaperInstance
            }
            '*'{ respond newspaperInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Newspaper newspaperInstance) {

        if (newspaperInstance == null) {
            notFound()
            return
        }

        newspaperInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Newspaper.label', default: 'Newspaper'), newspaperInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'newspaper.label', default: 'Newspaper'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
