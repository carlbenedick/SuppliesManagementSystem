<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="JS/prototype.js"></script>
<script src="JS/suppliesFunctions.js"></script>
<script src="JS/homeFunctions.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
	<div id="mainContents">
		<div id="header" style="background-color: #448cff;">
			<%@ include file="header.jsp"%></div>
		<h1>HOME</h1>
		<%
			if (session.getAttribute("accessType").equals("A")) {
		%>
		<a href="JavaScript:goMainte()">Maintenance</a>
		<%
			}
		%>
		<br> <a href="pages/supplies_maintenance.jsp">Supplies</a> <br>
		<a href="stocks.jsp">Stocks</a> <br>
		<a href="issue">Issue Supply</a>
		<div>
			<input type="button" id="btnLogout" value="Log out">
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$("btnLogout").observe("click", function() {
		logOut();
	});
</script>