<%@ page import="com.thinksoas.report.course.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'courseReport.label', default: 'CourseReport')}" />
    <g:javascript src="BarGraph.js" />
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
        <div class="col-sm-8">
            <ul class="list-group">
                <li class="list-group-item active"> Course Report -
                <g:fieldValue bean="${courseReportInstance}" field="section"/>:
                </li>
                <li class="list-group-item">Details:</li>
                <li class="list-group-item">
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