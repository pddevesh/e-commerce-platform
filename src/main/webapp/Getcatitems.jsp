<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%! String pid;
%>

<% 
pid=request.getParameter("subcat");
//int p = Integer.parseInt(pid);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.vl {
    border-left: 6px solid green;
    height: 500px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Amazon Home page</title>
    <link rel="stylesheet" href="assets/css/styles.css">
 	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link href="columndisintigration.css" rel="stylesheet" type="text/css">
</head>
<jsp:include page="header.html" />
<div id="container">
<body style="margin-top:13%;" id="mainbody" onload="colorLoad()">

<div id="primary">
<h5>Price</h5>
<input type="text" name="minimum" id="min" placeholder="min" size="4"><br>
<input type="text" name="maximum" id="max" placeholder="max" size="4"><br>
<input type="button" value="go" onclick="print()">
</div>
<div id="primary">
<h5>Color</h5>
<select  id="color" onclick="colorPrint(this.value)" class="form-control" style="max-width:10%;"></select>
</div>
  

  
<div id="secondary">

    <div id="allp">
        <div class="row" id="bodyraw">

 <script src="jquery-3.2.1.js"></script>  
    <script>
    var dt={};
    $(document).ready(function(){
    	
var k="<%=pid%>";
var uri="webapi/webservice/getItemByCat/";
console.log(k);
uri+=k;
console.log(uri+"hello");
$.ajax({ 
   type: "GET",
   dataType: "json",
   url: uri,
   success: function(data){
	   dt=data;
	  // alert(dt);
	   //alert(data);
	   var n=data.length;
	   
	   var strLinks='';
	   console.log(n);
	for(var i=0;i<n;i++){
		if(i%2!=1){
	var title= data[i].title;
	var itemid = data[i].itemid;
	var category=data[i].category;
	var image1=data[i].image1;
	var name=data[i].name;
	var price = data[i].price;
	strLinks += '<a href="ItemDetails.jsp?pid='+itemid+'"<div class="col-md-3 item" id="cmd3"><div id="imagediv"><img class="img-responsive" src="'+image1+'" id="productimg"></div><h3 class="text-center">'+title+' </h3><h3 class="text-center">'+price+' </h3> </div>';
	
		}
		document.getElementById("allp").innerHTML = strLinks;
	}
   },
error: function(e) {
        console.log(e.message);
    }
});
});
   function print(){
	  
    	var min=parseInt(document.getElementById("min").value);
    	var max=parseInt(document.getElementById("max").value);
    	 
    	 var n=dt.length;
    	document.getElementById("allp").innerHTML ="";
    	var strLinks="";
    	for(var i=0;i<n;i++){
    		if(i%2!=1){
    			
    			var price = parseInt(dt[i].price+"");
    			
    	    	if(price>=min&&price<=max){
    	    		alert(price+" sdf");
    	var title= dt[i].title;
    	var itemid = dt[i].itemid;
    	var category=dt[i].category;
    	var image1=dt[i].image1;
    	var name=dt[i].name;
    	
    	strLinks += '<a href="ItemDetails.jsp?pid='+itemid+'"<div class="col-md-3 item" id="cmd3"><div id="imagediv"><img class="img-responsive" src="'+image1+'" id="productimg"></div><h3 class="text-center">'+title+' </h3><h3 class="text-center">'+price+' </h3> </div>';
    
    		}
    	    	document.getElementById("allp").innerHTML = strLinks;
    	}
    	}
   }
    </script> 
    <script>
    function colorLoad()
    {
    	
    	  var select = document.getElementById("color");
			var option = document.createElement('option');
			option.text = option.value = "Select Color";
			select.appendChild(option);
			
			var select = document.getElementById("color");
			var option = document.createElement('option');
			option.text = option.value = "All";
			select.appendChild(option);
			
        var xhr  = new XMLHttpRequest();
        var subcat= '<%= pid%>';
        //alert(subcat);
    	xhr.open('GET',"http://localhost:8080/akshay/webapi/webservice/loadColors/"+subcat,true);
    	
    	xhr.onreadystatechange = function () {
    		//alert("colorload");
    		
			
    		if (xhr.readyState == 4 && xhr.status == 200)
    		{
    			var users = JSON.parse(xhr.responseText);
    			//alert(users);
    			for(i=0;i<users.length;i++)
    			{
    				
    				var select = document.getElementById("color");
    				var option = document.createElement('option');
    	        	option.text = option.value = users[i];
    	        	select.appendChild(option);
    			}	
    		}
    		else
    		{
    			//alert(xhr.status);
    			//console.error(users);		
    		}
    	}
    		xhr.send();
    		
    }
function colorPrint( desiredColor){
	 // alert(desiredColor);
	 var kl="<%=pid%>";
	 if(desiredColor==="All")
		 {
		 location.replace("http://localhost:8080/akshay/Getcatitems.jsp?subcat="+kl);
		 }
	 var n=dt.length;
	 var s= '<%= pid%>';
	document.getElementById("allp").innerHTML ="";
	var strLinks='';
	for(var i=0;i<n;i++){
		//if(i%2!=1){
			
			var itemColor =dt[i].color;
			
	    	if(desiredColor=== itemColor){
	    	var title= dt[i].title;
	var itemid = dt[i].itemid;
	var category=dt[i].category;
	var color=dt[i].color;
	var price = dt[i].price;
	var image1=dt[i].image1;
	var name=dt[i].name;
	//alert(itemColor+" s");
	//console.log(color);
	strLinks += '<a href="ItemDetails.jsp?pid='+itemid+'"<div class="col-md-3 item" id="cmd3"><div id="imagediv"><img class="img-responsive" src="'+image1+'" id="productimg"></div><h3 class="text-center">'+title+' </h3><h3 class="text-center">'+price+' </h3><h3 class="text-center">'+color+' </h3> </div>';
	//alert(itemColor+" sdf");
		}
	    	
	    	document.getElementById("allp").innerHTML = strLinks;
		//}
	}
	
}
    </script>
    </div>
   
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </div>
</body>
</div>
</html>