package com.thinksoas.dashboard

import com.thinksoas.Message
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.NOT_FOUND


@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class MessageController {

    def messageService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Message.list(params), model:[messageInstanceCount: Message.count(), messages: messageService.getUserMessages()]
    }

    def show(Message messageInstance) {
        respond messageInstance
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
