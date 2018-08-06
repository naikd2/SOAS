<%@ page import="com.thinksoas.data.Semester" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'semester.label', default: 'Semester')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-semester" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${semesterInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${semesterInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:semesterInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${semesterInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<div class="col-md-4">
					<fieldset class="buttons btn-group-justified">
						<div class="btn-group">
							<g:actionSubmit class="save" class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						</div>
						<div class="btn-group">
							<g:actionSubmit name="cancel" class="btn"
											value="Cancel" action="index"/>
						</div>
					</fieldset>
				</div>
			</g:form>
		</div>
	</body>
</html>
