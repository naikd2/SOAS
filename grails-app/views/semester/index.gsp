
<%@ page import="com.thinksoas.data.Semester" %>
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
			<h2>Semesters</h2>
			%{--<h2>Current Semester ${activeSemester}</h2>--}%


				%{--<g:remoteLink controller="Semester" action="changeSemester" update="updateMe">--}%
					%{--Change Semester <span class="glyphicon glyphicon-education"></span>--}%
				%{--</g:remoteLink>--}%


				<h5>Current Semester: ${activeSemester}</h5>
				<g:link controller="Semester" action="create">
					Add Semester <span class="glyphicon glyphicon-plus"></span>
				</g:link><br>

				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
						<tr>
							<g:sortableColumn property="year" title="Year" />
							<th property="term" title="Term">Term</th>
							<th></th>
						</tr>
						</thead>
						<tbody>
						<g:each in="${semesterInstanceList}" status="i" var="semesterInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:link action="edit" id="${semesterInstance.id}">${semesterInstance.year}</g:link></td>
								<td>${semesterInstance.term}</td>
								<td>
									<div class="pull-right">
										<g:link class="current" action="changeSemesterAction" resource="${semesterInstance}">
											<g:if test="${semesterInstance == activeSemester}">
												<span class = "glyphicon glyphicon-star">
											</g:if>
											<g:else>
												<span class = "glyphicon glyphicon-star-empty">
											</g:else>
										</g:link>
										%{--<g:link class="edit" action="edit" resource="${semesterInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--}%
										<g:link class="delete" action="delete" resource="${semesterInstance}" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" ><span class = "glyphicon glyphicon-trash pull-right"></span></g:link>
									</div>
								</td>
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
