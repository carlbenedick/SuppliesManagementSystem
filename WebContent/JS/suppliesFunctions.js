/**
 * 
 */
	var lastSelectedRow = "";
	var selectedRow ="";
function goToAddNewSupply() {
	try {
		new Ajax.Request(contextPath + "/supplies", {
			method : "GET",
			parameters : {
				action : "goToAddNewSupplies"
			},
			onComplete : function(response) {
				$("mainContents").update(response.responseText);
			}
		});
	} catch (e) {
		alert(e.toString());
	}
}

function cancel() {
	try {
		new Ajax.Request(contextPath + "/supplies", {
			method : "GET",
			parameters : {
				action : "cancel"
			},
			onComplete : function(response) {
				$("mainContents").update(response.responseText);
			}
		});
	} catch (e) {
		alert(e.toString());
	}
}

function goToSuppliesMain(){
	try {
		new Ajax.Request(contextPath + "/supplies", {
			method : "GET",
			parameters : {
				action : "suppliesMaintenance",
				supplyID : null
			},
			onComplete : function(response) {
				$("mainContents").update(response.responseText);
			}
		});
	} catch (e) {
		alert(e.toString());
	}
}

function addNewSupplies(){
	try {
		var obs_tag;
		
		if($("radioYes").checked)
			obs_tag = 'Y';
		if($("radioNo").checked)
			obs_tag = 'N';
		
		new Ajax.Request(contextPath + "/supplies", {
			method : "GET",
			parameters : {
				action : "addNewSupplies",
				supply_type_name : $("supplyTypes").value,
				item_name: $F("txtItemName"),
				item_unit: $F("txtItemUnit"),
				obsolete_tag: obs_tag,
				location: $F("txtLocation"),
				reorder_level: $F("txtReorderLvl"),
				actual_count: $F("txtActualCount"),
				remarks: $F("txtRemarks"),
				entered_dt: $F("txtEnteredDt")
			},
			onComplete : function(response) {
				$("mainContents").update(response.responseText);
			}
		});
	} catch (e) {
		alert(e.message);
	}
}

function whenSelectedRow(row){
	
	var table = $('tabSupplies');
	
	$('supplyTypes').setValue(row.down("td", 1).innerHTML);
	$('txtItemName').setValue(row.down("td", 2).innerHTML);
	$('txtItemUnit').setValue(row.down("td", 3).innerHTML);
	
	if (row.down("td", 4).innerHTML == 'Y')
	 	$("radioYes").checked = true;
 	if (row.down("td", 4).innerHTML == 'N')
		$("radioNo").checked = true;
	
	$('txtLocation').setValue(row.down("td", 5).innerHTML);
	$('txtReorderLvl').setValue(row.down("td", 6).innerHTML);
	$('txtActualCount').setValue(row.down("td", 7).innerHTML);
	$('txtRemarks').setValue(row.down("td", 8).innerHTML);
	$('txtEnteredDt').setValue(row.down("td", 9).innerHTML);  
	
	selectedRow = row.rowIndex;
	
	//to put/remove highlight selected/unselected row
	 	if (lastSelectedRow == "") {
			table.rows[selectedRow].addClassName('rowClick');
		} else {
			if (selectedRow != lastSelectedRow) {
				table.rows[lastSelectedRow].removeClassName('rowClick');

				table.rows[selectedRow].addClassName('rowClick');
			}else{
				table.rows[selectedRow].removeClassName('rowClick');
				
			}
		}

		lastSelectedRow = selectedRow; 
}

function updateSupply(){
	var table = $('tabSupplies');
	if(selectedRow != ""){
		alert(selectedRow);
		alert(table.rows[selectedRow].down("td",0).innerHTML);
		
		var obs_tag = '';
		
		if($("radioYes").checked)
			obs_tag = 'Y';
		if($("radioNo").checked)
			obs_tag = 'N';
		
		
		new Ajax.Request(contextPath + "/supplies", {
			method : "GET",
			parameters : {
				action : "updateSupply",
				supply_ID : table.rows[selectedRow].down("td",0).innerHTML,
				item_name: $F("txtItemName"),
				item_unit: $F("txtItemUnit"),
				obsolete_tag: obs_tag,
				location: $F("txtLocation"),
				reorder_level: $F("txtReorderLvl"),
				remarks: $F("txtRemarks")
			},
			onComplete : function(response) {
				$("mainContents").update(response.responseText);
			}
		});
		
	}else{
		alert('null');
	}
}

function searchSupplyId(){
	try {
		new Ajax.Request(contextPath + "/supplies", {
			method : "GET",
			parameters : {
				action : "searchSupply",
				supplyID : $F("txtSearchId")
			},
			onComplete : function(response) {
				$("mainContents").update(response.responseText);
			}
		});
	} catch (e) {
		alert(e.toString());
	}
}