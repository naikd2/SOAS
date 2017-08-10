
<%@ page import="com.thinksoas.data.Program" %>
<%@ page import="com.thinksoas.data.Course" %>
<%@ page import="com.thinksoas.data.StudentOutcome" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
    <title>Settings</title>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">

        <div class="container">
                  <h1 class="page-header">Computer Engineering Program</h1>

        <div class="main">
          <div class="table-responsive">
          <h2 class="sub-header">Program Settings </h2>
            <g:form url="[resource:program, action:'update']" method="PUT" >
              <g:hiddenField name="version" value="${programsInstance?.version}" />
              <fieldset class="form">
                <g:render template="form"/>
              </fieldset>
              <fieldset class="buttons">
                <g:actionSubmit class="btn btn-primary btn-block" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
              </fieldset>
            </g:form>
          </div>
        </div>
      </div>
      </div>
    </div>
  </body>
</html>
