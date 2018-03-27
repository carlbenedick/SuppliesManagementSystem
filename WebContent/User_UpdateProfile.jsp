<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Profile</title>
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
</head>
<body>
	<div id="updateProf">
		<table>
			<tr>
				<td>User ID</td>
				<td><input type="text" id="user_ids"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" id="passw" disabled="disabled"></td>
				<td><input type="button" id="btnChangePassword"
					value="Change Password"></td>
				<td><input type="button" id="btnSv" value="Save"></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" id="firstNames"></td>
				<td></td>
				<td><input type="button" id="btnCan" value="Cancel"></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" id="lastNames"></td>
			</tr>
			<tr>
				<td>Middle Initial</td>
				<td><input type="text" id="middleInitials"></td>
			</tr>
			<tr>
				<td>Email Address</td>
				<td><input type="text" id="emailAdds"></td>
			</tr>
		</table>
	</div>
</body>
<script>
	$("btnSv").observe("click", function() {
		updateUser()
	});
	function updateUser() {
		new Ajax.Request(contextPath + "/updateUser", {
			method : "GET",
			parameters : {
				action : "updateUser",
				userIds : $F("user_ids"),
				firstNames : $F("firstNames"),
				lastNames : $F("lastNames"),
				middleInitials : $F("middleInitials"),
				emailss : $F("emailAdds")
			},
			onComplete : function(response) {
				$("updateProf").update(response.responseText);
			}
		});
	}
	$("btnChangePassword").observe("click", function() {
		new Ajax.Request(contextPath + "/changepass", {
			method : "GET",
			parameters : {
				action : "changepass"
			},
			onComplete : function(response) {
				$("updateProf").update(response.responseText);
			}
		});
	});
	$("btnCan").observe("click", function() {
		new Ajax.Request(contextPath + "/cancel", {
			method : "GET",
			parameters : {
				action : "cancelProfile"
			},
			onComplete : function(response) {
				$("updateProf").update(response.responseText);
			}
		});
	});
</script>
</html>