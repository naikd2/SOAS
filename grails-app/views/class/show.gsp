
<%@ page import="com.thinksoas.data.Class" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'class.label', default: 'Class')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container-fluid">
		<div class="row">

			<div class="list-group">

				<div class="col-sm-10 main">

					<h1><g:fieldValue bean="${classInstance}" field="course"/>-<g:fieldValue bean="${classInstance}" field="section"/></h1>


					<div class="text-right">
						<g:link controller="Class" action="edit" id="${classInstance.id}">
							Edit <span class="glyphicon glyphicon-cog"></span>
						</g:link>
					&nbsp;
						<g:link controller="Class" action="delete" id="${classInstance.id}" onclick="return confirm('${message(code: 'course.button.delete.confirm.message', default: 'Are you sure? All class sections of this course will be deleted as well.')}');">
							Delete <span class="glyphicon glyphicon-trash"></span>
						</g:link>
					</div>

					<div class="list-group-item">
						<h4 class="list-group-item-heading">Semester</h4>
						<p class="list-group-item-text"><font size="+1"><g:fieldValue bean="${classInstance}" field="semester"/></font></p>
					</div>

					<div class="list-group-item">
						<h4 class="list-group-item-heading">Professor</h4>
						<p class="list-group-item-text"><font size="+1"><g:fieldValue bean="${classInstance}" field="professor.username"/></font></p>
					</div>

					<div class="list-group-item">
						<h4 class="list-group-item-heading">Students</h4>
						<p class="list-group-item-text"><font size="+1"><g:fieldValue bean="${classInstance}" field="students"/></font></p>
					</div>

				</div>
			</div>

				%{----}%
			%{--<g:form url="[resource:classInstance, action:'delete']" method="DELETE">--}%
				%{--<fieldset class="buttons">--}%
					%{--<g:link class="edit" action="edit" resource="${classInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--}%
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				%{--</fieldset>--}%
			%{--</g:form>--}%
		</div>
	</body>
</html>
