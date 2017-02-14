<%@ page import="com.thinksoas.PerformanceCriteria" %>

<r:script>
jQuery(document).ready( function() {

 	 $( "#sortable1, #sortable2, #sortable3, #sortable4" ).sortable({
      connectWith: ".connectedSortable"
    }).disableSelection();

    $('#assessmentsListTableBody').sortable({
        stop: function (event, ui) {
            updateNames($(this))
        },
        handle: '.moveRow',
    });

    function updateNames($tbody) {
        $tbody.find('p').each(function (idx) {
            var $inp = $(this).find('input,select,textarea');
            $(this).attr('rowId', idx);
            $inp.each(function () {
                this.name = this.name.replace(/(\[\d\])/, '[' + idx + ']');
            })
        });
    }

    $(document).on("click", ".deleteObjective",function(event) {

        var tableBody = $('#assessmentsListTableBody');
        var rowToDelete = $(this).parents('p');

        $(rowToDelete).remove();

        updateNames(tableBody);
        return false;
    });

    $('.addNew').click( function() {

        var allObj = $("#assessmentsListTableBody p[rowId]");
        var rowId = 0;

        // This operation is performed to allow safe-delete of newly created (not saved in DB) articles
        if( allObj.length ) {

            var maxId = 0;
                allObj.each(function() {
                        maxId = Math.max(maxId, parseInt($(this).attr('rowId')));
                });
                rowId = maxId+1;
        }
        console.log('rowId:' + rowId);

                    $("#assessmentsListTableBody").append( '<p  newRow="true" rowId="' + rowId  + '">' +
			'<label>'+
			'Method Description'+
			'</label>'+
		    '<select  class="form-control" required="true"  value="" name="assessments[' + rowId + '].methods" >'+
            '<g:each in="${com.thinksoas.Programs.findBySettings("SETTINGS").methods}" var="m">'+
            '<option value="${m.toString()}" > ${m.toString()} </option>'+
            '</g:each>'+
			'</p>');
        return false;
    });

} );

</r:script>


<div class="col-md-10 main">

    <div class="form-group ${hasErrors(bean: performanceCriteriaInstance, field: 'report', 'error')} required">
        <g:hiddenField name="report" value="${soReport}" />
    </div>

    <div class="form-group ${hasErrors(bean: performanceCriteriaInstance, field: 'objective', 'error')} required">
        <label for="objective">
            <g:message code="SO_Report.report.label" default="Course Objective: " />
        </label>
        <select  id ="objective" name="objective" class="form-control" required="true" >
        <g:each in="${objectiveQuery}" var="o">
                <option  name="objective" value="${o.id}">${o.course}: ${o.description}</option>
        </g:each>
        </select>

        %{--<g:radioGroup name="objective" values="${objectiveQuery.id}" value="${performanceCriteriaInstance?.objective}" labels="${objectiveQuery}" >--}%
            %{--<p><g:message code="${it.label}" /> ${it.radio}</p>--}%
        %{--</g:radioGroup>--}%
    </div>

    <div class="form-group ${hasErrors(bean: performanceCriteriaInstance, field: 'assessments', 'error')} ">
        <label for="objectives">
            <g:message code="SO_Report.report.label" default="Method of Assessments" />
        </label>
        <table class="table table-striped" id="assessmentsList">
            <thead>
            <tr>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody id="assessmentsListTableBody">
            %{--<g:each in="${performanceCriteriaInstance.assessments}" var="assessments" status="xyz">--}%

                %{--<p  <g:if test="${!objectives?.id}">newRow="true"</g:if> rowId="${xyz}">--}%

                    %{--<label>--}%
                        %{--Prefix--}%
                    %{--</label>--}%
                    %{--<input type="text" class="form-control"required="true" name="assessments[' + rowId + '].prefix" value="${assessments?.prefix}"/>--}%
                    %{--<label>--}%
                        %{--Description--}%
                    %{--</label>--}%
                    %{--<g:textArea  class="form-control" row="5" required="true" name="assessments[' + rowId + '].description" value="${assessments?.prefix}"/>--}%
                %{--<table class="table table-condensed">--}%
                    %{--<thead>--}%
                    %{--<tr>--}%
                        %{--<th>Outcome</th>--}%
                        %{--<th>Level</th>--}%
                    %{--</tr>--}%
                    %{--</thead>--}%
                    %{--<tbody>--}%

                    %{--</tbody>--}%
                %{--</table></p>--}%

            %{--</g:each>--}%
            </tbody>
        </table>
    <a href="#" class="addNew">Add New Assessments</a>
</div>