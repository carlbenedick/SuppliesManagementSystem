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
	.tdFormFields{
		width: 50%;
	}
	
	.thTabSupplies{
		font-size: 12px;
		font-weight: normal;
		border: 1px solid;
	}
	
	#tabSupplies{
		border: 1px solid;
		border-spacing: none;
		border-collapse: collapse; 
		width: 100%;
	}
	
</style>
</head>
<body>
	<div id="mainContents" style="padding-top: 20px;">
		<table id="tabForm" style="width: 900; border: 1px solid #ffe6e6; padding: 15px; background-color: #b3d7ff" align="center">
			<tr>
				<td class="tdFormFields">
					<label>Supply Type</label>
					<select id="supplyTypes"> 
						<c:forEach var="sup" items="${suppTypes}">
							<option value="${sup.typeName}" id="optSupplyType">${sup.typeName}</option>
						</c:forEach>
					</select>
				</td>
				<td class="tdFormFields">
					<label>Entered Date</label>
					<input type="text" id="txtEnteredDt"/>
				</td>
			</tr>
			<tr>
				<td class="tdFormFields">
					<label>Item Name</label>
					<input type="text" id="txtItemName"/>
				</td>
				<td class="tdFormFields">
					<label>Reordered Level</label>
					<input type="text" id="txtReorderLvl"/>
					<label>Actual Count</label>
					<input type="text" id="txtActualCount"/>
				</td>
			</tr>
			<tr>
				<td class="tdFormFields">
					<label>Item Unit</label>
					<input type="text" id="txtItemUnit"/>
				</td>
				<td rowspan="3" class="tdFormFields">
					<label>Remarks</label>
					<textarea rows="3" cols="50" id="txtRemarks"></textarea>
				</td>
			</tr>
			<tr>
				<td class="tdFormFields">
					<label>Obsolete Tag</label>
					<input type="radio" name="obs_tag" value="Y" id="radioYes">Yes
					<input type="radio" name="obs_tag" value="N" id="radioNo" checked="checked">No
				</td>
			</tr>
			<tr>
				<td class="tdFormFields">
					<label>Location</label>
					<input type="text" id="txtLocation"/>
				</td>
			</tr>	
			<tr>
				<td width="100%" align="center" colspan="2" style="padding-top: 20px;">
					<input type="button" id="btSave" value="Save"/>
					<input type="button" id="btCancel" value="Cancel"/>
	    		</td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
	$("btCancel").observe("click",function(){
		goToSuppliesMain();
	});
	
	$("btSave").observe("click",function(){
		//alert($("supplyTypes").value);
		addNewSupplies();
		goToSuppliesMain();
	});
</script>