
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
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="${createLink(controller:'Course', action:'index')}">Courses</a></li>
            <li><a href="${createLink(controller:'Course', action:'create')}">New Course</a></li>
            <li><hr style="border: 1px solid white; width: 85%; margin-top: 10px; margin-bottom:10px;"></li>
            <li><a href="${createLink(controller:'studentOutcome', action:'index')}">Student Outcomes</a></li>
            <li><a href="${createLink(controller:'studentOutcome', action:'create')}">New Student Outcome</a></li>
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
        <div class="container">
                  <h1 class="page-header">Computer Engineering Program</h1>

        <div class="main">
          <div class="table-responsive">
          <h2 class="sub-header">Program Settings</h2>
            <g:form url="[resource:courseInstance, action:'update']" method="PUT" >
              <g:hiddenField name="version" value="${courseInstance?.version}" />
              <fieldset class="form">
                <g:render template="form"/>
              </fieldset>
              <fieldset class="buttons">
                <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
              </fieldset>
            </g:form>
          </div>
        </div>
      </div>
      </div>
    </div>
  </body>
</html>
