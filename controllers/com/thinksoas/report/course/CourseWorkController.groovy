package com.thinksoas.report.course



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class CourseWorkController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CourseWork.list(params), model:[courseWorkInstanceCount: CourseWork.count()]
    }

    def show(CourseWork courseWorkInstance) {
        respond courseWorkInstance
    }

    def create() {
        respond new CourseWork(params)
    }

    @Transactional
    def upload(Long id) {
        CourseReport report = CourseReport.findById(id)
        println(report.section)
        if (report != null) {
            def file = request.getFile('file')
            if(file.empty) {
                flash.message = "File cannot be empty"
            } else {
                def work = new CourseWork(report: report)
                work.filename = file.originalFilename
                work.fullPath = grailsApplication.config.uploadFolder + work.filename
                file.transferTo(new File(work.fullPath))
                work.save flush: true
            }
        }
        redirect(controller: 'courseReport', action: 'show', id: report.id)
    }

    def download(long id) {
        CourseWork work = CourseWork.get(id)
        if ( work == null) {
            flash.message = "Document not found."
            redirect (action:'list')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${work.filename}\"")
            def file = new File(work.fullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()
        }
    }


    @Transactional
    def save(CourseWork courseWorkInstance) {
        if (courseWorkInstance == null) {
            notFound()
            return
        }

        if (courseWorkInstance.hasErrors()) {
            respond courseWorkInstance.errors, view:'create'
            return
        }

        courseWorkInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'courseWork.label', default: 'CourseWork'), courseWorkInstance.id])
                redirect courseWorkInstance
            }
            '*' { respond courseWorkInstance, [status: CREATED] }
        }
    }

    def edit(CourseWork courseWorkInstance) {
        respond courseWorkInstance
    }

    @Transactional
    def update(CourseWork courseWorkInstance) {
        if (courseWorkInstance == null) {
            notFound()
            return
        }

        if (courseWorkInstance.hasErrors()) {
            respond courseWorkInstance.errors, view:'edit'
            return
        }

        courseWorkInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CourseWork.label', default: 'CourseWork'), courseWorkInstance.id])
                redirect courseWorkInstance
            }
            '*'{ respond courseWorkInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CourseWork courseWorkInstance) {

        if (courseWorkInstance == null) {
            notFound()
            return
        }

        courseWorkInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CourseWork.label', default: 'CourseWork'), courseWorkInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'courseWork.label', default: 'CourseWork'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
