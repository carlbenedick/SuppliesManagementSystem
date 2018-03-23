<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplies Maintenance</title>
</head>
<body>
	<div id="mainContents">
		<table id="tabForm">
			<tr>
				<td>
					<label>Supply Type</label>
					<select>
						<option></option>
					</select>
				</td>
				<td>
					<label>Entered Date</label>
					<input type="text"/>
				</td>
			</tr>
			<tr>
				<td>
					<label>Item Name</label>
					<input type="text"/>
				</td>
				<td>
					<label>Reordered Level</label>
					<input type="text"/>
					<label>Actual Count</label>
					<input type="text"/>
				</td>
			</tr>
			<tr>
				<td>
					<label>Item Unit</label>
					<input type="text"/>
				</td>
				<td rowspan="3">
					<label>Remarks</label>
					<textarea rows="3" cols="10"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<label>Obsolete Tag</label>
					<input type="radio" name="obs_tag" value="Yes">Yes
					<input type="radio" name="obs_tag" value="No" checked="checked">No
				</td>
			</tr>
			<tr>
				<td>
					<label>Location</label>
					<input type="text"/>
				</td>
			</tr>			
		</table>
	</div>
	
	
</body>
</html>