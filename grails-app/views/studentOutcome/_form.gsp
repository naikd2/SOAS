<%@ page import="com.thinksoas.data.StudentOutcome" %>


<div class="col-md-10 main">

    <div class="form-group ${hasErrors(bean: studentOutcomeInstance, field: 'prefix', 'error')} required">
        <label for="prefix">
            <g:message code="studentOutcome.prefix.label" default="Prefix"/>
            <span class="required-indicator">*</span>
        </label>
        <input type="text" name="prefix" required="" value="${studentOutcomeInstance?.prefix}"/>

    </div>

    <div class="form-group ${hasErrors(bean: studentOutcomeInstance, field: 'description', 'error')} required">
        <label for="description">
            <g:message code="studentOutcome.description.label" default="Description"/>
            <span class="required-indicator">*</span>
        </label>
        <g:textArea class="form-control" rows="5" name="description" required=""
                    value="${studentOutcomeInstance?.description}"/>

    </div>

</div>