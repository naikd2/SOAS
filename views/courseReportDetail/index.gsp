
<%@ page import="com.thinksoas.course.report.CourseReportDetail" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseReportDetail.label', default: 'CourseReportDetail')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-courseReportDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-courseReportDetail" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="instrument" title="${message(code: 'courseReportDetail.instrument.label', default: 'Instrument')}" />
					
						<g:sortableColumn property="max" title="${message(code: 'courseReportDetail.max.label', default: 'Max')}" />
					
						<g:sortableColumn property="min" title="${message(code: 'courseReportDetail.min.label', default: 'Min')}" />
					
						<th><g:message code="courseReportDetail.objective.label" default="Objective" /></th>
					
						<th><g:message code="courseReportDetail.report.label" default="Report" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${courseReportDetailInstanceList}" status="i" var="courseReportDetailInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${courseReportDetailInstance.id}">${fieldValue(bean: courseReportDetailInstance, field: "instrument")}</g:link></td>
					
						<td>${fieldValue(bean: courseReportDetailInstance, field: "max")}</td>
					
						<td>${fieldValue(bean: courseReportDetailInstance, field: "min")}</td>
					
						<td>${fieldValue(bean: courseReportDetailInstance, field: "objective")}</td>
					
						<td>${fieldValue(bean: courseReportDetailInstance, field: "report")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${courseReportDetailInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
