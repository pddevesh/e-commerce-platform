<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>demo1</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/untitled.css">
    <script src="jquery-3.2.1.js"></script> 
</head>	
</head>
<jsp:include page="admin.jsp" />
<script>
	$(document).ready(function(){
		   $("#div2").hide();
		//});	
    //alert("Page is loaded");
    var select = document.getElementById("category");
	var option = document.createElement('option');
	option.text = option.value = "Select Category";
	select.appendChild(option);
	
	var select = document.getElementById("category");
	var option = document.createElement('option');
	option.text = option.value = "Add Category";
	select.appendChild(option);
	
	/*$('select[name="category"]').change(function(){

	    if ($(this).val() == "Add Category")
	    	 $("#div2").show();
	     
	});*/
	
    
	
    var xhr  = new XMLHttpRequest();
	xhr.open('GET',"http://localhost:8080/akshay/webapi/webservice/loadcategory/", true);
	
	xhr.onreadystatechange = function () {
		
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			var users = JSON.parse(xhr.responseText);
			for(i=0;i<users.length;i++)
			{
				
				var select = document.getElementById("category");
				var option = document.createElement('option');
	        	option.text = option.value = users[i].category;
	        	select.appendChild(option);
			}	
		}
		else
		{
			//alert("error");
			//console.error(users);		
		}
	}
		xhr.send();
		
});
</script>
<script>
function showSubcategory(value)
{

	var cat=document.getElementById("cat");
	cat.value=value;
	var x = document.getElementById("category").value;	
	var c = document.getElementById("subcategory");
	
	for(i=c.options.length-1;i>=0;i--)
		c.remove(i);
	//alert(x);
	/*$('select[name="category"]').change(function(){

	    if ($(this).val() == "Add Category")
	    	 $("#div2").show();
	     
	});*/
	
	if(x === "Add Category")
	{
		$("#div2").show();
		alert("div2 display");
		c.value = "Add SubCategory"
	}
	else
	{
		$("#div2").hide();
		alert("div2 display");
	}
	
	var url = "http://localhost:8080/akshay/webapi/webservice/loadsubcategory/".concat(x);
	var xhr  = new XMLHttpRequest();
	//alert(url);
	xhr.open('GET',url, true);
	
	xhr.onreadystatechange = function () {
		
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			var users = JSON.parse(xhr.responseText);
			for(i=0;i<users.length;i++)
			{
				//alert(users[i].category);
				var select = document.getElementById("subcategory");
				var option = document.createElement('option');
	        	option.text = option.value = users[i].subcategory;
	        	
	        	select.appendChild(option);
			}	
		}
		else
		{
			//alert("error");
			//console.error(users);		
		}
	}
		xhr.send();
		var select = document.getElementById("subcategory");
		var option1 = document.createElement('option');
    	option1.text = option1.value = "Select SubCategory";
    	select.appendChild(option1);
    	
		var option = document.createElement('option');
    	option.text = option.value = "Add SubCategory";
    		select.appendChild(option);
    
    	
}

function show(value)
{	
	

	var cat=document.getElementById("sub");
	cat.value=value;
	
	$('select[name="subcategory"]').change(function(){

	    if ($(this).val() == "Add SubCategory")
	    	 $("#div2").show();
	    else
	    	$("#div2").hide();
	});
	
}	
	function add(){
		var cat=document.getElementById("cat").value;
		var sub=document.getElementById("sub").value;

		
		
		
		var url = "http://localhost:8080/akshay/webapi/webservice/addcategory/".concat(cat+"/"+sub);
		var xhr  = new XMLHttpRequest();
		//alert(url);
		xhr.open('GET',url, true);
		
		xhr.onreadystatechange = function () {
			
			if (xhr.readyState == 4 && xhr.status == 200)
			{
				//alert(xhr.responseText);
				window.location.replace("admin.jsp");
				
			}
			else
			{
				//alert("error");
				//console.error(users);		
			}
		}
			xhr.send();
			var c = document.getElementById("category");
			
			for(i=c.options.length-1;i>=0;i--)
				c.remove(i);
			 myFunction();
		
	}
	
	

</script>



<body>






<div class="btn1">
<div class="dropdown">
<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select Category

<select name="category"  id="category" class="form-control" onchange="showSubcategory(this.value)" required>


  </select></div><br>
 
 <div class="dropdown">
 <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select Subcategory
 <select name="subcategory"  id="subcategory" class="form-control" onchange="show(this.value)" required>

  </select></div>
  </div>
  

<br>

  <div id="div2" class="form" style="display:block;">
  <div class="col-sm-4">
 <label>Category:</label> <input id="cat" class="form-control" type="text" placeholder="insert new category">
 </div>
 <div class="col-sm-4">
 <label>SubCategory</label> <input id="sub"  class="form-control" type="text" placeholder="insert new Subcategory"></div><br>
 <Button class="btn btn-success" value="Submit" onclick="add()" >Submit
 
 </Button>
 
 </div>
 

</body>
</html>