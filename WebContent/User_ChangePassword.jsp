<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
</head>
<body>
	<div id="changePasswords">
		<table>
			<tr>
				<td>Current Password</td>
				<td><input type="text" id="passwords"></td>
			</tr>
			<tr>
				<td>New Password</td>
				<td><input type="text" id="newPasswords"></td>
				<td></td>
				<td><input type="button" id="btnSaves" value="Save"></td>
			</tr>
			<tr>
				<td>Retype Password</td>
				<td><input type="text" id="retypePasswords"></td>
				<td></td>
				<td><input type="button" id="btnCancels" value="Cancel"></td>
			</tr>
		</table>
	</div>
</body>
<script>
	var pass_min = 8;
	var pass_max = 20;
	$("btnSaves").observe("click", function() {

		if ($F("newPasswords").length < pass_min) {
			alert("Password should be at least 8 characters.")
		} else if ($F("newPasswords").length > pass_max) {
			alert("Password should not exceed 20 characters.")
		} else {
			if ($F("newPasswords") == $F("retypePasswords")) {
				updatePassword();
			} else {
				alert("New Password is not equal to retype password")
			}
		}
	});
	function updatePassword() {
		new Ajax.Request(contextPath + "/updatePasswords", {
			method : "GET",
			parameters : {
				action : "changePassword",
				passwords : $F("passwords"),
				newPasswords : $F("newPasswords")
			},
			onComplete : function(response) {
				$("changePasswords").update(response.responseText);
			}
		});
	}
	$("btnCancels").observe("click", function() {
		new Ajax.Request(contextPath + "/cancel", {
			method : "GET",
			parameters : {
				action : "cancelPassword"
			},
			onComplete : function(response) {
				$("updateProf").update(response.responseText);
			}
		});
	});
</script>
</html>