<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'class.label', default: 'Class')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>

	<div class="container-fluid">
		<div class="row">
			<div class="container">
				<h1>Create a Class</h1>
				<div id="create-class" class="content scaffold-create" role="main">

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

			<g:form url="[resource:classInstance, action:'save']" >
				<fieldset class="form well col-md-7">
					<g:render template="form"/>
				</fieldset>
				<div class="col-md-6">

					<fieldset class="buttons">
						<div class="btn-group">
							<g:submitButton name="create" class="btn btn-primary btn-block"
											value="Create Class"/>
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
	</body>
</html>
