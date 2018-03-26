<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New User</title>
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
</head>
<body>
	<div id="addsUser">
		<table id="mainContents">
			<tr>
				<td>User ID</td>
				<td><input type="text" id="userid"></td>
				<td></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" id="pass"></td>
				<td></td>
				<td><input type="button" id="btnsaves" value="Save"></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" id="firstname"></td>
				<td></td>
				<td><input type="button" id="btncancel" value="Cancel"></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" id="lastname"></td>
			</tr>
			<tr>
				<td>Middle Initial</td>
				<td><input type="text" id="middleinitial"></td>
			</tr>
			<tr>
				<td>Email Address</td>
				<td><input type="text" id="emailadd"></td>
			</tr>
			<tr>
				<td>Active Tag</td>
				<td><input type="radio" id="activetag" value="Y">Yes <input
					type="radio" id="activetag" value="N">No</td>
			</tr>
			<tr>
				<td>Access Level</td>
				<td><select id="accesslevel" name="accesslevel">
						<option value=""></option>
						<option value="A">Admin</option>
						<option value="U">User</option>
				</select></td>
			</tr>
		</table>
	</div>
</body>
<script>
	$("btnsaves").observe("click", function() {
		addUsers();
	});
	function addUsers() {
		new Ajax.Request(contextPath + "/adds", {
			method : "GET",
			parameters : {
				action : "insertUsers",
				userid : $F("userid"),
				pass : $F("pass"),
				firstname : $F("firstname"),
				lastname : $F("lastname"),
				middleinitial : $F("middleinitial"),
				emailadd : $F("emailadd"),
				activet : $F("activetag"),
				accesslevel : $F("accesslevel")
			},
			onComplete : function(response) {
				/* $("addsUser").update(response.responseText); */
			}
		});
	}
</script>
</html>