<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'studentOutcome.label', default: 'StudentOutcome')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="container-fluid">
    <div class="row">

        <div class="container">

            <g:eachError bean="${studentOutcomeInstance}">
            %{--<div class="alert alert-danger alert-dismissable">--}%
            %{--<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>--}%
            %{--<strong><g:message error="${it}"/></strong>--}%
            %{--</div>--}%
            </g:eachError>
            <h1>Create a Student Outcome</h1>



        %{--<div class="alert alert-dismissible alert-info">--}%
        %{--<button type="button" class="close" data-dismiss="alert">&times;</button>--}%
        %{--<strong>Heads up!</strong> This <a href="#" class="alert-link">alert needs your attention</a>, but it's not super important.--}%
        %{--</div>--}%
            <g:form url="[resource: studentOutcomeInstance, action: 'save', params: [program: session.currentProgram]]">
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>

                <div class="col-md-6">
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
            </g:form>
        </div>
    </div>
</div>
</div>
</body>
</html>
