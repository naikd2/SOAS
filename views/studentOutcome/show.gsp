
<%@ page import="com.thinksoas.StudentOutcome" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'studentOutcome.label', default: 'StudentOutcome')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>


		<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="${createLink(controller:'StudentOutcome', action:'index')}">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="${createLink(controller:'StudentOutcome', action:'create')}">Add</a></li>
            <li><a href="${createLink(controller:'StudentOutcome', action:'index')}">Index</a></li>
            <li><a href="#"></a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href=""></a></li>
            <li><a href=""></a></li>
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


	<div class="col-md-10 main">
		<ul class="list-group">
  			<li class="list-group-item active">
  					<g:fieldValue bean="${studentOutcomeInstance}" field="prefix"/>
  			</li>

  			<li class="list-group-item">
  					<g:fieldValue bean="${studentOutcomeInstance}" field="description"/>
  			</li>

		</ul>

			</ol>
			<g:form url="[resource:studentOutcomeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${studentOutcomeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		</div>
		</div>
	</body>
</html>
