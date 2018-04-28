<%@ page import="com.thinksoas.report.course.CourseReportMethod" %>




<div class="form-group">
	<div class="col-lg-10">
		<div class="fieldcontain ${hasErrors(bean: courseReportMethodInstance, field: 'percentage', 'error')} required">
			%{--<label for="min" class="col-lg-2 control-label">Min</label>--}%
<div class="input-group">

	<g:textField name="percentage" class="form-control" value="${courseReportMethodInstance?.percentage}"
						 placeholder="Percentage"/>
			<span class="input-group-addon">%</span>

		</div>
		</div>
	</div>
</div>