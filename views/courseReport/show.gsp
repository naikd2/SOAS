
<%@ page import="com.thinksoas.Report.Couse.CourseReport; com.thinksoas.StudentOutcome" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseReport.label', default: 'CourseReport')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

	<div class="container-fluid">

		<h6>
			Student Performance Assessment Data Form
		</h6>
		<h6>
			Instructor: ${courseReportInstance.section.professor.username}
		</h6>
		<h6>
			Course: ${courseReportInstance.section}
		</h6>
		<h6>
			Semester: ${courseReportInstance.section.semester}
		</h6>
		<h6>
			Students: ${courseReportInstance.section.students}
		</h6>

	<table class="table table-striped table-hover ">
			<thead>
			<tr>
				<th>Objective</th>
				<th>Instrument</th>
				<g:each in="${StudentOutcome.list()}" var="so">
					<th>${so.prefix}</th>
				</g:each>
				<th>Max/Min</th>
			</tr>
			</thead>
			<tbody>
			<g:each in="${objectives}" var="o">
				<tr>
					<td><g:link controller="courseReportObjective" action="edit" id="${o.id}">${o.objective.prefix}</g:link></td>
					<td>${o.instrument}</td>
					<g:each in="${StudentOutcome.list()}" var="so">
						<g:set var="found" value="${false}"/>
						<g:each in="${o.outcomes}" var="outs">
							<g:if test="${outs.outcome == so}" >
								<g:set var="found" value="${true}"/>
								<td>
								<g:each in="${outs.methods}" var="m">
									<g:link controller="courseReportMethod" action="edit" id="${m.id}">
										${m.method}: ${m.percentage}%
									</g:link>
								</g:each>
								</td>
							</g:if>
						</g:each>
							<g:if test="${found == false}" >
								<td>N/A</td>
							</g:if>
						</g:each>
					<td>
						${o.max}/${o.min}
					</td>
				</tr>
			</g:each>
			</tbody>
		</table>
	</div>
	</body>
</html>
