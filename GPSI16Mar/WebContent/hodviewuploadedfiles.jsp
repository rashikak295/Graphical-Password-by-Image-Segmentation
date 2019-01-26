<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Form</title>

<link href="assets/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
 <link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  
  <link href="tabCss/style3.css" rel="stylesheet" type="text/css"/>
<script src="tabCss/tab.js" type="text/javascript"></script>
   <script type="text/javascript">


	$(document).ready(function() {
	    
		var tab = "teacherFiles";
	    document.getElementById(tab).style.display = "none";
			    
	});
	

		function opentab(evt, tabs) {
    	var i, tabcontent, tablinks;
    	tabcontent = document.getElementsByClassName("tabcontent");
    	for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    	}
    	tablinks = document.getElementsByClassName("tablinks");
    	for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    	}
    	document.getElementById(tabs).style.display = "block";
    	evt.currentTarget.className += " active";
		}
		document.getElementById("defaultOpen").click();
	
	</script>


<style type="text/css">
        
			body {
					background-color: #;
					margin: 0px;
					padding: 0px;
			}
			
			.bs-example{
				width: 400px;
			} 
	
			tr:nth-child(even) {
		    	background-color: #dddddd;
			}


			td {
				font: monospace;
				font-size: medium;
			}
	
		.row {
				margin: 50px;
		}
		
	 </style>
  

</head>

<body>
<jsp:include page="hodNavbar.jsp"></jsp:include>
<br></br><br></br><br></br> 
   
	<div id="main">
    	<div id="head">
         <ul class="tab ui-widget-header">
  			<li><a href="javascript:void(0)" id="defaultopen" class="tablinks" onclick="opentab(event, 'form')">Student Files</a></li>
  			<li><a href="javascript:void(0)" class="tablinks" onclick="opentab(event, 'teacherFiles')">Teacher Files</a></li>
		</ul>
                
        <div id="form" class="tabcontent">
   					 <div class="container bs-example"> 
				<table class="table table-hover table-striped table-bordered table-info" style="height: 100%;">
					<thead style="background-color: #8ED2C9;">
						 <tr>
						 	<th>Student Name</th>
							<th>File Name</th>
							<th>Uploaded By</th>
							<th>Download File</th>
						</tr> 
					</thead>


					<tbody>
					<c:forEach items="${studentFilesList}" var="fileList"> 
					
							<tr>
								<td>${fileList.studentUsername}</td>
								<td>${fileList.uploadFile}</td>
								<td>${fileList.userType}</td>
								<td><a href="UploadDownloadFileServlet?fileName=${fileList.uploadFilePath}">Download</a></td>
							</tr>
					</c:forEach> 

					</tbody>
				</table>
   		 </div>
        </div>
        
        
        <br>
        <div id="teacherFiles" class="tabcontent">
   					 <div class="container bs-example"> 
				<table class="table table-hover table-striped table-bordered table-info" style="height: 100%;">
					<thead style="background-color: #8ED2C9;">
						 <tr>
						 	<th>Teacher Name</th>
							<th>File Name</th>
							<th>Uploaded By</th>
							<th>Download File</th>
						</tr> 
					</thead>


					<tbody>
					<c:forEach items="${teacherFilesList}" var="teachersfile"> 
					
							<tr>
								<td>${teachersfile.teacherUsername}</td>
								<td>${teachersfile.uploadFile}</td>
								<td>${teachersfile.userType}</td>
								<td><a href="UploadDownloadFileServlet?fileName=${teachersfile.uploadFilePath}">Download</a></td>
							</tr>
					</c:forEach> 

					</tbody>
				</table>
    			</div>
        </div>
        
  
        </div>	       
	</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>	
<jsp:include page="commonFooter.jsp"></jsp:include>
</body>
</html>
