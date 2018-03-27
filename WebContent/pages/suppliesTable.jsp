<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="stylesheet" type="text/css" href="css/suppliesStyle.css">
<script type="text/javascript" src="js/prototype.js" ></script>
<script src="js/suppliesFunctions.js"></script>
<script src="js/sweetalert.min.js"></script>
<script src="js/functions.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
</head>
<body>
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
</body>
</html>
<script>

var rowSelected = "";

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
</script>