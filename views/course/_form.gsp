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
        var rowToDelete = $(this).parents('p');    
 
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
          $("#objectivesListTableBody").append( '<p><tr  rowId="' + rowId  + '">' +                                     
			
	
			'<label>'+
			'Prefix'+
			'</label>'+
			'<input type="text" class="form-control"required="true" name="objectives[' + rowId + '].prefix" value=""/>'+
			'<label>'+
			'Description'+
			'</label>'+
			'<textarea  class="form-control" row="5" required="true" name="objectives[' + rowId + '].description" value=""></textarea>'+
			'<table class="table table-condensed">'+
			'<thead>'+
			'<tr>'+
			'<th>Outcome</th>'+
			'<th>Level</th>'+
			'</tr>'+
			'</thead>'+
			'<tbody>'+
			'<tr>'+
			'<tr>'+
			'<td>a</td>'+
			'<td><select name="objectives[' + rowId + '].a" >'+
			'<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="a">'+
			'<option value="${a}">${a}</option></g:each></select></td>'+
			'</tr>'+
			'<tr>'+
			'<td>b</td>'+
			'<td><select name="objectives[' + rowId + '].b" >'+
			'<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="b">'+
			'<option value="${b}">${b}</option></g:each></select></td>'+
			'</tr>'+
			'<tr>'+
			'<td>c</td>'+
			'<td><select name="objectives[' + rowId + '].c" >'+
			'<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="c">'+
			'<option value="${c}">${c}</option></g:each></select></td>'+
			'</tr>'+
			'<tr>'+
			'<td>d</td>'+
			'<td><select name="objectives[' + rowId + '].d" >'+
			'<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="d">'+
			'<option value="${d}">${d}</option></g:each></select></td>'+
			'</tr>'+
			'<tr>'+
			'<td>e</td>'+
			'<td><select name="objectives[' + rowId + '].e" >'+
			'<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="e">'+
			'<option value="${e}">${e}</option></g:each></select></td>'+
		    '</tr>'+
		    '<tr>'+
		  	'<td>f</td>'+
		  	'<td><select name="objectives[' + rowId + '].f" >'+
        	'<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="f">'+
        	'<option value="${f}">${f}</option></g:each></select></td>'+
		    '</tr>'+
		    '<tr>'+
		    '<td>g</td>'+
	     	'<td><select name="objectives[' + rowId + '].g" >'+
        	'<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="g">'+
        	'<option value="${g}">${g}</option></g:each></select></td>'+
		    '</tr>'+
		  	'<tr>'+
		    '<td>h</td>'+
		    '<td><select name="objectives[' + rowId + '].h" >'+
        	'<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="h">'+
        	'<option value="${h}">${h}</option></g:each></select></td>'+
		    '</tr>'+
       		'<tr>'+
        	'<td>i</td>'+
        	'<td><select name="objectives[' + rowId + '].i" >'+
   			'<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="i">'+
   			'<option value="${i}">${i}</option></g:each></select></td>'+
		    '</tr>'+
		   	'<tr>'+
		    '<td>j</td>'+
		    '<td><select name="objectives[' + rowId + '].j" >'+
        	'<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="j">'+
        	'<option value="${j}">${j}</option></g:each></select></td>'+
		    '</tr>'+
		    '<tr>'+
		    '<td>k</td>'+
		    '<td><select name="objectives[' + rowId + '].k" >'+
        	'<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="k">'+
        	'<option value="${k}">${k}</option></g:each></select></td>'+
		    '</tr>'+
		    '</tbody>'+
		    '</table>'); 
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


	


%{-- 
		
			<div class="form-group">
	<label for="prefix">
		Prefix
	</label>
		<input type="text" class="form-control" name="prefix"required="true" name="objectives[' + rowId + '].prefix" value=""/>
</div>  
	
				<div class="form-group">
	<label for="description">
		Description
	</label>
<textarea  class="form-control" row="5" name="description"equired="true" name="objectives[' + rowId + '].description" value=""></textarea>
		       
</div>  	     --}%	
     		 
     				
		       	 
%{-- 		    <table class="table table-condensed">
		        <thead>
		        	<tr>
		                <th>Outcome</th>
		                <th>Level</th>
		            </tr>
		        </thead>
		        <tbody>

		            <tr>
		            	<td>a</td>
		            	<td><select name="objectives[' + rowId + '].a" >
        				<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="a">
        				<option value="${a}">${a}</option></g:each></select></td>
		            </tr>
		           	<tr>
		            	<td>b</td>
		            	<td><select name="objectives[' + rowId + '].b" >
        				<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="b">
        				<option value="${b}">${b}</option></g:each></select></td>
		            </tr>
		            <tr>
		            	<td>c</td>
		            	<td><select name="objectives[' + rowId + '].c" >
        				<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="c">
        				<option value="${c}">${c}</option></g:each></select></td>
		            </tr>
		           	<tr>
		            	<td>d</td>
		            	<td><select name="objectives[' + rowId + '].d" >
        				<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="d">
        				<option value="${d}">${d}</option></g:each></select></td>
		            </tr>
		            <tr>
		            	<td>e</td>
		            	<td><select name="objectives[' + rowId + '].e" >
        				<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="e">
        				<option value="${e}">${e}</option></g:each></select></td>
		            </tr>
		           	<tr>
		            	<td>f</td>
		            	<td><select name="objectives[' + rowId + '].f" >
        				<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="f">
        				<option value="${f}">${f}</option></g:each></select></td>
		            </tr>
		            <tr>
		            	<td>g</td>
		            	<td><select name="objectives[' + rowId + '].g" >
        				<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="g">
        				<option value="${g}">${g}</option></g:each></select></td>
		            </tr>
		           	<tr>
		            	<td>h</td>
		            	<td><select name="objectives[' + rowId + '].h" >
        				<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="h">
        				<option value="${h}">${h}</option></g:each></select></td>
		            </tr>
		            <tr>
		            	<td>i</td>
		            	<td><select name="objectives[' + rowId + '].i" >
        				<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="i">
        				<option value="${i}">${i}</option></g:each></select></td>
		            </tr>
		           	<tr>
		            	<td>j</td>
		            	<td><select name="objectives[' + rowId + '].j" >
        				<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="j">
        				<option value="${j}">${j}</option></g:each></select></td>
		            </tr>
		            <tr>
		            	<td>k</td>
		            	<td><select name="objectives[' + rowId + '].k" >
        				<g:each in="${com.thinksoas.CourseObjective.Level.values()}" var="k">
        				<option value="${k}">${k}</option></g:each></select></td>
		            </tr>	            		            		            
		        </tbody>
		    </table> --}%




<div class="form-group ${hasErrors(bean: courseInstance, field: 'objectives', 'error')} ">
	<label for="objectives">
		<g:message code="course.objectives.label" default="Objectives" />
		
	</label>
	<table class="table table-striped" id="objectivesList">
		<thead>
			<tr>
				<th></th>
				<th></th>
				
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

