
<%@ page import="com.thinksoas.ObjectiveOutcome" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objectiveOutcome.label', default: 'ObjectiveOutcome')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-objectiveOutcome" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-objectiveOutcome" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="objectiveOutcome.objective.label" default="Objective" /></th>
					
						<th><g:message code="objectiveOutcome.outcome.label" default="Outcome" /></th>
					
						<g:sortableColumn property="level" title="${message(code: 'objectiveOutcome.level.label', default: 'Level')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${objectiveOutcomeInstanceList}" status="i" var="objectiveOutcomeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${objectiveOutcomeInstance.id}">${fieldValue(bean: objectiveOutcomeInstance, field: "objective")}</g:link></td>
					
						<td>${fieldValue(bean: objectiveOutcomeInstance, field: "outcome")}</td>
					
						<td>${fieldValue(bean: objectiveOutcomeInstance, field: "level")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${objectiveOutcomeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
