<%@ page import="com.thinksoas.SO_Report" %>



<div class="fieldcontain ${hasErrors(bean: SO_ReportInstance, field: 'criteria', 'error')} ">
	<label for="criteria">
		<g:message code="SO_Report.criteria.label" default="Criteria" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${SO_ReportInstance?.criteria?}" var="c">
    <li><g:link controller="performanceCriteria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="performanceCriteria" action="create" params="['SO_Report.id': SO_ReportInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'performanceCriteria.label', default: 'PerformanceCriteria')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: SO_ReportInstance, field: 'outcome', 'error')} required">
	<label for="outcome">
		<g:message code="SO_Report.outcome.label" default="Outcome" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="outcome" name="outcome.id" from="${com.thinksoas.StudentOutcome.list()}" optionKey="id" required="" value="${SO_ReportInstance?.outcome?.id}" class="many-to-one"/>

</div>

