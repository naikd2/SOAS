<%@ page import="com.thinksoas.Class" %>


<div class="col-md-10 main">



<div class="form-group ${hasErrors(bean: classInstance, field: 'section', 'error')} required">
	<label for="section">
		<g:message code="class.section.label" default="Section" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="section" required="" value="${classInstance?.section}"/>

</div>

<div class="form-group ${hasErrors(bean: classInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="class.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course" from="${com.thinksoas.Course.list()}" optionKey="" required="" value="" class="many-to-one"/>

</div>





</div>



