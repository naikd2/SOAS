
<%@ page import="com.thinksoas.report.course.CourseReportObjective" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseReportObjective.label', default: 'CourseReportObjective')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-courseReportObjective" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-courseReportObjective" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list courseReportObjective">
			
				<g:if test="${courseReportObjectiveInstance?.instrument}">
				<li class="fieldcontain">
					<span id="instrument-label" class="property-label"><g:message code="courseReportObjective.instrument.label" default="Instrument" /></span>
					
						<span class="property-value" aria-labelledby="instrument-label"><g:fieldValue bean="${courseReportObjectiveInstance}" field="instrument"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseReportObjectiveInstance?.max}">
				<li class="fieldcontain">
					<span id="max-label" class="property-label"><g:message code="courseReportObjective.max.label" default="Max" /></span>
					
						<span class="property-value" aria-labelledby="max-label"><g:fieldValue bean="${courseReportObjectiveInstance}" field="max"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseReportObjectiveInstance?.min}">
				<li class="fieldcontain">
					<span id="min-label" class="property-label"><g:message code="courseReportObjective.min.label" default="Min" /></span>
					
						<span class="property-value" aria-labelledby="min-label"><g:fieldValue bean="${courseReportObjectiveInstance}" field="min"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseReportObjectiveInstance?.objective}">
				<li class="fieldcontain">
					<span id="objective-label" class="property-label"><g:message code="courseReportObjective.objective.label" default="Objective" /></span>
					
						<span class="property-value" aria-labelledby="objective-label"><g:link controller="courseObjective" action="show" id="${courseReportObjectiveInstance?.objective?.id}">${courseReportObjectiveInstance?.objective?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseReportObjectiveInstance?.outcomes}">
				<li class="fieldcontain">
					<span id="outcomes-label" class="property-label"><g:message code="courseReportObjective.outcomes.label" default="Outcomes" /></span>
					
						<g:each in="${courseReportObjectiveInstance.outcomes}" var="o">
						<span class="property-value" aria-labelledby="outcomes-label"><g:link controller="courseReportOutcome" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${courseReportObjectiveInstance?.report}">
				<li class="fieldcontain">
					<span id="report-label" class="property-label"><g:message code="courseReportObjective.report.label" default="Report" /></span>
					
						<span class="property-value" aria-labelledby="report-label"><g:link controller="courseReport" action="show" id="${courseReportObjectiveInstance?.report?.id}">${courseReportObjectiveInstance?.report?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:courseReportObjectiveInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${courseReportObjectiveInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
