
<%@ page import="com.thinksoas.course.report.CourseReport" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseReport.label', default: 'CourseReport')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-10 main">
				<ul class="list-group">
					<li class="list-group-item active"> Course Report -
					<g:fieldValue bean="${courseReportInstance}" field="section"/>:
					</li>
					<li class="list-group-item">Details:</li>
					<li class="list-group-item">
						<g:each in="${courseReportInstance.details}" status="i" var="d">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<dl>
									<dt><span class="property-value" aria-labelledby="objectives-label">Detail</span></dt>
									<g:link controller="courseReportDetail" action="edit" id="${d.id}">edit</g:link>
									<div>
									<h5>Outcome</h5>
									<div>
										<span class="property-value" aria-labelledby="articles-label">${d.objective.encodeAsHTML()}</span>
									</div>

									<div>
										<h6>Introduce Outcomes</h6>
										<g:each in="${d.objective.introduceOutcomes}" var="intro">
											<div>
												<span class="property-value" aria-labelledby="articles-label">${intro?.encodeAsHTML()}</span>
											</div>
										</g:each>
									</div>
									<div>
										<h6>Reinforce Outcomes</h6>
										<g:each in="${d.objective.reinforceOutcomes}" var="intro">
											<div>
												<span class="property-value" aria-labelledby="articles-label">${intro?.encodeAsHTML()}</span>
											</div>
										</g:each>
									</div>
									<div>
										<h6>Emphasize Outcomes</h6>
										<g:each in="${d.objective.emphasizeOutcomes}" var="intro">
											<div>
												<span class="property-value" aria-labelledby="articles-label">${intro?.encodeAsHTML()}</span>
											</div>
										</g:each>
									</div>

									<h5>Instrument</h5>
									<div>
										<span class="property-value" aria-labelledby="articles-label">${d.instrument.encodeAsHTML()}</span>
									</div>
									<h5>Min Grade</h5>
									<div>
										<span class="property-value" aria-labelledby="articles-label">${d.min.encodeAsHTML()}</span>
									</div>
									<h5>Max Grade</h5>
									<div>
										<span class="property-value" aria-labelledby="articles-label">${d.max.encodeAsHTML()}</span>
									</div>
									</div>
								</dl>
							</tr>
						</g:each>
					</li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
