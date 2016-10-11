<%@ page import="com.thinksoas.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>



	<body>
<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="${createLink(controller:'Course', action:'index')}">Return to Courses <span class="sr-only">(current)</span></a></li>
                                    <li><hr style="border: 1px solid white; width: 85%; margin-top: 10px; margin-bottom:10px;"></li>

            <li><a href="${createLink(controller:'Course', action:'create')}">Add</a></li>
            <li><a href="${createLink(controller:'Course', action:'index')}">Index</a></li>
            <li><a href="#">Dummy</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Dummy</a></li>
            <li><a href="">Dummy</a></li>
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

        
%{-- 		<div id="edit-course" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${courseInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${courseInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors> --}%
			<g:form url="[resource:courseInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${courseInstance?.version}" />
				<fieldset class="form">
					<g:render template="formEdit"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
</div>
	</body>
</html>
