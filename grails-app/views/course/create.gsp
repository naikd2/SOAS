<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="container-fluid">
    <div class="row">

        <div class="container">
            <h1>Create a Course</h1>
            &nbsp
            <div id="create-course" class="content scaffold-create" role="main">
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${courseInstance}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${courseInstance}" var="error">
                            <li><g:if
                                    test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                    error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <g:form url="[resource: courseInstance, action: 'save', params: [program: session.currentProgram]]">
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>

                    <div class="col-sm-10">
                        <fieldset class="buttons">
                                <g:submitButton name="create" class="btn btn-primary btn-block"
                                                value="Create Course"/>
                        </fieldset>

                    </div>

                </g:form>
            </div>
        </div>
</body>
</html>
