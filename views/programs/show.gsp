
<%@ page import="com.thinksoas.Programs" %>
<%@ page import="com.thinksoas.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'programs.label', default: 'Programs')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:set var="currentProgram" value="${programsInstance.id}" scope="session"/>
		<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="${createLink(controller:'Programs', action:'index')}">Programs Index <span class="sr-only">(current)</span></a></li>
            <li><g:link class="edit" action="edit" resource="${programsInstance}"><g:message code="program.button.edit.label" default="Edit Program" /></g:link></li>
            <li><g:link controller="programs" action="delete" params="[id:programsInstance.id]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><g:message code="program.button.delete.label" default="Delete Program"/> </g:link></li>
           
            <li><a href="${createLink(controller:'Course', action:'create')}">New Course</a></li>
            <li><a href="${createLink(controller:'studentOutcome', action:'index')}">Student Outcomes</a></li>
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
          <h1 class="page-header">${programsInstance.programName}</h1>
          <div class="table-responsive">
            <table class="table table-striped">
			<thead>
					<tr>
					
			<g:sortableColumn property="programCourses" title="${message(code: 'programs.courses.label', default: 'Program Courses')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:set var="courseList" value="${Course.getAll()}" />
				<g:each in="${courseList}" status="i" var="course">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<g:if test="${course.program =~ session.currentProgram}">
						<td><a href="${createLink(controller:'Course', action:'show', params:[id:course.id])}" role="button">${fieldValue(bean: course, field: "name")}</a></td>
						</g:if>
					</tr>
				</g:each>
				</tbody>

			</table>
			<div class="pagination">
				<g:paginate total="${courseInstanceCount ?: 0}" />
			</div>
            </table>
          </div>
        </div>
      </div>
    </div>
	</body>
</html>
