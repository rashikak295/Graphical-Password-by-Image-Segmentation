<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>GPSI</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="assets/style.css" rel="stylesheet" type="text/css" />  
<link href="css/form1.css" rel="stylesheet" type="text/css" media="all" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

<script type="text/javascript">
       
        
        function validation()
					{
						var mobno=document.f1.phoneNo.value;
						if(isNaN(mobno) || mobno.length!=10)
						{
							alert("Enter 10digit mobile number!");
							return false;
						}
					}

        </script> 


</head>
<body>
<jsp:include page="commonRegisterHeader.jsp"></jsp:include>

 

<div class="container">
<div class="row">
  	<div class="col-md-6">
		<img class="img-responsive" src="image/registration-img.png" style="height=500px" width="500px" alt="">
		<img class="img-responsive" src="image/register-button-png-20.png" style="height=500px" width="500px" alt="">
	</div>
	
	<div class="col-md-6">
	<h4>HOD Registration: </h4>
	
    <%String register_msg=(String)request.getAttribute("error");
    	if(register_msg!=null)
    		out.println("<font color=red size=4px>"+register_msg+"</font>");
    	
    %>
        <form class="form-basic"  name="f1" method="post" enctype="multipart/form-data" action="GPSIHODServlet" onsubmit="return validation()">

            <div class="form-row">
                <label>
                    <span>UserName</span>
                    <input type="text" name="username" value="" required>
                </label>
            </div>


			<div class="form-row">
                <label>
                    <span>Address</span>
                    <textarea name="address"  type="text"  value="" required></textarea>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Contact No.</span>
                    <input type="text" name="phoneNo" value=""  maxlength="10"  title="Enter 10digit MobileNumber" required>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Qualification</span>
                    <input type="text" name="qualification" value=""  required>
                </label>
            </div>
            
             <div class="form-row">
                <label>
                    <span>Research Interest</span>
                    <input type="text" name="researchInterest" value=""  required>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Email Id</span>
                    <input type="email" name="emailId" value=""  required>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Department Name</span>
                   <!--  <input type="text" name="deptName" value=""  required> -->
                    <select name="deptName" required>
                    	<!-- <option value="null">------Select-------</option> -->
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
                    <span>Rows <img src="images/tooltip1.png" title="Select the Rows to set the password"  style="width: 20px; height: 20px;"/></span>
                    <!-- <input type="text" name="rows" value=""  required> -->
                    <select name="rows" required>
                    	<!-- <option value="null">------Select-------</option> -->
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                    </select>
                </label>
            </div>
            
            
            <div class="form-row">
                <label>
                    <span>Column <img src="images/tooltip1.png" title="Select the Columns to set the password"  style="width: 20px; height: 20px;"/></span>
                    <!-- <input type="text" name="cols" value=""  required> -->
                    <select name="cols" required>
                    	<!-- <option value="null">------Select-------</option> -->
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                    </select>
                </label>
            </div>
            
         	<div class="form-row">
                <label>
                    <span>Shuffle <img src="images/tooltip1.png" title="Do you want to shuffle image while Login"  style="width: 20px; height: 20px;"/></span>
                   <!--  <input type="text" name="cols" value=""  required> -->
                    <select name="shuffleImage" required>
                    <!-- 	<option value="null">------Select-------</option> -->
                        <option value="yes">yes</option>
                        <option value="no">no</option>
                    </select>
                </label>
            </div>
            
            
         	<div class="form-row">
                <label>
                    <span>Photo</span>
                    <input type="file" name="image" value="" style="float: right;" required>
                </label>
            </div>
               
            
            <div class="form-row">
                <center><button type="submit" value="Save" name="btnSave">Save</button></center>
            </div>

        </form>
      </div>
      
</div>
</div>
<br></br>
<jsp:include page="commonFooter.jsp"></jsp:include>
</body>
</html>

