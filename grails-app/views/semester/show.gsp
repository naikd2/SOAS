
<%@ page import="com.thinksoas.data.Semester" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'semester.label', default: 'Semester')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-10 main">
				<h3>Semester</h3>
			<ol class="property-list semester">
				<g:if test="${semesterInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="semester.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${semesterInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${semesterInstance?.term}">
				<li class="fieldcontain">
					<span id="term-label" class="property-label"><g:message code="semester.term.label" default="Term" /></span>
					
						<span class="property-value" aria-labelledby="term-label"><g:fieldValue bean="${semesterInstance}" field="term"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${semesterInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="semester.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${semesterInstance?.active}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:semesterInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${semesterInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
