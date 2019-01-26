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
        <form class="form-basic" name="f1" method="post" enctype="multipart/form-data" action="GPSITeacherServlet">

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
                    <input type="text" name="phoneNo" value="" maxlength="10" required>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Qualification</span>
                    <input type="text" name="qualification" value="" required>
                </label>
            </div>
            
             <div class="form-row">
                <label>
                    <span>Subject</span>
                    <input type="text" name="subject" value="" required>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Semester</span>
                    <input type="text" name="semesterWise" value="" required>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Email Id</span>
                    <input type="email" name="emailId" value="" required>
                </label>
            </div>
            
            <div class="form-row">
                <label>
                    <span>Department Name</span>
                    <input type="text" name="deptName" value="" required>
                </label>
            </div>
		
            
			<div class="form-row">
                <label>
                    <span>Rows</span>
                    <input type="text" name="rows" value="" required>
                </label>
            </div>
            
            
            <div class="form-row">
                <label>
                    <span>Column</span>
                    <input type="text" name="cols" value="" required>
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