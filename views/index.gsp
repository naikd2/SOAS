<%@ page import="com.thinksoas.Programs" %>
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
        <p>Select a program to start</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
      </div>
    </div>  
    <div class="container">
    <g:if test="${request.getSession(false) && session.user}">
        <g:if test="${Programs.count() == 0}">
          <p><a class="btn btn-link btn-lg" href="${createLink(controller:'Programs', action:'create')}" role="button">Create a program to get started&raquo;</a></p>
        </g:if>
        <g:else>
        	<g:set var="programList" value="${Programs.getAll()}" />
          Programs
          <g:each in="${programList}" status="i" var="program">
              <li><a class="btn btn-link btn-lg" href="${createLink(controller:'Programs', action:'show', params:[id:program.id])}" role="button">${program}</a></li>
          </g:each>
        </g:else>
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
