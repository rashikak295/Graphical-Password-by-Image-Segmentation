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

</head>



<body>
<jsp:include page="commonLoginHeader.jsp"></jsp:include>


<div class="container">
<div class="row">
	<div class="col-md-6">
		<img class="img-responsive" src="image/registration-img.png" style="height=500px" width="500px" alt="">
	</div>
	 <!-- <div class="clear"></div>
	<div class="col-md-1"></div> -->
	<div class="col-md-6">
			<% String msg=(String)request.getAttribute("error"); 
       if(msg!=null)
	   out.println("<font color=red size=4px align=center>" +msg+"</font>");  %>
	   
        <form class="form-basic" name="action" method="post" action="TeacherLoginServlet">
        

            <div class="form-title-row">
                <h1>Enter your UserName</h1>
            </div>

            <div class="form-row">
                <label>
                    <span>UserName</span>
                    <input type="text" name="username" value="" required>
                </label>
            </div>
            	        
            
            <div class="form-row">
                <center><button type="submit" value="enter" name="action">Next</button>  <a href="teacherForgotPassword.jsp" style="float: right;">Forgot Password</a></center>
            </div>

        </form>

	</div>
</div>
</div>
<br><br><br></br>
<div id="footer"> 
</div>
</body>
</html>
