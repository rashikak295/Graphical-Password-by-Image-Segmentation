<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>GPSI</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="assets/style.css" rel="stylesheet" type="text/css" />  
<link href="css/form1.css" rel="stylesheet" type="text/css" media="all" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery-ui.js"></script>
 
 <!--  
 <script type="text/javascript">
		
 					 $(document).ready(function(){
 						//alert("ok");
 						$("#StartDate, #EndDate").datepicker();
						$("#EndDate").change(function () {
						    var startDate = document.getElementById("StartDate").value;
						    var endDate = document.getElementById("EndDate").value;

						    if ((Date.parse(startDate) >= Date.parse(endDate))) {
						        alert("End date should be greater than Start date");
						        document.getElementById("EndDate").value = "";
						    }
						});
 					 });
				
								 

					function validation()
					{
						var mobno=document.f1.phoneNo.value;
						if(isNaN(mobno) || mobno.length!=10)
						{
							alert("Enter 10digit mobile number!");
							return false;
						}


						var rollno=document.f1.rollNo.value;
						if(isNaN(rollno) || rollno.length!=6)
						{
							alert("Enter 6digit roll number!");
							return false;
						}	
					}			
</script>  -->
</head>



<body>
<jsp:include page="studentNavbar.jsp"></jsp:include>


<div class="container">
<div class="row">
	<div class="col-md-6">
		<img class="img-responsive" src="image/registration-img.png" style="height=500px" width="500px" alt="">
		<img class="img-responsive" src="image/register-button-png-20.png" style="height=500px" width="500px" alt="">
	</div>
	 <!-- <div class="clear"></div>
	<div class="col-md-1"></div> -->
	<div class="col-md-6">
<!-- 	<h4>Student Registration: </h4> -->
<%-- 	
			 <%String register_msg=(String)request.getAttribute("error");
    	if(register_msg!=null)
    		out.println("<font color=red size=4px>"+register_msg+"</font>");
    %> --%>
	   	<c:forEach items="${registerList}" var="editList"> 
        <form class="form-basic" name="f1" method="get" enctype="multipart/form-data" action="StudentLoginServlet">
		
	


            <div class="form-row">
                <label>
                    <span>UserName</span>
                    <input type="text" name="username" value="${editList.username}" readonly="readonly">
                </label>
            </div>


			<div class="form-row">
                <label>
                    <span>Address</span>
                    <textarea name="address"  type="text"  value="${editList.address}" readonly="readonly">${editList.address}</textarea>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Contact No.</span>
                    <input type="text" name="phoneNo" value="${editList.phoneNo}" readonly="readonly">
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Roll No.</span>
                    <input type="text" name="rollNo" value="${editList.rollNo}"  readonly="readonly">
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Email Id</span>
                    <input type="email" name="emailId" value="${editList.emailId}" readonly="readonly">
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Department Name</span>
                    <!-- <input type="text" name="deptName" value=""  required> -->
                    <select name="deptName" readonly="readonly">
                    	<!-- <option value="null">------Select-------</option> -->
                        <option value="${editList.deptName}">${editList.deptName}</option>
                       <!--  <option value="COMPS">COMPS</option>
                        <option value="EXTC">EXTC</option>
                        <option value="ELECTRICAL">ELECTRICAL</option>
                        <option value="MECHANICAL">MECHANICAL</option> -->
                    </select>
                </label>
            </div>
            
               
            <div class="form-row">
                <label>
                    <span>Semester</span>
                    <select name="semester">
                    	<option value="${editList.semesterWise}">${editList.semesterWise}</option>
                        <option value="1st">1st Semester</option>
                        <option value="2nd">2nd Semester</option>
                        <option value="3rd">3rd Semester</option>
                        <option value="4th">4th Semester</option>
                        <option value="5th">5th Semester</option>
                        <option value="6th">6th Semester</option>
                        <option value="7th">7th Semester</option>
                        <option value="8th">8th Semester</option>
                    </select>
                </label>
            </div> 
            
             <div class="form-row">
                <label>
                    <span>Year of Joining</span>
                    <input type="text" name="yearOfJoining" id="StartDate" value="${editList.yearOfJoining}"  readonly="readonly">
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Year of Completion</span>
                    <input type="text" name="yearOfCompletion" id="EndDate" value="${editList.yearOfCompletion}"  readonly="readonly">
                </label>
            </div>
			
            
			<!-- <div class="form-row">
                <label>
                    <span>Rows <img src="images/tooltip1.png" title="Select the Rows to set the password"  style="width: 20px; height: 20px;"/></span>
                    <input type="text" name="rows" value=""  required>
                    <select name="rows" required>
                    	<option value="null">------Select-------</option>
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
                    <input type="text" name="cols" value=""  required>
                    <select name="cols" required>
                    	<option value="null">------Select-------</option>
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
                    <input type="text" name="cols" value=""  required>
                    <select name="shuffleImage" required>
                    	<option value="null">------Select-------</option>
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
            </div> -->
       
            
            <div class="form-row">
                <center><button type="submit" value="UpdateProfile" name="action">Update Profile</button></center>
            </div>

        </form>
        
        </c:forEach>
	</div>
	
</div>
</div>
<br></br>
<jsp:include page="commonFooter.jsp"></jsp:include>
</body>
</html>
