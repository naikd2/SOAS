
<%@ page import="com.thinksoas.report.course.CourseWork" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseWork.label', default: 'CourseWork')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-courseWork" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-courseWork" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list courseWork">
			
				<g:if test="${courseWorkInstance?.filename}">
				<li class="fieldcontain">
					<span id="filename-label" class="property-label"><g:message code="courseWork.filename.label" default="Filename" /></span>
					
						<span class="property-value" aria-labelledby="filename-label"><g:fieldValue bean="${courseWorkInstance}" field="filename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseWorkInstance?.fullPath}">
				<li class="fieldcontain">
					<span id="fullPath-label" class="property-label"><g:message code="courseWork.fullPath.label" default="Full Path" /></span>
					
						<span class="property-value" aria-labelledby="fullPath-label"><g:fieldValue bean="${courseWorkInstance}" field="fullPath"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseWorkInstance?.uploadDate}">
				<li class="fieldcontain">
					<span id="uploadDate-label" class="property-label"><g:message code="courseWork.uploadDate.label" default="Upload Date" /></span>
					
						<span class="property-value" aria-labelledby="uploadDate-label"><g:formatDate date="${courseWorkInstance?.uploadDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:courseWorkInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${courseWorkInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
