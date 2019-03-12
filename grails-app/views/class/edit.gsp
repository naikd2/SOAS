<%@ page import="com.thinksoas.data.Class" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'class.label', default: 'Class')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

	<div class="container-fluid">
		<div class="row">
			<div class="container">
				<h1>Edit Class</h1>
				<div id="edit-class" class="content scaffold-edit" role="main">

					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${classInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${classInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</g:hasErrors>

					<g:form url="[resource:classInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${classInstance?.version}" />
						<fieldset class="form well col-md-7">
							<g:render template="form"/>
						</fieldset>
						<div class="col-md-6">

							<fieldset class="buttons">
								<div class="btn-group">
								<g:submitButton name="create" class="btn btn-primary btn-block"
												value="Save Class"/>
							</div>
							<div class="btn-group">
								<g:actionSubmit name="cancel" class="btn"
												value="Cancel" action="index"/>
							</div>
						</fieldset>
						</div>
					</g:form>
				</div>
			</div>
		</div>
	</div>



		%{--<div id="edit-class" class="content scaffold-edit" role="main">--}%
			%{--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>--}%
			%{--<g:if test="${flash.message}">--}%
			%{--<div class="message" role="status">${flash.message}</div>--}%
			%{--</g:if>--}%
			%{--<g:hasErrors bean="${classInstance}">--}%
			%{--<ul class="errors" role="alert">--}%
				%{--<g:eachError bean="${classInstance}" var="error">--}%
				%{--<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>--}%
				%{--</g:eachError>--}%
			%{--</ul>--}%
			%{--</g:hasErrors>--}%
			%{--<g:form url="[resource:classInstance, action:'update']" method="PUT" >--}%
				%{--<g:hiddenField name="version" value="${classInstance?.version}" />--}%
				%{--<fieldset class="form">--}%
					%{--<g:render template="form"/>--}%
				%{--</fieldset>--}%
				%{--<fieldset class="buttons">--}%
					%{--<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />--}%
				%{--</fieldset>--}%
			%{--</g:form>--}%
		%{--</div>--}%
	</body>
</html>
