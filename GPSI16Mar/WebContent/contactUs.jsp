<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="assets/style.css" rel="stylesheet" type="text/css" />  
<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<title>GPSI</title>

<style type="text/css">
	  .jumbotron {
      height: 230px;
      padding-top: 10px;
    }
</style>
</head>
<body>
<jsp:include page="aboutContactNavbar.jsp"></jsp:include>


<div class="jumbotron">
  <div class="container text-center">
    <!-- <h3>We are here to help!</h3>  --> 
		<img src="images/wehere.png"/>
    <p>Reach out to us anytime and we'll happily answer your questions.</p>
  </div>
</div>

<center><h3>Contact Person:</h3></center>
<div class="container">    
  <div class="row">
    <div class="col-sm-3">
      <div class="panel panel-primary">
        <div class="panel-heading">Name: Tanya</div>
        <div class="panel-body">Call At: 6892379899</div>
        <div class="panel-footer">Email: abc@gmail.com</div>
      </div>
    </div>
    <div class="col-sm-3"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Name: Rashika</div>
        <div class="panel-body">Call At: 7295800290</div>
        <div class="panel-footer">Email: abcd@gmail.com</div>
      </div>
    </div>
    <div class="col-sm-3"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Name: Radhika</div>
        <div class="panel-body">Call At: 749280100</div>
        <div class="panel-footer">Email: abcde@gmail.com</div>
      </div>
    </div>
    <div class="col-sm-3"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Name: Ashwini</div>
        <div class="panel-body">Call At: 7494098480</div>
        <div class="panel-footer">Email: hng@gmail.com</div>
      </div>
    </div>
  </div>
</div><br>

<jsp:include page="commonFooter.jsp"></jsp:include>
</body>
</html>