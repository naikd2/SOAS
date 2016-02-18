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
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="${createLink(controller:'Programs', action:'index', params:[id:session.currentProgram])}">Return to Overview <span class="sr-only">(current)</span></a></li>
                        <li><hr style="border: 1px solid white; width: 85%; margin-top: 10px; margin-bottom:10px;"></li>
            <li><a href="${createLink(controller:'Course', action:'create')}">New Course</a></li>
            <li><a href="${createLink(controller:'Course', action:'index')}">Dummy</a></li>
            <li><a href="#">Dummy</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Dummy</a></li>
            <li><a href="">Dummy</a></li>
            <li><a href="">Dummy</a></li>
            <li><a href="">Dummy</a></li>
            <li><a href="">Dummy</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Dummy</a></li>
            <li><a href="">Dummy</a></li>
            <li><a href="">Dummy</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header"></h1>
          <h2 class="sub-header">Course List</h2>
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
						<g:if test="${courseInstance.program =~ session.currentProgram}">
							<td><g:link action="show" id="${courseInstance.id}">${fieldValue(bean: courseInstance, field: "subject")}</g:link></td>
						
							<td>${fieldValue(bean: courseInstance, field: "number")}</td>
						
							<td>${fieldValue(bean: courseInstance, field: "name")}</td>
						
							<td>${fieldValue(bean: courseInstance, field: "description")}</td>
						
							<td>${fieldValue(bean: courseInstance, field: "units")}</td>
						
							<td>${fieldValue(bean: courseInstance, field: "offered")}</td>
						</g:if>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${courseInstanceCount ?: 0}" />
			</div>
          </div>
        </div>
      </div>
    </div>

	</body>
</html>
