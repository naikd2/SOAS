
<%@ page import="com.thinksoas.CourseObjective" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseObjective.label', default: 'CourseObjective')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-courseObjective" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-courseObjective" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list courseObjective">
			
				<g:if test="${courseObjectiveInstance?.prefix}">
				<li class="fieldcontain">
					<span id="prefix-label" class="property-label"><g:message code="courseObjective.prefix.label" default="Prefix" /></span>
					
						<span class="property-value" aria-labelledby="prefix-label"><g:fieldValue bean="${courseObjectiveInstance}" field="prefix"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseObjectiveInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="courseObjective.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${courseObjectiveInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseObjectiveInstance?.course}">
				<li class="fieldcontain">
					<span id="course-label" class="property-label"><g:message code="courseObjective.course.label" default="Course" /></span>
					
						<span class="property-value" aria-labelledby="course-label"><g:link controller="course" action="show" id="${courseObjectiveInstance?.course?.id}">${courseObjectiveInstance?.course?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseObjectiveInstance?.objOut}">
				<li class="fieldcontain">
					<span id="objOut-label" class="property-label"><g:message code="courseObjective.objOut.label" default="Obj Out" /></span>
					
						<g:each in="${courseObjectiveInstance.objOut}" var="o">
						<span class="property-value" aria-labelledby="objOut-label"><g:link controller="objectiveOutcome" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:courseObjectiveInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${courseObjectiveInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
