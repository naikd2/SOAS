<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> <meta name="layout" content="main" />
<title>Login</title>
</head>
<body>

    <div class="container">


<g:if test="${flash.message}">
<div class="message">${flash.message}</div> </g:if>
      <form class="form-signin" action="validate">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="username" class="sr-only">Username</label>
        <input type="username" id="username" name="username" class="form-control" placeholder="username" required autofocus>
        <label for="password" class="sr-only">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
      <input type="hidden" name="cName" value="${cName}"> 
		<input type="hidden" name="aName" value="${aName}">

   

    </div> <!-- /container -->
%{-- 
<table>
<tr class="prop"> <td class="name">
<label for="username">User Name:</label> </td>
<td class="value">
<input type="text" id="username" name="username" value="">
</td> </tr>
<tr class="prop"> <td class="name">
<label for="password">Password:</label> </td>
<td class="value">
<input type="password" id="password" name="password" value="">
</td> </tr>
<tr> <td>
</td> <td>
<input type="submit" value="login"/> </td>
        </tr>
      </table>
		<input type="hidden" name="cName" value="${cName}"> 
		<input type="hidden" name="aName" value="${aName}">

    </g:form> --}%
  </body>
</html>