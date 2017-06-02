
<%@ page import="com.thinksoas.report.outcome.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="Student Outcome Assessment" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
<body>
<div class="container-fluid">
	<div class="row">
			<h2 class="sub-header">Outcome Assessment Plan</h2>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
					<tr>

						<th>Outcome</th>

					</tr>
					</thead>
					<tbody>
						<g:each in="${OutcomeReport.list()}" status="i" var="report">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:link action="show" id="${report.id}">${fieldValue(bean: report, field: "outcome")}</g:link></td>
							</tr>
						</g:each>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>

</body>
</html>
