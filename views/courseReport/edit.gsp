<%@ page import="com.thinksoas.Report.Couse.CourseReport" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<title>TITLE</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
			<g:form url="[action:'update', resource:'objective']" method="PUT" >
				<g:hiddenField name="version" value="${objective?.version}" />
				<div class="col-sm-10 main">
					<h2>
						Edit ${objective}
					</h2>
					<div>
						<label>
							<g:message message="Numvb"/>
							<span class="required-indicator">*</span>
						</label>
						<input type="text" class="form-control" name="number" required="" value="${objective?.instrument}"/>
					</div>
					<div>
						<label>
							<g:message message="Max Grade"/>
							<span class="required-indicator">*</span>
						</label>
						<g:field name="students" type="number" value="${objective?.max}" required=""/>
					</div>
					<div>
						<label>
							<g:message message="Min Grade"/>
							<span class="required-indicator">*</span>
						</label>
						<g:field name="students" type="number" value="${objective?.min}" required=""/>
					</div>
				</div>
				<g:actionSubmit value="Submit" action="success"/>
			</g:form>
</body>
</html>
