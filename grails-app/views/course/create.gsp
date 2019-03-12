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

                    <div class="col-md-6">
                        <fieldset class="buttons btn-group-justified">
                            <div class="btn-group">
                                <g:submitButton name="create" class="btn btn-primary btn-block"
                                                value="Create Course"/>
                            </div>
                            <div class="btn-group">
                                <g:actionSubmit name="cancel" class="btn"
                                                value="Cancel" action="index"/>
                            </div>
                        </fieldset>
                    </div>

                </g:form>
            </div>
        </div>
    </div>
</div>




<div class="objective-element hidden">
    <div class="control-group input-group well" id="objective-copy">
        <div class="row">
            <div class="col-md-3 mb-3">
                <label for="prefix">
                    Prefix
                    <span class="required-indicator">*</span>
                </label>
                <g:textField type="text" id="prefix" name="objectives[row_id].prefix" value="${objectives?.prefix}" class="form-control" placeholder="Prefix" required=""/>
            </div>
            <div class="col-md-6 mb-3">
                <label for="obj_descript">
                    Description
                    <span class="required-indicator">*</span>
                </label>
                <g:textArea class="form-control" rows="5" id="obj_descript" name="objectives[row_id].description" value="${objectives?.description}" placeholder="Course objective description..." required=""/>
            </div>
            <div class="col-md-3 mb-3">
                &nbsp;
                <div class="input-group-btn">
                    <button class="btn btn-danger remove" type="button"><i class="glyphicon glyphicon-remove"></i> Remove</button>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <label for="introduce">
                    Introduce
                </label>
                <g:select class="newselectpicker" id="introduce"
                          name="objectives[row_id].introduceOutcomes"
                          value="${objectives?.introduceOutcomes*.prefix}"
                          optionKey="id"
                          from="${com.thinksoas.data.StudentOutcome.list(sort: 'id', order: 'asc')}"
                          multiple="true"
                          data-actions-box="true"/>
            </div>
            <div class="col-md-3">
                <label for="reinforce">
                    Reinforce
                </label>
                <g:select class="newselectpicker" id="reinforce"
                          name="objectives[row_id].reinforceOutcomes"
                          value="${objectives?.reinforceOutcomes*.prefix}"
                          optionKey="id"
                          from="${com.thinksoas.data.StudentOutcome.list(sort: 'id', order: 'asc')}"
                          multiple="true"
                          data-actions-box="true"/>
            </div>
            <div class="col-md-3">
                <label for="emphasize">
                    Emphasize
                </label>
                <g:select class="newselectpicker" id="emphasize"
                          name="objectives[row_id].emphasizeOutcomes"
                          value="${objectives?.emphasizeOutcomes*.prefix}"
                          optionKey="id"
                          from="${com.thinksoas.data.StudentOutcome.list(sort: 'id', order: 'asc')}"
                          multiple="true"
                          data-actions-box="true"/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label for="method1">
                    Method 1
                </label>
                <g:select class="newselectpicker" id="method1"
                          name="objectives[row_id].method1"
                          value="${objectives?.method1}"
                          from="${methods}"/>
            </div>
            <div class="col-md-3">
                <label for="method2">
                    Method 2
                </label>
                <g:select class="newselectpicker" id="method2"
                          name="objectives[row_id].method2"
                          value="${objectives?.method2}"
                          from="${methods}"/>
            </div>
        </div>
    </div>
    &nbsp;
</div>


</body>
</html>
