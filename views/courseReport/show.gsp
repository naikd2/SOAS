
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
			<div class="col-sm-8">
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
		<div class="row">
			<div class="col-sm-4">
				<g:each in="${courseReportInstance.details}" status="i" var="d">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<span class="property-value" aria-labelledby="articles-label">${d.instrument.encodeAsHTML()}</span>
					<div>
						<div id="graphDiv1" style="float: left; width: 200px"></div> <div id="graphDiv2" style="float: left"></div>
						<!--[if IE]><script src="excanvas.js"></script><![endif]-->
						<g:javascript src="BarGraph.js" />
						<script>(function () {
						function createCanvas(divName) {
							var div = document.getElementById(divName);
							var canvas = document.createElement('canvas');
							div.appendChild(canvas);
							if (typeof G_vmlCanvasManager !== 'undefined') {
								canvas = G_vmlCanvasManager.initElement(canvas);
							}
							var ctx = canvas.getContext("2d");
							return ctx;
						}
						var ctx = createCanvas("graphDiv1");
						var ctx2 = createCanvas("graphDiv2");
						var graph = new BarGraph(ctx);
						graph.xAxisLabelArr = ["Max", "Min", ""];
						graph.update([${d.max}, ${d.min},0]);
					}());</script>
					</div>
				</g:each>
			</div>
		</div>
	</div>
	</body>
</html>
