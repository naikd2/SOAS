
<%@ page import="com.thinksoas.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'SO_Report.label', default: 'SO_Report')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>

	<body>

	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-10 main">

				<h2>${SO_ReportInstance.outcome}</h2>
				<div>
					<a href="${createLink(controller:'performanceCriteria', action:'create', params:[reportId: SO_ReportInstance.id])}">Add New Performance Criterion</a>
				</div>
				<div class="table-responsive">
					<table class="table">
						<thead>
						<tr>
							<th class="text-center">Description</th>
							<th class="text-center">Method of Assessment</th>
							<th class="text-center">Where Data is Collected</th>
							<th class="text-center">Target</th>
							<th class="text-center">Length</th>
							<th class="text-center">When</th>
							<th class="text-center">Delete</th>
						</tr>
						</thead>
						<tbody>
						<g:each in="${SO_ReportInstance.criteria}" var="c">
							<td>
								${c.objective.description}
							</td>
							<td>
								${c.assessments.join(':::').encodeAsHTML().replace(':::',"<div />").encodeAsRaw()}
							</td>
							<td>
								${c.objective.course}
							</td>
							<td>
								${settings.performanceTarget}
							</td>
							<td>
								${settings.assessmentPeriod}
							</td>
							<td>
								${c.objective.course.offered}
							</td>
							<td>
								<p>
									<g:link controller="performanceCriteria" action="delete" id="${c.id}">
										<span class="glyphicon glyphicon-trash"></span>
									</g:link>
								</p>
							</td>
							</tbody>
						</g:each>
					</table>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>