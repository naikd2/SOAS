<%@ page import="com.thinksoas.report.outcome.*" %>

<div class="col-md-10 main">

    <div class="form-group ${hasErrors(bean: performanceCriteriaInstance, field: 'report', 'error')} required">
        <g:hiddenField name="report" value="${soReport}" />
    </div>

    <div class="form-group ${hasErrors(bean: performanceCriteriaInstance, field: 'objective', 'error')} required">
        <label for="objective">
            <g:message code="SO_Report.report.label" default="Course Objective: " />
        </label>
        <select  id ="objective" name="objective" class="form-control" required="true" onchange="objectiveChanged(this.value)">
            <option selected hidden value="null">Choose Objective</option>
        <g:each in="${objectiveQuery}" var="o">
                <option  name="objective" value="${o.id}">${o.course}: ${o.prefix}. ${o.description}</option>
        </g:each>
        </select>
    </div>


    <div id="objectiveDetails" class="form-group ${hasErrors(bean: performanceCriteriaInstance, field: 'description', 'error')} required">

    </div>

    <script>
        function objectiveChanged(objective) {
            <g:remoteFunction controller="outcomeReport" action="objectiveChanged"
                    update="objectiveDetails"
                    params="'objective='+objective"/>

        }
    </script>



</div>