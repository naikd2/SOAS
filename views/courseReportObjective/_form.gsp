<%@ page import="com.thinksoas.Report.Couse.CourseReportObjective" %>


<div class="fieldcontain ${hasErrors(bean: courseReportObjectiveInstance, field: 'instrument', 'error')} required">
	<label for="instrument">
		<g:message code="courseReportObjective.instrument.label" default="Instrument" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="instrument" required="" value="${courseReportObjectiveInstance?.instrument}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseReportObjectiveInstance, field: 'max', 'error')} required">
	<label for="max">
		<g:message code="courseReportObjective.max.label" default="Max" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="max" value="${fieldValue(bean: courseReportObjectiveInstance, field: 'max')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseReportObjectiveInstance, field: 'min', 'error')} required">
	<label for="min">
		<g:message code="courseReportObjective.min.label" default="Min" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="min" value="${fieldValue(bean: courseReportObjectiveInstance, field: 'min')}" required=""/>

</div>

