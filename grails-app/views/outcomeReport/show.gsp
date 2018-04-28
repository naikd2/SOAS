<%@ page import="com.thinksoas.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="Student Outcome Assessment"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <asset:javascript src="bootstrap-modal.js"/>
</head>

<body>
<div class="container-fluid">
    <h2>${outcomeReportInstance.outcome}</h2>

    <div>
        <a href="${createLink(controller: 'outcomeReport', action: 'createCriteria', params: [reportId: outcomeReportInstance.id])}">Add New Performance Criterion</a>
    </div>

    <table class="table">
        <thead>
        <tr>
            <th class="text-left">Description</th>
            <th class="text-left">Method of Assessment</th>
            <th class="text-left">Where Data is Collected</th>
            <th class="text-left">Target</th>
            <th class="text-left">Length</th>
            <th class="text-left">When</th>
            <th class="text-left">Delete</th>
        </tr>
        </thead>
        <g:set var="cIndex" value="${1}"/>
        <g:each in="${outcomeReportInstance.criteria}" var="c">

            <tbody>

            <g:set var="course" value="${c.objective.course}"/>

            <td>
                ${cIndex}: ${c.description}
            </td>

            <td>
                <div>${c.objective.method1}</div>

                <div>${c.objective.method2}</div>
            </td>

            <td>
                <a href="#courseDetails${course.id}" data-toggle="modal" data-target="#courseDetails${course.id}">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    ${course} RCO: ${c.objective.prefix}
                </a>

                <div class="modal fade" id="courseDetails${course.id}" tabindex="-1"
                     role="dialog"
                     aria-labelledby="myModalLabelCourse">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabelCourse">${course}</h4>
                            </div>

                            <div class="modal-body">
                                <g:render template="/course/quickView" collection="${course}" var="course"/>
                            </div>
                        </div>

                    </div>

                </div>

            </td>
            <td>
                ${settings.performanceTarget}
            </td>
            <td>
                ${settings.assessmentPeriod}
            </td>
            <td>
                ${course.offered}
            </td>
            <td>
                <p>
                    <g:link controller="outcomeReportCriteria" action="delete" id="${c.id}">
                        <span class="glyphicon glyphicon-trash"></span>
                    </g:link>
                </p>
            </td>
        </tbody>
            <g:set var="cIndex" value="${cIndex + 1}"/>
        </g:each>

    </table>

</div>
</body>
</html>

