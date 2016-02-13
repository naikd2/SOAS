<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to SOAS</title>
	
	</head>
	<body>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>Welcome To SOAS!</h1>
        <p>TODO DESCRIPTION.</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
      </div>
    </div>  

    <g:if test="${request.getSession(false) && session.user}">
   		 <div class="container">
      		<!-- Example row of columns -->
      		<div class="row">
        	<div class="col-md-4">
          		<h2>Student Outcomes</h2>
          		<p>Brief Description </p>
          		<p><a class="btn btn-default" href="${createLink(controller:'StudentOutcome', action:'index')}"  role="button">Go To &raquo;</a></p>
        	</div>
        	 
        	<div class="col-md-4">
          	<h2>Courses</h2>
          		<p>Brief Description </p>
          		<p><a class="btn btn-default" href="${createLink(controller:'Course', action:'index')}"  role="button">Go To &raquo;</a></p>
      		</div>
        	<div class="col-md-4">
          	<h2>Classes</h2>
          		<p>Brief Description</p>
          		<p><a class="btn btn-default" href="${createLink(controller:'Class', action:'index')}"  role="button">Go To &raquo;</a></p>
        	</div>
      	</div>
	</g:if>
	<g:else>
		<h3>Please Login</h3>
	</g:else>
      
      <hr>
      <footer>
        <p>&copy; 2015 ThinkSOAS, Inc.</p>
      </footer>
    </div> <!-- /container -->
	</body>
</html>
