<%@ page import="com.thinksoas.StudentOutcome" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'studentOutcome.label', default: 'StudentOutcome')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

<div class="container-fluid">
      <div class="row">

        
<div class="container">
<h1>Edit Student Outcome ${studentOutcomeInstance.prefix}</h1>
%{-- 		<div id="edit-studentOutcome" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${studentOutcomeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${studentOutcomeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors> --}%
			<g:form url="[resource:studentOutcomeInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${studentOutcomeInstance?.version}" />
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
	</body>
</html>
