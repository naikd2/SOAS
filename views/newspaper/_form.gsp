<%@ page import="com.thinksoas.Newspaper" %>


<r:script>
jQuery(document).ready( function() {
 
    $('#articlesListTableBody').sortable({
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
 
    $(document).on("click", ".deleteArticle",function(event) {  
 
        var tableBody = $('#articlesListTableBody');
        var rowToDelete = $(this).closest('tr');    
 
        $(rowToDelete).remove();
        updateNames(tableBody);
        return false;
    });
 
    $('.addNewArticle').click( function() {
        var allArticles = $("#articlesListTableBody tr[rowId]");
        var rowId = 0;          
 
        // This operation is performed to allow safe-delete of newly created (not saved in DB) articles
        if( allArticles.length ) {
            var maxId = 0;
                allArticles.each(function() {
                        maxId = Math.max(maxId, parseInt($(this).attr('rowId')));
                });
                rowId = maxId+1;
        }           
 
        $("#articlesListTableBody").append( '<tr newRow="true" rowId="' + rowId  + '">' +                                     
                 '<td><input required="true" type="text"  name="articles[' + rowId + '].title" value=""/></td>' +
                 '<td><select name="articles[' + rowId + '].type" >' +
        '<g:each in="${com.thinksoas.ArticleType?.values()}" var="type"> <option value="${type}">${type}</option></g:each></select></td>' +
        '<td  class="moveRow"><a href="#" class="deleteArticle">Delete article</a></td><td class="moveRow">Move</td></tr>');
 
        return false;
    });
 
} );
 
</r:script>


<div class="fieldcontain ${hasErrors(bean: newspaperInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="newspaper.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" maxlength="16"  value="${newspaperInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newspaperInstance, field: 'articles', 'error')} ">
	<label for="articles">
		<g:message code="newspaper.articles.label" default="Articles" />
		
	</label>
	<table id="articlesList">
		<thead>
			<tr>
				<th>Title</th>
				<th>Type</th>
				<th>Delete</th>
				<th>Move</th>
			</tr>
		</thead>
		<tbody id="articlesListTableBody">
		<g:each in="${newspaperInstance.articles}" var="article" status="i">
			<tr <g:if test="${!article?.id}">newRow="true"</g:if> rowId="${i}">
				<td>
					<g:textField id="" required="" name="articles[$i].title" value="${article?.title}"/>
					<g:if test="${article?.id}">  
						<g:hiddenField id="" name="articles[$i].id" value="${article?.id}"/>
					</g:if>
				</td>
				<td>
					<g:select value="${article?.type}" name="articles[${i}].type" from="${com.thinksoas.ArticleType?.values()}" keys="${com.thinksoas.ArticleType.values()*.name()}" />					
				</td>
				<td>
					<a href="#" class="deleteArticle">Delete article</a>
				</td>		
				<td class="moveRow">
					Move
				</td>		
			</tr>
		</g:each>
		</tbody>
	</table>	
	<a href="#" class="addNewArticle">Add new article</a>
</div>

