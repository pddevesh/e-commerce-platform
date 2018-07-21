<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Item</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/styles2.css">
<jsp:include page="SellerDashboard.jsp" />
<script src="jquery-3.2.1.js"></script> 
<style type="text/css">
    table{
        width: 100%;
        margin-bottom: 20px;
		border-collapse: collapse;
    }
    table, th, td{
        border: 1px solid #cdcdcd;
    }
    table th, table td{
        padding: 10px;
        text-align: left;
    }
</style>
</head>
<body>
<form id="updateform">
     <div class="container">
     	<label for="Choose Product"><b>Item ID</b></label>
  	 	<select name="itemid"  id="itemid" class="form-control" onchange="displaydetails()">
  	 	</select><br><br>
</div>

<div class="container1">
  <label for="Choose Category"><b>Category(*)</b></label>
  <select name="category"  id="category" class="form-control">
  </select>
  
  <label for="Choose SubCategory"><b>SubCategory(*)</b></label>
  <select name="subcategory" id="subcategory" class="form-control" required>
  	<!-- <option>A</option>
  	<option>B</option>
  	<option>C</option>
  	<option>D</option>
  	<option>E</option> -->
  </select>
  
  <label for="pid"><b>Product ID(*)</b></label>
  <input type="text" placeholder="Product ID" class="form-control" name="pid" id="pid" required>
  
  <label for="title"><b>Title(*)</b></label>
  <input type="text" placeholder="Title" class="form-control" name="title" id="title" required>
  
  <label for="brand"><b>Brand(*)</b></label>
  <input type="text" placeholder="Brand" class="form-control" name="brand" id="brand" required>
  
  <label for="color"><b>Color</b></label>
  <select placeholder="Color" class="form-control" name="color" id="color"></select>
  
  <label for="weight"><b>Weight</b></label>
  <input type="text" placeholder="Weight" class="form-control" name="weight" id="weight">
  
  <label for="price"><b>Price(*)</b></label>
  <input type="text" placeholder="Price" class="form-control" name="price" id="price" required>
  
  <label for="size"><b>Size</b></label>
  <input type="text" placeholder="Size" class="form-control" name="size" id="size">
  
  <label for="quantity"><b>Quantity(*)</b></label>
  <input type="text" placeholder="Quantity" class="form-control" name="quantity" id="quantity" required>
  
  <label for="warrantyduration"><b>Warranty Duration</b></label>
  <input type="text" placeholder="Warranty Duration" class="form-control" name="warranty" id="warranty">
  
  <label for="Used_Fresh"><b>Used/Fresh</b></label>
  <select name="used_fresh" class="form-control" id="used_fresh" required>
  	<option>Used</option>
  	<option>Fresh</option>
  </select>
  
  <label for="discount"><b>Discount</b></label>
  <input type="text" placeholder="Discount" class="form-control" name="discount" id="discount">
  <button type="button" class="delete-row" onClick="updateItem()" >Update Product</button><br><br>
  </div>
  
  
</form>
<script>
$(document).ready(function(){
    var k ="<%=session.getAttribute("sellername") %>";
    var uri="webapi/webservice/loadItembySeller/";
    //console.log(k);
    var select = document.getElementById("itemid");
	var option = document.createElement('option');
	option.text = option.value = "Select Item ID";
	select.appendChild(option);
    uri+=k;
    //alert(uri);
    var val = document.getElementById("itemid").value;
     
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
		        	option.text = option.value = data[i].itemid;
		        	select.appendChild(option);
    		   } 
    	   },
    	error: function(e) {
    	        console.log(e.message);
    	    }
    	});
});
</script>
</body>
</html>

<script>
function displaydetails()
{
	var x = document.getElementById("itemid").value;	
	alert(x);
	var c = document.getElementById("color");

	for(i=c.options.length-1;i>=0;i--)
		c.remove(i);
	//for(i=c.options.length-1;i>=0;i--)
	//	c.remove(i);
	//alert(x);
	/*if(x === "Select Item ID")
    	$("#infotable").hide();
    else
    	$("#infotable").show();*/
    	 $.ajaxSetup({async:false});
	var uri = "webapi/webservice/getItemDetails/".concat(x);
	 $.ajax({ 
  	   type: "GET",
  	   dataType: "json",
  	   url: uri,
  	   success: function(data){
  		 
  		 var select = document.getElementById("category");
  		var option = document.createElement('option');
  		option.text = option.value = data.category;
  		select.appendChild(option);
  		
  		var select1 = document.getElementById("subcategory");
  		var option1 = document.createElement('option');
  		option1.text = option1.value = data.subcategory;
  		select1.appendChild(option1);
  	
  		$("#pid").val(data.productid);
  		$("#title").val(data.title);
  		$("#brand").val(data.brand);
  		//$("#color").val(data.color);
  		var select2 = document.getElementById("color");
  		var option2 = document.createElement('option');
  		option2.text = option2.value = data.color;
  		select2.appendChild(option2);
  		
  		$("#weight").val(data.weight);
  		$("#price").val(data.price);
  		$("#size").val(data.size);
  		$("#quantity").val(data.quantity);
  		$("#warranty").val(data.warranty);
  		$("#used_fresh").val(data.usedFresh);
  		$("#discount").val(data.discount);
  		
  		
  	   }
	 });
	 var c1 = document.getElementById("color").value;
		alert(c1);
	 var uri2 = "webapi/webservice/getColors/";
	 $.ajax({ 
	  	   type: "GET",
	  	   dataType: "json",
	  	   url: uri2,
	  	   success: function(data){
	  		   for(var i=0;i<data.length;i++)
	  		  {
	  			   if(data[i] != c1)
	  			   {
	  		 		var select2 = document.getElementById("color");
	   				var option2 = document.createElement('option');
	   				option2.text = option2.value = data[i];
	   				select2.appendChild(option2);
	  			   }
	  	   }
		}
	 });
}
</script>

<script>
function updateItem()
{
var itemid = document.getElementById("itemid").value;
var cat = document.getElementById("category").value;
var subcat = document.getElementById("subcategory").value;
var title=document.getElementById("title").value;
var brand=document.getElementById("brand").value;
var color=document.getElementById("color").value;
var weight=document.getElementById("weight").value;
var price=document.getElementById("price").value;
var size=document.getElementById("size").value;
var quantity=document.getElementById("quantity").value;
var warranty=document.getElementById("warranty").value;
var usedfresh=document.getElementById("used_fresh").value;
var discount=document.getElementById("discount").value;
var pid = document.getElementById("pid").value;
console.log("HelloUpdate");
var uri = "webapi/webservice/updateItem/";
uri+= pid+"/"+cat+"/"+subcat+"/"+title+"/"+brand+"/"+color+"/"+weight+"/"+price+"/"+size+"/"+quantity+"/"+warranty+"/"+usedfresh+"/"+discount;
 console.log(uri);
 $.ajax({ 
	   type: "GET",
	   dataType: "json",
	   url: uri,
	   success: function(data){
		   alert("item updated");
		   
		   location.href="ItemUpdate.jsp";
	   },
 error: function(e) {
     console.log(e.message);
 }
 });
 
}
</script>