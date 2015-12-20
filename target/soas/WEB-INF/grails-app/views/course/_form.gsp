<%@ page import="com.thinksoas.Course" %>


<%@ page import="com.thinksoas.Newspaper" %>


<r:script>
jQuery(document).ready( function() {
 
    $('#objectivesListTableBody').sortable({
        stop: function (event, ui) {
            updateNames($(this))
        },
        handle: '.moveRow',
    });
 
    function updateNames($tbody) {
        $tbody.find('tr').each(function (idx) {
            var $inp = $(this).find('input,select,textarea');
            $(this).attr('rowId', idx);
            $inp.each(function () {
                this.name = this.name.replace(/(\[\d\])/, '[' + idx + ']');
            })
        });
    }
 
    $(document).on("click", ".deleteObjective",function(event) {  
 
        var tableBody = $('#objectivesListTableBody');
        var rowToDelete = $(this).closest('tr');    
 
        $(rowToDelete).remove();
        updateNames(tableBody);
        return false;
    });
 
    $('.addNewObjective').click( function() {
        var allObjectives = $("#objectivesListTableBody tr[rowId]");
        var rowId = 0;          
 
        // This operation is performed to allow safe-delete of newly created (not saved in DB) articles
        if( allObjectives.length ) {
            var maxId = 0;
                allObjectives.each(function() {
                        maxId = Math.max(maxId, parseInt($(this).attr('rowId')));
                });
                rowId = maxId+1;
        }           
 
        $("#objectivesListTableBody").append( '<tr newRow="true" rowId="' + rowId  + '">' +                                     
                 '<td><input type="text" class="form-control" required="true" name="objectives[' + rowId + '].prefix" value=""/></td>' +
                 '<td><input type="text" class="form-control" required="true" name="objectives[' + rowId + '].description" value=""/></td>' +
        '<td  class="moveRow"><a href="#" class="deleteObjective">Delete</a></td>');
 
        return false;
    });
 
} );
 
</r:script>


<div class="col-md-10 main">


<div class="form-group ${hasErrors(bean: courseInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="course.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<input type="text" class="form-control" name="subject" required="" value="${courseInstance?.subject}"/>

</div>

<div class="form-group ${hasErrors(bean: courseInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="course.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<input type="text" class="form-control" name="number" required="" value="${courseInstance?.number}"/>

</div>

<div class="form-group ${hasErrors(bean: courseInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="course.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<input type="text" class="form-control" name="name" required="" value="${courseInstance?.name}"/>

</div>

<div class="form-group ${hasErrors(bean: courseInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="course.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<textarea class="form-control" rows="5" name="description" required="" value="${courseInstance?.description}"></textarea>
</div>

<div class="form-group ${hasErrors(bean: courseInstance, field: 'units', 'error')} required">
	<label for="units">
		<g:message code="course.units.label" default="Units" />
		<span class="required-indicator">*</span>
	</label>
	<input type="text" class="form-control" name="units" required="" value="${courseInstance?.units}"/>

</div>

<div class="form-group ${hasErrors(bean: courseInstance, field: 'offered', 'error')} required">
	<label for="offered">
		<g:message code="course.offered.label" default="Offered" />
		<span class="required-indicator">*</span>
	</label>
	<input type="text" class="form-control" name="offered" required="" value="${courseInstance?.offered}"/>

</div>


<div class="form-group ${hasErrors(bean: courseInstance, field: 'objectives', 'error')} ">
	<label for="objectives">
		<g:message code="course.objectives.label" default="Objectives" />
		
	</label>
	<table class="table table-striped" id="objectivesList">
		<thead>
			<tr>
				<th>Prefix</th>
				<th>Description</th>
				
			</tr>
		</thead>
		<tbody id="objectivesListTableBody">
		<g:each in="${courseInstance.objectives}" var="objectives" status="i">
			<tr <g:if test="${!objectives?.id}">newRow="true"</g:if> rowId="${i}">
				<td>
					<input type="text" class="form-control" id="" required="" name="objectives[$i].prefix" value="${objectives?.prefix}"/>
					<g:if test="${objectives?.id}">  
						<g:hiddenField id="" name="objectives[$i].id" value="${objectives?.id}"/>
					</g:if>
				</td>
				<td>
					<input type="text" class="form-control" id="" required="" name="objectives[$i].description" value="${objectives?.description}"/>
					<g:if test="${objectives?.id}">  
						<g:hiddenField id="" name="objectives[$i].id" value="${objectives?.id}"/>
					</g:if>
				</td>
				<td>
					<a href="#" class="deleteObjective">Delete</a></td>'
				</td>		

			</tr>
		</g:each>
		</tbody>
	</table>	
	<a href="#" class="addNewObjective">ADD NEW OBJECTIVE</a>

	 
</div>

