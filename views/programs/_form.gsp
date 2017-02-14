<%@ page import="com.thinksoas.Programs" %>



<div class="col-md-10 main">

<div class="form-group ${hasErrors(bean: programsInstance, field: 'assessmentPeriod', 'error')} required">
	<label for="assessmentPeriod">
		<g:message code="programs.assessmentPeriod.label" default="Course Assessment Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="assessmentPeriod" required="" value="${programsInstance?.assessmentPeriod}"/>

</div>

<div class="form-group ${hasErrors(bean: programsInstance, field: 'performanceTarget', 'error')} required">
	<label for="performanceTarget">
		<g:message code="programs.performanceTarget.label" default="Target For Performance Percentage" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="performanceTarget" required="" value="${programsInstance?.performanceTarget}"/>

</div>

<div class="form-group ${hasErrors(bean: programsInstance, field: 'performanceThreshold', 'error')} required">
	<label for="performanceThreshold">
		<g:message code="programs.performanceThreshold.label" default="Students Performing at Target, Minimum Percentage" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="performanceThreshold" required="" value="${programsInstance?.performanceThreshold}"/>

</div>

<div class="form-group ${hasErrors(bean: programsInstance, field: 'deltaValue', 'error')} required">
	<label for="deltaValue">
		<g:message code="programs.deltaValue.label" default="Maximum Threshold Delta Percentage" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="deltaValue" required="" value="${programsInstance?.deltaValue}"/>
</div>

<div class="form-group ${hasErrors(bean: programsInstance, field: 'deltaValue', 'error')} required">

	<tbody id="mListTableBody">
	<g:each in="${programsInstance.methods}" var="o" status="i">
	<div class="list-group">
	<label for="outcome" > -- ${o}   </label>
	</div>
	</g:each>
	</tbody>
</div>



