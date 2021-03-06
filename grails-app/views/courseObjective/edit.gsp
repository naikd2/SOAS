<%@ page import="com.thinksoas.data.CourseObjective" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseObjective.label', default: 'CourseObjective')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="container">
			<h1>Edit Course Objective: <g:fieldValue bean="${courseObjectiveInstance}" field="course.name"/></h1>
			%{--<div id="edit-courseObjective" class="content scaffold-edit" role="main">--}%

				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>

				<g:hasErrors bean="${courseObjectiveInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${courseObjectiveInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>

				<g:form url="[resource:courseObjectiveInstance, action:'update']" method="PUT" >
					<g:hiddenField name="version" value="${courseObjectiveInstance?.version}" />
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="buttons">
						<g:actionSubmit class="btn btn-primary btn-bloc" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</fieldset>
				</g:form>
			%{--</div>--}%
		</div>
	</div>
</div>
</body>
</html>
