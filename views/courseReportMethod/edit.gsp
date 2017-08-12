<%@ page import="com.thinksoas.report.course.CourseReportMethod" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseReportMethod.label', default: 'CourseReportMethod')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

	<div class="container-fluid">
		<div class="row">
			<h3>${courseReportMethodInstance.method}</h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${courseReportMethodInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${courseReportMethodInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:courseReportMethodInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${courseReportMethodInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</div>
	</body>
</html>
