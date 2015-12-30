<%@ page import="com.thinksoas.Programs" %>

<div class="col-md-10 main">

<div class="form-group ${hasErrors(bean: programsInstance, field: 'programName', 'error')} required">
	<label for="programName">
		<g:message code="programs.title.label" default="Program Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="programName" required="" value="${programsInstance?.programName}"/>

</div>

