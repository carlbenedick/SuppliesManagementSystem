<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="JS/prototype.js"></script>
<script src="JS/suppliesFunctions.js"></script>
<script src="JS/homeFunctions.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<!-- <link href="css/style.css" rel="stylesheet" type="text/css" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<div id="mainContents">
		<%
			if (session.getAttribute("userId") == null) {
		%>
		<%@ include file="login.jsp"%>

		<%
			} else {
		%>
		<%@ include file="home.jsp"%>

		<%
			}
		%>
	</div>
</body>
</html>