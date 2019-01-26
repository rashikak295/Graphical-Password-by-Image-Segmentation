<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GPSI</title>
<link href="assets/form-basic.css" rel="stylesheet" type="text/css"/>
        
        <style type="text/css">
        
			body {
					background-color: #00ABFD;
					margin: 0px;
					padding: 0px;
			}
			
			
			/* html {
    			display: block;
			} */
        </style>
    </head>
    <body>
    
    <div></div> <br>
    <div class="container"> 
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
</body>
</html>