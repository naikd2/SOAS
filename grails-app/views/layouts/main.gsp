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
  		<asset:stylesheet src="application2.css"/>
      <asset:stylesheet src="bootstrap.css"/>
      <script src="/soas/static/plugins/jquery-1.11.1/js/jquery/jquery-1.11.1.min.js" type="text/javascript" ></script>
      <link href="/soas/static/plugins/jquery-ui-1.10.4/jquery-ui/themes/ui-lightness/jquery-ui-1.10.4.custom.css" type="text/css" rel="stylesheet" media="screen, projection" />
      <script src="/soas/static/plugins/jquery-ui-1.10.4/jquery-ui/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript" ></script>s
  		<r:layoutResources/>
  		<asset:javascript src="application.js"/>
  		<asset:javascript src="jquery.metadata.js"/>
  		<asset:javascript src="jquery.ui.writetable.js"/>
		<g:layoutHead/>
		
	</head>
	<body>
%{-- 		<div id="Logo" role="banner"><img src="${resource(dir: 'images', file: 'SOASLogo.png')}"
			alt="SOAS"/></a>
			<g:loginToggle />
		</div> --}%
		    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">SOAS</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/soas">Home</a></li>
            <li><a href="#about">About</a></li>
            
          </ul>
        	<g:if test="${request.getSession(false) && session.user}">
      			<ul class="nav navbar-nav navbar-right">
        		<li><a href="#"><span class="glyphicon glyphicon-user"></span> ${session.user}</a></li>
        		<li><a href='${createLink(controller:'User', action:'logout')}'><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
     			</ul>
			</g:if>
		<g:else>
		   <form class="navbar-form navbar-right" action="user/validate">
            <div class="form-group">
               <input type="username" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
            </div>
            <div class="form-group">
             <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          		<input type="hidden" name="cName" value="${cName}"> 
				<input type="hidden" name="aName" value="${aName}">
		</g:else>
        </div>
      </div>   
    </nav>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<r:layoutResources/>


	</body>
</html>
 