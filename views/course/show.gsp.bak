
<%@ page import="com.thinksoas.Course" %>
<%@ page import="com.thinksoas.Class" %>
<%@ page import="com.thinksoas.Programs" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

<g:if test="${errorMessage}">
  <div class="alert alert-danger alert-dismissable" >
  </div>
</g:if>

<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="${createLink(controller:'Course', action:'index')}">Return to Courses <span class="sr-only">(current)</span></a></li>
            <li><hr style="border: 1px solid white; width: 85%; margin-top: 10px; margin-bottom:10px;"></li>
            <li><a href="${createLink(controller:'Course', action:'edit', params:[id:courseInstance.id])}">Edit Course</a></li>
            <li><g:link controller="Course" action="delete" params="[id:courseInstance.id]" onclick="return confirm('${message(code: 'course.button.delete.confirm.message', default: 'Are you sure? All class sections of this course will be deleted as well.')}');"><g:message code="course.button.delete.label" default="Delete Course"/> </g:link></li>
             <li><hr style="border: 1px solid white; width: 85%; margin-top: 10px; margin-bottom:10px;"></li>
            <li><a href="${createLink(controller:'Class', action:'create')}">Add Section</a></li>
          </ul>
          <ul class="nav nav-sidebar">
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
				<g:each in="${courseInstance.objectives}" status="i" var="o">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
        <dl>
        <dt><span class="property-value" aria-labelledby="objectives-label">${o?.encodeAsHTML()}</span></dt>

            <div>
                <h5>Introduce Outcomes</h5>
            <g:each in="${o.introduceOutcomes}" var="intro">
                <div>
                <span class="property-value" aria-labelledby="articles-label">${intro?.encodeAsHTML()}</span>
                </div>
            </g:each>
             </div>
            <div>
                <h5>Reinforce Outcomes</h5>
            <g:each in="${o.reinforceOutcomes}" var="rein">
                <div>
                <span class="property-value" aria-labelledby="articles-label">${rein?.encodeAsHTML()}</span>
                </div>
            </g:each>
            </div>
                <div>
                    <h5>Emphasize Outcomes</h5>
            <g:each in="${o.emphasizeOutcomes}" var="emph">
                <div>
                <span class="property-value" aria-labelledby="articles-label">${emph?.encodeAsHTML()}</span>
                </div>
            </g:each>
                </div>
        </dl>
      <div></div>
          </tr>
				</g:each>
			</li>
		</ul>

    <table class="table table-striped">
      <thead>
          <tr>
      <g:sortableColumn property="classSections" title="${message(code: 'programs.classes.label', default: 'Class Sections')}" />
          </tr>
        </thead>
        <tbody>
        <g:set var="classList" value="${Class.getAll()}" />
        <g:each in="${classList}" status="i" var="section">
          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
          <g:if test="${section.course.name =~ courseInstance.name && section.course.subject =~ courseInstance.subject}">
            <td><a href="${createLink(controller:'Class', action:'show', params:[id:section.id])}" role="button">${fieldValue(bean: section, field: "section")}</a></td>
            </g:if>
          </tr>
        </g:each>
        </tbody>

      </table>
		
		</div>
		</div>
	</div>
	</body>
</html>
