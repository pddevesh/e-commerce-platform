<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Color</title>
<link rel="stylesheet" type="text/css" href="bootstrap.css" >
<script src="jquery-3.2.1.js"></script> 
</head>
<jsp:include page="admin.jsp" />
<body>
<form id="addColor">
	<div class="container">
     	<label for="Choose Product"><b>Colors</b></label>
  	 	<select name="itemid"  id="itemid" class="form-control" onchange="displaydetails()">
  	 	</select><br><br>
  	</div>
  	<div class="container" id="container1">
  	<input type="text" placeholder="Enter Color" class="form-control" name="color" id="color" required>
  	<button type="button" class="delete-row" onClick="addColor()" >Add Color</button><br><br>
  	</div>
</form>
</body>
</html>
<script>
$(document).ready(function(){
    var uri="webapi/webservice/getColors/";
    $("#container1").hide();
    
    $.ajax({ 
    	   type: "GET",
    	   dataType: "json",
    	   url: uri,
    	   success: function(data){
    		   var n = data.length;
    		    
    		   for(var i=0;i<n;i++)
    		   {
			    	var select = document.getElementById("itemid");
					var option = document.createElement('option');
		        	option.text = option.value = data[i];
		        	select.appendChild(option);
    		   }
    		   var select = document.getElementById("itemid");
    			var option = document.createElement('option');
    			option.text = option.value = "Add Color";
    			select.appendChild(option);
    	   },
    	error: function(e) {
    	        console.log(e.message);
    	    }
    	});
	
});

function displaydetails()
{
  var val = document.getElementById("itemid").value;
  if(val === "Add Color")
	  $("#container1").show();
}

function addColor()
{
	var val = document.getElementById("color").value;
	 var uri="webapi/webservice/addColors/";
	  uri+=val;
	    alert(uri);
	    $.ajax({ 
	    	   type: "GET",
	    	   dataType: "json",
	    	   url: uri,
	    	   success: function(data){
	    		   if(data.numrows == 1)
	    			   alert("Color added");
	    	   },
	       	error: function(e) {
	       	        console.log(e.message);
	       	    }
	       	});
	
}
</script>