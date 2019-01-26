<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
div{
    padding: 15px;
    border: solid 2px steelblue;
}
</style>

<script type="text/javascript">
$('#start').datepicker({
    onSelect: function(dateText, inst){
        $('#end').datepicker('option', 'minDate', new Date(dateText));
    },
});

$('#end').datepicker({
    onSelect: function(dateText, inst){
        $('#start').datepicker('option', 'maxDate', new Date(dateText));
    }
});
</script>
</head>
<body>

<div>Start: <input type="text" id="start" /></div>
<div>End: <input type="text" id="end" /></div>
</body>
</html>