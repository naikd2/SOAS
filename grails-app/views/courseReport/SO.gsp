<%@ page import="com.thinksoas.report.course.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'courseReport.label', default: 'CourseReport')}" />
    <g:javascript src="BarGraph.js" />
    <asset:javascript src="bootstrap-modal.js"/>
    <title>
        <g:message code="default.show.label" args="[entityName]" />
    </title>

    <style>
    .tabcontent {
        display: none;
        padding: 6px 12px;
        border: 1px solid #ccc;
        border-top: none;
        -webkit-animation: fadeEffect 1s;
        animation: fadeEffect 1s; /* Fading effect takes 1 second */
    }

    div.tab button {
        background-color: coral;
        text-align: center;
        border: none;
        outline: none;
        cursor: pointer;
        transition: 0.3s;
        font-weight: bold;
        padding: 20px 10px;
        border: 1px solid black;
        margin-left: 5px;
        margin-top: 5px;
    }

    /* Change background color of buttons on hover */
    div.tab button:hover {
        background-color: #ddd;
    }

    /* Create an active/current tablink class */
    div.tab button.active {
        background-color: #ccc;
    }

    th {
        text-align: center;
        padding: 5px;
    }

    div.tab {
        overflow: hidden;
        border: 1px solid #ccc;
        background-color: #f1f1f1;

    }

    .divider {
        width: 5px;
        height: auto;
        display: inline-block;
        padding: 0px 10px;
    }

    @-webkit-keyframes fadeEffect {
        from {opacity: 0;}
        to {opacity: 1;}
    }

    @keyframes fadeEffect {
        from {opacity: 0;}
        to {opacity: 1;}
    }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-11">
            <ul class="list-group">
                <li class="list-group-item active"> Improvement Reports
                </li>
                    <script>function SetupTabs(evt, cityName) {
                        // Declare all variables
                        var i, tabcontent, tablinks;

                        // Get all elements with class="tabcontent" and hide them
                        tabcontent = document.getElementsByClassName("tabcontent");
                        for (i = 0; i < tabcontent.length; i++) {
                            tabcontent[i].style.display = "none";
                        }

                        // Get all elements with class="tablinks" and remove the class "active"
                        tablinks = document.getElementsByClassName("tablinks");
                        for (i = 0; i < tablinks.length; i++) {
                            tablinks[i].className = tablinks[i].className.replace(" active", "");
                        }

                        // Show the current tab, and add an "active" class to the button that opened the tab
                        document.getElementById(cityName).style.display = "block";
                        evt.currentTarget.className += " active";
                    }</script>

                <div class="tab" style="text-align: center">
                    <g:each in="${com.thinksoas.data.StudentOutcome.findAll()}" var="studentOutcome" >
                        <button class="tablinks" onclick="SetupTabs(event, '${studentOutcome.prefix}')">Student Performance ${studentOutcome.prefix}</button>
                    </g:each>
                </div>

                    <g:each in="${com.thinksoas.data.StudentOutcome.findAll()}" var="studentOutcome" >
                        <div id="${studentOutcome.prefix}" class="tabcontent" style="font-size: 20px; text-align: center; padding-top: 65px">Student Performance ${studentOutcome} </span></br></br>
                        <g:set var="impReport" value="${com.thinksoas.report.improvement.ImprovementReport.findByOutcome(studentOutcome)}" />
                        <g:set var="settings" value="${com.thinksoas.data.Program.findBySettings("SETTINGS")}" />
                        <g:if test="${impReport.courses.size() == 0}">
                           <span style="font-style: italic; font-size: 16px;">Outcome plan has yet to be created.</span>
                        </g:if>
                        <g:else>
                            <div>

                                <div id="ReportTable">
                                    <table style="font-size: 16px; text-align: center; width:70%; margin-left:15%; margin-right:15%;" border="1" class="fixed">
                                        <tr>
                                            <th>Criterion</th><th>Faculty Evaluations</th><th>Student Surveys</th>
                                            <th>Delta</th>
                                        </tr>
                                        <g:each in="${impReport.courses}" var="course">
                                            <g:set var="index_num" value="${impReport.courses.indexOf(course) + 1}" />
                                            <tr>
                                                <td>
                                                    <a href="#criteriaDetails${index_num}${impReport.id}" data-toggle="modal"
                                                       data-target="#criteriaDetails${index_num}${impReport.id}">
                                                        %{--<span class="glyphicon glyphiconr" aria-hidden="true"></span>--}%
                                                        ${index_num}
                                                    </a>
                                                </td>

                                                <div class="modal fade" id="criteriaDetails${index_num}${impReport.id}" tabindex="-1"
                                                     role="dialog"
                                                     aria-labelledby="myModalLabelCourse">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                        aria-label="Close"><span
                                                                        aria-hidden="true">&times;</span></button>
                                                                <h4 class="modal-title" id="myModalLabelCourse">
                                                                    ${course.courseObjective.course}
                                                                    ${course.courseObjective.course.name}
                                                                </h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <g:render template="/courseReport/quickViewCriterion" collection="${course}" var="criterion"/>
                                                            </div>

                                                            <div class="modal-footer">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <g:set var="delta" value="${0}" />

                                                <g:each in="${course.methods}" var="method">
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
                                                    <td>
                                                        <span style="font-weight:bold; color: red">
                                                            ${delta}
                                                        </span><sup>2</sup>
                                                    </td>
                                                </g:else>
                                            </tr>
                                        </g:each>
                                    </table>
                                </div>
                                <span style="font-size: 12px">1: This result does not meet expectations of ${settings.performanceTarget}% or greater.</span><br>
                                <span style="font-size: 12px">2: In all cases delta must be ${settings.deltaValue}% or less.</span><br>
                                <g:each in="${impReport.courses}" var="course">
                                    <g:set var="index_num" value="${impReport.courses.indexOf(course) + 1}" />
                                    <g:set var="graph_number" value="${0}" />
                                    <g:set var="method1" value="${course.methods.get(0).percentage}" />
                                    <g:set var="method2" value="${course.methods.get(1).percentage}" />
                                    <g:set var="delta" value="${(method1 - method2).abs()}" />
                                    <div id="graphs">
                                        <div id="graphDiv_SO${studentOutcome.prefix}_${graph_number}" style="top: 50%; left: 50%; display: inline-block; padding-right: 50px; padding-left: 50px; text-align: center">
                                            <script>
                                                (function () {
                                                    function createCanvas(divName) {
                                                        var div = document.getElementById(divName);
                                                        var canvas = document.createElement('canvas');
                                                        div.appendChild(canvas);
                                                        if (typeof G_vmlCanvasManager !== 'undefined') {
                                                            canvas = G_vmlCanvasManager.initElement(canvas);
                                                        }
                                                        var ctx = canvas.getContext("2d");
                                                        return ctx;
                                                    }
                                                    var ctx = createCanvas("graphDiv_SO${studentOutcome.prefix}_${graph_number}");
                                                    var graph = new BarGraph(ctx);
                                                    graph.xAxisLabelArr = ["", "${index_num}", ""];
                                                    graph.update(["${method1}", "${method2}", "${delta}"]);
                                                }());
                                            </script>
                                        </div>
                                        <g:set var="graph_number" value="${graph_number + 1}" />
                                    </div>
                                </g:each>

                                <span style="text-align: center; color: blue; font-weight:bold; font-size: 16px">Faculty Evaluation</span><br>
                                <span style="text-align: center; color: Orange; font-weight:bold; font-size: 16px">Student Surveys</span><br>
                                <span style="text-align: center; color: Green; font-weight:bold; font-size: 16px">Delta</span><br>

                                <form action="/soas/courseReport/myExampleAction2/${impReport.id}">
                                    Notes
                                    <textarea class="form-control" rows="5" name="notes">${impReport.notes}</textarea>
                                    Action Items
                                    <textarea class="form-control" rows="5" name="actionitems">${impReport.actionItem}</textarea>

                                    <input type="submit" name="create" class="btn btn-primary btn-block" value="Save" id="create">
                                </form>
                            </div>
                        </g:else>
                        </div>
                    </g:each>
            </ul>
        </div>
    </div>
</div>
</body>
</html>

