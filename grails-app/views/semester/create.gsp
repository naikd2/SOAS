<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'semester.label', default: 'Semester')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <asset:javascript src="bootstrap-datepicker.js"/>
    <asset:stylesheet src="datepicker.css"/>

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="container">
            <h1>Create a Semester</h1>

            <g:eachError bean="${semesterInstance}">
            %{--<div class="alert alert-danger alert-dismissable">--}%
            %{--<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>--}%
            %{--<strong><g:message error="${it}"/></strong>--}%
            %{--</div>--}%
            </g:eachError>

            <g:form url="[resource: semesterInstance, action: 'save']">
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>

                <div class="col-sm-10">
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-primary btn-block"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                    </fieldset>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
