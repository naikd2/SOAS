
<%@ page import="com.thinksoas.ObjectiveOutcome" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objectiveOutcome.label', default: 'ObjectiveOutcome')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-objectiveOutcome" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-objectiveOutcome" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list objectiveOutcome">
			
				<g:if test="${objectiveOutcomeInstance?.objective}">
				<li class="fieldcontain">
					<span id="objective-label" class="property-label"><g:message code="objectiveOutcome.objective.label" default="Objective" /></span>
					
						<span class="property-value" aria-labelledby="objective-label"><g:link controller="courseObjective" action="show" id="${objectiveOutcomeInstance?.objective?.id}">${objectiveOutcomeInstance?.objective?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${objectiveOutcomeInstance?.outcome}">
				<li class="fieldcontain">
					<span id="outcome-label" class="property-label"><g:message code="objectiveOutcome.outcome.label" default="Outcome" /></span>
					
						<span class="property-value" aria-labelledby="outcome-label"><g:link controller="studentOutcome" action="show" id="${objectiveOutcomeInstance?.outcome?.id}">${objectiveOutcomeInstance?.outcome?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${objectiveOutcomeInstance?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="objectiveOutcome.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${objectiveOutcomeInstance}" field="level"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:objectiveOutcomeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${objectiveOutcomeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
