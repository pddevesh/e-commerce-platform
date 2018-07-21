<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Item</title>
<link rel="stylesheet" type="text/css" href="bootstrap.css" >
<jsp:include page="SellerDashboard.jsp" />
<script>
function myFunction()
{
    alert("Page is loaded");
    //$("color").val ("NA");
    //document.getElementById('color').value = 'NA';
    document.getElementById('weight').value = 'NA';
    document.getElementById('size').value = 'NA';
    document.getElementById('warranty').value = 'NA';
    document.getElementById('discount').value = '0';
    document.getElementById('description').value = 'NA';
    var select = document.getElementById("category");
	var option = document.createElement('option');
	option.text = option.value = "Select Category";
	select.appendChild(option);
	
    var xhr  = new XMLHttpRequest();
	xhr.open('GET',"webapi/webservice/loadcategory/", true);
	
	xhr.onreadystatechange = function () {
		
		if (xhr.readyState == 4 && xhr.status == 200)
		{
			var users = JSON.parse(xhr.responseText);
			for(i=0;i<users.length;i++)
			{
				//alert(users[i].category);
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
		
		var xhr1  = new XMLHttpRequest();
		xhr1.open('GET',"webapi/webservice/getColors/", true);
		
		xhr1.onreadystatechange = function () {
			
			if (xhr1.readyState == 4 && xhr1.status == 200)
			{
				var users = JSON.parse(xhr1.responseText);
				for(i=0;i<users.length;i++)
				{
					//alert(users[i].category);
					var select = document.getElementById("color");
					var option = document.createElement('option');
		        	option.text = option.value = users[i];
		        	select.appendChild(option);
				}	
			}
			else
			{
				//alert("error");
				//console.error(users);		
			}
		}
			xhr1.send();
}
</script>
</head>
<body onload="myFunction()">

<form action="http://localhost:8080/akshay/webapi/webservice/addItem/<%=session.getAttribute("sellername") %>" method="post">
<div class="container">
  <label for="Choose Category"><b>Category(*)</b></label>
  <select name="category"  id="category" class="form-control" onchange="showSubcategory()" required>
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
  <input type="text" placeholder="Product ID" class="form-control" name="pid" required>
  
  <label for="title"><b>Title(*)</b></label>
  <input type="text" placeholder="Title" class="form-control" name="title" required>
  
  <label for="brand"><b>Brand(*)</b></label>
  <input type="text" placeholder="Brand" class="form-control" name="brand" required>
  
  <label for="color"><b>Color</b></label>
  <select placeholder="Color" class="form-control" name="color" id="color"></select>
  
  <label for="weight"><b>Weight</b></label>
  <input type="text" placeholder="Weight" class="form-control" name="weight" id="weight">
  
  <label for="price"><b>Price(*)</b></label>
  <input type="text" placeholder="Price" class="form-control" name="price" required>
  
  <label for="size"><b>Size</b></label>
  <input type="text" placeholder="Size" class="form-control" name="size" id="size">
  
  <label for="quantity"><b>Quantity(*)</b></label>
  <input type="text" placeholder="Quantity" class="form-control" name="quantity" required>
  
  <label for="warrantyduration"><b>Warranty Duration</b></label>
  <input type="text" placeholder="Warranty Duration" class="form-control" name="warranty" id="warranty">
  
  <label for="Used_Fresh"><b>Used/Fresh(*)</b></label>
  <select name="used_fresh" class="form-control" required>
  	<option>Used</option>
  	<option>Fresh</option>
  </select>
  
  <label for="discount"><b>Discount</b></label>
  <input type="text" placeholder="Discount" class="form-control" name="discount" id="discount">
  
  <label for="Filter1"><b>Filter1(*)</b></label>
  <select name="filter1" class="form-control" required>
  	<option>RAM Size</option>
  	<option>Processor Speed</option>
  	<option>Hard-disk Size</option>
  	<option>Screen Size</option>
  	<option>Battery Capacity</option>
  	<option>Connectivity Technology</option>
  	<option>Display Technology</option>
  	<option>Number of HDMI Ports</option>
  	<option>Energy Star Rating</option>
  	<option>Room Size</option>
  	<option>Coil Material</option>
  	<option>Spin Speed</option>
  	<option>Capacity</option>
  </select><br>
  <input type="text" placeholder="Value1" class="form-control" name="value1" required>
  
  <label for="Filter2"><b>Filter(*)2</b></label>
  <select name="filter2" class="form-control" required>
  	<option>RAM Size</option>
  	<option>Processor Speed</option>
  	<option>Hard-disk Size</option>
  	<option>Screen Size</option>
  	<option>Battery Capacity</option>
  	<option>Connectivity Technology</option>
  	<option>Display Technology</option>
  	<option>Number of HDMI Ports</option>
  	<option>Energy Star Rating</option>
  	<option>Room Size</option>
  	<option>Coil Material</option>
  	<option>Spin Speed</option>
  	<option>Capacity</option>
  </select><br>
  <input type="text" placeholder="Value2" class="form-control" name="value2" required>
  
  <label for="Filter3"><b>Filter3(*)</b></label>
  <select name="filter3" class="form-control" required>
  	<option>RAM Size</option>
  	<option>Processor Speed</option>
  	<option>Hard-disk Size</option>
  	<option>Screen Size</option>
  	<option>Battery Capacity</option>
  	<option>Connectivity Technology</option>
  	<option>Display Technology</option>
  	<option>Number of HDMI Ports</option>
  	<option>Energy Star Rating</option>
  	<option>Room Size</option>
  	<option>Coil Material</option>
  	<option>Spin Speed</option>
  	<option>Capacity</option>
  </select><br>
  <input type="text" placeholder="Value3" class="form-control" name="value3" required>
  
  <label for="Description"><b>Description</b></label>
  <textarea class="form-control" name="description" value="null" id="description" rows="2"></textarea>
  
  <div class="clearfix">
      <input type="submit" title="Save"/><br><br>
        <input type="button" value="upload image" onclick="window.location.href='ItemImage.jsp'" />
    </div>
  
 </div>
</form>
</body>
</html>
<script>
function showSubcategory()
{
	var x = document.getElementById("category").value;	
	var c = document.getElementById("subcategory");
	
	for(i=c.options.length-1;i>=0;i--)
		c.remove(i);
	//alert(x);
	
	var url = "webapi/webservice/loadsubcategory/".concat(x);
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
}

</script>
    