<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Store"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&family=Pacifico&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
</head>
<body>

<!-- Header include -->
<jsp:include page="header-navi.jsp" />

<!-- Login form -->
<div class="login">
	<p id="msg1"></p>
	<p id="msg2"></p>

	<form action="<%=request.getContextPath()%>/login-servlet" method="post">
		<input type="text" name="userId" required id="idInput">
		<input type="password" name="password" required id="passInput">
		<input type="submit" id="submitBtn">
	</form>

	<p class="error-msg" id="errorMsg"></p>
</div>

</body>
</html>
