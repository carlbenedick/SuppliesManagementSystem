<%@page
	import="java.util.logging.SimpleFormatter,java.io.*,java.util.*, javax.servlet.*,java.text.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
		<script src="JS/jquery.min.js"></script>
		<script src="JS/bootstrap.js"></script>
		<script src="JS/bootstrap.min.js"></script>
		<script src="JS/sweetalert.min.js"></script>
		<script src="JS/prototype.js"></script>
		<script src="JS/functions.js"></script>
		<script type="text/javascript">
			var contextPath = "${pageContext.request.contextPath}";
		</script>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
		<link rel="stylesheet" type="text/css" href="css/issuestyles.css" /> -->

<jsp:include page="includes/header.jsp">
	<jsp:param value="" name="" />
</jsp:include>

<title>Issued Supply Listings</title>
</head>
<body>
	<div id="body" class="container-fluid panel-body">
		<fieldset style="margin-top:30px;">
		<legend>Issue Supplies</legend>
		<div id="form" >
			<form class="form-inline" style="margin-left: 280px;">
				<div class="form-group edit-form">
					<label for="itemName">Item Name: </label> <select
						class="form-control" name="itemName" id="itemName" required>
						<!-- Loop for item name -->
						<c:forEach var="supply" items="${supplies}">
							<option value="${supply.supplyID}" selected><c:out
									value="${supply.itemName}" /></option>
						</c:forEach>
						<!-- End of Loop -->
					</select>
				</div>

				<div class="form-group" style="margin-left: 100px;">
					<label for="quantity">Quantity: </label> <input type="text"
						class="form-control" name="quantity" id="quantity" required />
				</div>

				<div class="form-group" style="margin-left: 20px;">
					<label for="requestor">Requested By: </label> <input type="text"
						class="form-control" name="requestor" id="requestor" required />
				</div>
				</form>
				<form class="form-inline" style="margin-top: 20px; margin-left: 230px;">
				<div class="form-group edit-form">
					<label for="departmentName">Department Name: </label> <select
						class="form-control" name="departmentName" id="departmentName"
						required>
						<!-- Loop for item name -->
						<c:forEach var="department" items="${departments}">
							<option value="${department.departmentId}" selected><c:out
									value="${department.departmentName}" /></option>
						</c:forEach>
						<!-- End of Loop -->
					</select>
				</div>

				<div class="form-group" style="margin-left: 20px;">
					<label for="issueDate">Issue Date: </label> <input type="date"
						class="form-control" name="issueDate" id="issueDate" required />
				</div>
				</form>
				
				<form class="form-inline" style="margin-top: 20px;">
				<div class="form-group" style="margin-left: 500px;">
					<!-- Session userID attribute value -->
					<input type="hidden" name="userId" value="userId" id="userId"
						required> <input type="hidden" value="" id="issueId"
						name="issueId">
					<button type="button" id="btnAdd" class="btn btn-success"
						onclick="location.href='loadAddIssue'" style="margin-left: 10px;">Issue Request</button>
					<button type="button" id="btnEdit" class="btn btn-primary" style="margin-left: 10px;">Save</button>
					<button type="button" id="btnCancel" class="btn btn-info" style="margin-left: 10px;">Cancel</button>
				</div>
			</form>
		</div>
		</fieldset>

		<div id="searchTable">
			<div class="form-horizontal form-group">
				<input type="text" placeholder="Search..."
					class="form-control col-xs-4" id="searchText" name="searchText"
					maxlength="5">
			</div>
			<table id="tableIssuance" class="table table-hover">
				<thead>
					<tr>
						<th class="th-lg">Issue ID</th>
						<th class="th-lg">Item Name</th>
						<th class="th-lg">Qty</th>
						<th class="th-lg">Requested By</th>
						<th class="th-lg">Department Name</th>
						<th class="th-lg">Issue Date</th>
						<th class="th-lg">Last Updated By</th>
						<th class="th-lg">Last Update</th>
					</tr>
				</thead>

				<c:forEach var="iss" items="${issuances}">

					<tr id="${iss.issueId}" onclick="selectRow(${iss.issueId})"
						onmouseover="hover(${iss.issueId})"
						onmouseout="hoverOut(${iss.issueId})" name="row">
						<td>${iss.issueId}</td>
						<td><label hidden>${iss.supplyId}</label>${iss.supply.itemName}</td>
						<td>${iss.quantity}</td>
						<td>${iss.requestor}</td>
						<td><label hidden>${iss.deptId}</label>${iss.department.departmentName}</td>
						<td><fmt:formatDate value="${iss.date}" pattern="MM/dd/yyy" /></td>
						<td>${iss.lastUser}</td>
						<td><fmt:formatDate value="${iss.lastUpdate}"
								pattern="MM/dd/yyy" /></td>
					</tr>

				</c:forEach>

			</table>
		</div>

		<span id="msg"></span>
	</div>
</body>
<jsp:include page="includes/footer.jsp">
	<jsp:param value="" name="" />
</jsp:include>
<script type="text/javascript">
		function editIssuance() {
			if($F("quantity") == ""  || $F("requestor") == "" || $F("issueDate") == ""){
				swal({
					title: "Validation Error",
					icon: "error",
					text: "Please fill in the required fields."
				})
			}else if(isNaN($F("quantity"))){
				swal({
					title: "Validation Error",
					icon: "error",
					text: "Quantity entered is not a number."
				})
			} else {
				new Ajax.Request(contextPath + "/updateIssue", {
					method : "POST",
					parameters : {
						issueId : $F("issueId"),
						itemName : $F("itemName"),
						quantity : $F("quantity"),
						requestor : $F("requestor"),
						departmentName : $F("departmentName"),
						issueDate : $F("issueDate"),
						userId : $F("userId")
					},
					onComplete : function(response) {
						var resp = response.responseText;
						var jsonResponse = eval( "(" + resp + ")");
						var isSuccess = jsonResponse.updateStatus === 1;
						
						swal({
							title: isSuccess ? 'Request Success' : 'Request Error',
							icon: isSuccess ? 'success' : 'error',
							text: jsonResponse.updateMessage
						}).then(function() {
							if(isSuccess) {
								window.location.replace('issue');
							}
						});
					}
				});
			}
		}
		
		 $("searchText").observe("keypress", function(event){			
			var charCode = (event.which) ? event.which : event.keyCode;
			
			if( charCode == Event.KEY_RETURN  || charCode == Event.KEY_RETURN ){
				window.location.replace("issue?filter=" + $F("searchText"));
	        } else if (numberOnly(charCode)) {
	        	return true;
	        }
			
			event.preventDefault();
		});
		 
		 
		$("quantity").observe("keypress", function(event){			
			var charCode = (event.which) ? event.which : event.keyCode;
			if (numberOnly(charCode)) {
	        	return true;
	        }
			event.preventDefault();
		});
		
		$("requestor").observe("keypress", function(event){			
			var charCode = (event.which) ? event.which : event.keyCode;
			console.log(charCode);
			if (alphaOnly(charCode)) {
	        	return true;
	        }
			event.preventDefault();
		});
		
		
		$("btnCancel").observe("click", function(){clearFields()});
		$("btnEdit").observe("click", function() {
			editIssuance()
		});

	</script>


</html>