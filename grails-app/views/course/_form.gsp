<%@ page import="com.thinksoas.data.StudentOutcome; com.thinksoas.data.Course; com.thinksoas.data.CourseObjective;" %>


<!-- Optional theme -->

<asset:javascript src="bootstrap-select.min.js"/>
<asset:stylesheet src="bootstrap-select.min.css"/>

<script type="text/javascript">

    $(document).ready(function() {
        $(".add-objective").click(function(){
            var html = $(".objective-element").html();
            var row_id = document.querySelectorAll("#objective-copy").length - 1;
            html = html.replace(/row_id/g, row_id);
            html = html.replace(/newselectpicker/g, "selectrefresh");

            $(".dynamic-objectives").after(html);

            // only update new one
            $(".selectrefresh").selectpicker();
            $(document).removeClass(".selectrefresh");

        });

        $("body").on("click",".remove",function(){
            $(this).parents(".control-group").remove();
        });

    });

</script>



    <g:hiddenField name="report" value="${courseInstance}" />
<div class = "well ">
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

        <div class="col-md-4 mb-3">
            <label for="name">
                <g:message code="course.name.label" default="Course Title" />
                <span class="required-indicator">*</span>
            </label>
            <g:textField type="text" class="form-control" id="name" name="name" placeholder="Intro to ELC" value="${courseInstance?.name}" required=""/>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-md-8 ${hasErrors(bean: courseInstance, field: 'description', 'error')} required">
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
</div>
    &nbsp;

    <div class="input-group control-group dynamic-objectives">
        <div class="row">
            <div class="col-md-7">
                <font size="+2">Objectives</font>
            </div>
            <div class="col-md-5">
                <button class="btn btn-success add-objective" type="button"><i class="glyphicon glyphicon-plus"></i> Add</button>
            </div>
            &nbsp;
        </div>
    </div>