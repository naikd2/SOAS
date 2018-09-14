<%@ page import="com.thinksoas.report.course.CourseReport; com.thinksoas.data.StudentOutcome" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'courseReport.label', default: 'CourseReport')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>

    <style>

    .ObjectiveMethod {
        display: block;
        font-style: italic;
        margin-top: 2px;
        text-align: left;
    }

    .OutcomeNA {
        font-style: italic;
        text-align: left;
    }

    .ReportMethodCell {
        text-align: left;
    }

    .ReportTextField {
        width: 50px;
        display: inline-block;
        margin-top: 10px;
        border: 1px dotted;
        text-align: left;
    }

    .ReportObjective {
        text-decoration: underline;
        text-align: left;
    }
    </style>
</head>

<body>

<div class="container-fluid">

    <h6>
        Student Performance Assessment Data Form
    </h6>
    <h6>
        Instructor: ${courseReportInstance.section.professor.username}
    </h6>
    <h6>
        <a href="#courseDetails" data-toggle="modal"
           data-target="#courseDetails">
            <span class="glyphicon glyphicon-book" aria-hidden="true"></span>
            Course: ${courseReportInstance.section}
        </a>

        <div class="modal fade" id="courseDetails" tabindex="-1"
             role="dialog"
             aria-labelledby="myModalLabelCourse">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabelCourse">${courseReportInstance.section.course}</h4>
                    </div>
                    <div class="modal-body">
                        <g:render template="/course/quickView" collection="${courseReportInstance.section.course}" var="course"/>
                    </div>

                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
    </h6>
    <h6>
        Semester: ${courseReportInstance.section.semester}
    </h6>
    <h6>
        Students: ${courseReportInstance.section.students}
    </h6>



    <g:form action="multiSave">
        <table class="table table-striped table-hover " style="text-align: left">
            <thead>
            <tr>
                <th>Objective</th>
                <th>Instrument</th>
                <g:each in="${StudentOutcome.list()}" var="so">
                    <th>${so.prefix}</th>
                </g:each>
                <th>Max/Min</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${objectives}" var="o">
                <tr>
                    <td>
                        <a href="#objectiveDetails${o.objective.prefix}${o.id}" data-toggle="modal"
                           data-target="#objectiveDetails${o.objective.prefix}${o.id}">
                            ${o.objective.prefix}
                        </a>

                        <div class="modal fade" id="objectiveDetails${o.objective.prefix}${o.id}" tabindex="-1"
                             role="dialog"
                             aria-labelledby="myModalLabelCourse">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabelCourse2">${o.objective.prefix} </h4>
                                    </div>
                                    <div class="modal-body">
                                        <g:render template="/courseReport/quickViewObjective" collection="${o.objective}" var="obj"/>
                                    </div>

                                    <div class="modal-footer">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <span class="ObjectiveMethod">${o.outcomes[0].methods[0].method}</span>
                        <span class="ObjectiveMethod">${o.outcomes[0].methods[1].method}</span>
                    </td>
                    <td>
                        <div>
                            <g:hiddenField name="method[${o.id}].id" value="${o.id}"></g:hiddenField>
                            Instrument: <g:textField name='method[${o.id}].instrument' value="${o.instrument}" class="ReportTextField" />
                        </div>
                    </td>
                    <g:each in="${StudentOutcome.list()}" var="so">
                        <g:set var="found" value="${false}"/>
                        <g:each in="${o.outcomes}" var="outs">
                            <g:if test="${outs.outcome == so}">
                                <g:set var="found" value="${true}"/>
                                <td>
                                    <g:each in="${outs.methods}" var="m" status="i">
                                        <div id="method${i}" class="ReportMethodCell">
                                            <g:textField name='method[${m.id}].percentage' value="${m.percentage}" class="ReportTextField" /> %
                                            <g:hiddenField name="method[${m.id}].id" value="${m.id}"></g:hiddenField>
                                            <g:hiddenField name="CourseReportInstance" value="${CourseReportInstance}"></g:hiddenField>
                                        </div>
                                    </g:each>


                                </td>
                            </g:if>
                        </g:each>
                        <g:if test="${!found}">
                            <td class="OutcomeNA">N/A</td>
                        </g:if>
                    </g:each>
                    <td>
                        <div>
                            <g:hiddenField name="method[${o.id}].id" value="${o.id}"></g:hiddenField>
                            Max: <g:textField name='method[${o.id}].max' value="${o.max}" class="ReportTextField" />
                        </div>
                        <div>
                            Min: <g:textField name='method[${o.id}].min' value="${o.min}" class="ReportTextField" />
                        </div>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>



        <g:submitButton name="action" value="Submit Scores"/></g:form>



    <table class="table table-striped table-hover ">
        <thead>
        <tr>
            <th>
                Course Work
                <a href="#uploadModal" data-toggle="modal"
                   data-target="#uploadModal">
                    <span class="glyphicon glyphicon-upload" aria-hidden="true"></span>
                    Upload
                </a>
            </th>
            <th>
            </th>

        </tr>
        </thead>
        <tbody>


        <g:each in="${courseReportInstance.works}" status="i" var="w">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${w.filename}</td>

                <td><g:link controller="courseWork" action="download" id="${w.id}">Download
                    <span class="glyphicon glyphicon-download" aria-hidden="true"></span>

                </g:link></td>

            </tr>

        </g:each>

        </tbody>
    </table>

    <g:link action="report" id="${courseReportInstance.id}">View Detailed Report</g:link>
    </br>
    <g:link action="exportWord" id="${courseReportInstance.id}">
        <span class="glyphicon glyphicon-export" aria-hidden="true"></span>
        Export Report to Word
    </g:link>

</div>


<div class="modal fade" id="uploadModal" tabindex="-1"
     role="dialog"
     aria-labelledby="myModalLabel3">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel3">Upload Course Work</h4>
            </div>
            <g:uploadForm enctype='multipart/form-data' controller="courseWork" action="upload" id="${courseReportInstance.id}" >
                <div class="modal-body">
                    <fieldset class="form">
                        <input type="file" name="file[]" multiple />
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <fieldset class="buttons">
                        <g:submitButton name="upload" class="save" value="Upload"/>
                    </fieldset>
                </div>
            </g:uploadForm>
        </div>
    </div>
</div>
</body>
</html>
