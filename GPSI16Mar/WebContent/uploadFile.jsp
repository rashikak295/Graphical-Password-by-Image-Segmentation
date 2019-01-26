<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload</title>
</head>
<body>
	<!-- <h1>Upload any image to mysql DB</h1> -->
	<form method="post" action="FileServlet"
		enctype="multipart/form-data">
		<table>
			<!-- <tr>
				<td>First Name:</td>
				<td><input type="text" name="firstName" size="10"
					required="required" /></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lastName" size="10"
					required="required" /></td>
			</tr> -->
			<tr>
				<td>Choose File:</td>
				<td><input type="file" name="photo" size="10"
					required="required" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit"></td>
				<td><input type="reset" value="Clear" /></td>
			</tr>
		</table>
	</form>
</body>
</html>