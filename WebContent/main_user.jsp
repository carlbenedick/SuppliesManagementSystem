<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Maintenance</title>
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
</head>
<body>
	<div id="mainContents">
		<input type="button" id="btnMaintenance" value="Maintenance">
	</div>
</body>
<script>
$("btnMaintenance").observe("click", function() {
	addss();
});
function addss() {
	new Ajax.Request(contextPath + "/maintenance", {
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
</html>