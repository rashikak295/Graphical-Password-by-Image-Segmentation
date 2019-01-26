<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="assets/style.css" rel="stylesheet" type="text/css" />  
<link href="css/form1.css" rel="stylesheet" type="text/css" media="all" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<title>GPSI</title>

</head>
<body>
<jsp:include page="aboutContactNavbar.jsp"></jsp:include>

<div class="container">
	<div class="row">
		<p style="font-family: monospace; font: 20px; color: black;">The Graphical Password by Segmentation of Image is a system segments the image like a grid, which has a maximum of 8 columns and 8 rows. 
		Then, each segment of the image is dragged in a particular sequence onto an empty grid of size 8x8 and placed on a particular segment of the empty grid, to form the user's password. 
		If the user chooses to shuffle the segments during registration, the image segments will be presented in a shuffled manner when the user logs into the system and the user needs to drag each segment of the image onto the same empty grid of size 8x8 in the correct sequence and position of the segments that user had specified during registration.  
		The GPSI is proposed with the aim to provide a system which gives strong authentication to the user and protects user data from unauthorized access. 
		</p>
		
			<center><img src="images/img.png"/></center>
		<br>
		<p style="font-family: monospace; font: 20px; color: black;">For example in the above image:
		The segments of an image (Which is segmented into 2*2 grid) are mapped onto 4 corresponding segments of an empty grid of 8*8. 
		This mapping of segments is done in a particular noted sequence. 
		Considering that every segment of the empty grid and the image is associated with a unique number, each segment number of the image is written besides the segment number of the empty grid segment on which it is mapped, in the mapping table.
		</p>
	</div>
</div>

<jsp:include page="commonFooter.jsp"></jsp:include>
</body>
</html>