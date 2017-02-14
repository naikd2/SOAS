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
		<p>Computer Engineering Program</p>
		<p><a class="btn btn-primary btn-lg" href="${createLink(controller:'Message', action:'index')}" role="button">Go To Your Messages &raquo;</a></p>
	</div>
</div>

<sec:ifLoggedIn>
	<div class="container">
      <!-- Example row of columns -->
      <div class="row">
	<sec:ifAnyGranted roles="ROLE_ADMIN">
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
	</sec:ifAnyGranted>
	<div class="col-md-4">
		<h2>Classes</h2>
		<p>Brief Description</p>
		<p><a class="btn btn-default" href="${createLink(controller:'Class', action:'index')}"  role="button">Go To &raquo;</a></p>
	</div>
	<sec:ifAnyGranted roles="ROLE_ADMIN">
		<div class="col-md-4">
			<h2>Outcome Assessment Plan</h2>
			<p>Brief Description</p>
			<p><a class="btn btn-default" href="${createLink(controller:'SO_Report', action:'index')}"  role="button">Go To &raquo;</a></p>
		</div>


		<div class="col-md-4">
			<h2>Course Report</h2>
			<p>End of Semester Report</p>
			<p><a class="btn btn-default" href="${createLink(controller:'CourseReport', action:'index')}"  role="button">Go To &raquo;</a></p>
		</div>

		<div class="col-md-4">
			<h2>Semester</h2>
			<p>Brief Description</p>
			<p><a class="btn btn-default" href="${createLink(controller:'Semester', action:'index')}"  role="button">Go To &raquo;</a></p>
		</div>
	</sec:ifAnyGranted>
	</div>
</sec:ifLoggedIn>


<footer>
	<p>&copy; 2016 ThinkSOAS, Inc.</p>
</footer>

</div> <!-- /container -->
</body>
</html>
