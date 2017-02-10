
<%@ page import="com.thinksoas.course.report.CourseReport" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseReport.label', default: 'CourseReport')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-10 main">

				<h2>End of Semester Course Report</h2>

				<div class="table-responsive">
					<table class="table table-striped">
			<thead>
					<tr>
					
						<th><g:message code="courseReport.section.label" default="Section" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${courseReportInstanceList}" status="i" var="courseReportInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${courseReportInstance.id}">${fieldValue(bean: courseReportInstance, field: "section")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${courseReportInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
