
<%@ page import="com.thinksoas.Class" %>
<%@ page import="com.thinksoas.Course" %>
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
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="${createLink(controller:'Course', action:'show', params:[id:classInstance.course.id])}">Course Overview <span class="sr-only">(current)</span></a></li>
                                    <li><hr style="border: 1px solid white; width: 85%; margin-top: 10px; margin-bottom:10px;"></li>

            <li><a href="${createLink(controller:'Class', action:'edit', params:[id:classInstance.id])}">Edit Class</a></li>
            <li><g:link controller="Class" action="delete" params="[id:classInstance.id]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><g:message code="class.button.delete.label" default="Delete Class"/> </g:link></li>
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

<div class="col-md-10 main">
<g:set var="courseList" value="${Course.getAll()}" />
          <h1><g:each in="${courseList}" var="course"> <g:if test="${course =~ classInstance.course}">${course.name}</g:if></g:each></h1>
		<ul class="list-group">
  			<li class="list-group-item active"> Section - 
  					<g:fieldValue bean="${classInstance}" field="section"/>
  			</li>
  		</ul>

%{-- 			</g:if>
			<ol class="property-list class">
			
				<g:if test="${classInstance?.section}">
				<li class="fieldcontain">
					<span id="section-label" class="property-label"><g:message code="class.section.label" default="Section" /></span>
					
						<span class="property-value" aria-labelledby="section-label"><g:fieldValue bean="${classInstance}" field="section"/></span>
					
				</li>
				</g:if> --}%
			
%{-- 				<g:if test="${classInstance?.course}">
				<li class="fieldcontain">
					<span id="course-label" class="property-label"><g:message code="class.course.label" default="Course" /></span>
					
						<span class="property-value" aria-labelledby="course-label"><g:link controller="course" action="show" id="${classInstance?.course?.id}">${classInstance?.course?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if> --}%

			
			</ol>
		</div>
		</div>
		</div>
	</body>
</html>
