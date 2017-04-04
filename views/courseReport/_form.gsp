<%@ page import="com.thinksoas.Class.Class; com.thinksoas.Report.Couse.CourseReport" %>


<div class="fieldcontain ${hasErrors(bean: courseReportInstance, field: 'section', 'error')} required">
	<label for="section">
		<g:message code="courseReport.section.label" default="Section" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="section" name="section.id" from="${com.thinksoas.Class.list()}" optionKey="id" required="" value="${courseReportInstance?.section?.id}" class="many-to-one"/>

</div>

