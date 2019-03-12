<%@ page import="com.thinksoas.report.course.CourseWork" %>



<div class="fieldcontain ${hasErrors(bean: courseWorkInstance, field: 'filename', 'error')} required">
	<label for="filename">
		<g:message code="courseWork.filename.label" default="Filename" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="filename" required="" value="${courseWorkInstance?.filename}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseWorkInstance, field: 'fullPath', 'error')} required">
	<label for="fullPath">
		<g:message code="courseWork.fullPath.label" default="Full Path" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fullPath" required="" value="${courseWorkInstance?.fullPath}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseWorkInstance, field: 'uploadDate', 'error')} required">
	<label for="uploadDate">
		<g:message code="courseWork.uploadDate.label" default="Upload Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="uploadDate" precision="day"  value="${courseWorkInstance?.uploadDate}"  />

</div>

