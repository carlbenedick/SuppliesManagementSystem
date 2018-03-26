/**
 * 
 */

function goHome() {

	new Ajax.Request(contextPath + "/index", {
		method : "get",
		parameters : {
			action : "goHome"

		},
		onComplete : function(response) {
			$("mainContents").update(response.responseText);
		}
	});
}

function logOut() {

	new Ajax.Request(contextPath + "/index", {
		method : "get",
		parameters : {
			action : "logOut"

		},
		onComplete : function(response) {
			$("mainContents").update(response.responseText);
		}
	});
}

function goMainte() {

	new Ajax.Request(contextPath + "/index", {
		method : "get",
		parameters : {
			action : "goMainte"

		},
		onComplete : function(response) {
			$("mainContents").update(response.responseText);
		}
	});
}

function goIssue() {

	new Ajax.Request(contextPath + "/index", {
		method : "get",
		parameters : {
			action : "goIssue"

		},
		onComplete : function(response) {
			$("mainContents").update(response.responseText);
		}
	});
}