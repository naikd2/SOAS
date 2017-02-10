
<%@ page import="com.thinksoas.Programs" %>
<%@ page import="com.thinksoas.Course" %>
<%@ page import="com.thinksoas.StudentOutcome" %>
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
            <li class="active"><a href="${createLink(controller:'Programs', action:'index')}">All Programs <span class="sr-only">(current)</span></a></li>
            <li><hr style="border: 1px solid white; width: 85%; margin-top: 10px; margin-bottom:10px;"></li>
            <li><g:link class="edit" action="edit" resource="${programsInstance}"><g:message code="program.button.edit.label" default="Edit Program" /></g:link></li>
            <li><g:link controller="programs" action="delete" params="[id:programsInstance.id]" onclick="return confirm('${message(code: 'programs.button.delete.confirm.message', default: 'Are you sure? Deleting this program will delete all of its courses and outcomes')}');"><g:message code="program.button.delete.label" default="Delete Program"/> </g:link></li>
           	<li><hr style="border: 1px solid white; width: 85%; margin-top: 10px; margin-bottom:10px;"></li>
            <li><a href="${createLink(controller:'Course', action:'index')}">Courses</a></li>
            <li><a href="${createLink(controller:'Course', action:'create')}">New Course</a></li>
            <li><hr style="border: 1px solid white; width: 85%; margin-top: 10px; margin-bottom:10px;"></li>
            <li><a href="${createLink(controller:'studentOutcome', action:'index')}">Student Outcomes</a></li>
            <li><a href="${createLink(controller:'studentOutcome', action:'create')}">New Student Outcome</a></li>
            <li><a href=""></a></li>
            <li><a href=""></a></li>
            <li><a href=""></a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href=""></a></li>
            <li><a href=""></a></li>
            <li><a href=""></a></li>
          </ul>
        </div>
        <div class="container">
                  <h1 class="page-header">${programsInstance.programName}</h1>

        <div class="main">
          <div class="table-responsive">
          <h2 class="sub-header">Program Courses</h2>
            <table class="table table-striped">
			        <thead>
				        <tr>
					        <g:sortableColumn property="programCourses" title="${message(code: 'programs.courses.label', default: 'Course Name')}" />					
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
          </div>

          <div class="table-responsive">
                    <h2 class="sub-header">Program Student Outcomes</h2>

            <table class="table table-striped">
              <thead>
                <tr>
                  <g:sortableColumn property="prefix" title="${message(code: 'studentOutcome.prefix.label', default: 'Prefix')}" />
                  <g:sortableColumn property="description" title="${message(code: 'studentOutcome.description.label', default: 'Description')}" />     
                </tr>
              </thead>
              <tbody>
                <g:set var="studentOutcomeList" value="${StudentOutcome.getAll()}" />
                <g:each in="${studentOutcomeList}" status="i" var="studentOutcome">
                  <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <g:if test="${studentOutcome.program =~ session.currentProgram}">
                      <td><g:link action="edit" id="${studentOutcome.id}">${fieldValue(bean: studentOutcome, field: "prefix")}</g:link></td>
                      <td>${fieldValue(bean: studentOutcome, field: "description")}</td>
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
    </div>
	</body>
</html>
