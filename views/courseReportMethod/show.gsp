
<%@ page import="com.thinksoas.report.course.CourseReportMethod" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseReportMethod.label', default: 'CourseReportMethod')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-courseReportMethod" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-courseReportMethod" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list courseReportMethod">
			
				<g:if test="${courseReportMethodInstance?.method}">
				<li class="fieldcontain">
					<span id="method-label" class="property-label"><g:message code="courseReportMethod.method.label" default="Method" /></span>
					
						<span class="property-value" aria-labelledby="method-label"><g:fieldValue bean="${courseReportMethodInstance}" field="method"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseReportMethodInstance?.outcome}">
				<li class="fieldcontain">
					<span id="outcome-label" class="property-label"><g:message code="courseReportMethod.outcome.label" default="Outcome" /></span>
					
						<span class="property-value" aria-labelledby="outcome-label"><g:link controller="courseReportOutcome" action="show" id="${courseReportMethodInstance?.outcome?.id}">${courseReportMethodInstance?.outcome?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseReportMethodInstance?.percentage}">
				<li class="fieldcontain">
					<span id="percentage-label" class="property-label"><g:message code="courseReportMethod.percentage.label" default="Percentage" /></span>
					
						<span class="property-value" aria-labelledby="percentage-label"><g:fieldValue bean="${courseReportMethodInstance}" field="percentage"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:courseReportMethodInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${courseReportMethodInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
