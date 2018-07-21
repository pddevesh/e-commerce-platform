<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Amazon Home page</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script> 
<!--
$(function(){
  $("#header").load("header.jsp"); 
  $("#footer").load("footer.jsp"); 
});
-->

</script> 
</head>
<body style="padding-top:100px">
  
<div id="header"></div>
<!--
<h1 align="center">Amazon Home Page</h1>
-->
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<center>
<table style="width:70%">

  <tr>
    <th>Product Image</th>
    <td>Product InFormation</td>
  </tr>
  <tr>
    <th rowspan="4"><img src="${it.key1}" style="width:100px;height:100px;"></th>
    <td>${it.key4}</td>
  
  </tr>
  <tr>
    <td>${it.key5}</td>
  
  </tr>
    <tr>
    <td>${it.key6}</td>
  
  </tr>
    <tr>
    <td>${it.key7}</td>
  
  </tr>
  
</table>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;    
}
</style>
 </center>
<jsp:include page="footer.jsp" />
</body>
</html>