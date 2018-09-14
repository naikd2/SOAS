<%@ page import="com.thinksoas.report.course.*" %>
<%
    def myService = grailsApplication.classLoader.loadClass('com.thinksoas.report.course.CourseReportService').newInstance()
%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'courseReport.label', default: 'CourseReport')}" />
    <asset:javascript src="bootstrap-modal.js"/>
    <asset:javascript src="Chart.bundle.min.js"/>

    <title>
        <g:message code="default.show.label" args="[entityName]" />
    </title>
    <style>

    canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-11">

            <div>
                <li class="list-group-item active">
                    <ul class="list-inline">
                        <li>Course Report:</li><li>${reportSemester}</li>
                    </ul>
                </li>
                <g:set var="settings" value="${com.thinksoas.data.Program.findBySettings("SETTINGS")}" />

                <!-- Nav tabs -->
                <g:set var="isActive" value="true" />
                <ul class="nav nav-tabs" role="tablist">
                    <g:each in="${myService.findAllReleventOutcomes(courseReportInstance.id)}" var="studentOutcome" >
                        <g:if test="${isActive.toBoolean()}">
                            <li role="presentation"><a href="#outcome-${studentOutcome.prefix}" aria-controls="home" role="tab" data-toggle="tab">Student Performance ${studentOutcome.prefix}</a></li>
                            <g:set var="isActive" value="false" />
                        </g:if>
                        <g:else>
                            <li role="presentation"><a href="#outcome-${studentOutcome.prefix}" aria-controls="home" role="tab" data-toggle="tab">Student Performance ${studentOutcome.prefix}</a></li>
                        </g:else>
                    </g:each>
                </ul>


                <!-- Tab panes -->
                <div class="tab-content">
                    <g:each in="${myService.findAllReleventOutcomes(courseReportInstance.id)}" var="studentOutcome" >



                        <div role="tabpanel" class="tab-pane" id="outcome-${studentOutcome.prefix}">

                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Criterion</th>
                                    <th>Faculty Evaluations</th>
                                    <th>Student Surveys</th>
                                    <th>Delta</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${courseReportInstance.objectives}" var="rObjective">
                                    <tr>

                                        <td>
                                            <a href="#objectiveDetails${rObjective.objective.prefix}${rObjective.id}" data-toggle="modal"
                                               data-target="#objectiveDetails${rObjective.objective.prefix}${rObjective.id}">
                                                ${rObjective.objective.prefix}
                                            </a>
                                        </td>
                                        <!-- Objective Modal -->
                                        <div class="modal fade" id="objectiveDetails${rObjective.objective.prefix}${rObjective.id}" tabindex="-1"
                                             role="dialog"
                                             aria-labelledby="myModalLabelCourse">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close"><span
                                                                aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="myModalLabelCourse">${rObjective.objective.course} </h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <g:render template="/courseReport/quickViewObjective" collection="${rObjective.objective}" var="obj"/>
                                                    </div>

                                                    <div class="modal-footer">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <g:set var="delta" value="${0}" />

                                        <g:each in="${myService.getReportOutcomeBySO(studentOutcome.id, rObjective.id).methods}" var="method">
                                            <g:set var="delta" value="${(delta - method.percentage).abs()}" />

                                            <g:if test="${method.percentage > settings.performanceTarget}" >
                                                <td>${method.percentage}</td>
                                            </g:if>
                                            <g:else>
                                                <td>
                                                    <span style="font-weight:bold; color: red">
                                                        ${method.percentage}
                                                    </span><sup>1</sup>
                                                </td>
                                            </g:else>
                                        </g:each>
                                        <g:if test="${delta <= settings.deltaValue}" >
                                            <td>
                                                ${delta}
                                            </td>
                                        </g:if>
                                        <g:else>
                                            <td class="danger">
                                                <span style="font-weight:bold; color: red">
                                                    ${delta}
                                                </span><sup>2</sup>
                                            </td>
                                        </g:else>

                                    </tr>

                                </g:each>

                                </tbody>
                            </table>
                            <span style="font-size: 12px">1: This result does not meet expectations of ${settings.performanceTarget}% or greater.</span><br>
                            <span style="font-size: 12px">2: In all cases delta must be ${settings.deltaValue}% or less.</span><br>

                            <g:set var="chartSO" value="${chartData.get(studentOutcome)}" />
                            <g:set var="datasetJson" value="${chartSO.createJsonOfDataSet()}" />

                            <div id="graphs">
                                <div id="graphDiv${studentOutcome.prefix}" >
                                    <canvas id="myChart${studentOutcome.prefix}"></canvas>

                                    <script>
                                        //red: 'rgb(255, 99, 132)',
                                        //yellow: 'rgb(255, 205, 86)',
                                        //blue: 'rgb(54, 162, 235)',
                                        var ctx = document.getElementById('myChart${studentOutcome.prefix}');

                                        %{--var myChart = new Chart(ctx, {--}%
                                        %{--type: 'bar',--}%
                                        %{--data: {--}%
                                        %{--labels: ['CourseObjective1', 'CourseObjective2'],--}%
                                        %{--datasets: [{--}%
                                        %{--label: 'Faculty Evaluation',--}%
                                        %{--backgroundColor: 'rgb(255, 99, 132)',--}%
                                        %{--borderColor: 'rgb(255, 99, 132)',--}%
                                        %{--borderWidth: 1,--}%
                                        %{--data: [--}%
                                        %{--5, 2, 6--}%
                                        %{--]--}%
                                        %{--}, {--}%
                                        %{--label: 'Student Surveys',--}%
                                        %{--backgroundColor: 'rgb(54, 162, 235)',--}%
                                        %{--borderColor: 'rgb(54, 162, 235)',--}%
                                        %{--borderWidth: 1,--}%
                                        %{--data: [--}%
                                        %{--5, 2, 6--}%
                                        %{--]--}%
                                        %{--}, {--}%
                                        %{--label: 'Delta',--}%
                                        %{--backgroundColor: 'rgb(255, 205, 86)',--}%
                                        %{--borderColor: 'rgb(255, 205, 86)',--}%
                                        %{--borderWidth: 1,--}%
                                        %{--data: [--}%
                                        %{--5, 2, 6--}%
                                        %{--]--}%
                                        %{--}]--}%
                                        %{--},--}%
                                        %{--// Chart config--}%
                                        %{--options: {--}%
                                        %{--maintainAspectRatio: true,--}%
                                        %{--responsive: true,--}%
                                        %{--animation: {--}%
                                        %{--onComplete: function(animation){--}%
                                        %{--//--}%
                                        %{--//                                                        document.querySelector('#myImage').setAttribute('src', this.toBase64Image());--}%
                                        %{--//                                                        var baseImage = document.querySelector('#myImage').getAttribute('src');--}%
                                        %{--//                                                        var data =--}%
                                        %{--//                                                            {requestId: 12456,--}%
                                        %{--//                                                                node: baseImage};--}%


                                        %{--var URL="${createLink(controller:'courseReport',action:'checkJquery')}";--}%

                                        %{--$.ajax({--}%
                                        %{--url:URL,--}%
                                        %{--data: JSON.stringify(data),--}%
                                        %{--contentType: 'application/json; charset=utf-8',--}%
                                        %{--dataType: 'json',--}%
                                        %{--type: 'POST',--}%
                                        %{--success: function(resp){--}%
                                        %{--console.log(resp);--}%
                                        %{--}--}%
                                        %{--});--}%
                                        %{--}--}%
                                        %{--},--}%
                                        %{--scales: {--}%
                                        %{--xAxes: [{--}%
                                        %{--display: true,--}%
                                        %{--gridLines: {--}%
                                        %{--display: true,--}%
                                        %{--color: 'rgba(0, 0, 0, 0.00)',--}%
                                        %{--zeroLineColor: 'transparent'--}%
                                        %{--},--}%
                                        %{--scaleLabel: {--}%
                                        %{--display: false,--}%
                                        %{--labelString: 'Month'--}%
                                        %{--}--}%
                                        %{--}],--}%
                                        %{--yAxes: [{--}%
                                        %{--display: true,--}%
                                        %{--gridLines: {--}%
                                        %{--display: true,--}%
                                        %{--color: 'rgba(0, 0, 0, 0.05)',--}%
                                        %{--zeroLineColor: 'transparent'--}%
                                        %{--},--}%
                                        %{--scaleLabel: {--}%
                                        %{--display: false,--}%
                                        %{--labelString: 'Total'--}%
                                        %{--}--}%
                                        %{--}]--}%
                                        %{--},--}%
                                        %{--tooltips: {--}%
                                        %{--titleFontSize: 12,--}%
                                        %{--bodyFontSize: 12,--}%
                                        %{--bodyFontStyle: 'normal',--}%
                                        %{--bodyFontColor: '#FFFFFF',--}%
                                        %{--backgroundColor: '#3f5761',--}%
                                        %{--cornerRadius: 0,--}%
                                        %{--xPadding: 12,--}%
                                        %{--yPadding: 12,--}%
                                        %{--titleMarginBottom: 10--}%
                                        %{--}--}%
                                        %{--}--}%
                                        %{--});--}%
                                        var barChartData = {
                                            labels: ${chartSO.labels},
                                            datasets: ${raw(datasetJson as String)}
                                        };

                                        window.myBar = new Chart(ctx, {
                                            type: 'bar',
                                            data: barChartData,
                                            options: {
                                                responsive: true,
                                                legend: {
                                                    position: 'top',
                                                },
                                                title: {
                                                    display: true,
                                                    text: 'Chart.js Bar Chart'
                                                },
                                                scales: {
                                                    yAxes: [{
                                                        ticks: {
                                                            beginAtZero: true,
                                                            suggestedMax: 100
                                                        }
                                                    }]
                                                }

                                            }
                                        });
                                    </script>
                                </div>
                                %{--<g:set var="graph_number" value="${graph_number + 1}" />--}%
                            </div>



                        </div>
                    </g:each>
                </div>

            </div>

            <ul class="list-group">

                %{--<g:each in="${courseReportInstance.objectives}" var="rObjective">--}%
                %{--<g:set var="methods" value="${myService.getReportOutcomeBySO(studentOutcome.id, rObjective.id).methods}" />--}%



                %{--<g:set var="index_num" value="${rObjective.objective.prefix}" />--}%
                %{--<g:set var="graph_number" value="${0}" />--}%
                %{--<g:set var="method1" value="${methods.get(0).percentage}" />--}%
                %{--<g:set var="method2" value="${methods.get(1).percentage}" />--}%
                %{--<g:set var="delta" value="${(method1 - method2).abs()}" />--}%

        </div>

    </li>
    </ul>
    </div>
</div>

</div>

</body>
</html>
</html>