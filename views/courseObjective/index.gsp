
<%@ page import="com.thinksoas.CourseObjective" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseObjective.label', default: 'CourseObjective')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-courseObjective" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-courseObjective" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="prefix" title="${message(code: 'courseObjective.prefix.label', default: 'Prefix')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'courseObjective.description.label', default: 'Description')}" />
					
						<th><g:message code="courseObjective.course.label" default="Course" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${courseObjectiveInstanceList}" status="i" var="courseObjectiveInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${courseObjectiveInstance.id}">${fieldValue(bean: courseObjectiveInstance, field: "prefix")}</g:link></td>
					
						<td>${fieldValue(bean: courseObjectiveInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: courseObjectiveInstance, field: "course")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${courseObjectiveInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
