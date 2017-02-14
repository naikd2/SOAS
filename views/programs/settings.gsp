
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
          <h2 class="sub-header">Program Settings</h2>
            <g:form url="[resource:programsInstance, action:'update']" method="PUT" >
              <g:hiddenField name="version" value="${programsInstance?.version}" />
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
