
<%@ page import="com.thinksoas.dashboard.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-10 main">
				<h2>User message list</h2>

				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
						<tr>
							<g:sortableColumn property="description" title="${message(code: 'message.description.label', default: 'Description')}" />
							<th><g:message code="message.inClass.label" default="In Class" /></th>
						</tr>
						</thead>
						<tbody>
						<g:each in="${messages}" status="i" var="messageInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:link action="show" id="${messageInstance.id}">${fieldValue(bean: messageInstance, field: "description")}</g:link></td>
								<td>${fieldValue(bean: messageInstance, field: "inClass")}</td>
							</tr>
						</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${messageInstanceCount ?: 0}" />
					</div>
				</div>
		</div>
	</body>
</html>
