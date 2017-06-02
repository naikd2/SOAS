<%@ page import="com.thinksoas.data.Program" %>

<div class="col-md-10 main">

<div class="form-group ${hasErrors(bean: programInstance, field: 'assessmentPeriod', 'error')} required">
	<label for="assessmentPeriod">
		<g:message code="programs.assessmentPeriod.label" default="Course Assessment Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="assessmentPeriod" required="" value="${programInstance?.assessmentPeriod}"/>

</div>

<div class="form-group ${hasErrors(bean: programInstance, field: 'performanceTarget', 'error')} required">
	<label for="performanceTarget">
		<g:message code="programs.performanceTarget.label" default="Target For Performance Percentage" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="performanceTarget" required="" value="${programInstance?.performanceTarget}"/>

</div>

<div class="form-group ${hasErrors(bean: programInstance, field: 'performanceThreshold', 'error')} required">
	<label for="performanceThreshold">
		<g:message code="programs.performanceThreshold.label" default="Students Performing at Target, Minimum Percentage" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="performanceThreshold" required="" value="${programInstance?.performanceThreshold}"/>

</div>

<div class="form-group ${hasErrors(bean: programInstance, field: 'deltaValue', 'error')} required">
	<label for="deltaValue">
		<g:message code="programs.deltaValue.label" default="Maximum Threshold Delta Percentage" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="deltaValue" required="" value="${programInstance?.deltaValue}"/>
</div>

<div class="form-group ${hasErrors(bean: programInstance, field: 'deltaValue', 'error')} required">

	<tbody id="mListTableBody">
	<g:each in="${programInstance?.methods}" var="o" status="i">
	<div class="list-group">
	-- ${o}
	</div>
	</g:each>
	</tbody>

	%{--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addMethods">--}%
		%{--Launch demo modal--}%
	%{--</button>--}%

	<div class="modal fade" id="addMethods" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<label for="newMethod">
						Methods
					</label>
					<g:textField name="newMethod" required="" value=""/>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<a class="btn btn-primary" href="${createLink(controller:'program', action:'newMethod', params: [name: newMethod])}" role="button">Go To Your Messages &raquo;</a>
				</div>
			</div>
		</div>
	</div>

</div>



