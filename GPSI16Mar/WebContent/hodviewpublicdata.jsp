<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE  html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>GPSI</title>
  <meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
 <link href="assets/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<style type="text/css">

			
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
<jsp:include page="hodNavbar.jsp"></jsp:include>


  <div class="container">
  <div class="row">
<!--  <div class=" col-md-5">
 <div>
 		<br>
        &nbsp; --><!-- <img class="img-responsive" src="image/upload.jpg" alt="">
        <div class="overlay">
        </div>
</div>
    </div> -->
	
	<div class=" col-md-10">

    <div class="container bs-example"> 
<!-- <br> -->
				<table class="table table-hover table-striped table-bordered table-info">
					<thead style="background-color: #8ED2C9;">
						 <tr>
							<th>Uploaded By</th>
							<th>Download File</th>
						</tr> 
					</thead>


					<tbody>
					<c:forEach items="${publicuploadList}" var="files"> 
					
							<tr>
								<td>${files.uploaded_by}</td>
							  	<td><a href="DownloadFileServlet?fileName=${files.upload_file}">Download</a></td>
							</tr>
					</c:forEach> 

					</tbody>
				</table>

    </div>

 </div> 
	

 

</div>
</div><br>



<br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="commonFooter.jsp"></jsp:include>	
</body>
</html>

