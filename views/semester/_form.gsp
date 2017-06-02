<%@ page import="com.thinksoas.data.Semester" %>



<div class="fieldcontain ${hasErrors(bean: semesterInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="semester.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="year" required="" value="${semesterInstance?.year}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: semesterInstance, field: 'term', 'error')} required">
	<label for="term">
		<g:message code="semester.term.label" default="Term" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="term" required="" value="${semesterInstance?.term}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: semesterInstance, field: 'active', 'error')} ">
	<g:hiddenField name="active" value="${java.lang.Boolean.FALSE}" />
</div>

