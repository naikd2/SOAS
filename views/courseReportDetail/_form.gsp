<%@ page import="com.thinksoas.course.report.CourseReportDetail" %>



<div class="fieldcontain ${hasErrors(bean: courseReportDetailInstance, field: 'instrument', 'error')} required">
	<label for="instrument">
		<g:message code="courseReportDetail.instrument.label" default="Instrument" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="instrument" required="" value="${courseReportDetailInstance?.instrument}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseReportDetailInstance, field: 'max', 'error')} required">
	<label for="max">
		<g:message code="courseReportDetail.max.label" default="Max" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="max" value="${fieldValue(bean: courseReportDetailInstance, field: 'max')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseReportDetailInstance, field: 'min', 'error')} required">
	<label for="min">
		<g:message code="courseReportDetail.min.label" default="Min" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="min" value="${fieldValue(bean: courseReportDetailInstance, field: 'min')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseReportDetailInstance, field: 'objective', 'error')} required">

	<g:hiddenField id="objective" name="objective.id" value="${courseReportDetailInstance?.objective?.id}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseReportDetailInstance, field: 'report', 'error')} required">

	<g:hiddenField id="report" name="report.id" value="${courseReportDetailInstance?.report?.id}" class="many-to-one"/>

</div>

