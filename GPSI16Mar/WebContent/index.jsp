<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <form class="form-basic" name="f1" method="post" enctype="multipart/form-data" action="addEmployee">

            <div class="form-title-row">
                <h1>Add Image In DB</h1>
            </div>

            <div class="form-row">
                <label>
                    <span>Name</span>
                    <input type="text" name="txtName" value="">
                </label>
            </div>


			<div class="form-row">
                <label>
                    <span>Address</span>
                    <textarea name="txtAddress"  type="text"  value=""></textarea>
                </label>
            </div>
		
            
			<div class="form-row">
                <label>
                    <span>Rows</span>
                    <input type="text" name="txtRows" value="">
                </label>
            </div>
            
            
            <div class="form-row">
                <label>
                    <span>Column</span>
                    <input type="text" name="txtCols" value="">
                </label>
            </div>
            
         
         	<div class="form-row">
                <label>
                    <span>Photo</span>
                    <input type="file" name="flPhoto" value="">
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
