<%@ page import="com.thinksoas.Report.Couse.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'courseReport.label', default: 'CourseReport')}" />
    <g:javascript src="BarGraph.js" />
    <title>
        <g:message code="default.show.label" args="[entityName]" />
    </title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-8">
            <ul class="list-group">
                <li class="list-group-item active"> Course Report -
                <g:fieldValue bean="${courseReportInstance}" field="section"/>:
                </li>
                <li class="list-group-item">Details:</li>
                <li class="list-group-item">
                    ${raw(report)}


                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">

        </div>
    </div>
</div>
</body>
</html>