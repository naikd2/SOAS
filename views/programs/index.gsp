
<%@ page import="com.thinksoas.Programs" %>
<%@ page import="com.thinksoas.Course" %>
<%@ page import="com.thinksoas.StudentOutcome" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
    <title><g:message code="default.show.label" args="[entityName]" /></title>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">

        <div class="container">
                  <h1 class="page-header">Computer Engineering Program</h1>

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
                      <td><a href="${createLink(controller:'Course', action:'show', params:[id:course.id])}" role="button">${fieldValue(bean: course, field: "name")}</a></td>
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
                      <td><a href="${createLink(controller:'StudentOutcome', action:'show', params:[id:studentOutcome.id])}" >${fieldValue(bean: studentOutcome, field: "prefix")}</a></td>
                      <td>${fieldValue(bean: studentOutcome, field: "description")}</td>
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
