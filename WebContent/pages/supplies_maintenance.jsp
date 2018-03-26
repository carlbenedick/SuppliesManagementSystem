<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplies Maintenance</title>
<script src="js/prototype.js"></script>
<script src="js/suppliesFunctions.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<style>
.tdFormFields {
	width: 50%;
}

.thTabSupplies {
	font-size: 12px;
	font-weight: normal;
	border: 1px solid;
}

#tabSupplies {
	border: 1px solid;
	border-spacing: none;
	border-collapse: collapse;
	width: 100%;
}

.hover {
	background-color: #adc7d3;
}

.rowClick {
	background-color: #5390ad;
}
</style>
</head>
<body>
	<div id="mainContents" style="padding-top: 20px;">
		<div id="header" style="background-color: #448cff;">
			<%@ include file="../header.jsp"%></div>
		<table id="tabForm"
			style="width: 900; border: 1px solid #ffe6e6; padding: 15px; background-color: #b3d7ff"
			align="center">
			<tr>
				<td class="tdFormFields"><label>Supply Type</label> <select
					id="supplyTypes">
						<c:forEach var="sup" items="${suppTypes}">
							<option value="${sup.typeName}" id="optSupplyType">${sup.typeName}</option>
						</c:forEach>
				</select></td>
				<td class="tdFormFields"><label>Entered Date</label> <input
					type="text" id="txtEnteredDt" /></td>
			</tr>
			<tr>
				<td class="tdFormFields"><label>Item Name</label> <input
					type="text" id="txtItemName" /></td>
				<td class="tdFormFields"><label>Reordered Level</label> <input
					type="text" id="txtReorderLvl" /> <label>Actual Count</label> <input
					type="text" id="txtActualCount" /></td>
			</tr>
			<tr>
				<td class="tdFormFields"><label>Item Unit</label> <input
					type="text" id="txtItemUnit" /></td>
				<td rowspan="3" class="tdFormFields"><label>Remarks</label> <textarea
						rows="3" cols="50" id="txtRemarks"></textarea></td>
			</tr>
			<tr>
				<td class="tdFormFields"><label>Obsolete Tag</label> <input
					type="radio" name="obs_tag" value="Y" id="radioYes">Yes <input
					type="radio" name="obs_tag" value="N" id="radioNo"
					checked="checked">No</td>
			</tr>
			<tr>
				<td class="tdFormFields"><label>Location</label> <input
					type="text" id="txtLocation" /></td>
			</tr>
			<tr>
				<td width="100%" align="center" colspan="2"
					style="padding-top: 20px;"><input type="button" id="btAdd"
					value="Add New" /> <input type="button" id="btSave" value="Save" />
					<input type="button" id="btCancel" value="Cancel" /></td>
			</tr>
			<tr>
				<td width="100%" align="center" colspan="2"
					style="padding-top: 20px;"><label>Search</label> <input
					type="text" id="txtSearchId" /> <!-- <input type="button" id="btSearch" value="Search"/> -->
				</td>
			</tr>
			<tr>
				<td width="100%" align="center" colspan="2"
					style="padding-top: 20px;">
					<table id="tabSupplies" style="width: 2000">
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
							<th class="thTabSupplies" class="colLastUpBy">Last Updated
								By</th>
							<th class="thTabSupplies" class="colLastUpDt">Last Update</th>
						</tr>
						<c:forEach var="supp" items="${supplies}">
							<tr>
								<td class="colSupId">${supp.supplyID}</td>
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
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
	$("btAdd").observe("click", function() {
		goToAddNewSupply();
	});

	$("btSave").observe("click", function() {
		updateSupply();
	});

	$$("table#tabSupplies tr").each(function(row) {

		row.observe("mouseover", function() {
			row.addClassName("hover");
		});

		row.observe("mouseout", function() {
			row.removeClassName("hover");
		});

		row.observe("click", function() {

			whenSelectedRow(row);

		});

	})

	$("txtSearchId").observe("blur", function() {

		if ($F("txtSearchId") == null | $F("txtSearchId") == "") {
			alert("search");
			goToSuppliesMain();

		} else {
			alert("hey " + $F("txtSearchId"));
			searchSupplyId();
		}
	});
</script>