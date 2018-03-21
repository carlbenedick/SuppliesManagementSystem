<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Maintenance</title>
</head>
<body>
<div>
<table>
<tr>
<td>User ID</td>
<td>
<input type="text" id="user_id">
</td>
<td></td>
<td><input type="button" id="btnAdd" value="Add New"></td>
</tr>
<tr>
<td>Password</td>
<td>
<input type="text" id="password">
</td>
<td><input type="button" id="btnPassword" value="Change Password"></td>
<td><input type="button" id="btnSave" value="Save"></td>
</tr>
<tr>
<td>First Name</td>
<td>
<input type="text" id="firstName">
</td>
<td></td>
<td><input type="button" id="btnCancel" value="Cancel"></td>
</tr>
<tr>
<td>Last Name</td>
<td><input type="text" id="lastName"></td>
</tr>
<tr>
<td>Middle Initial</td>
<td><input type="text" id="middleInitial"></td>
</tr>
<tr>
<td>Email Address</td>
<td><input type="text" id="emailAdd"></td>
</tr>
<tr>
<td>Active Tag</td>
<td><input type="radio" name="activeTag" value="yes">Yes
<input type="radio" name="activeTag" value="no">No</td>
</tr>
<tr>
<td>Access Level</td>
<td><select id="accessLevel" name="accessLevel"></select>
<option value=""></option>

</tr>
</table>
</div>
</body>
</html>