
<%@ page import="com.thinksoas.data.Course" %>
<%@ page import="com.thinksoas.data.Class" %>
<%@ page import="com.thinksoas.data.Program" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

<g:if test="${errorMessage}">
  %{--<div class="alert alert-danger alert-dismissable" >--}%
  %{--</div>--}%
</g:if>

<div class="container-fluid">
    <div class="row">
    <div class="col-md-10 main">
          
		<div class="list-group">
  			<h1>
  					<g:fieldValue bean="${courseInstance}" field="subject"/>-<g:fieldValue bean="${courseInstance}" field="number"/>: <g:fieldValue bean="${courseInstance}" field="name"/>
            </h1>

            <div class="text-right">
                <g:link controller="Course" action="edit" id="${courseInstance.id}">
                    Edit <span class="glyphicon glyphicon-cog"></span>
                </g:link>
                &nbsp;
                <g:link controller="Course" action="delete" id="${courseInstance.id}" onclick="return confirm('${message(code: 'course.button.delete.confirm.message', default: 'Are you sure? All class sections of this course will be deleted as well.')}');">
                    Delete <span class="glyphicon glyphicon-trash"></span>
                </g:link>
            </div>

  			<div class="list-group-item">
                <h4 class="list-group-item-heading">Semester</h4>
                <p class="list-group-item-text"><font size="+1"><g:fieldValue bean="${courseInstance}" field="offered"/></font></p>
  			</div>
            <div class="list-group-item">
                <h4 class="list-group-item-heading">Units</h4>
                <p class="list-group-item-text"><font size="+1"><g:fieldValue bean="${courseInstance}" field="units"/></font></p>
            </div>
            <div class="list-group-item">
                <h4 class="list-group-item-heading">Description</h4>
                <p class="list-group-item-text"><font size="+1"><g:fieldValue bean="${courseInstance}" field="description"/></font></p>
            </div>
        </div>

        <div class="list-group">
  			<div class="list-group-item active"><font size="+2">Objectives:</font></div>
            <g:each in="${courseInstance.objectives}" status="i" var="o">
                <div class="list-group-item">
                    <dt><font size="+1"><span class="property-value" aria-labelledby="objectives-label">${o?.encodeAsHTML()}</span></font></dt>
                    <g:link controller="courseObjective" action="edit" id="${o.id}">
                        Edit <span class="glyphicon glyphicon-cog"></span>
                    </g:link>

                    <g:if test="${o.introduceOutcomes.size() > 0}">
                        <div class="list-group">
                            <h5>Introduce Outcomes:</h5>
                            <g:each in="${o.introduceOutcomes}" var="intro">
                                <div class="col-xs-offset-1">
                                    <span class="property-value" aria-labelledby="articles-label">${intro?.encodeAsHTML()}</span>
                                </div>
                            </g:each>
                        </div>
                    </g:if>

                    <g:if test="${o.reinforceOutcomes.size() > 0}">
                        <div class="list-group">
                            <h5>Reinforce Outcomes:</h5>
                            <g:each in="${o.reinforceOutcomes}" var="rein">
                                <div class="col-xs-offset-1">
                                    <span class="property-value" aria-labelledby="articles-label">${rein?.encodeAsHTML()}</span>
                                </div>
                            </g:each>
                        </div>
                    </g:if>

                    <g:if test="${o.emphasizeOutcomes.size() > 0}">
                        <div class="list-group">
                            <h5>Emphasize Outcomes:</h5>
                            <g:each in="${o.emphasizeOutcomes}" var="emph">
                                <div class="col-xs-offset-1">
                                    <span class="property-value" aria-labelledby="articles-label">${emph?.encodeAsHTML()}</span>
                                </div>
                            </g:each>
                        </div>
                    </g:if>

                    <g:if test="${o.emphasizeOutcomes.size() < 1 && o.reinforceOutcomes.size() < 1 && o.introduceOutcomes.size() < 1}">
                        <h5>No Mapped Outcomes</h5>
                    </g:if>

                    <div class="list-group">
                        <h5>Collection Methods:</h5>
                        <div class="col-xs-offset-1">
                            <div class="row">${o.method1}</div>
                            <div class="row">${o.method2}</div>
                        </div>
                    </div>

                </div>
            </g:each>
        </div>

        <div class="list-group">
            <div class="list-group-item active">
                <font size="+2">Class Sections</font>
            </div>
            <div class="list-group-item">
            <table class="table table-striped">
                <thead>
                <tr>
                    <g:sortableColumn property="classSections" title="${message(code: 'programs.classes.label', default: 'Semester')}" />
                    <g:sortableColumn property="classSections" title="${message(code: 'programs.classes.label', default: 'Section')}" />
                    <th><g:message code="class.professor.label" default="Professor" /></th>
                </tr>
                </thead>
                <tbody>
                <g:set var="classList" value="${Class.getAll()}" />
                <g:each in="${classList}" status="i" var="section">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <g:if test="${section.course.name =~ courseInstance.name && section.course.subject =~ courseInstance.subject}">
                            <td>${fieldValue(bean: section, field: "semester")}</td>
                            <td><a href="${createLink(controller:'Class', action:'show', params:[id:section.id])}" role="button">${fieldValue(bean: section, field: "section")}</a></td>
                            <td>${fieldValue(bean: section, field: "professor.username")}</td>

                        </g:if>
                    </tr>
                </g:each>
                </tbody>
            </table>
            </div>
        </div>
    </div></div></div>
	</body>
</html>
