
<%@ page import="com.thinksoas.report.course.CourseReportOutcome" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseReportOutcome.label', default: 'CourseReportOutcome')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-courseReportOutcome" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

	<g:if test="${courseReportOutcomeInstanceList.isEmpty()}">
		<a href="/soas/studentOutcome/index">First Create Outcome</a>
	</g:if>
	<g:else>

		<div id="list-courseReportOutcome" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
					</tr>
				</thead>
				<tbody>
					<g:each in="${courseReportOutcomeInstanceList}" status="i" var="courseReportOutcomeInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${courseReportOutcomeInstanceCount ?: 0}" />
			</div>
		</div>
	</g:else>

	</body>
</html>
