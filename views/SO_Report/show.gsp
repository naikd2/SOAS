
<%@ page import="com.thinksoas.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'SO_Report.label', default: 'SO_Report')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>

	<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="${createLink(controller:'Programs', action:'index', params:[id:session.currentProgram])}">Overview <span class="sr-only">(current)</span></a></li>
					<li><hr style="border: 1px solid white; width: 85%; margin-top: 10px; margin-bottom:10px;"></li>
					<li><a href="${createLink(controller:'SO_Report', action:'index')}">Dummy</a></li>
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
				<h1 class="page-header"></h1>
				<h2 class="sub-header">Outcome Assessment Plan</h2>
				<div>
					<a href="${createLink(controller:'performanceCriteria', action:'create', params:[reportId: SO_ReportInstance.id])}">Add New Performance Criteria</a>
				</div>
				<div class="table-responsive">
					<table class="table">
						<thead>
						<tr>
							<th class="text-center">Description</th>
							<th class="text-center">Method of Assessment</th>
							<th class="text-center">Where Data is Collected</th>
							<th class="text-center">Target</th>
							<th class="text-center">Length</th>
							<th class="text-center">When</th>
						</tr>
						</thead>
						<tbody>
						<g:each in="${SO_ReportInstance.criteria}" var="c">
							<td>
								${c.objective.description}
							</td>
							<td>
								${c.assessments.join(':::').encodeAsHTML().replace(':::',"<div />").encodeAsRaw()}
							</td>
							<td>
								${c.objective.course}
							</td>
							<td>
								70%
							</td>
							<td>
								3 years
							</td>
							<td>
								${c.objective.course.offered}
							</td>
							</tbody>
						</g:each>
					</table>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>

%{--<td>--}%
	%{--${c.assessments.prefix.join(':::').encodeAsHTML().replace(':::',"<div />").encodeAsRaw()}--}%
%{--</td>--}%
%{--<td>--}%
	%{--${c.assessments.collected.join(':::').encodeAsHTML().replace(':::',"<div />").encodeAsRaw()}--}%
%{--</td>--}%
%{--<td>--}%
	%{--${c.assessments.description.join(':::').encodeAsHTML().replace(':::',"<div />").encodeAsRaw()}--}%
%{--</td>--}%
%{--<td>--}%
	%{--${c.assessments.target.join(':::').encodeAsHTML().replace(':::',"<div />").encodeAsRaw()}--}%
%{--</td>--}%