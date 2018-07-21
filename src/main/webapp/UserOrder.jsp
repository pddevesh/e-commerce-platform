<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%! 
 String name;
%>

<% 
name=(String)session.getAttribute("name");
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Amazon Home page</title>
    <link rel="stylesheet" href="assets/css/styles.css">
 	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
</head>
<jsp:include page="headerwithname.jsp" />

<body style="margin-top:13%;" id="mainbody">


    <div id="allp">
        <div class="row" id="bodyraw">
<script src="jquery-3.2.1.js"></script> 
<script>
$(document).ready(function(){
	var uname = '<%=name%>';
var uri="webapi/webservice/getUserOrderDetails/";
uri+=uname;
console.log("uri="+uri);
$.ajax({ 
   type: "GET",
   dataType: "json",
   url: uri,
   success: function(data){
   var n=data.length;
   var strLinks='';
for(var i=0;i<n;i++){
var title= data[i].title;
var itemid = data[i].itemid;
var category=data[i].category;
var image1=data[i].image1;
var name=data[i].name;
var price = data[i].price;

strLinks += '<a href="ItemDetails.jsp?pid='+itemid+'"<div class="col-md-3 item"><div id="imagediv"><img class="img-responsive" src="'+image1+'" id="productimg"></div><h3 class="text-center">'+title+' </h3><h3 class="text-center">'+price+' </h3> </div>';
document.getElementById("allp").innerHTML = strLinks;
}
   },
error: function(e) {
        console.log(e.message);
    }
});
});

</script>

<!--  <script>
$(document).ready(function(){
	var hello="Hello,";
	var k=$(name);
	alert(k);
	hello+=k;
	if(k!=){
		$("check").text(hello);
	}
		
});
</script> -->
            
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
