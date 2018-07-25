<%@ page import="com.thinksoas.data.StudentOutcome; com.thinksoas.data.Course; com.thinksoas.data.CourseObjective" %>


<!-- Optional theme -->

<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/i18n/defaults-en_US.min.js"></script>

<script type="text/javascript">

    $(document).ready(function() {
        $(".add-objective").click(function(){
            var html = $(".objective-element").html();

            var row_id = $('#objective-copy').length;

            html = '<div class="control-group input-group well" id="objective-copy">' + html;

            html+=  '<div class="row">' +
                        '<div class="col-md-3">' +
                            '<label for="introduce">' +
                            'Introduce' +
                            '</label>' +
                            '<select class="selectpicker" id="introduce" name="objectives['+ row_id +'].introduceOutcomes" multiple data-actions-box="true">' +
                                '<g:each in="${com.thinksoas.data.StudentOutcome.list(sort: 'id', order: 'asc')}" var="outcome" status="i">' +
                                '<option name="objectives[' + row_id + '].introduceOutcomes" value="${outcome.id}">${outcome.prefix}</option>' +
                                '</g:each>' +
                            '</select>' +
                        '</div>' +
                        '<div class="col-md-3">' +
                            '<label for="reinforce">' +
                            'Reinforce' +
                            '</label>' +
                            '<select class="selectpicker" id="reinforce" name="objectives['+ row_id +'].reinforceOutcomes" multiple data-actions-box="true">' +
                                '<g:each in="${com.thinksoas.data.StudentOutcome.list(sort: 'id', order: 'asc')}" var="outcome" status="i">' +
                                '<option name="objectives[' + row_id + '].reinforceOutcomes" value="${outcome.id}">${outcome.prefix}</option>' +
                                '</g:each>' +
                            '</select>' +
                        '</div>' +
                        '<div class="col-md-3">' +
                            '<label for="emphasize">' +
                            'Emphasize' +
                            '</label>' +
                            '<select class="selectpicker" id="emphasize" name="objectives['+ row_id +'].emphasizeOutcomes" multiple data-actions-box="true">' +
                                '<g:each in="${com.thinksoas.data.StudentOutcome.list(sort: 'id', order: 'asc')}" var="outcome" status="i">' +
                                '<option name="objectives[' + row_id + '].emphasizeOutcomes" value="${outcome.id}">${outcome.prefix}</option>' +
                                '</g:each>' +
                            '</select>' +
                        '</div>' +
                    '</div>' +
                    '<div class="row">' +
                        '<div class="col-md-3">' +
                            '<label for="method1">' +
                            'Method 1' +
                            '</label>' +
                            '<select class="selectpicker" id="method1" name="objectives[' + row_id + '].method1">' +
                                '<g:each in="${methods}" var="m" status="i">'+
                                '<option>${m}</option>'+
                                '</g:each>'+
                            '</select>' +
                        '</div>' +
                        '<div class="col-md-3">' +
                            '<label for="method2">' +
                            'Method 2' +
                            '</label>' +
                            '<select class="selectpicker" id="method2" name="objectives[' + row_id + '].method2">' +
                                '<g:each in="${methods}" var="m" status="i">'+
                                '<option>${m}</option>'+
                                '</g:each>'+
                            '</select>' +
                        '</div>' +
                    '</div>' +
                    '&nbsp;';

            $(".dynamic-objectives").after(html);

            $('.selectpicker').selectpicker("refresh");

        });

        $("body").on("click",".remove",function(){
            $(this).parents(".control-group").remove();
        });

    });
</script>




    <div class="form-group row">
        <div class="col-md-2 mb-3">
            <label for="subject">
                <g:message code="course.subject.label" default="Course Subject" />
                <span class="required-indicator">*</span>
            </label>
            <input type="text" class="form-control" id="subject" name="subject" placeholder="ELC" value="${courseInstance?.subject}" required/>
        </div>

        <div class="col-md-2 mb-3">
            <label for="number">
                <g:message code="course.number.label" default="Course ID Number" />
                <span class="required-indicator">*</span>
            </label>
            <input type="text" class="form-control" id="number" name="number" placeholder="123" value="${courseInstance?.number}" required/>
        </div>

        <div class="col-md-4 mb-3">
            <label for="name">
                <g:message code="course.name.label" default="Course Title" />
                <span class="required-indicator">*</span>
            </label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Intro to ELC" value="${courseInstance?.name}" required/>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-md-8 ${hasErrors(bean: courseInstance, field: 'description', 'error')} required">
            <label for="description">
                <g:message code="course.description.label" default="Description" />
                <span class="required-indicator">*</span>
            </label>
            <textarea class="form-control" rows="5" id="description" name="description" value="${courseInstance?.description}" required></textarea>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-md-2 mb-3">
            <label for="units">
                <g:message code="course.units.label" default="Units/Credits" />
                <span class="required-indicator">*</span>
            </label>
            <input type="text" class="form-control" id="units" name="units" value="${courseInstance?.units}" required/>
        </div>

        <div class="col-md-2 mb-3">
            <label for="offered">
                <g:message code="course.offered.label" default="Semester" />
                <span class="required-indicator">*</span>
            </label>
            <input type="text" class="form-control" id="offered" name="offered" value="${courseInstance?.offered}" required/>
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


    <div class="objective-element hidden">
            <div class="row">
                <div class="col-md-3 mb-3">
                    <label for="prefix">
                        Prefix
                        <span class="required-indicator">*</span>
                    </label>
                    <input type="text" id="objectiveInstance.prefix" name="objectiveInstance[].prefix" class="form-control" placeholder="Prefix">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="obj_descript">
                        Description
                        <span class="required-indicator">*</span>
                    </label>
                    <textarea class="form-control" rows="5" id="objectiveInstance.description" name="objectiveInstance[].description" value="${objectiveInstance?.description}" required></textarea>
                </div>
                <div class="col-md-3 mb-3">
                    &nbsp;
                    <div class="input-group-btn">
                        <button class="btn btn-danger remove" type="button"><i class="glyphicon glyphicon-remove"></i> Remove</button>
                    </div>
                </div>
            </div>
    </div>
