<%@ page import="com.thinksoas.course.report.CourseReportDetail" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'courseReportDetail.label', default: 'CourseReportDetail')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="container">
					<h1>Edit Report</h1>
					<div id="edit-courseReportDetail" class="content scaffold-edit" role="main">
						<g:form url="[resource:courseReportDetailInstance, action:'update']" method="PUT" >
							<g:hiddenField name="version" value="${courseReportDetailInstance?.version}" />
							<fieldset class="form">
								<g:render template="form"/>
							</fieldset>
							<fieldset class="buttons">
								<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
							</fieldset>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
