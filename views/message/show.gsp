
<%@ page import="com.thinksoas.data.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-message" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-message" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list message">
			
				<g:if test="${messageInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="message.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${messageInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.inClass}">
				<li class="fieldcontain">
					<span id="inClass-label" class="property-label"><g:message code="message.inClass.label" default="In Class" /></span>
					
						<span class="property-value" aria-labelledby="inClass-label"><g:link controller="class" action="show" id="${messageInstance?.inClass?.id}">${messageInstance?.inClass?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="message.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${messageInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="message.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${messageInstance?.user?.id}">${messageInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:messageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${messageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
