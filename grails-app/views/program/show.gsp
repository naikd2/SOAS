
<%@ page import="com.thinksoas.data.Program" %>
<%@ page import="com.thinksoas.data.Course" %>
<%@ page import="com.thinksoas.data.StudentOutcome" %>
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
