<%@ page import="com.thinksoas.course.report.CourseReport" %>



<div class="fieldcontain ${hasErrors(bean: courseReportInstance, field: 'details', 'error')} ">
	<label for="details">
		<g:message code="courseReport.details.label" default="Details" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${courseReportInstance?.details?}" var="d">
    <li><g:link controller="courseReportDetail" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="courseReportDetail" action="create" params="['courseReport.id': courseReportInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'courseReportDetail.label', default: 'CourseReportDetail')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: courseReportInstance, field: 'section', 'error')} required">
	<label for="section">
		<g:message code="courseReport.section.label" default="Section" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="section" name="section.id" from="${com.thinksoas.Class.list()}" optionKey="id" required="" value="${courseReportInstance?.section?.id}" class="many-to-one"/>

</div>

