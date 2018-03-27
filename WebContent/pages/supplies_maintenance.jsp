<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplies Maintenance</title>
<link rel="stylesheet" type="text/css" href="css/suppliesStyle.css">
<script type="text/javascript" src="js/prototype.js" ></script>
<script src="js/suppliesFunctions.js"></script>
<script src="js/sweetalert.min.js"></script>
<script src="js/functions.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<%@ include file="../includes/header.jsp"%>
</head>
<body>
	<div id="mainContents" style="padding-top: 20px;">
	<div id="body" class="container-fluid panel-body">
		<table id="tabForm" style="width: 1200px; border: 1px solid #ffe6e6; padding: 15px; background-color: #b3d7ff; border-radius: 25px;" align="center">
			<tr>
				<td class="tdFormFields">
					<label class="textFieldsLabel">Supply Type</label><br/>
					<select id="supplyTypes" class="formFields" style="height: 35px;" disabled> 
						<c:forEach var="sup" items="${suppTypes}">
							<option value="${sup.typeName}" id="optSupplyType">${sup.typeName}</option>
						</c:forEach> 
					</select>
				</td>
				<td class="tdFormFields">
					<label class="textFieldsLabel">Entered Date</label><br/>
					<input type="date" id="txtEnteredDt" class="formFields" min="2000-01-01" disabled/>
				</td>
			</tr>
			<tr>
				<td class="tdFormFields">
					<label class="textFieldsLabel">Item Name<span style="color:#cc0000; font-weight: bold;">*</span></label><br/>
					<input type="text" id="txtItemName" class="formFields" maxlength="100"/>
				</td>
				<td class="tdFormFields">
					<label class="textFieldsLabel">Reordered Level</label>
					<input type="text" id="txtReorderLvl" class="formFields2"/>
					<label class="textFieldsLabel">Actual Count</label>
					<input type="text" id="txtActualCount" class="formFields2" disabled/>
				</td> 
			</tr>
			<tr>
				<td class="tdFormFields">
					<label class="textFieldsLabel">Item Unit<span style="color:#cc0000; font-weight: bold;">*</span></label><br/>
					<input type="text" id="txtItemUnit" class="formFields" maxlength="10"/>
				</td>
				<td rowspan="3" class="tdFormFields">
					<label class="textFieldsLabel">Remarks</label><br/>
					<textarea rows="3" cols="50" id="txtRemarks" class="formFields"></textarea>
				</td>
			</tr>
			<tr>
				<td class="tdFormFields">
					<label class="textFieldsLabel">Obsolete Tag</label>
					<input type="radio" name="obs_tag" value="Y" id="radioYes" class="textFieldsLabel">Yes
					<input type="radio" name="obs_tag" value="N" id="radioNo" checked="checked" class="textFieldsLabel">No
				</td>
			</tr>
			<tr>
				<td class="tdFormFields">
					<label class="textFieldsLabel">Location</label><br/>
					<input type="text" id="txtLocation" class="formFields" maxlength="100"/>
				</td>
			</tr>	
			<tr>
				<td width="100%" align="center" colspan="2" style="padding-top: 20px;">
					<input type="button" id="btAdd" value="Add New"/>
					<input type="button" id="btSave" value="Save"/>
					<input type="button" id="btCancel" value="Cancel"/>
	    		</td>
			</tr>
			<tr>
				<td width="100%" align="center" colspan="2" style="padding-top: 20px;"> 
					<label class="textFieldsLabel">Search</label>
					<input type="text" id="txtSearchId" class="formFields" placeholder="Enter supply ID..."/>
					<!-- <input type="button" id="btSearch" value="Search"/> -->
				</td>
			</tr>	
			<tr>
				<td width="100%" align="center" colspan="2" style="padding-top: 20px;"> 
				<div id="suppliesTab">
					<table id="tabSupplies" style="width: 1200px;">
						<tr class="rowSup">
							<th class="thTabSupplies" class="colSupId">Supply ID</th>
							<th class="thTabSupplies" class="colSupTyp">Supply Type</th>
							<th class="thTabSupplies" class="colItemNm">Item Name</th>
							<th class="thTabSupplies" class="colItemName">Item Unit</th>
							<th class="thTabSupplies" class="colObsTag">Obsolete Tag</th>
							<th class="thTabSupplies" class="colLocation">Location</th>
							<th class="thTabSupplies" class="colReLevel">Reorder Level</th>
							<th class="thTabSupplies" class="colActCnt">Actual Count</th>
							<th class="thTabSupplies" class="colRmks">Remarks</th>
							<th class="thTabSupplies" class="colEntDate">Entry Date</th>
							<th class="thTabSupplies" class="colLastUpBy">Last Updated By</th>
							<th class="thTabSupplies" class="colLastUpDt">Last Update</th>
						</tr>
						<c:forEach var="supp" items="${supplies}">
							<tr>
								<td class="colSupId" >${supp.supplyID}</td>
								<td class="colSupTyp">${supp.typeName}</td>
								<td class="colItemNm">${supp.itemName}</td>
								<td class="colItemName">${supp.itemUnit}</td>
								<td class="colObsTag">${supp.obsTag}</td>
								<td class="colLocation">${supp.location}</td>
								<td class="colReLevel">${supp.reorderLvl}</td>
								<td class="colActCnt">${supp.actCount}</td>
								<td class="colRmks">${supp.remarks}</td>
								<td class="colEntDate">${supp.dateAdded}</td>
								<td class="colLastUpBy">${supp.lastUser}</td>
								<td class="colLastUpDt">${supp.lastUpdate}</td>
							</tr>
						</c:forEach>
					</table>
					</div>
				</td>
			</tr>
		</table>
	</div></div>
</body>
</html>
<script>

	var rowSelected = "";
	$("btAdd").observe("click",function(){
		goToAddNewSupply();
	});
	
	$("btSave").observe("click",function(){
				
	 if (rowSelected == "") {
		swal({icon: "error",
			text:"No row has been selected!"});
		} else {
			if (validateReqFields()) {
				updateSupply();
				goToSuppliesMain();
			} else {
				swal({icon: "error",
					text:"Please fill out all the required fields!"});
			}
		}
	}); 

	$$("table#tabSupplies tr").each(function(row) {

		if (row.rowIndex > 0) {
			row.observe("mouseover", function() {
				row.addClassName("hover");
			});

			row.observe("mouseout", function() {
				row.removeClassName("hover");
			});

			row.observe("click", function() {
				rowSelected = row;
				whenSelectedRow(row);

			});
		}

	})

	$("txtSearchId").observe("keyup", function(event) {
		var searchTxt = $F("txtSearchId").replace(" ", "");
		// Cancel the default action, if needed
		event.preventDefault();
		// Number 13 is the "Enter" key on the keyboard
		if (event.keyCode === 13) {
			if (!searchTxt == null | !searchTxt == "") {

				if (!isNaN(searchTxt)) {
					searchSupplyId();
				}
			} else {
				goToSuppliesMain();
			}
		}
	});

	$("btCancel").observe("click", function() {
		//goToHome();
		checkIfHasChild();
	});


	$("txtReorderLvl").observe("keypress", function(event) {
		var charCode = (event.which) ? event.which : event.keyCode;

		if (numberOnly(charCode)) {
			return true;
		}

		event.preventDefault();
	});
</script>