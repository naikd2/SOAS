
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


    <div class="col-md-10 main">
          
		<ul class="list-group">
  			<li class="list-group-item active"> Course - 
  					<g:fieldValue bean="${courseInstance}" field="subject"/>: <g:fieldValue bean="${courseInstance}" field="name"/>
  					<g:fieldValue bean="${courseInstance}" field="number"/>
  			</li>
            <g:link controller="Course" action="edit" id="${courseInstance.id}">
                Edit <span class="glyphicon glyphicon-cog"></span>
            </g:link>
            <g:link controller="Course" action="delete" id="${courseInstance.id}" onclick="return confirm('${message(code: 'course.button.delete.confirm.message', default: 'Are you sure? All class sections of this course will be deleted as well.')}');">
                 Delete <span class="glyphicon glyphicon-trash"></span>
            </g:link>
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
            <g:link controller="courseObjective" action="edit" id="${o.id}">edit</g:link>

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
