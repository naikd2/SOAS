<%@ page import="com.thinksoas.CourseObjective" %>

<div class="form-group ${hasErrors(bean: courseObjectiveInstance, field: 'prefix', 'error')} required">
	<label for="name">
		<g:message code="course.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<input type="text" class="form-control" name="prefix" required="" value="${courseObjectiveInstance?.prefix}"/>

</div>

<div class="form-group ${hasErrors(bean: courseObjectiveInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="course.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea class="form-control" rows="5" name="description" required="" value="${courseObjectiveInstance?.description}"/>
</div>


<div class="col-xs-4">
	<h5 class="text-center">Reinforce</h5>
	<g:each in="${com.thinksoas.StudentOutcome.list(sort: 'id', order: 'asc')}" var="outcome" status="i">
		<div class="list-group-item">
			<g:checkBox class="pull-right" name="introduceOutcomes" value="${outcome.id}" checked="false"  />
			<label for="outcome" > ${outcome.prefix}   </label>
		</div>
	</g:each>
</div>
<div class="col-xs-4">
	<h5 class="text-center">Reinforce</h5>
	<g:each in="${com.thinksoas.StudentOutcome.list(sort: 'id', order: 'asc')}" var="outcome" status="i">
		<div class="list-group-item">
			<g:checkBox class="pull-right" name="reinforceOutcomes" value="${outcome.id}" checked="false" />
			<label for="outcome" > ${outcome.prefix}   </label>
		</div>
	</g:each>
</div>
<div class="col-xs-4">
	<h5 class="text-center">Emphasize</h5>
	<g:each in="${com.thinksoas.StudentOutcome.list(sort: 'id', order: 'asc')}" var="outcome" status="i">
		<div class="list-group-item">
			<g:checkBox class="pull-right" name="emphasizeOutcomes" value="${outcome.id}" checked="false" />
			<label for="outcome" > ${outcome.prefix}   </label>
		</div>
	</g:each>
</div>
