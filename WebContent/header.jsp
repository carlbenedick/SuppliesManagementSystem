<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="JS/prototype.js"></script>
<script src="JS/homeFunctions.js"></script>
<script src="JS/suppliesFunctions.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
</head>
<body>
	<div>
		<table width="100%">
			<tr>
				<td><a href="JavaScript:goHome()"><img
						src="images/home.png" style="height: 25px; width: 25px;"
						alt="Home"></a> <%
 	if (session.getAttribute("accessType").equals("A")) {
 %> <a href="JavaScript:goMainte()"><img src="images/mainte.png"
						style="height: 25px; width: 25px;" alt="Maintenance"></a> <%
 	}
 %> <a href="supplies.jsp"><img src="images/supplies.png"
						style="height: 25px; width: 25px;" alt="Supplies"></a> <a
					href="stocks.jsp"><img src="images/stocks.jpg"
						style="height: 25px; width: 25px;" alt="Stocks"></a></td>
				<td><div align="right">
						<a href="JavaScript:logOut()"><img src="images/logout.png"
							style="height: 25px; width: 25px;" alt="Supplies"></a>
					</div></td>
			</tr>
		</table>
	</div>
</body>
</html>
<script type="text/javascript">
	
</script>