<%@ page import="com.thinksoas.report.course.CourseReport; com.thinksoas.data.StudentOutcome" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'courseReport.label', default: 'CourseReport')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <asset:javascript src="bootstrap-modal.js"/>
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
        Course: ${courseReportInstance.section}
    </h6>
    <h6>
        Semester: ${courseReportInstance.section.semester}
    </h6>
    <h6>
        Students: ${courseReportInstance.section.students}
    </h6>

    <table class="table table-striped table-hover ">
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
                    <a href="#obj${o.objective.prefix}" data-toggle="modal"
                       data-target="#obj${o.objective.prefix}">
                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                        ${o.objective.prefix}
                    </a>
                </td>

                <div class="modal fade" id="obj${o.objective.prefix}" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">${o.objective}</h4>
                            </div>

                            <g:form class="form-horizontal"
                                    url="[resource: o, controller: 'courseReportObjective', action: 'update']"
                                    method="PUT">
                                <g:hiddenField name="version" value="${courseReportObjectiveInstance?.version}"/>
                                <div class="modal-body">

                                    <fieldset>
                                        <g:render template="/courseReportObjective/form"/>
                                    </fieldset>
                                </div>

                                <div class="modal-footer">
                                    <fieldset class="buttons">
                                        <g:actionSubmit class="btn btn-primary" action="update"
                                                        value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                                    </fieldset>
                                </div>

                            </g:form>
                        </div>
                    </div>
                </div>
                <td>
                    ${o.instrument}
                </td>
                <g:each in="${StudentOutcome.list()}" var="so">
                    <g:set var="found" value="${false}"/>
                    <g:each in="${o.outcomes}" var="outs">
                        <g:if test="${outs.outcome == so}">
                            <g:set var="found" value="${true}"/>
                            <td>
                                <g:each in="${outs.methods}" var="m">
                                    <div>

                                        <a href="#method${m.id}" data-toggle="modal"
                                           data-target="#method${m.id}">
                                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                            ${m.method}: ${m.percentage}%
                                        </a>


                                        <div class="modal fade" id="method${m.id}" tabindex="-1"
                                             role="dialog"
                                             aria-labelledby="myModalLabel2">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close"><span
                                                                aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="myModalLabel2">${m.method}</h4>
                                                    </div>

                                                    <g:form class="form-horizontal"
                                                            url="[resource: m, controller: 'courseReportMethod', action: 'update']"
                                                            method="PUT">
                                                        <g:hiddenField name="version"
                                                                       value="${courseReportMethodInstance?.version}"/>
                                                        <div class="modal-body">

                                                            <fieldset>
                                                                <g:render template="/courseReportMethod/form"/>
                                                            </fieldset>
                                                        </div>

                                                        <div class="modal-footer">
                                                            <fieldset class="buttons">
                                                                <g:actionSubmit class="btn btn-primary" action="update"
                                                                                value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                                                            </fieldset>
                                                        </div>
                                                    </g:form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </g:each>
                            </td>
                        </g:if>
                    </g:each>
                    <g:if test="${!found}">
                        <td>N/A</td>
                    </g:if>
                </g:each>
                <td>
                    <div>
                        ${o.max}/${o.min}
                    </div>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
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
            <g:uploadForm controller="courseWork" action="upload" id="${courseReportInstance.id}" >
                <div class="modal-body">
                    <fieldset class="form">
                        <input type="file" name="file"/>
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
