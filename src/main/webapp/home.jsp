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
findAll();
$(document).ready(function(){
  
        $.ajax({url: "demo_test.txt", success: function(result){
            $("#div1").html(result);
        }});
    });


</script> 
</head>
<body style="padding-top:100px">
  
<div id="header"></div>
<!--
<h1 align="center">Amazon Home Page</h1>
-->
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {display:none;
          
           width:100% ;
           }
</style>
<body>

<h2 class="w3-center">Offers</h2>
<div class="w3-content w3-section" style="max-width:100%">
 <!--   <img class="mySlides" src="http://127.0.0.1:8887/upload/tv.jpg" style="width:100%">
  <img class="mySlides" src="http://127.0.0.1:8887/upload/xbox.jpg" style="width:100%">
  <img class="mySlides" src="http://127.0.0.1:8887/upload/oppo.jpg" style="width:100%">
    <img class="mySlides" src="http://127.0.0.1:8887/upload/tv.jpg" style="width:100%">
      <img class="mySlides" src="http://127.0.0.1:8887/upload/oppo.jpg" style="width:100%">
 -->     
   <!--     <img class="mySlides" src="http://127.0.0.1:8887/upload/tv.jpg" style="width:100%">
        <img class="mySlides" src="http://127.0.0.1:8887/upload/tv.jpg" style="width:100%">
 
       <img class="mySlides" src="${it.key1}" style="width:100%">
      
  <img class="mySlides" src="${it.key2}" style="width:100%">
  <img class="mySlides" src="${it.key3}" style="width:100%">
      -->
      
     <!--   <button class="w3-button w3-black w3-display-left">&#10094;</button>
  <button class="w3-button w3-black w3-display-right" >&#10095;</button>
-->
</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 6000); // Change image every 2 seconds
}
</script>
<div id="div1">
<center>
<table style="width:100%">
  <tr>
    <th align="left"><img src="${it.key1}" style="width:100px;height:100px;"></th>
    <th align="center"><img src="${it.key2}" style="width:100px;height:100px;"></th> 
   <th align="right"><img src="${it.key3}" style="width:100px;height:100px;"></th> 
  </tr>
  
   <tr>
    <th align="left"><img src="http://127.0.0.1:8887/upload/mobiles.jpg"></th>
    <th align="right"><img src="http://127.0.0.1:8887/upload/homek.jpg"></th> 
   <th align="left"><img src="http://127.0.0.1:8887/upload/fashon.jpg"></th>
  </tr>
 </table>
 <style>
table, th, td {
  padding-top: 50px;
    padding-right: 10px;
    padding-bottom: 50px;
    padding-left: 120px;
}
</style>
 </center>
 </div>
<jsp:include page="footer.jsp" />
</body>
</html>