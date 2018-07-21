<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Special Deals</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/styles2.css">
<script src="jquery-3.2.1.js"></script> 
<jsp:include page="admin.jsp" />
</head>
<body>
<form action="NewFile.jsp" method="get">
<div class="container">
<select name="productid"  id="productid" class="form-control"">
</select><br><br>

<label><b>Buy X</b></label>
<input type="text" placeholder="Enter X" class="form-control" name="InitialQuantity">

<label><b>Enter Product ID's</b></label>
<input type="text" placeholder="Enter Product ID's" class="form-control" name="attr2">

<label><b>Get Y</b></label>
<input type="text" placeholder="Enter Y" class="form-control" name="dealtype">

<label><b>Enter Product ID's</b></label>
<input type="text" placeholder="Enter Product ID's" class="form-control" name="att3">
</div>
</form>

</body>
</html>

<script>
$(document).ready(function(){
   
    var uri="webapi/webservice/getAllItems/";
    //console.log(k);
    var select = document.getElementById("productid");
	var option = document.createElement('option');
	option.text = option.value = "Select Product ID";
	select.appendChild(option);
	
   
    //alert(uri);
    var val = document.getElementById("productid").value;
    if(val === "Select Product ID")
    	$("#infotable").hide();
     
    $.ajax({ 
    	   type: "GET",
    	   dataType: "json",
    	   url: uri,
    	   success: function(data){
    		   var n = data.length;
    		    
    		   for(var i=0;i<n;i++)
    		   {
			    	var select = document.getElementById("productid");
					var option = document.createElement('option');
		        	option.text = option.value = data[i].productid;
		        	select.appendChild(option);
    		   } 
    	   },
    	error: function(e) {
    	        console.log(e.message);
    	    }
    	});
});
</script>
