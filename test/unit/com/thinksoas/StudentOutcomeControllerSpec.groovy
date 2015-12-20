package com.thinksoas



import grails.test.mixin.*
import spock.lang.*

@TestFor(StudentOutcomeController)
@Mock(StudentOutcome)
class StudentOutcomeControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.studentOutcomeInstanceList
            model.studentOutcomeInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.studentOutcomeInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def studentOutcome = new StudentOutcome()
            studentOutcome.validate()
            controller.save(studentOutcome)

        then:"The create view is rendered again with the correct model"
            model.studentOutcomeInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            studentOutcome = new StudentOutcome(params)

            controller.save(studentOutcome)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/studentOutcome/show/1'
            controller.flash.message != null
            StudentOutcome.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def studentOutcome = new StudentOutcome(params)
            controller.show(studentOutcome)

        then:"A model is populated containing the domain instance"
            model.studentOutcomeInstance == studentOutcome
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def studentOutcome = new StudentOutcome(params)
            controller.edit(studentOutcome)

        then:"A model is populated containing the domain instance"
            model.studentOutcomeInstance == studentOutcome
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/studentOutcome/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def studentOutcome = new StudentOutcome()
            studentOutcome.validate()
            controller.update(studentOutcome)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.studentOutcomeInstance == studentOutcome

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            studentOutcome = new StudentOutcome(params).save(flush: true)
            controller.update(studentOutcome)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/studentOutcome/show/$studentOutcome.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/studentOutcome/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def studentOutcome = new StudentOutcome(params).save(flush: true)

        then:"It exists"
            StudentOutcome.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(studentOutcome)

        then:"The instance is deleted"
            StudentOutcome.count() == 0
            response.redirectedUrl == '/studentOutcome/index'
            flash.message != null
    }
}
