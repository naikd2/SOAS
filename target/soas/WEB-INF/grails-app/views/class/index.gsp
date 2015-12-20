
<%@ page import="com.thinksoas.Class" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'class.label', default: 'Class')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="${createLink(controller:'Class', action:'index')}">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="${createLink(controller:'Class', action:'create')}">Add</a></li>
            <li><a href="${createLink(controller:'Class', action:'index')}">Index</a></li>
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
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Dashboard</h1>
          <h2 class="sub-header">Class List</h2>
          <div class="table-responsive">
            <table class="table table-striped">
			<thead>
					<tr>
					
			<g:sortableColumn property="section" title="${message(code: 'class.section.label', default: 'Section')}" />
					
						<th><g:message code="class.course.label" default="Course" /></th>
					
						<th><g:message code="class.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${classInstanceList}" status="i" var="classInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${classInstance.id}">${fieldValue(bean: classInstance, field: "section")}</g:link></td>
					
						<td>${fieldValue(bean: classInstance, field: "course")}</td>
					
						<td>${fieldValue(bean: classInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${courseInstanceCount ?: 0}" />
			</div>
            </table>
          </div>
        </div>
      </div>
    </div>
%{-- 		<a href="#list-class" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" controller="objectiveOutcome" action="index"><g:message code="Objective Outcomes" /></g:link></li>
			</ul>
		</div>
		<div id="list-class" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if> --}%
	</body>
</html>
