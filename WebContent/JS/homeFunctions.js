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
			window.location.replace('home');
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

 function userMaintenance() {
	new Ajax.Request(contextPath + "/maintenance", {
		method : "GET",
		parameters : {
			action : "maintain",
		},
		onComplete : function(response) {
			$("mainContents").update(response.responseText);
		}
	});
}

function updateProf() {
	new Ajax.Request(contextPath + "/updateProfile", {
		method : "GET",
		parameters : {
			action : "updateprof",
		},
		onComplete : function(response) {
			$("mainContents").update(response.responseText);
		}
	});
}