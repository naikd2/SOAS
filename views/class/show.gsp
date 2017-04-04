
<%@ page import="com.thinksoas.Class" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'class.label', default: 'Class')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-10 main">

				<h2>Class List</h2>
			<ol class="property-list class">
			
				<g:if test="${classInstance?.semester}">
				<li class="fieldcontain">
					<span id="semester-label" class="property-label"><g:message code="class.semester.label" default="Semester" /></span>
					
						<span class="property-value" aria-labelledby="semester-label"><g:link controller="semester" action="show" id="${classInstance?.semester?.id}">${classInstance?.semester?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${classInstance?.course}">
				<li class="fieldcontain">
					<span id="course-label" class="property-label"><g:message code="class.course.label" default="Course" /></span>
					
						<span class="property-value" aria-labelledby="course-label"><g:link controller="course" action="show" id="${classInstance?.course?.id}">${classInstance?.course?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${classInstance?.professor}">
				<li class="fieldcontain">
					<span id="professor-label" class="property-label"><g:message code="class.professor.label" default="Professor" /></span>
					
						<span class="property-value" aria-labelledby="professor-label"><g:link controller="user" action="show" id="${classInstance?.professor?.id}">${classInstance?.professor?.username}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${classInstance?.section}">
				<li class="fieldcontain">
					<span id="section-label" class="property-label"><g:message code="class.section.label" default="Section" /></span>
					
						<span class="property-value" aria-labelledby="section-label"><g:fieldValue bean="${classInstance}" field="section"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classInstance?.students}">
				<li class="fieldcontain">
					<span id="students-label" class="property-label"><g:message code="class.students.label" default="Students" /></span>
					
						<span class="property-value" aria-labelledby="students-label"><g:fieldValue bean="${classInstance}" field="students"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:classInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${classInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
