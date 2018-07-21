<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OOAD Exam Question1</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/styles2.css">
<script src="jquery-3.2.1.js"></script> 
</head>
<body>
<form action="NewFile.jsp" method="get">
<label for="price"><b>Student Name : Akash Shendge</b></label>
<label for="price"><b>Student Roll No: MT2017010</b></label>
<select name="productid"  id="productid" class="form-control" onchange="displaydetails()">
</select><br><br>
<input type="submit" value="Back" >

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
                        </tbody>
                    </table>
                </div>
</form>
</body>

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
</html>

<script>
function displaydetails()
{
	var x = document.getElementById("productid").value;	
	//alert(x);
	//for(i=c.options.length-1;i>=0;i--)
	//	c.remove(i);
	//alert(x);
	if(x === "Select Product ID")
    	$("#infotable").hide();
    else
    	$("#infotable").show();
	var uri = "http://localhost:8080/akshay/webapi/webservice/getProductDetails/".concat(x);
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
  		var h="Discounted Price: "
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
  		h+=m;
  		
  		$("#trdetails1").text(c);
  		$("#trdetails2").text(f);
  		if(discount > 0)
  		{
  			$("#trdetails3").show();
  			$("#trdetails3").text(h);
  		}
  		else
  			$("#trdetails3").hide();
  		 
  		   
  	   }
	 });
}

</script>

<script>