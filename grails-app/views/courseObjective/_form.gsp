<%@ page import="com.thinksoas.data.CourseObjective" %>

<asset:javascript src="bootstrap.min.js"/>
<asset:stylesheet src="bootstrap.min.css"/>
<asset:javascript src="bootstrap-select.min.js"/>
<asset:stylesheet src="bootstrap-select.min.css"/>

<script type="text/javascript">
    $(document).ready(function() {
        $('.selectpicker').selectpicker();
    });
</script>

    %{--<div class="control-group input-group">--}%
        <div class="form-group row">
            <div class="col-md-3 mb-3">
                <label for="prefix">
                    Prefix
                    <span class="required-indicator">*</span>
                </label>
                <input type="text" id="prefix" name="courseObjectiveInstance.prefix" value="${courseObjectiveInstance?.prefix}" class="form-control" placeholder="Prefix">
            </div>
            <div class="col-md-6 mb-3">
                <label for="obj_descript">
                    Description
                    <span class="required-indicator">*</span>
                </label>
                <g:textArea class="form-control" rows="5" id="obj_descript" name="courseObjectiveInstance.description" value="${courseObjectiveInstance?.description}" required=""/>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-md-3">
                <label for="introduce">
                    Introduce
                </label>
                <g:select class="selectpicker" id="introduce"
                          name="courseObjectiveInstance.introduceOutcomes"
                          value="${courseObjectiveInstance?.introduceOutcomes}"
                          optionKey="id"
                          from="${com.thinksoas.data.StudentOutcome.list(sort: 'id', order: 'asc')}"
                          multiple="true"
                          data-actions-box="true"/>
            </div>
            <div class="col-md-3">
                <label for="reinforce">
                    Reinforce
                </label>
                <g:select class="selectpicker" id="reinforce"
                          name="courseObjectiveInstance.reinforceOutcomes"
                          value="${courseObjectiveInstance?.reinforceOutcomes}"
                          optionKey="id"
                          from="${com.thinksoas.data.StudentOutcome.list(sort: 'id', order: 'asc')}"
                          multiple="true"
                          data-actions-box="true"/>
            </div>
            <div class="col-md-3">
                <label for="emphasize">
                    Emphasize
                </label>
                <g:select class="selectpicker" id="emphasize"
                          name="courseObjectiveInstance.emphasizeOutcomes"
                          value="${courseObjectiveInstance?.emphasizeOutcomes}"
                          optionKey="id"
                          from="${com.thinksoas.data.StudentOutcome.list(sort: 'id', order: 'asc')}"
                          multiple="true"
                          data-actions-box="true"/>
            </div>
        </div>
        <div class="form-group  row">
            <div class="col-md-3">
                <label for="method1">
                    Method 1
                </label>
                <g:select class="selectpicker" id="method1"
                          name="courseObjectiveInstance.method1"
                          value="${courseObjectiveInstance?.method1}"
                          from="${methods}"/>
            </div>
            <div class="col-md-3">
                <label for="method2">
                    Method 2
                </label>
                <g:select class="selectpicker" id="method2"
                          name="courseObjectiveInstance.method2"
                          value="${courseObjectiveInstance?.method2}"
                          from="${methods}"/>
            </div>
        </div>
    %{--</div>--}%
    &nbsp;
