<%@ page import="com.thinksoas.data.Course" %>

<div class="col-md-10 main">

<div class="form-group ${hasErrors(bean: courseInstance, field: 'subject', 'error')} required">
<label for="subject">
    <g:message code="course.subject.label" default="Subject" />
    <span class="required-indicator">*</span>
</label>
<input type="text" class="form-control" name="subject" required="" value="${courseInstance?.subject}"/>

</div>

<div class="form-group ${hasErrors(bean: courseInstance, field: 'number', 'error')} required">
    <label for="number">
        <g:message code="course.number.label" default="Number" />
        <span class="required-indicator">*</span>
    </label>
    <input type="text" class="form-control" name="number" required="" value="${courseInstance?.number}"/>

</div>

<div class="form-group ${hasErrors(bean: courseInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="course.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <input type="text" class="form-control" name="name" required="" value="${courseInstance?.name}"/>

</div>

<div class="form-group ${hasErrors(bean: courseInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="course.description.label" default="Description" />
        <span class="required-indicator">*</span>
    </label>
    <g:textArea class="form-control" rows="5" name="description" required="" value="${courseInstance?.description}"/>
</div>

<div class="form-group ${hasErrors(bean: courseInstance, field: 'units', 'error')} required">
    <label for="units">
        <g:message code="course.units.label" default="Units" />
        <span class="required-indicator">*</span>
    </label>
    <input type="text" class="form-control" name="units" required="" value="${courseInstance?.units}"/>

</div>

<div class="form-group ${hasErrors(bean: courseInstance, field: 'offered', 'error')} required">
    <label for="offered">
        <g:message code="course.offered.label" default="Offered" />
        <span class="required-indicator">*</span>
    </label>
    <input type="text" class="form-control" name="offered" required="" value="${courseInstance?.offered}"/>

</div>