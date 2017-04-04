<%@ page import="com.thinksoas.Report.Couse.CourseReportMethod" %>


<div class="fieldcontain ${hasErrors(bean: courseReportMethodInstance, field: 'percentage', 'error')} required">
	<label for="percentage">
		<g:message code="courseReportMethod.percentage.label" default="Percentage" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="percentage" value="${fieldValue(bean: courseReportMethodInstance, field: 'percentage')}" required=""/>

</div>

