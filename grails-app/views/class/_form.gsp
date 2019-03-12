<%@ page import="com.thinksoas.data.Class; com.thinksoas.data.Course; com.thinksoas.system.User"  %>

<asset:javascript src="bootstrap-select.min.js"/>
<asset:stylesheet src="bootstrap-select.min.css"/>

%{--Current semester ${activeSemester}--}%

<div class="fieldcontain ${hasErrors(bean: classInstance, field: 'semester', 'error')} required">
    <g:hiddenField id="semester" name="semester.id" value="${activeSemester}" />
</div>

<div class="form-group row">
    <div class="col-md-4 mb-3">
        <label for="course">
            <g:message code="class.course.label" default="Course" />
            <span class="required-indicator">*</span>
        </label>
        <g:select id="course" name="course.id" from="${Course.list()}" optionKey="id" required="" value="${classInstance?.course?.id}" class="many-to-one"/>
    </div>

    <div class="col-md-4 mb-3">
        <label for="professor">
            <g:message code="class.professor.label" default="Professor" />
            <span class="required-indicator">*</span>
        </label>
        <g:select id="professor" name="professor.id" from="${User.list()}" optionKey="id" optionValue="username" value="${classInstance?.professor?.id}" class="many-to-one"/>
    </div>
</div>

<div class="form-group row">
    <div class="col-md-4 mb-3">
        <label for="section">
            <g:message code="class.section.label" default="Section" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="section" required="" value="${classInstance?.section}"/>
    </div>

    <div class="col-md-4 mb-3">
        <label for="students">
            <g:message code="class.students.label" default="Students" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="students" type="number" value="${classInstance.students}" required=""/>
    </div>
</div>