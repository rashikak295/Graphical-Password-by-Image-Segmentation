<%@page import="com.image.pojo.GPSIRegistrationTeacherPojo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Form</title>

<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
<link href="tabCss/style2.css" rel="stylesheet" type="text/css"/>
<script src="tabCss/tab.js" type="text/javascript"></script>
   <script type="text/javascript">


	$(document).ready(function() {
		
		var tab1 = "approvedFiles";
		document.getElementById(tab1).style.display = "none";	    
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

<script>
function myFunction() {
    alert("Request Sent to Teacher");
}
</script>


<style type="text/css">
        
			body {
					background-color: #;
					margin: 0px;
					padding: 0px;
			}
			
			
			/* html {
    			display: block;
			} */
			header{
				height:60px;
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
  

 <link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
<jsp:include page="studentNavbar.jsp" ></jsp:include>
   
   
	<div id="main">
    	<div id="head">
         <ul class="tab ui-widget-header">
  			<li><a href="javascript:void(0)" id="defaultopen" class="tablinks" onclick="opentab(event, 'form')">Teacher Files</a></li>
  			<li><a href="javascript:void(0)" class="tablinks" onclick="opentab(event, 'approvedFiles')">Approved Files</a></li>
		</ul>
                
        <div id="form" class="tabcontent">
       	
       	 <div class="container bs-example"> 

				<table class="table table-hover table-striped table-bordered table-info">
					<thead style="background-color: #8ED2C9;">
						 <tr>
						 	<th>Teacher Name</th>
							<th>File Name</th>
							<th>Uploaded By</th>
							<th>Status</th>
						</tr> 
					</thead>


					<tbody>
					<c:forEach items="${teacherFilesList}" var="fileList"> 
					
							<tr>
								<td>${fileList.teacherUsername}</td>
								<td>${fileList.uploadFile}</td>
								<td>${fileList.userType}</td>
								
	<c:choose>
  <c:when test="${studentId == fileList.teacherId}">
  	<td><a href="StudentLoginServlet?action=RequestedFiles&filename=${fileList.uploadFile}&fileId=${fileList.uploadId}&owner_id=${fileList.teacherId}" class="btn btn-primary" onclick="myFunction()">Request</a></td>
  </c:when>
  <c:otherwise>
     <td><a href="UploadDownloadFileServlet?fileName=${fileList.uploadFilePath}">Download</a></td>
  </c:otherwise>
  </c:choose>							
								
								
								
							</tr>
					</c:forEach> 

					</tbody>
				</table>
		</div>
        </div>
        
        
        
  
  <br>
  			<div id="approvedFiles" class="tabcontent">
  				<div class="container bs-example"> 
				<table class="table table-hover table-striped table-bordered table-info">
					<thead style="background-color: #8ED2C9;">
						 <tr>
							<th>File Name</th>
							<th>Status</th>
						</tr> 
					</thead>


		
	
					<c:forEach items="${teacherapprovedFilesList}" var="approvedfile"> 
					<tbody>
						<tr>
								<td>${approvedfile.file_name}</td>								

    				<td><a href="UploadDownloadFileServlet?fileName=${approvedfile.upload_url}">Download</a></td> 

						</tr>
			
					</tbody>
					</c:forEach>  
				</table>

    			</div>
        	</div>
      
        </div>	       
	</div>
	
<jsp:include page="commonFooter.jsp"></jsp:include>
</body>
</html>
