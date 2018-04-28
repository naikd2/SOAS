
<%@ page import="com.thinksoas.data.Class" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'class.label', default: 'Class')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-10 main">

				<h2>Class List</h2>
				<g:link controller="Class" action="create">
					Add Class <span class="glyphicon glyphicon-plus"></span>
				</g:link>


				<div class="table-responsive">
					<table class="table table-striped">
			<thead>
					<tr>
					
						<th><g:message code="class.semester.label" default="Semester" /></th>
					
						<th><g:message code="class.course.label" default="Course" /></th>
					
						<th><g:message code="class.professor.label" default="Professor" /></th>
					
						<g:sortableColumn property="section" title="${message(code: 'class.section.label', default: 'Section')}" />
					
						<g:sortableColumn property="students" title="${message(code: 'class.students.label', default: 'Students')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${classInstanceList}" status="i" var="classInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${classInstance.id}">${fieldValue(bean: classInstance, field: "semester")}</g:link></td>
					
						<td>${fieldValue(bean: classInstance, field: "course")}</td>
					
						<td>${classInstance.professor.username}</td>
					
						<td>${fieldValue(bean: classInstance, field: "section")}</td>
					
						<td>${fieldValue(bean: classInstance, field: "students")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${classInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
