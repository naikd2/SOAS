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
                    &nbsp;
                    <g:render template="form"/>
                </fieldset>

                <div class="col-md-4">
                    <fieldset class="buttons btn-group-justified">
                        <div class="btn-group">
                            <g:submitButton name="create" class=" btn-primary btn"
                                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                        </div>
                        <div class="btn-group">
                        <g:actionSubmit name="cancel" class="btn"
                                        value="Cancel" action="index"/>
                        </div>
                    </fieldset>
                </div>
                <div class="col-md-6"></div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
