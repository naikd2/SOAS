<%@ page import="com.thinksoas.data.*" %>

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
			<p>Add or edit Student Outcomes for your specific program.</p>
			<p><a class="btn btn-default" href="${createLink(controller:'StudentOutcome', action:'index')}"  role="button">Go To &raquo;</a></p>
		</div>


		<div class="col-md-4">
			<h2>Courses</h2>
			<p>Add or edit course information for your program.</p>
			<p><a class="btn btn-default" href="${createLink(controller:'Course', action:'index')}"  role="button">Go To &raquo;</a></p>
		</div>
	</sec:ifAnyGranted>
	<div class="col-md-4">
		<h2>Classes</h2>
		<p>Add or edit specific classes for each individual course.</p>
		<p><a class="btn btn-default" href="${createLink(controller:'Class', action:'index')}"  role="button">Go To &raquo;</a></p>
	</div>
	<sec:ifAnyGranted roles="ROLE_ADMIN">
		<div class="col-md-4">
			<h2>Outcome Assessment Plan</h2>
			<p>View your Continuous Improvement Plan for any course.</p>
			<p><a class="btn btn-default" href="${createLink(controller:'OutcomeReport', action:'index')}"  role="button">Go To &raquo;</a></p>
		</div>


		<div class="col-md-4">
			<h2>Outcome Assessment Report</h2>
			<p>View your Continuous Improvement Plan for a course.</p>
			<p><a class="btn btn-default" href="${createLink(controller:'CourseReport', action:'SO')}"  role="button">Go To &raquo;</a></p>
		</div>

		<div class="col-md-4">
			<h2>Course Report</h2>
			<p>View your End of Semester Report for each of your courses.</p>
			<p><a class="btn btn-default" href="${createLink(controller:'CourseReport', action:'index')}"  role="button">Go To &raquo;</a></p>
		</div>

		<div class="col-md-4">
			<h2>Semester</h2>
			<p>Add or edit semester information.</p>
			<p><a class="btn btn-default" href="${createLink(controller:'Semester', action:'index')}"  role="button">Go To &raquo;</a></p>
		</div>
	</sec:ifAnyGranted>
	</div>
</sec:ifLoggedIn>


<footer>
	<p>&copy; 2018 ThinkSOAS, Inc.</p>
</footer>

</div> <!-- /container -->
</body>
</html>
