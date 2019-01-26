<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

/* html {
    display: block;
} */

	/* Navigation Menu */
.main-navigation {
	text-align: center;
	clear: both;
}
.main-navigation li {
	font-size: 12px;
	font-size: 0.8571428571rem;
	
}
.main-navigation a {
	color: #5e5e5e;	
}
.main-navigation a:hover {
	color: #21759b;	
}
.main-navigation ul.nav-menu,
.main-navigation div.nav-menu > ul {display: none;}

.main-navigation ul.nav-menu.toggled-on,
.menu-toggle {
	display: inline-block;
}
.menu-toggle {
	margin: 16px 0;
	margin: 1.1428571429rem 0;
}

.main-navigation ul.nav-menu.toggled-on li {margin-bottom: 16px;}

.hassubchild:after {
	/* content: 'V'; */
  padding-left:5px;
  font-size:7px;
  color:#147852;
}





@media screen and (min-width: 600px) {
.main-navigation ul.nav-menu,
	.main-navigation div.nav-menu > ul {					
		display: inline-block !important;
		text-align: center; 
		width: 100%;					
	}
	
	.main-navigation ul {	
		text-indent: 0;
	}
	.main-navigation li a,
	.main-navigation li {
		display: inline-block;
		text-decoration: none;
		
		margin: 0 16px; 
		margin: 0 1.1428571429rem;	
	}
	.main-navigation li a {
		border-bottom: 0;
		color: #6a6a6a;
		padding: 12px 0;
		text-transform: uppercase;
		white-space: nowrap;
	}
	.main-navigation li a:hover {color: #89CBBF;}
	.main-navigation li { 
		position: relative;
		margin: 0;
	}
	
	.main-navigation li:hover {background: #ededed;}
		
	.main-navigation li ul {
		display: none;
		margin: 0;
		padding: 0;
		position: absolute;
		top: 100%;
		z-index: 1;
	}
	.main-navigation li ul ul {
		top: 0;
		left: 100%;
	}
	.main-navigation ul li:hover > ul {
		border-left: 0;
		display: block;
	}
	.main-navigation li ul li a {
		background: #efefef;
		border-bottom: 1px solid #ededed;
		display: block;
		font-size: 11px;
		font-size: 0.7857142857rem;
		padding: 8px 10px;
		padding: 0.5714285714rem 0.7142857143rem;
		width: 180px;
		width: 12.857142857rem;
		white-space: normal;
		margin: 0;
	}
	.main-navigation li ul li a:hover {
		background: #e3e3e3;		
		color: #89CBBF;
	}
	.main-navigation .current-menu-item > a,
	.main-navigation .current-menu-ancestor > a,
	.main-navigation .current_page_item > a,
	.main-navigation .current_page_ancestor > a {
		color: #89CBBF;
		font-weight: bold;
	}
}

 /* body {
	background-image: url("image/images.jpg");
	background-repeat: no-repeat;
}  */
</style>
</head>
<body>
	<nav id="site-navigation" class="main-navigation" role="navigation">
  <div class="nav-menu">
    <ul>
      <li class="current_page_item"><a href="homePage.jsp" title="Home">Home</a></li>
      <li class="page_item page-item-7"><a href="#">About</a></li>
      <li class="page_item page-item-26"><a class="hassubchild" href="#">Register</a>
        <ul class='children'>
          <li class="page_item page-item-27"><a href="studentRegistrationPage.jsp">Student</a></li>
          <li class="page_item page-item-28"><a href="hodRegistrationPage.jsp">HOD</a>
            <!-- <ul class='children'>
              <li class="page_item page-item-34"><a href="#">Checkout &rarr; Pay</a></li>
              <li class="page_item page-item-35"><a href="teacherRegister.jsp">Teacher</a></li>
            </ul> -->
          </li>
          <!-- <li class="page_item page-item-30"><a href="#">Login</a>
            <ul class='children'>
              <li class="page_item page-item-33"><a href="#">Change Password</a></li>
              <li class="page_item page-item-31"><a href="#">Edit My Address</a></li>
            </ul>
          </li> -->
          <li class="page_item page-item-29"><a href="teacherRegistrationPage.jsp">Teacher</a></li>
        </ul>
      </li>
      <li class="page_item page-item-9"><a href="#">Login</a>
       <ul class='children'>
					<li class="page_item page-item-33"><a href="studentLoginPage.jsp">StudentLogin</a></li>
					<li class="page_item page-item-31"><a href="teacherLoginPage.jsp">TeacherLogin</a></li>
					<li class="page_item page-item-31"><a href="hodLoginPage.jsp">HODLogin</a></li>
		</ul>
	</li>
    </ul>
  </div><!-- .nav-menu -->
</nav><!-- #site-navigation -->


	 <img src="image/bg-image.jpg"/> 
</body>
</html>