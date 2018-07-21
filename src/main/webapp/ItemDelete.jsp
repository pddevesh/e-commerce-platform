<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Item</title>
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

<form action="#">
     <div class="container">
     	<label for="Choose Product"><b>Item ID</b></label>
  	 	<select name="itemid"  id="itemid" class="form-control" onchange="displaydetails()">
  	 	</select><br><br>
  	 			<div class="table-responsive" id="details1">
                    <table class="table" id="infotable">
                        <thead>
                        </thead>
                        <tbody>
                            <tr id="trdetails">
                                <td id="trdetails1"></td>
                            </tr>
                            <tr id="trdetails">
                                <td id="trdetails2"></td>
                            </tr>
                            <tr id="trdetails">
                                <td id="trdetails3">
                            </tr>
                            <tr id="trdetails">
                                <td id="trdetails4"></td>
                            </tr>
                            <tr id="trdetails">
                                <td id="trdetails5"></td>
                            </tr>
                            <tr id="trdetails">
                                <td  id="trdetails6"></td>
                            </tr>
                            <tr id="trdetails">
                                <td  id="trdetails7"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
     	<button type="button" class="delete-row" onclick="deleteItem()">Delete Product</button>
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
    if(val === "Select Item ID")
    	$("#infotable").hide();
     
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
	//alert(x);
	//for(i=c.options.length-1;i>=0;i--)
	//	c.remove(i);
	//alert(x);
	if(x === "Select Item ID")
    	$("#infotable").hide();
    else
    	$("#infotable").show();
	var uri = "webapi/webservice/getItemDetails/".concat(x);
	 $.ajax({ 
  	   type: "GET",
  	   dataType: "json",
  	   url: uri,
  	   success: function(data){
  		var a="Category: ";
  		var b="Subcategory: ";
  		var c="Title: ";
  		var d="Brand: ";
  		var e="Quantity: ";
  		var f="Price: ";
  		var g;
  		var h="Discount: "
  		var cat=data.category;
  		var subcat=data.subcategory;
  		var title=data.title;
  		var brand=data.brand;
  		var price=data.price;
  		var image=data.image1;
  		var quantity=data.quantity;
  		var discount=data.discount;
  		var m=price-price*(discount/100);
  		a+=cat;
  		b+=subcat;
  		c+=title;
  		d+=brand;
  		e+=quantity;
  		f+=price;
  		h+=discount;
  		
  		$("#trdetails1").text(a);
  		$("#trdetails2").text(b);
  		$("#trdetails3").text(c);
  		$("#trdetails4").text(d);
  		$("#trdetails5").text(e);
  		$("#trdetails6").text(f);
  		$("#trdetails7").text(h);
  		 
  		   
  	   }
	 });
}

</script>

<script>
function deleteItem()
{
var x = document.getElementById("itemid").value;	
alert(x);
var uri = "webapi/webservice/deleteItem/".concat(x);
 $.ajax({ 
	   type: "GET",
	   dataType: "json",
	   url: uri,
	   success: function(data){
		   alert("item deleted");
		   window.location.replace("ItemDelete.jsp");
		   
	   },
 error: function(e) {
     console.log(e.message);
 }
 });
 
}
</script>