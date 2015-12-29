<%@ page import="com.thinksoas.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="profile.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${profileInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="profile.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${profileInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="profile.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${profileInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="profile.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.thinksoas.User.list()}" optionKey="id" required="" value="${profileInstance?.user?.id}" class="many-to-one"/>

</div>

