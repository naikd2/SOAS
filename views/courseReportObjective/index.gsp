
<%@ page import="com.thinksoas.Report.Couse.CourseReportObjective" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseReportObjective.label', default: 'CourseReportObjective')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-courseReportObjective" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-courseReportObjective" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="instrument" title="${message(code: 'courseReportObjective.instrument.label', default: 'Instrument')}" />
					
						<g:sortableColumn property="max" title="${message(code: 'courseReportObjective.max.label', default: 'Max')}" />
					
						<g:sortableColumn property="min" title="${message(code: 'courseReportObjective.min.label', default: 'Min')}" />
					
						<th><g:message code="courseReportObjective.objective.label" default="Objective" /></th>
					
						<th><g:message code="courseReportObjective.report.label" default="Report" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${courseReportObjectiveInstanceList}" status="i" var="courseReportObjectiveInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${courseReportObjectiveInstance.id}">${fieldValue(bean: courseReportObjectiveInstance, field: "instrument")}</g:link></td>
					
						<td>${fieldValue(bean: courseReportObjectiveInstance, field: "max")}</td>
					
						<td>${fieldValue(bean: courseReportObjectiveInstance, field: "min")}</td>
					
						<td>${fieldValue(bean: courseReportObjectiveInstance, field: "objective")}</td>
					
						<td>${fieldValue(bean: courseReportObjectiveInstance, field: "report")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${courseReportObjectiveInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
