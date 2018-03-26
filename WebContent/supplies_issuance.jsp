<%@page import="java.util.logging.SimpleFormatter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*, javax.servlet.*,java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/sweetalert.min.js"></script>
<script src="js/prototype.js"></script>
<script src="js/functions.js"></script>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
</script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="css/issuestyles.css" /> -->

<jsp:include page="includes/header.jsp">
		<jsp:param value="" name=""/>
		</jsp:include>
<title>Add Issuance</title>
</head>
<body>
	<div id="body" class="container">
		<h3>Issue Supplies</h3>

		<div id="form">
		<form>
					<div class="form-group">
						<label for="itemName">Item Name: </label> 
						<select class="form-control" name="itemName" id="itemName" required>
							<!-- Loop for item name -->
							<c:forEach var="supply" items="${supplies}">
								<option value="${supply.supplyID}" selected><c:out
									value="${supply.itemName}" /></option>
							</c:forEach>
							<!-- End of Loop -->
						</select>
					</div>
			 <div class="form-group">
						<label for="quantity">Quantity: </label>
						<input type="text" class="form-control" name="quantity" id="quantity" required />
					</div>
				
					<div class="form-group">
						<label for="requestor">Requested By: </label> 
						<input type="text" class="form-control" name="requestor" id="requestor" required />
					</div>
				
					<div class="form-group">
						<label for="departmentName">Item Name: </label> 
						<select class="form-control" name="departmentName" id="departmentName" required>
							<!-- Loop for item name -->
							<c:forEach var="department" items="${departments}">
								<option value="${department.departmentId}" selected><c:out
									value="${department.departmentName}" /></option>
							</c:forEach>
							<!-- End of Loop -->
						</select>
					</div>

					<div class="form-group">
						<label for="issueDate">Issue Date: </label> 
						<input type="date" class="form-control" name="issueDate" id="issueDate" required />
					</div>

			<!-- Session userID attribute value -->
			
			<div class="form-group">
						<!-- Session userID attribute value -->
						<input type="hidden" name="userId" value="userId" id="userId" required >
						<input type="hidden" value="" id="issueId" name="issueId"> 
						<button type="button" id="btnAdd" class="btn btn-primary">Save</button>
						<button type="button" id="btnCancel" class="btn btn-primary">Cancel</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function addIssuance() {
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
		}else{
		new Ajax.Request(contextPath + "/addIssue", {
			method : "POST",
			parameters : {
				supplyId : $F("itemName"),
				quantity : $F("quantity"),
				requestor : $F("requestor"),
				deptId : $F("departmentName"),
				issueDate : $F("issueDate"),
				lastUser : $F("userId")
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

	$("quantity").observe("keypress", function(event){			
		var charCode = (event.which) ? event.which : event.keyCode;
		
		if (numberOnly(charCode)) {
        	return true;
        }
		
		event.preventDefault();
	});
	
	$("requestor").observe("keypress", function(event){			
		var charCode = (event.which) ? event.which : event.keyCode;
		if (alphaOnly(charCode)) {
        	return true;
        }
		event.preventDefault();
	});

	$("btnCancel").observe("click", function() {
		$("quantity").value = "";
		$("requestor").value = "";
		$("issueDate").value = "";
	});
	$("btnAdd").observe("click", function() {
		addIssuance()
	});
</script>
</html>