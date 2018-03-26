function selectRow(id){	
	
	var dateArr = $("" + id + "").down('td', 5).innerHTML.split('/');;
	var date = dateArr[2] + "-" + dateArr[0] + "-" + dateArr[1];
	
	$("issueId").value = $("" + id + "").down('td', 0).innerHTML;
	$("itemName").value = $("" + id + "").down('td', 1).down('label', 0).innerHTML;
	$("quantity").value = $("" + id + "").down('td', 2).innerHTML;
	$("requestor").value = $("" + id + "").down('td', 3).innerHTML;
	$("issueDate").value = date;
	$("departmentName").value = $("" + id + "").down('td', 4).down('label', 0).innerHTML;
	
	if($("" + id + "").hasClassName("selected")){
		$("" + id + "").removeClassName("selected");
		$("issueId").value = "";
		$("quantity").value = "";
		$("requestor").value = "";
		$("issueDate").value = "";
	}else{
		$("" + id + "").addClassName("selected");
	}
	
	
	
	$$("table#tableIssuance tr[name='row']").each(function(c) {
		if (c.id != id) {
			$("" + c.id + "").removeClassName("selected");
		}
	})
	
}


function hover(id){
	
		$("" + id + "").style.background = "#aeaeae";
		$("" + id + "").style.color = "#0F52BA";
	
}

function hoverOut(id){
	
		$("" + id + "").style.background = "#ebebeb";
		$("" + id + "").style.color = "black";
	
}

function clearFields(){
	$$("table#tableIssuance tr[name='row']").each(function(c) {
		$("" + c.id + "").removeClassName("selected");
	});
	
	$("issueId").value = "";
	$("quantity").value = "";
	$("requestor").value = "";
	$("issueDate").value = "";
}

function numberOnly(charCode){
	if ((charCode > 47 && charCode < 58) || charCode == 8 || charCode == 9 || charCode == 17) {
    	return true;
    }	
	return false;
}

function alphaOnly(charCode){
	if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 9 || charCode == 46 || charCode == 45) {
    	return true;
    }
	return false;
}

