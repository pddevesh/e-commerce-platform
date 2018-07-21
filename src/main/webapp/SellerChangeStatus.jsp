<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seller Change Status</title>
<link rel="stylesheet" href="assets/css/styles2.css">
<jsp:include page="SellerDashboard.jsp" />
<script src="jquery-3.2.1.js"></script> 
</head>
<body>
<form id="changestatus">
     <div class="container">
        <label for="Choose Product"><b>Buyer Email</b></label>
  	 	<select name="buyer"  id="buyer" class="form-control" onchange="display()">
  	 	</select><br><br>
  	 	
     	<label for="Choose Product"><b>Item ID</b></label>
  	 	<select name="itemid"  id="itemid" class="form-control" onchange="displaydetails()">
  	 	</select><br><br>
  	 	
  	 	<label for="Choose Product"><b>Status</b></label>
  	 	<select name="status"  id="status" class="form-control">
  	 	</select><br><br>
  	 	
  	 	 <button type="button" class="delete-row" onClick="updateItem()" >Update Status</button><br><br>
	</div>
</form>
</body>
</html>
<script>
var dt={};
$(document).ready(function(){
    var k ="<%=session.getAttribute("sellername")%>";
    var uri="webapi/webservice/sellerItemStatus/";
    //console.log(k);
    var select = document.getElementById("buyer");
	var option = document.createElement('option');
	option.text = option.value = "Select Buyer";
	select.appendChild(option);
    uri+=k;
   // alert(uri);
    //var val = document.getElementById("itemid").value;
     
    $.ajax({ 
    	   type: "GET",
    	   dataType: "json",
    	   url: uri,
    	   success: function(data){
    		   var n = data.length;
    		    dt=data;
    		   for(var i=0;i<n;i++)
    		   {
			    	var select = document.getElementById("buyer");
					var option = document.createElement('option');
		        	option.text = option.value = data[i].email;
		        	select.appendChild(option);
    		   }
    		   /*for(var i=0;i<n;i++)
    			   alert(dt[i].status);*/
    	   },
    	error: function(e) {
    	        console.log(e.message);
    	    }
    	});
});

function display()
{
	var mail = document.getElementById("buyer").value;
	var select = document.getElementById("itemid");
	var option = document.createElement('option');
	option.text = option.value = "Select Item ID";
	select.appendChild(option);
	
	for(var i=0;i<dt.length;i++)
	{
		if(mail == dt[i].email)
		{
			var option1 = document.createElement('option');
			option1.text = option1.value = dt[i].itemid;
			select.appendChild(option1);
		}
	}
	
}

function displaydetails()
{
	var id = document.getElementById("itemid").value;
	var n = dt.length;
	var m;
	
	for(var i=0;i<n;i++)
	{
		var lc = dt[i].itemid;
		if(lc == id)
		{
			m = dt[i].status;
			//alert(dt[i].status);
			break;
		}
	}
	//alert(m);
	var c = document.getElementById("status");	
	for(i=c.options.length-1;i>=0;i--)
		c.remove(i);
	
	var option = document.createElement('option');
	option.text = option.value = m;
	c.appendChild(option);
	
	var option1 = document.createElement('option');
 	option1.text = option1.value = "Item Shipped";
 	c.appendChild(option1);
}

function updateItem()
{
	var uri="webapi/webservice/updateSellerStatus/";
	var k = document.getElementById("buyer").value;
	var id = document.getElementById("itemid").value;
	/*var n = dt.length;
	var m;
	for(var i=0;i<n;i++)
	{
		var lc = dt[i].title;
		if(lc === title)
			m = dt[i].itemid;
	}*/
	var x="Item Shipped";
	
	uri=uri+k+"/"+id+"/"+x;
	//alert(uri);
	
	$.ajaxSetup({async:false});
	$.ajax({ 
	 	   type: "GET",
	 	   dataType: "json",
	 	   url: uri,
	 	   success: function(data){
	 		   if(data.numrows == 1)
	 			   alert("Status Updated Successfully");
	 	   },
	error: function(e) {
	        console.log(e.message);
	    }
	 });
}

</script>