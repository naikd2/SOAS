
<%@ page import="com.thinksoas.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="Student Outcome Assessment" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>

	<body>

	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-10 main">

				<h2>${outcomeReportInstance.outcome}</h2>
				<div>
					<a href="${createLink(controller:'outcomeReportCriteria', action:'create', params:[reportId: outcomeReportInstance.id])}">Add New Performance Criterion</a>
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
						<g:each in="${outcomeReportInstance.criteria}" var="c">
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
									<g:link controller="outcomeReportCriteria" action="delete" id="${c.id}">
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