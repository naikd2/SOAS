<%@ page import="com.thinksoas.data.CourseObjective" %>


<script src="http://code.jquery.com/jquery.min.js"></script>

%{--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper.js"></script>--}%

<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/i18n/defaults-en_US.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $('.selectpicker').selectpicker();
    });
</script>

<div class="form-group row">
    <div class="col-md-3 mb-3">
        <label for="prefix">
            Prefix
            <span class="required-indicator">*</span>
        </label>
        <input type="text" id="prefix" name="prefix" class="form-control" placeholder="${courseObjectiveInstance.prefix}">
    </div>
    <div class="col-md-6 mb-3">
        <label for="obj_descript">
            Description
            <span class="required-indicator">*</span>
        </label>
        <textarea class="form-control" rows="5" id="obj_descript" name="obj_descript" value="${courseObjectiveInstance.description}" required></textarea>
    </div>
</div>
<div class="row">
    <div class="col-md-3">
        <label for="introduce">
        Introduce
        </label>
        <select class="selectpicker" id="introduce" name="courseObjectiveInstance.introduceOutcomes[]" multiple data-actions-box="true">
            <g:each in="${com.thinksoas.data.StudentOutcome.list(sort: 'id', order: 'asc')}" var="outcome" status="i">
                <option " value="${outcome.id}">${outcome.prefix}</option>
            </g:each>
        </select>
    </div>
    <div class="col-md-3">
        <label for="reinforce">
        Reinforce
        </label>
        <select class="selectpicker" id="reinforce" name="courseObjectiveInstance.reinforceOutcomes[]" multiple data-actions-box="true">
            <g:each in="${com.thinksoas.data.StudentOutcome.list(sort: 'id', order: 'asc')}" var="outcome" status="i">
                <option value="${outcome.id}">${outcome.prefix}</option>
            </g:each>
        </select>
    </div>
    <div class="col-md-3">
        <label for="emphasize">
        Emphasize
        </label>
        <select class="selectpicker" id="emphasize" name="courseObjectiveInstance.emphasizeOutcomes[]" multiple data-actions-box="true">
            <g:each in="${com.thinksoas.data.StudentOutcome.list(sort: 'id', order: 'asc')}" var="outcome" status="i">
                <option value="${outcome.id}">${outcome.prefix}</option>
            </g:each>
        </select>
    </div>
</div>
<div class="row">
    <div class="col-md-3">
        <label for="method1">
        Method 1
        </label>
        <select class="selectpicker" id="method1" name="courseObjectiveInstance.method1">
            <g:each in="${methods}" var="m" status="i">
                <option>${m}</option>
            </g:each>
        </select>
    </div>
    <div class="col-md-3">
        <label for="method2">
        Method 2
        </label>
        <select class="selectpicker" id="method2" name="courseObjectiveInstance.method2">
            <g:each in="${methods}" var="m" status="i">
                <option>${m}</option>
            </g:each>
        </select>
    </div>
</div>
&nbsp;