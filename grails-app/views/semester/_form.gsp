<%@ page import="com.thinksoas.data.Semester" %>


<div class="col-md-4 main well">
	<div class="fieldcontain ${hasErrors(bean: semesterInstance, field: 'year', 'error')} required">
		<label for="year">
			<g:message code="semester.year.label" default="Year" />
			<span class="required-indicator">*</span>
		</label>
        <input  id="year" type="text"  class="form-control" name="year" required="" value="${semesterInstance?.year}"/>
	</div>

	<div class="fieldcontain ${hasErrors(bean: semesterInstance, field: 'term', 'error')} required">
		<label for="term">
			<g:message code="semester.term.label" default="Term" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="term" name="term" class="form-control" from="${['Fall', 'Winter', 'Spring', 'Summer']}" value="${semesterInstance?.term}" required=""/>
	</div>

	%{--<div class="fieldcontain ${hasErrors(bean: semesterInstance, field: 'startDate', 'error')} required">--}%
		%{--<label for="startDate">--}%
			%{--<g:message code="semester.term.startDate" default="Start Date" />--}%
			%{--<span class="required-indicator">*</span>--}%
		%{--</label>--}%
		%{--<div class='input-group'>--}%
			%{--<span class="input-group-addon">--}%
				%{--<span class="glyphicon glyphicon-calendar"></span>--}%
			%{--</span>--}%

			%{--<input  id="startDate" type="text" class="form-control" name="startDate" required="" value="${semesterInstance?.startDate}"/>--}%
		%{--</div>--}%

		%{--<script type="text/javascript">--}%
            %{--$(function () {--}%
                %{--$('#startDate').datepicker();--}%
            %{--});--}%
		%{--</script>--}%
	%{--</div>--}%

	%{--<div class="fieldcontain ${hasErrors(bean: semesterInstance, field: 'endDate', 'error')} required">--}%

		%{--<label for="endDate">--}%
			%{--<g:message code="semester.term.endDate" default="End Date" />--}%
			%{--<span class="required-indicator">*</span>--}%
		%{--</label>--}%

		%{--<div class='input-group'>--}%
			%{--<span class="input-group-addon">--}%
				%{--<span class="glyphicon glyphicon-calendar"></span>--}%
			%{--</span>--}%
			%{--<input  id="endDate" type="text" class="form-control" name="endDate" required="" value="${semesterInstance?.endDate}"/>--}%
		%{--</div>--}%

		%{--<script type="text/javascript">--}%
            %{--$(function () {--}%
                %{--$('#endDate').datepicker();--}%
            %{--});--}%
		%{--</script>--}%
	%{--</div>--}%


	<div class="fieldcontain ${hasErrors(bean: semesterInstance, field: 'active', 'error')} ">
		<g:hiddenField name="active" value="${Boolean.FALSE}" />
	</div>
<div class="col-md-6"></div>




</div>

