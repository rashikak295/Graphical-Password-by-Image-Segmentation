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
        
        
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <%-- <script type="text/javascript">
				$(document).ready(function(){
				var message='<%=request.getParameter("msg") %>';
				if(message!=null && message!="" && message=='failure')
					{
						alert("Please check the password");
					}
				});	
        </script> --%>
    </head>
    <body>
    
    <div></div> <br>
    <div class="container"> 
    <% String msg=(String)request.getAttribute("error"); 
       if(msg!=null)
	   out.println("<font color=red size=4px align=center>" +msg+"</font>");  %>
	   
        <form class="form-basic" name="action" method="post" action="StudentLoginServlet">
        

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
                <center><button type="submit" name="action">Next</button></center>
            </div>

        </form>
       </div>
</body>
</html>