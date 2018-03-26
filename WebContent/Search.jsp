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

			<table id="tableRows" border="1"
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
						<td><c:out value="${u.emails}" /></td>
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
</body>
<script>
	/* function clicks(row) { */
		var Rows = "";
		var inserts = $("tableRows");
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
	/* } */
	/* $("btnSave").observe("click", function() {
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
				emails : $F("emailAdd"),
				activeTag : activeTags,
				accessLevel : $F("accessLevel")
			},
			onComplete : function(response) {
				$("userTable").update(response.responseText);
			}
		});
	} */
	/* $("btnadds").observe("click", function() {
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
	} */
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
</script>
</html>