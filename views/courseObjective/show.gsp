
<%@ page import="com.thinksoas.CourseObjective" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseObjective.label', default: 'CourseObjective')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

	${courseObjectiveInstance.description}

	</body>
</html>
