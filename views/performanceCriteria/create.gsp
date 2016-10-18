<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'performanceCriteria.label', default: 'PerformanceCriteria')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="${createLink(controller:'Course', action:'index')}">Return to Courses <span class="sr-only">(current)</span></a></li>
					<li><a href="${createLink(controller:'Course', action:'create')}">Add</a></li>
					<li><a href="${createLink(controller:'Course', action:'index')}">Index</a></li>
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
			<div class="container">
				<h1>Create Performance Criteria</h1>
				<div id="create-performanceCriteria" class="content scaffold-create" role="main">
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${performanceCriteriaInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${performanceCriteriaInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</g:hasErrors>
					<g:form url="[resource:performanceCriteriaInstance, action:'save']" >
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</fieldset>
					</g:form>
				</div>
			</div>
	</body>
</html>