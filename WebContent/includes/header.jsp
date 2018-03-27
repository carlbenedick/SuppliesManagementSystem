<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="JS/jquery.min.js"></script>
<script src="JS/bootstrap.js"></script>
<script src="JS/bootstrap.min.js"></script>
<script src="JS/sweetalert.min.js"></script>
<script src="JS/prototype.js"></script>
<script src="JS/functions.js"></script>
<script src="JS/homeFunctions.js"></script>
<script src="JS/suppliesFunctions.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
</script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/issuestyles.css" />

<nav class="navbar navbar-inverse navbar-fixed-top"
	style="box-shadow: 0 0 10px black;">
<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="#">WebSiteName</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="home">Home</a></li>
		<%
			if (session.getAttribute("accessType").equals("A")) {
		%>
		<li class="dropdown"><a href="JavaScript:goMainte()" data-toggle="dropdown"
			class="dropdown-toggle inactiveLink">Maintenance <span
				class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">Users</a></li>
				<li><a href="supplies?action=suppliesMaintenance">Supplies</a></li>
			</ul></li>
		<%
			}
		%>
		<li><a href="issue">Issue Supplies</a></li>
		<li><a href="#">Add Stocks</a></li>
	</ul>

	<ul class="nav navbar-nav navbar-right">

		<%="<li><a href=\"updateProfile?action=updateprof\"><span class=\"glyphicon glyphicon-user\"></span>"
					+ session.getAttribute("firstName") + " " + session.getAttribute("lastName") + "</a></li>"%>
		<%
			if (session.getAttribute("userId") == null) {
		%>
		<%="<li><a href=\"#\"><span class=\"glyphicon glyphicon-log-in\"></span>Login</a></li>"%>
		<%
			} else {
		%>
		<%="<li><a href=\"JavaScript:logOut()\"><span class=\"glyphicon glyphicon-log-out\"></span>Logout</a></li>"%>
		<%
			}
		%>

	</ul>
</div>
</nav>
</head>