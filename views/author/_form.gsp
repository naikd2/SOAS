<%@ page import="com.thinksoas.Author" %>



<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'books', 'error')} ">
	<label for="books">
		<g:message code="author.books.label" default="Books" />
		
	</label>
	<g:select name="books" from="${com.thinksoas.Book.list()}" multiple="multiple" optionKey="id" size="5" value="${authorInstance?.books*.id}" class="many-to-many"/>

</div>
				<td>
					<g:select value="${article?.type}" name="articles[${i}].type" from="${com.thinksoas.ArticleType?.values()}" keys="${com.thinksoas.ArticleType.values()*.name()}" />					
				</td>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="author.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${authorInstance?.name}"/>

</div>

