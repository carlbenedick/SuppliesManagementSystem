<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="js/prototype.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
</head>
<body>
	<div id="userTable">
		<table id="addData">
			<tr>
				<th>User ID</th>
				<th><input type="text" id="user_id"></th>
				<th></th>
				<th><input type="button" id="btnadds" value="Add New"></th>
			</tr>
			<tr>
				<th>Password</th>
				<th><input type="text" id="password" disabled="disabled"></th>

				<th></th>

				<th><input type="button" id="btnSave" value="Save"></th>
			</tr>
			<tr>
				<th>First Name</th>
				<th><input type="text" id="firstName"></th>
				<th></th>
				<th><input type="button" id="btnCancel" value="Cancel"></th>
			</tr>
			<tr>
				<th>Last Name</th>
				<th><input type="text" id="lastName"></th>
			</tr>
			<tr>
				<th>Middle Initial</th>
				<th><input type="text" id="middleInitial"></th>
			</tr>
			<tr>
				<th>Email Address</th>
				<th><input type="text" id="emailAdd"></th>
			</tr>
			<tr>
				<th>Active Tag</th>
				<th><input type="radio" name="active" id="activeYes" value="Y">Yes
					<input type="radio" name="active" id="activeNo" value="N">No</th>
			</tr>
			<tr>
				<th>Access Level</th>
				<th><select id="accessLevel" name="accessLevel">
						<option value=""></option>
						<option value="A">Admin</option>
						<option value="U">User</option>
				</select></th>
			</tr>
			<tr>
				<th>Search</th>
				<th><input type="text" id="search"></th>
			</tr>
		</table>
		<div>
			<table id="tableRow" border="1"
				style="width: 1345px; margin: 2px 0px 0px 2px; background: buttonhighlight; align: center;">
				<tr>
					<th>User ID</th>
					<th>Password</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Middle Initial</th>
					<th>Email</th>
					<th>Active Tag</th>
					<th>Access Level</th>
					<th>Entry Date</th>
					<th>Last Login</th>
					<th>Last User</th>
					<th>Last Update</th>
				</tr>
				<c:forEach var="u" items="${lists}">
					<tr id="showTable">
						<td><c:out value="${u.userId}" /></td>
						<td><c:out value="${u.password}" /></td>
						<td><c:out value="${u.firstName}" /></td>
						<td><c:out value="${u.lastName}" /></td>
						<td><c:out value="${u.middleInitial}" /></td>
						<td><c:out value="${u.email}" /></td>
						<td><c:out value="${u.activeTag}" /></td>
						<td><c:out value="${u.accessLevel}" /></td>
						<td><fmt:formatDate type="date" pattern="dd-MMM-yyyy"
								value="${u.entryDate}" /></td>
						<td><fmt:formatDate type="date" pattern="dd-MMM-yyyy"
								value="${u.lastLogin}" /></td>
						<td><c:out value="${u.lastUser}" /></td>
						<td><fmt:formatDate type="date" pattern="dd-MMM-yyyy"
								value="${u.lastUpdate}" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
<script>
	function clicks(row) {
		var Rows = "";
		var inserts = $("tableRow");
		var selectedRows = "";

		$("user_id").setValue(row.down("td", 0).innerHTML);
		$("firstName").setValue(row.down("td", 2).innerHTML);
		$("lastName").setValue(row.down("td", 3).innerHTML);
		$("middleInitial").setValue(row.down("td", 4).innerHTML);
		$("emailAdd").setValue(row.down("td", 5).innerHTML);
		if (row.down("td", 6).innerHTML == "Y") {
			$("activeYes").writeAttribute("checked", "checked");
		} else if (row.down("td", 6).innerHTML == "N") {
			$("activeNo").writeAttribute("checked", "checked");
		}
		$("accessLevel").setValue(row.down("td", 7).innerHTML);
		Rows = row.rowIndex;

		if (Rows == "") {
			inserts.rows[selectedRows].removeClassName("hover1");
		} else {
			if (Rows != selectedRows) {
				inserts.rows[selectedRows].removeClassName("hover1");
				inserts.rows[Rows].addClassName("hover1");
			} else {
				inserts.rows[Rows].removeClassName("hover1");
			}
		}
	}
	$("btnSave").observe("click", function() {
		updateProfiles();
	});
	function updateProfiles() {
		var activeTags = "";
		if ($("activeYes").checked) {
			activeTags = "Y";
		} else if ($("activeNo").checked) {
			activeTags = "N";
		}
		new Ajax.Request(contextPath + "/updateProfile", {
			method : "GET",
			parameters : {
				action : "updateProfiles",
				userId : $F("user_id"),
				firstName : $F("firstName"),
				lastName : $F("lastName"),
				middleInitial : $F("middleInitial"),
				email : $F("emailAdd"),
				activeTag : activeTags,
				accessLevel : $F("accessLevel")
			},
			onComplete : function(response) {
				$("userTable").update(response.responseText);
			}
		});
	}
	$("btnadds").observe("click", function() {
		addNewUser();
	});
	function addNewUser() {
		new Ajax.Request(contextPath + "/addNew", {
			method : "GET",
			parameters : {
				action : "addNew"
			},
			onComplete : function(response) {
				$("userTable").update(response.responseText);
			}
		});
	}
	$$("table#tableRow tr").each(function(row) {
		row.observe("mouseover", function() {
			row.addClassName("hover");
		});
		row.observe("mouseout", function() {
			row.removeClassName("hover");
		});

		row.observe("click", function() {
			clicks(row);
		});
	});

	/* $("search").observe("blur", function() {
			new Ajax.Request(contextPath + "/search", {
				method : "GET",
				parameters : {
					action : "searches",
					searchId : $F("search")
				},
				onComplete : function(response) {
					//$("userTable").update(response.responseText);
				}
			});
		
	}); */
	

	
	
	$("search").observe("keyup", function(){
		new Ajax.Request(contextPath + "/search", {
			method: "POST",
			parameters: {
				/* action: "search", */
				searchId: $F("search")
			},
			onComplete: function(response) {
				
			}
		});
	});

	$("btnCancel").observe("click", function() {
		new Ajax.Request(contextPath + "/cancel", {
			method : "GET",
			parameters : {
				action : "cancelUser"
			},
			onComplete : function(response) {
				$("userTable").update(response.responseText);
			}
		});
	});
</script>
</html>