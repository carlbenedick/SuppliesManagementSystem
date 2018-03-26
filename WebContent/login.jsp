<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="JS/prototype.js"></script>
<!-- <link rel="stylesheet" href="css/style.css" type="text/css" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
	background: url("images/welcome.jpg") no-repeat fixed center center;
	background-size: cover;
	font-family: Montserrat;
}

.login-block {
	width: 320px;
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	border-top: 5px solid #4286f4;
	margin: 0 auto;   	
}

.login-block h1 {
	text-align: center;
	color: #000;
	font-size: 18px;
	text-transform: uppercase;
	margin-top: 0;
	margin-bottom: 20px;
}

.login-block input {
	width: 100%;
	height: 42px;
	box-sizing: border-box;
	border-radius: 5px;
	border: 1px solid #ccc;
	margin-bottom: 20px;
	font-size: 14px;
	font-family: Montserrat;
	padding: 0 20px 0 50px;
	outline: none;
}

.login-block input#userName {
	background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px top
		no-repeat;
	background-size: 16px 80px;
}

.login-block input#userName:focus {
	background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px bottom
		no-repeat;
	background-size: 16px 80px;
}

.login-block input#password {
	background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px top
		no-repeat;
	background-size: 16px 80px;
}

.login-block input#password:focus {
	background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px bottom
		no-repeat;
	background-size: 16px 80px;
}

.login-block input:active, .login-block input:focus {
	border: 1px solid #4286f4;
}

.login-block button {
	width: 100%;
	height: 40px;
	background: #4286f4;
	box-sizing: border-box;
	border-radius: 5px;
	border: 1px solid #4286f4;
	color: #fff;
	font-weight: bold;
	text-transform: uppercase;
	font-size: 14px;
	font-family: Montserrat;
	outline: none;
	cursor: pointer;
}

.login-block input.button:hover {
	background: #75a9ff;
}
</style>
<body>
	<div id="mainContents">
		<div class="login-block">
			<h1>Welcome!!</h1>
			<a>${message}</a> <input type="text" id="userName" name="userName"
				placeholder="Username" /> <input type="password" id="password"
				placeholder="Password" />
			<button class="button" value="Log in" id="btnLogin">Log in</button>

		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$("btnLogin").observe("click", function() {
		login();
	});

	function login() {

		new Ajax.Request("${pageContext.request.contextPath}/index", {
			method : "post",
			parameters : {
				action : "login",
				userName : $F("userName"),
				password : $F("password")
			},
			onComplete : function(response) {
				$("mainContents").update(response.responseText);
			}
		});
	}
</script>