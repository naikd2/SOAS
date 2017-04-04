
<%@ page import="com.thinksoas.Semester" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'semester.label', default: 'Semester')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-10 main">
				<h2>Current Semester ${activeSemester}</h2>
				<g:link controller="Semester" action="create">
					Add Semester <span class="glyphicon glyphicon-plus"></span>
				</g:link><br>



				<g:remoteLink controller="Semester" action="changeSemester" update="updateMe">
					Change Semester <span class="glyphicon glyphicon-education"></span>
				</g:remoteLink>

					<div id="updateMe">
						<br>
					</div>

				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
						<tr>
							<g:sortableColumn property="year" title="Semester" />
						</tr>
						</thead>
						<tbody>
						<g:each in="${semesterInstanceList}" status="i" var="semesterInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:link action="show" id="${semesterInstance.id}">${semesterInstance}</g:link></td>
							</tr>
						</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${semesterInstanceCount ?: 0}" />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
