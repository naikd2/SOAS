<%@ page import="com.thinksoas.Course" %>
<%@ page import="com.thinksoas.Programs" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

<div class="container-fluid">
      <div class="row">

		  <div class="col-sm-10 main">

          <h2>Course List</h2>
		  <g:link controller="Course" action="create">
			  Add Course <span class="glyphicon glyphicon-plus"></span>
		  </g:link>


			  <div class="table-responsive">
            <table class="table table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="subject" title="${message(code: 'course.subject.label', default: 'Subject')}" />
					
						<g:sortableColumn property="number" title="${message(code: 'course.number.label', default: 'Number')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'course.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'course.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="units" title="${message(code: 'course.units.label', default: 'Units')}" />
					
						<g:sortableColumn property="offered" title="${message(code: 'course.offered.label', default: 'Offered')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${courseInstanceList}" status="i" var="courseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td><g:link action="show" id="${courseInstance.id}">${fieldValue(bean: courseInstance, field: "subject")}</g:link></td>
						
							<td>${fieldValue(bean: courseInstance, field: "number")}</td>
						
							<td>${fieldValue(bean: courseInstance, field: "name")}</td>
						
							<td>${fieldValue(bean: courseInstance, field: "description")}</td>
						
							<td>${fieldValue(bean: courseInstance, field: "units")}</td>
						
							<td>${fieldValue(bean: courseInstance, field: "offered")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				%{-- <g:paginate total="${courseInstanceCount ?: 0}" /> --}%
			</div>
	</body>
</html>
