<%@ page import="com.thinksoas.*" %>



<g:each in="${courseobjectives}" var="item">
    <g:render template="orderItem" model="[item: item]"/>
</g:each>



%{-- 

<div class="fieldcontain ${hasErrors(bean: objectiveOutcomeInstance, field: 'objective', 'error')} required">
	<label for="objective">
		<g:message code="objectiveOutcome.objective.label" default="Objective" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="objective" name="objective.id" from="${com.thinksoas.CourseObjective.list()}" optionKey="id" required="" value="${objectiveOutcomeInstance?.objective?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: objectiveOutcomeInstance, field: 'outcome', 'error')} required">
	<label for="outcome">
		<g:message code="objectiveOutcome.outcome.label" default="Outcome" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="outcome" name="outcome.id" from="${com.thinksoas.StudentOutcome.list()}" optionKey="id" required="" value="${objectiveOutcomeInstance?.outcome?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: objectiveOutcomeInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="objectiveOutcome.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="level" from="${objectiveOutcomeInstance.constraints.level.inList}" required="" value="${objectiveOutcomeInstance?.level}" valueMessagePrefix="objectiveOutcome.level"/>

</div>

 --}%