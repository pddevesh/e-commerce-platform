<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<script src="jquery-3.2.1.js"></script> 
<html>
<%! String subcat;
String color;
%>

<% 
subcat=request.getParameter("subcat");

color=request.getParameter("color");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Price Filter</title>
</head>
<body style="margin-top:8%;" id="mainbody">
<input type="text" name="minimum" id="min" placeholder="min" size="10"><br>
<input type="text" name="maximum" id="max" placeholder="max" size="10"><br>
<input type="button" value="go" onclick="print()">
<div id="allp">
        <div class="row" id="bodyraw">
</div></div>
</body>
</html>
<script>
var dt={};
$(document).ready(function(){
	
alert("Hi");
var subcat = '<%=subcat%>';
var color = '<%=color%>';
alert(subcat+" "+color);
var uri="webapi/webservice/getItemsbysubcatcolor/";
uri=uri+subcat+'/'+color;
console.log("uri="+uri);
alert(uri);
$.ajax({ 
   type: "GET",
   dataType: "json",
   url: uri,
   success: function(data){
	   dt=data;
   var n=data.length;
   var strLinks='';
for(var i=0;i<n;i++){
var title= data[i].title;
var itemid = data[i].itemid;
var category=data[i].category;
var image1=data[i].image1;
var name=data[i].name;
var price = data[i].price;

strLinks += '<a href="ItemDetails.jsp?pid='+itemid+'"<div class="col-md-3 item"><div id="imagediv"><img class="img-responsive" src="'+image1+'" id="productimg"></div><h3 class="text-center">'+itemid+' </h3><h3 class="text-center">'+price+' </h3> </div>';
document.getElementById("allp").innerHTML = strLinks;
}
   },
error: function(e) {
        console.log(e.message);
    }
});
});
</script>
<script>
function print()
{
alert("Hi");
var min=parseInt(document.getElementById("min").value);
var max=parseInt(document.getElementById("max").value);
var strLinks="";
document.getElementById("allp").innerHTML ="";
var subcat = '<%=subcat%>';
var color = '<%=color%>';
var uri="webapi/webservice/getItemsbyprice/";
uri=uri+min+'/'+max+'/'+subcat+'/'+color;
console.log("uri="+uri);
alert(uri);
 
 var n=dt.length;
document.getElementById("allp").innerHTML ="";
var strLinks="";
for(var i=0;i<n;i++){
	//if(i%2!=1){
		
		var price = parseInt(dt[i].price+"");
		
    	if(price>=min&&price<=max){
    		alert(price+" sdf");
var title= dt[i].title;
var itemid = dt[i].itemid;
var category=dt[i].category;
var image1=dt[i].image1;
var name=dt[i].name;

strLinks += '<a href="ItemDetails.jsp?pid='+itemid+'"<div class="col-md-3 item" id="cmd3"><div id="imagediv"><img class="img-responsive" src="'+image1+'" id="productimg"></div><h3 class="text-center">'+itemid+' </h3><h3 class="text-center">'+price+' </h3> </div>';

	}
    	document.getElementById("allp").innerHTML = strLinks;
//}
}
}


</script>