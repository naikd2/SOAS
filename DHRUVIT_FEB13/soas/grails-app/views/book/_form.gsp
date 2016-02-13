<%@ page import="com.thinksoas.Book" %>



<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'authors', 'error')} ">
	<label for="authors">
		<g:message code="book.authors.label" default="Authors" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'isbn', 'error')} required">
	<label for="isbn">
		<g:message code="book.isbn.label" default="Isbn" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="isbn" required="" value="${bookInstance?.isbn}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="book.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${bookInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="book.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${bookInstance.year}" required=""/>

</div>

