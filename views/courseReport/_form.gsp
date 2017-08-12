<%@ page import="com.thinksoas.data.Class; com.thinksoas.report.course.CourseReport" %>


<div class="fieldcontain ${hasErrors(bean: courseReportInstance, field: 'section', 'error')} required">
	<label for="section">
		<g:message code="courseReport.section.label" default="Section" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="section" name="section.id" from="${Class.list()}" optionKey="id" required="" value="${courseReportInstance?.section?.id}" class="many-to-one"/>

</div>

