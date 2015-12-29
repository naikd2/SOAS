<%@ page import="com.thinksoas.CourseObjective" %>



<div class="fieldcontain ${hasErrors(bean: courseObjectiveInstance, field: 'prefix', 'error')} required">
	<label for="prefix">
		<g:message code="courseObjective.prefix.label" default="Prefix" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prefix" required="" value="${courseObjectiveInstance?.prefix}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseObjectiveInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="courseObjective.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${courseObjectiveInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseObjectiveInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="courseObjective.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${com.thinksoas.Course.list()}" optionKey="id" required="" value="${courseObjectiveInstance?.course?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseObjectiveInstance, field: 'objOut', 'error')} ">
	<label for="objOut">
		<g:message code="courseObjective.objOut.label" default="Obj Out" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${courseObjectiveInstance?.objOut?}" var="o">
    <li><g:link controller="objectiveOutcome" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="objectiveOutcome" action="create" params="['courseObjective.id': courseObjectiveInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'objectiveOutcome.label', default: 'ObjectiveOutcome')])}</g:link>
</li>
</ul>


</div>

