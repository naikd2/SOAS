
<%@ page import="com.thinksoas.StudentOutcome" %>
<%@ page import="com.thinksoas.Programs" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'studentOutcome.label', default: 'StudentOutcome')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
%{-- 		<a href="#list-studentOutcome" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%

		<div class="container-fluid">
      <div class="row">

          <h1 class="page-header"></h1>
          <h2 class="sub-header">Student Outcome List</h2>
          <g:link controller="StudentOutcome" action="create">
             Add Outcome <span class="glyphicon glyphicon-plus"></span>
          </g:link>
          <div class="table-responsive">
            <table class="table table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="prefix" title="${message(code: 'studentOutcome.prefix.label', default: 'Prefix')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'studentOutcome.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${studentOutcomeInstanceList}" status="i" var="studentOutcomeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="edit" id="${studentOutcomeInstance.id}">${fieldValue(bean: studentOutcomeInstance, field: "prefix")}</g:link></td>

						<td>${fieldValue(bean: studentOutcomeInstance, field: "description")}</td>
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

%{-- 		<div id="list-studentOutcome" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div> --}%
		
	</body>
</html>
