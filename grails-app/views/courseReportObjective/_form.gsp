<%@ page import="com.thinksoas.report.course.CourseReportObjective" %>


<div class="form-group">
    <div class="col-lg-10">
        <div class="fieldcontain ${hasErrors(bean: courseReportObjectiveInstance, field: 'instrument', 'error')} required">
            %{--<label for="instrument" class="col-lg-2 control-label">Instrument</label>--}%
            <g:textField name="instrument" class="form-control"
                         value="${courseReportObjectiveInstance?.instrument}" placeholder="Instrument"/>
        </div>
    </div>
</div>
<br>

<div class="form-group">
    <div class="col-lg-10">
        <div class="fieldcontain ${hasErrors(bean: courseReportObjectiveInstance, field: 'max', 'error')} required">
            %{--<label for="max" class="col-lg-2 control-label">Max</label>--}%
            <g:textField name="max" class="form-control" value="${courseReportObjectiveInstance?.max}"
                         placeholder="Max Grade"/>
        </div>
    </div>
</div>
<br>

<div class="form-group">
    <div class="col-lg-10">
        <div class="fieldcontain ${hasErrors(bean: courseReportObjectiveInstance, field: 'min', 'error')} required">
            %{--<label for="min" class="col-lg-2 control-label">Min</label>--}%
            <g:textField name="min" class="form-control" value="${courseReportObjectiveInstance?.min}"
                         placeholder="Min Grade"/>
        </div>
    </div>
</div>

