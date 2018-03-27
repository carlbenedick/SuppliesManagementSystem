<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplies Maintenance</title>
<link rel="stylesheet" type="text/css" href="css/suppliesStyle.css">
<script src="js/prototype.js"></script>
<script src="js/suppliesFunctions.js"></script>
<script src="js/sweetalert.min.js"></script>
<script src="js/functions.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
</head>
<body>
	<div id="mainContents" style="padding-top: 20px;" align="center">
		<table id="tabForm" style="width: 1200px; border: 1px solid #ffe6e6; padding: 15px; background-color: #b3d7ff; border-radius: 25px;" align="center">
			<tr>
				<td class="tdFormFields">
					<label class="textFieldsLabel">Supply Type<span style="color:#cc0000; font-weight: bold;">*</span></label><br/>
					<select id="supplyTypes" class="formFields" style="height: 35px;"> 
						<c:forEach var="sup" items="${suppTypes}">
							<option value="${sup.typeName}" id="optSupplyType">${sup.typeName}</option>
						</c:forEach> 
					</select>
				</td>
				<td class="tdFormFields">
					<label class="textFieldsLabel">Entered Date<span style="color:#cc0000; font-weight: bold;">*</span></label><br/>
					<input type="date" id="txtEnteredDt" class="formFields" min="2000-01-01"/>
				</td>
			</tr>
			<tr>
				<td class="tdFormFields">
					<label class="textFieldsLabel">Item Name <span style="color:#cc0000; font-weight: bold;">*</span></label><br/>
					<input type="text" id="txtItemName" class="formFields" maxlength="100"/>
				</td>
				<td class="tdFormFields">
					<label class="textFieldsLabel">Reordered Level</label>
					<input type="text" id="txtReorderLvl" class="formFields2"/>
					<label class="textFieldsLabel">Actual Count<span style="color:#cc0000; font-weight: bold;">*</span></label>
					<input type="text" id="txtActualCount" class="formFields2"/>
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
		 if(validateReqFields()){
			swal({title: "Success!",
				icon: "success",
				text:"New Supply has been added!"});
			addNewSupplies();
			goToSuppliesMain(); 
		}else{
			swal({title: "Validation Error",
					icon: "error",
					text:"Please fill out all the required fields!"});
		} 
	});
	
	$("txtActualCount").observe("keypress", function(event) {
		var charCode = (event.which) ? event.which : event.keyCode;

		if (numberOnly(charCode)) {
			return true;
		}

		event.preventDefault();
	});
	
	$("txtReorderLvl").observe("keypress", function(event) {
		var charCode = (event.which) ? event.which : event.keyCode;

		if (numberOnly(charCode)) {
			return true;
		}

		event.preventDefault();
	});


	/*set entered date
	 ** start */
	/* var enteredDate = new Date();
	var dt = enteredDate.getDate();
	var mth = enteredDate.getMonth();
	var year = enteredDate.getFullYear();
	var mthStr = "";
	mth++;
	
	if(mth < 10){
	mthStr = "0" + mth;
	}
	
	var enteredDt = (year + "-" + mthStr + "-" + dt);
	
	$("txtEnteredDt").setValue(enteredDt); */
	/* end */
</script>