<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>GPSI</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="assets/style.css" rel="stylesheet" type="text/css" />  
<link href="css/form2.css" rel="stylesheet" type="text/css" media="all" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>



</head>
<body>
<jsp:include page="teacherNavbar.jsp" ></jsp:include>
 

<div class="container">
<div class="row">
  	 <div class="col-md-1">
		<!-- <img class="img-responsive" src="image/registration-img.png" style="height=500px" width="500px" alt="">
		<img class="img-responsive" src="image/register-button-png-20.png" style="height=500px" width="500px" alt=""> -->
	</div> 
	
	<div class="col-md-11">
<%-- 
    <%String register_msg=(String)request.getAttribute("error");
    	if(register_msg!=null)
    		out.println("<font color=red size=4px>"+register_msg+"</font>");
    	
    %> --%>
        <form class="form-basic" action="TeacherPublicUploadServlet" method="post" enctype="multipart/form-data">

            <div class="form-row">
                <label>
                    <span>Enter who can view the files: </span>
                    <select name="userType" required>
                        <option value="Student">Student</option>
                        <option value="Faculty">Faculty</option>
                        <option value="HOD">HOD</option>
                    </select>
                </label>
            </div>

   
            
            
            <div class="form-row">
                <label>
                    <span>Enter the Department Name: </span>
                   <!--  <input type="text" name="deptName" value=""  required> -->
                    <select name="deptName" required>
                        <option value="IT">IT</option>
                        <option value="COMPS">COMPS</option>
                        <option value="EXTC">EXTC</option>
                        <option value="ELECTRICAL">ELECTRICAL</option>
                        <option value="MECHANICAL">MECHANICAL</option>
                    </select>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Enter Student Semester: </span>
                    <select name="semester" required>
                        <option value="1st">1st Semester</option>
                        <option value="2nd">2nd Semester</option>
                        <option value="3rd">3rd Semester</option>
                        <option value="4th">4th Semester</option>
                        <option value="5th">5th Semester</option>
                        <option value="6th">6th Semester</option>
                        <option value="7th">7th Semester</option>
                        <option value="8th">8th Semester</option>
                        <option value="NA">NA</option>

                    </select>
                </label>
            </div> 
            
            
         	<div class="form-row">
                <label>
                    <span>Upload the data you want to publish: </span>
                    <input type="file" name="photo" value="" style="float: right;" required>
                </label>
            </div>
               
            
            <div class="form-row">
                <center><button type="submit" value="Submit">Submit</button></center>
            </div>

        </form>
      </div>
      
</div>
</div>
<br></br><br></br></br>
<div id="footer"> 
</div>
</body>
</html>

