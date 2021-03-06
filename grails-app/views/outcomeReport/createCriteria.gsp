<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'performanceCriteria.label', default: 'PerformanceCriteria')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container-fluid">
		<div class="row">
			<div class="container">
				<h1>Create Performance Criterion</h1>
				<div id="create-performanceCriteria" class="content scaffold-create" role="main">
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${performanceCriteriaInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${performanceCriteriaInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</g:hasErrors>
					<g:form url="[resource:performanceCriteriaInstance, action:'saveCriteria']" >
						<fieldset class="form">
							<g:render template="formCriteria"/>
						</fieldset>
						<div class="col-sm-10">
							<fieldset class="buttons">
								<g:submitButton name="create" class="btn btn-primary btn-block" value="${message(code: 'default.button.create.label', default: 'Create')}" />
							</fieldset>
						</div>
					</g:form>
				</div>
			</div>
	</body>
</html>