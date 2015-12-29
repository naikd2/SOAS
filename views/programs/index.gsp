
<%@ page import="com.thinksoas.Programs" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'programs.label', default: 'Programs')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="${createLink(controller:'Programs', action:'index')}">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="${createLink(controller:'Programs', action:'create')}">Add</a></li>
            <li><a href="${createLink(controller:'Programs', action:'index')}">Index</a></li>
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
          <h1 class="page-header">Programs</h1>
          <div class="table-responsive">
            <table class="table table-striped">
			<thead>
					<tr>
					
			<g:sortableColumn property="programName" title="${message(code: 'programs.name.label', default: 'Program Name')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${programsInstanceList}" status="i" var="programsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${programsInstance.id}">${fieldValue(bean: programsInstance, field: "programName")}</g:link></td>
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
	</body>
</html>
