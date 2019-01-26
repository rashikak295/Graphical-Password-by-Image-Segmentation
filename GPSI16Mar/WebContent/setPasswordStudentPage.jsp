<%@page import="com.image.pojo.GPSIRegistrationStudentPojo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="assets/style.css" rel="stylesheet" type="text/css" />
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<title>GPSI</title>
<style type="text/css">
body
{
    font-family: Arial;
    font-size: 10pt;
    /* margin: 50px 0px 0px 0px;
    background-color: #00ABFD; */
}
img
{
    height: 45px;
    width: 45px;
    margin: 2px;
}
.draggable
{
    filter: alpha(opacity=60);
    opacity: 0.6;
}
.dropped
{
    position: static !important;
}
 .dvDest
{
    border: 5px solid #ccc;
    padding: 5px;
    /* min-height: 100px; */
    width: 250px;
    height: 220px;
}

 .container1{
	 height: 65px;
	 width: 65px;
	 float: left; 
} 
</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="js/jquery-ui.min.js" type="text/javascript"></script>
    <link href="js/jquery-ui.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
    var imageName="";
    var numValue="";
    var clickFlag=false;
    var currentElement;
        $(function () {
            $("#dvSource img").draggable({
                revert: "invalid",
                refreshPositions: true,
                drag: function (event, ui) {
                    ui.helper.addClass("draggable");
                    currentElement=$(this).id;
                },
                stop: function (event, ui) {
                	clickFlag=false;
                    ui.helper.removeClass("draggable");
                    var image = this.src.split("/")[this.src.split("/").length - 1];
                    if ($.ui.ddmanager.drop(ui.helper.data("draggable"), event)) {
                    	imageName= image.split("=")[1];
                    	sendData(imageName,numValue);
                        //alert(image + " dropped.");
                    }
                    else {
                        //alert(image + " not dropped.");
                    }
                }
            });
             var ids = ",";
            $(".dvDest").droppable({
                drop: function (event, ui) {
                   

                	if (ids.indexOf("," + $(this).attr('id') + ",") >= 0 && clickFlag)
                	{
                    	
                		$("#"+currentElement).attr("src","retriveImage?fileName="+imageName);
                	   alert("image already dropped please re-create password");
                	   location.href="setPasswordStudentPage.jsp";
                	}
                	else
                    	{
                	

                	
                	 if ($(".dvDest img").length == 0) 
                    	 {
                    	 	if($(this).text()!="")
                    	 		{
                     				numValue= $(this).text();
                         			//$(this).text("");
                         			//alert(1);
                    	 		}
                     	}
                     else
                     {
                    	 if($(this).text()!="")
             	 		{
              				numValue= $(this).text();
                  			//$(this).text("");
                  			//alert(1);
             	 		}
                     	//alert(2);
                    	//numValue= $(this).text();
                     }
                	 $(this).text("");
                    ui.draggable.addClass("dropped");
                    $(this).append(ui.draggable);
                    ids += $(this).attr('id') + ",";
                    clickFlag=true;
                   }
                  }
            });
        }); 
/*
        $(".dvDest").droppable({
            drop: function (event, ui) {
                if ($(".dvDest img").length == 0) 
                  {
                    if($(this).text()!="")
                    {
                    	numValue= $(this).text();
                    }
                }
                else
                 {
                	if($(this).text()!="")
                    {
                    	numValue= $(this).text();
                    }
                 }
                $(this).text("");
                //alert("22222 Number Read :"+ numValue);
                ui.draggable.addClass("dropped");
                $(this).append(ui.draggable);
                
            }
        });
    });
*/
        function sendData(imageN,numN)
        {
            //alert("NumValue:" +numN);
        	
        	$.ajax({
        	    url : "SaveStudentPasswordServlet",
        	    type: "POST",
        	    data : "action=update&imageName="+imageN+ "&numValue="+numN,
        	    /* success: function(data, textStatus, jqXHR)
        	    {
        	    	alert("Data :"+data);   //data - response from server
        	    },
        	    error: function (jqXHR, textStatus, errorThrown)
        	    {
        	 
        	    } */
        	});
         }
    </script>
</head>
<body>
<jsp:include page="commonLoginHeader.jsp"></jsp:include>

<div class="container">
<div class="row">
<div id="dvSource" class="col-md-6">
<table>
<%
String[] imagesList=(String[])session.getAttribute("imagesList");
GPSIRegistrationStudentPojo gpsiRegistrationPojo=(GPSIRegistrationStudentPojo)session.getAttribute("gpsiRegistrationPojo");
int kk=0;
if(imagesList!= null && imagesList.length>0)
{
	for(int i=0;i<gpsiRegistrationPojo.getRows();i++)
	{
		
		%>
		<tr>
		<%
		for(int j=0;j<gpsiRegistrationPojo.getCols();j++)
		{
			
			
			
		
%>
<td>
<img src="retriveImage?fileName=<%=imagesList[kk] %>" height="15" width="15" id="img<%=kk%>">
</td>
<%
kk++;
		}
		 out.println("<br/>"); 
	}
	
	%>
	</tr>
	<%
}
%>
</table>
</div>

<%-- <table border="2" bordercolor="red" id="dvDest">
<%
for(int i=1;i<=30;i++)
{	
%>
<td style="width:50px;height:50px;">
<%=i %>

</td>
<%
}

%>
</table> --%>

<!-- <h4>Drag the images from the above table.</h4> -->
		<div class="col-md-6">
			<%
				int kkk = 0;
				for (int i = 1; i <= 8; i++) {
					for (int j = 1; j <= 8; j++) {
			%>

			<div id="container<%=++kkk%>" class="container1 dvDest">
				<h4>
					<%=kkk%>
				</h4>
			</div>
			<%
				}
					/* out.println("<br/>"); */
				}
			%>
		</div>
</div>

<button class="btn-primary"><a href="studentLoginPage.jsp" style="font: 2opx bold; color: black;">Register</a></button>
</div>
<br>
<jsp:include page="commonFooter.jsp"></jsp:include>
</body>
</html>