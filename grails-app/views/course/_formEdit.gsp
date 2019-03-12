<%@ page import="com.thinksoas.data.Course" %>

<div class="form-group row">
    <div class="col-md-2 mb-3">
        <label for="subject">
            <g:message code="course.subject.label" default="Course Subject" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField type="text" class="form-control" id="subject" name="subject" placeholder="ELC" value="${courseInstance?.subject}" required=""/>
    </div>

    <div class="col-md-2 mb-3">
        <label for="number">
            <g:message code="course.number.label" default="Course ID Code" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField type="text" class="form-control" id="number" name="number" placeholder="123" value="${courseInstance?.number}" required=""/>
    </div>

    <div class="col-md-5 mb-3">
        <label for="name">
            <g:message code="course.name.label" default="Course Title" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField type="text" class="form-control" id="name" name="name" placeholder="Intro to ELC" value="${courseInstance?.name}" required=""/>
    </div>
</div>

<div class="form-group row">
    <div class="col-md-9 ${hasErrors(bean: courseInstance, field: 'description', 'error')} required">
        <label for="description">
            <g:message code="course.description.label" default="Description" />
            <span class="required-indicator">*</span>
        </label>
        <g:textArea class="form-control" rows="5" id="description" name="description" value="${courseInstance?.description}" placeholder="Course description..." required=""/>
    </div>
</div>

<div class="form-group row">
    <div class="col-md-2 mb-3">
        <label for="units">
            <g:message code="course.units.label" default="Units/Credits" />
            <span class="required-indicator">*</span>
        </label>
        <g:field type="number" class="form-control" id="units" name="units" value="${courseInstance?.units}" required=""/>
    </div>

    <div class="col-md-2 mb-3">
        <label for="offered">
            <g:message code="course.offered.label" default="Semester" />
            <span class="required-indicator">*</span>
        </label>
        %{--<g:textField type="text" class="form-control" id="offered" name="offered" value="${courseInstance?.offered}" placeholder="Fall" required=""/>--}%
        <g:select id="offered" name="offered" class="form-control" from="${['Fall', 'Winter', 'Spring', 'Summer']}" value="${courseInstance?.offered}" required=""/>
    </div>
</div>

%{--<div class="col-md-10 main">--}%

%{--<div class="form-group ${hasErrors(bean: courseInstance, field: 'subject', 'error')} required">--}%
%{--<label for="subject">--}%
    %{--<g:message code="course.subject.label" default="Subject" />--}%
    %{--<span class="required-indicator">*</span>--}%
%{--</label>--}%
%{--<input type="text" class="form-control" name="subject" required="" value="${courseInstance?.subject}"/>--}%

%{--</div>--}%

%{--<div class="form-group ${hasErrors(bean: courseInstance, field: 'number', 'error')} required">--}%
    %{--<label for="number">--}%
        %{--<g:message code="course.number.label" default="Number" />--}%
        %{--<span class="required-indicator">*</span>--}%
    %{--</label>--}%
    %{--<input type="text" class="form-control" name="number" required="" value="${courseInstance?.number}"/>--}%

%{--</div>--}%

%{--<div class="form-group ${hasErrors(bean: courseInstance, field: 'name', 'error')} required">--}%
    %{--<label for="name">--}%
        %{--<g:message code="course.name.label" default="Name" />--}%
        %{--<span class="required-indicator">*</span>--}%
    %{--</label>--}%
    %{--<input type="text" class="form-control" name="name" required="" value="${courseInstance?.name}"/>--}%

%{--</div>--}%

%{--<div class="form-group ${hasErrors(bean: courseInstance, field: 'description', 'error')} required">--}%
    %{--<label for="description">--}%
        %{--<g:message code="course.description.label" default="Description" />--}%
        %{--<span class="required-indicator">*</span>--}%
    %{--</label>--}%
    %{--<g:textArea class="form-control" rows="5" name="description" required="" value="${courseInstance?.description}"/>--}%
%{--</div>--}%

%{--<div class="form-group ${hasErrors(bean: courseInstance, field: 'units', 'error')} required">--}%
    %{--<label for="units">--}%
        %{--<g:message code="course.units.label" default="Units" />--}%
        %{--<span class="required-indicator">*</span>--}%
    %{--</label>--}%
    %{--<input type="text" class="form-control" name="units" required="" value="${courseInstance?.units}"/>--}%

%{--</div>--}%

%{--<div class="form-group ${hasErrors(bean: courseInstance, field: 'offered', 'error')} required">--}%
    %{--<label for="offered">--}%
        %{--<g:message code="course.offered.label" default="Offered" />--}%
        %{--<span class="required-indicator">*</span>--}%
    %{--</label>--}%
    %{--<input type="text" class="form-control" name="offered" required="" value="${courseInstance?.offered}"/>--}%

%{--</div>--}%