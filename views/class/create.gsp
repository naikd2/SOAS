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
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="${createLink(controller:'Class', action:'index')}">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="${createLink(controller:'Class', action:'create')}">Add</a></li>
            <li><a href="${createLink(controller:'Class', action:'index')}">Index</a></li>
            <li><a href="#"> </a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href=""> </a></li>
            <li><a href=""> </a></li>
            <li><a href=""> </a></li>
            <li><a href=""> </a></li>
            <li><a href=""> </a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href=""> </a></li>
            <li><a href=""> </a></li>
            <li><a href=""> </a></li>
          </ul>
        </div>


%{-- 		<div id="create-class" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${classInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${classInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors> --}%
			<g:form url="[resource:classInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit value="Sign Up" action="signUpClass"/>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
