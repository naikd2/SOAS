
<%@ page import="com.thinksoas.data.StudentOutcome" %>
<%@ page import="com.thinksoas.data.Program" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'studentOutcome.label', default: 'StudentOutcome')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-sm-10">

				<h2 >Student Outcome List</h2>
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
								<td>
									<g:link action="edit" id="${studentOutcomeInstance.id}">${fieldValue(bean: studentOutcomeInstance, field: "prefix")}</g:link>
								</td>
								<td>
									${fieldValue(bean: studentOutcomeInstance, field: "description")}
								</td>
							</tr>
						</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${courseInstanceCount ?: 0}" />
					</div>
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
