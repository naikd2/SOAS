
<%@ page import="com.thinksoas.SO_Report" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'SO_Report.label', default: 'SO_Report')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
<body>
<div class="container-fluid">
	<div class="row">

			<h1 class="page-header"></h1>
			<h2 class="sub-header">Outcome Assessment Plan</h2>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
					<tr>

						<th><g:message code="SO_Report.outcome.label" default="Outcome" /></th>

					</tr>
					</thead>
					<tbody>
						<g:each in="${SO_ReportInstanceList}" status="i" var="SO_ReportInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:link action="show" id="${SO_ReportInstance.id}">${fieldValue(bean: SO_ReportInstance, field: "outcome")}</g:link></td>
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
