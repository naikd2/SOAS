
<%@ page import="com.thinksoas.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="${createLink(controller:'Course', action:'index')}">Overview <span class="sr-only">(current)</span></a></li>
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


<div class="col-md-10 main">
		<ul class="list-group">
  			<li class="list-group-item active"> Course - 
  					<g:fieldValue bean="${courseInstance}" field="subject"/>: <g:fieldValue bean="${courseInstance}" field="name"/>
  					<g:fieldValue bean="${courseInstance}" field="number"/>
  			</li>

  			<li class="list-group-item">
  					<g:fieldValue bean="${courseInstance}" field="offered"/>: <g:fieldValue bean="${courseInstance}" field="units"/>
  			</li>

  			<li class="list-group-item"><g:fieldValue bean="${courseInstance}" field="description"/>
  			</li>
  			<li class="list-group-item">Objectives:</li>
  			<li class="list-group-item">

			</li>
		</ul>
		
			<g:form url="[resource:courseInstance, action:'delete']" method="DELETE">
			<div class="list-group">
					<g:link class="edit" action="edit" resource="${courseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
			</g:form>
		
		</div>
		</div>
	</div>
	</body>
</html>
