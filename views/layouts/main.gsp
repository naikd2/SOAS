<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

    <asset:stylesheet src="bootstrap.css"/>
    <script src="/soas/static/plugins/jquery-1.11.1/js/jquery/jquery-1.11.1.min.js" type="text/javascript" ></script>
    <link href="/soas/static/plugins/jquery-ui-1.10.4/jquery-ui/themes/ui-lightness/jquery-ui-1.10.4.custom.css" type="text/css" rel="stylesheet" media="screen, projection" />
    <script src="/soas/static/plugins/jquery-ui-1.10.4/jquery-ui/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript" ></script>
    <r:layoutResources/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="jquery.metadata.js"/>
    <asset:javascript src="jquery.ui.writetable.js"/>



    %{--<asset:stylesheet src="bootstrap.css"/>--}%
    %{--<script src="/soas/static/plugins/jquery-1.11.1/js/jquery/jquery-1.11.1.min.js" type="text/javascript" ></script>--}%
    %{--<link href="/soas/static/plugins/jquery-ui-1.10.4/jquery-ui/themes/ui-lightness/jquery-ui-1.10.4.custom.css" type="text/css" rel="stylesheet" media="screen, projection" />--}%
    %{--<script src="/soas/static/plugins/jquery-ui-1.10.4/jquery-ui/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript" ></script>--}%
    %{--<asset:javascript src="application.js"/>--}%
    %{--<asset:javascript src="jquery.metadata.js"/>--}%
    %{--<asset:javascript src="jquery.ui.writetable.js"/>--}%
    %{--<asset:javascript src="bootstrap-modal.js"/>--}%
    %{--<asset:javascript src="bootstrap-alert.js"/>--}%

    <g:layoutHead/>
</head>
<body>


        %{-- 		<div id="Logo" role="banner"><img src="${resource(dir: '/assets/images/', file: 'SOASLogo.png')}"
                    alt="SOAS"/></a>
                    <g:loginToggle />
                </div> --}%
<nav class="navbar navbar-inverse navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/soas">SOAS</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/soas">Home</a></li>
                <li><a href="#about">About</a></li>
            </ul>



            <sec:ifLoggedIn>
                <ul class="nav navbar-nav navbar-right">
                    <sec:ifAnyGranted roles="ROLE_ADMIN">
                        <li><a href='${createLink(controller:'Program', action:'settings')}'> Settings </a></li>
                    </sec:ifAnyGranted>
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span>  <sec:username/></a></li>
                    <li>
                        <a name="logout" href="${createLink(controller:'logout') }"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                    </li>
                </ul>
            </sec:ifLoggedIn>

            <sec:ifNotLoggedIn>
                <ul class="nav navbar-nav navbar-right">
                    <form class="navbar-form navbar-right" action="${createLink(uri: '/j_spring_security_check')}" method = "POST" id="loginForm" class="cssform" >
                        <div class="form-group">
                            <input type="j_username" id="j_username" name="j_username" class="form-control" placeholder="Username" required autofocus/>
                        </div>
                        <div class="form-group">
                            <input type="password" id="j_password" name="j_password" class="form-control" placeholder="Password" required/>
                        </div>
                        <div class="form-group">
                            <input type="checkbox" id="_spring_security_remember_me" name="_spring_security_remember_me" class="form-control"/>
                        </div>
                        <button type="submit" class="btn btn-success">Sign in</button>
                    </form>
                </ul>
            </sec:ifNotLoggedIn>

        </div>
    </div>
</nav>

<g:if test="${request.getServletPath() == '/grails/courseReport/show.dispatch'}">


</g:if>
<g:elseif test="${request.requestURI == '/soas/'}">

</g:elseif>
<g:else>
    %{--<sec:ifLoggedIn>--}%
        %{--<div class="container-fluid">--}%
            %{--<div class="row">--}%
                %{--<div class="col-sm-3 col-md-2 sidebar">--}%
                    %{--<ul class="nav nav-sidebar">--}%
                        %{--<li class="active"><a href="..">Return <span class="sr-only">(current)</span></a></li>--}%
                        %{--<li><hr style="border: 1px solid white; width: 85%; margin-top: 10px; margin-bottom:10px;"></li>--}%

        %{--<sec:ifAnyGranted roles="ROLE_ADMIN">--}%
            %{--<li><a href="${createLink(controller:'StudentOutcome', action:'index')}">Student Outcomes</a></li>--}%
            %{--<li><a href="${createLink(controller:'Course', action:'index')}">Courses</a></li>--}%
        %{--</sec:ifAnyGranted>--}%
        %{--<li><a href="${createLink(controller:'Class', action:'index')}">Classes</a></li>--}%
        %{--<sec:ifAnyGranted roles="ROLE_ADMIN">--}%
            %{--<li><a href="${createLink(controller:'SO_Report', action:'index')}">Student Outcome Report</a></li>--}%
        %{--</sec:ifAnyGranted>--}%
        %{--</ul>--}%
    %{--</div>--}%
    %{--</sec:ifLoggedIn>--}%
</g:else>
<div class="container-fluid">
    <div class="row">

        <g:if test="${request.requestURI != '/soas/'}">
            <div class="col-sm-1">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="${request.getHeader('referer')}">Return</a></li>
                    <li><a href="${createLink(controller:'StudentOutcome', action:'index')}">Student Outcomes</a></li>
                    <li><a href="${createLink(controller:'Course', action:'index')}">Courses</a></li>
                    <li><a href="${createLink(controller:'Class', action:'index')}">Classes</a></li>
                    <li><a href="${createLink(controller:'Semester', action:'index')}">Semesters</a></li>
                    %{--<li class="dropdown">--}%
                        %{--<a class="dropdown-toggle" data-toggle="dropdown" href="#">--}%
                            %{--Reports <span class="caret"></span>--}%
                        %{--</a>--}%
                        %{--<ul class="dropdown-menu">--}%
                            <li><a href="${createLink(controller:'OutcomeReport', action:'index')}">Outcome Plan</a></li>
                            <li><a href="${createLink(controller:'CourseReport', action:'index')}">Course Report</a></li>
                            <li><a href="${createLink(controller:'CourseReport', action:'SO')}">Outcome Report</a></li>
                            %{--<li class="divider"></li>--}%
                        %{--</ul>--}%
                    %{--</li>--}%
                </ul>
            </div>
        </g:if>

        <div class="col-sm-11">
            <g:layoutBody/>
        </div>

    </div>
</div>

<script>
    function goBack() {
        window.history.back()
    }
</script>

<div class="footer" role="contentinfo"></div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<r:layoutResources/>

</body>
</html>
 