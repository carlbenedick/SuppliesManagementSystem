<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="JS/prototype.js"></script>
<script src="JS/suppliesFunctions.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:include page="includes/header.jsp">
	<jsp:param value="" name="" />
</jsp:include>
<body>
	<div id="mainContents">
		<br> <a href="stocks.jsp">Stocks</a> <br>
		<div>
			<input type="button" id="btSuppliesMaintenance"
				value="SuppliesMaintenance">
		</div>
		<div>
			<input type="button" id="btnMaintenance" value="Maintenance">
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$("btSuppliesMaintenance").observe("click", function() {
		goToSuppliesMain();
	});

	$("btnMaintenance").observe("click", function() {
		addss();
	});

	function addss() {
		new Ajax.Request("${pageContext.request.contextPath}/maintenance", {
			method : "GET",
			parameters : {
				action : "maintain",
			},
			onComplete : function(response) {
				$("mainContents").update(response.responseText);
			}
		});
	}
</script>
