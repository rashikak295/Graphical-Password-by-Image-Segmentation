<!DOCTYPE  html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>form</title>
  <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, 
    initial-scale=1, maximum-scale=1, user-scalable=no">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <script src="bootstrap/js/jquery.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <style type="text/css">
        
			body {
					background-color: #;
					margin: 0px;
					padding:0px;
			}
			header{
			height:60px;
			width:auto;
			}
        </style>
  

 <link href="css/form1.css" rel="stylesheet" type="text/css" media="all" />


</head>
<body>

<div class="container-fluid">


<header style="background-color:#3b5998;">

<div class="header-top">
		<div class="container header">
		<div class="row">
		<div class="col-md-3 latest">
		</div>
		<div class="col-md-9 latest">
		<div class="head-top">
			
		
		<ul>
					
					
						
						
		</ul>	
			
  
		
		
		
		
 </div> 
 </div>

 </div>
 </div> 
  </header>
 
   </div>				  
<div>
  <div class="container">
  <div class="row">
  <div class=" col-md-6">
 <div>
        <img class="img-responsive" src="images/registration-img.png" style="height=500px" width="500px" alt="">
		<img class="img-responsive" src="images/register-button-png-20.png" style="height=500px" width="500px" alt="">
        <div class="overlay">
        </div>
</div>
    </div>
	<div class=" col-md-6">

	<div></div> <br>
    <div> 
        <form class="form-basic" name="f1" method="post" enctype="multipart/form-data" action="GPSIStudentServlet">

            <div class="form-title-row">
                <h1>Register and Add Image In DB</h1>
            </div>

            <div class="form-row">
                <label>
                    <span>UserName</span>
                    <input type="text" name="username" value="" placeholder="Enter your full Name" required>
                </label>
            </div>


			<div class="form-row">
                <label>
                    <span>Address</span>
                    <textarea name="address"  type="text"  value=""></textarea>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Contact No.</span>
                    <input type="text" name="phoneNo" value=""  maxlength="10"  required>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Roll No.</span>
                    <input type="text" name="rollNo" value=""  maxlength="6" required>
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
                    <!-- <input type="text" name="deptName" value=""  required> -->
                    <select name="deptName" required>
                    	<option value="null">------Select-------</option>
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
                    <span>Year of Joining</span>
                    <input type="text" name="yearOfJoining" value=""  required>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Year of Completion</span>
                    <input type="text" name="yearOfCompletion" value=""  required>
                </label>
            </div>
		
            
			<div class="form-row">
                <label>
                    <span>Rows</span>
                    <!-- <input type="text" name="rows" value=""  required> -->
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
                    <span>Column</span>
                   <!--  <input type="text" name="cols" value=""  required> -->
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
                    <span>Shuffle Image</span>
                   <!--  <input type="text" name="cols" value=""  required> -->
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
                    <input type="file" name="image" value="">
                </label>
            </div>
            
            <!-- <div class="form-row">
                <label>
                    <span>User Type</span>
                    <select name="usertype">
                        <option value="1">HOD</option>
                        <option value="2">Teacher</option>
                        <option value="3">Student</option>
                    </select>
                </label>
            </div>	 -->		        
            
            <div class="form-row">
                <center><button type="submit" value="Save" name="btnSave">Save</button></center>
            </div>

        </form>
       

    </div>
	

 

</div>
</div><br>

<br>

</div>

</body>
</html>

