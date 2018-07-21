<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!
String name;
%>
<%
name =(String)session.getAttribute("name");
%>
<head>
<jsp:include page="headerwithname.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Status</title>
<link rel="stylesheet" href="assets/css/styles2.css">
<script src="jquery-3.2.1.js"></script>

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <style>
    /* Rating Star Widgets Style */
.rating-stars ul {
  list-style-type:none;
  padding:0;
  
  -moz-user-select:none;
  -webkit-user-select:none;
}
.rating-stars ul > li.star {
  display:inline-block;
  
}

/* Idle State of the stars */
.rating-stars ul > li.star > i.fa {
  font-size:2em; /* Change the size of the stars */
  color:#ccc; /* Color on idle state */
}

/* Hover state of the stars */
.rating-stars ul > li.star.hover > i.fa {
  color:#FFCC36;
}

/* Selected state of the stars */
.rating-stars ul > li.star.selected > i.fa {
  color:#FF912C;
}
    </style>

</head>
<body style="margin-top:13%;">
<form id="changestatus">
	<div class="container">
     	<label for="Choose Product"><b>Product Title</b></label>
  	 	<select name="itemid"  id="itemid" class="form-control" onchange="displaydetails()">
  	 	</select><br><br>
  	 	
  	 	<label for="Choose Product"><b>Status</b></label>
  	 	<select name="status"  id="status" class="form-control">
  	 	</select><br><br>
  	 	
  	 	<h4 style="float:left;margin:0">Ratings: </h4>
                                
										  <!-- Rating Stars Box -->
										  <div class='rating-stars text-center' style="float:left;margin:0" >
										  
										    <ul id='stars' >
										      <li class='star' title='Poor' data-value='1' >
										        <i class='fa fa-star fa-fw'></i>
										      </li>
										      <li class='star' title='Fair' data-value='2'>
										        <i class='fa fa-star fa-fw'></i>
										      </li>
										      <li class='star' title='Good' data-value='3'>
										        <i class='fa fa-star fa-fw'></i>
										      </li>
										      <li class='star' title='Excellent' data-value='4'>
										        <i class='fa fa-star fa-fw'></i>
										      </li>
										      <li class='star' title='WOW!!!' data-value='5'>
										        <i class='fa fa-star fa-fw'></i>
										      </li>
										    </ul>
										  </div><br><br>
  	 	
  	 	 <button type="button" class="delete-row" onClick="updateItem()" style="margin-top:10px;">Update Status</button><br><br>
	</div>
</form>
</body>
</html>

<script>
var dt={};
var ratingValue=0;
$(document).ready(function(){
    var k ="<%=session.getAttribute("name") %>";
    var uri="webapi/webservice/loadItembyBuyer/";
    //console.log(k);
    var select = document.getElementById("itemid");
	var option = document.createElement('option');
	option.text = option.value = "Select Item";
	select.appendChild(option);
    uri+=k;
    alert(uri);
    //var val = document.getElementById("itemid").value;
     $('#stars li').on('mouseover', function(){
    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
   
    // Now highlight all the stars that's not after the current hovered star
    $(this).parent().children('li.star').each(function(e){
      if (e < onStar) {
        $(this).addClass('hover');
      }
      else {
        $(this).removeClass('hover');
      }
    });
    
  }).on('mouseout', function(){
    $(this).parent().children('li.star').each(function(e){
      $(this).removeClass('hover');
    });
  });
  
  
  /* 2. Action to perform on click */
  $('#stars li').on('click', function(){
    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
    var stars = $(this).parent().children('li.star');
    
    for (i = 0; i < stars.length; i++) {
      $(stars[i]).removeClass('selected');
    }
    
    for (i = 0; i < onStar; i++) {
      $(stars[i]).addClass('selected');
    }
    
    // JUST RESPONSE (Not needed)
    ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
    var msg = "";
    if (ratingValue > 1) {
        msg = "Thanks! You rated this " + ratingValue + " stars.";
    }
    else {
        msg = "We will improve ourselves. You rated this " + ratingValue + " stars.";
    }
    //responseMessage(msg);
    alert(msg);
  });
  
    
     
    $.ajax({ 
    	   type: "GET",
    	   dataType: "json",
    	   url: uri,
    	   success: function(data){
    		   var n = data.length;
    		    dt=data;
    		   for(var i=0;i<n;i++)
    		   {
			    	var select = document.getElementById("itemid");
					var option = document.createElement('option');
		        	option.text = option.value = data[i].title;
		        	alert(data[i].title);
		        	select.appendChild(option);
    		   } 
    	   },
    	error: function(e) {
    	        console.log(e.message);
    	    }
    	});
});

function displaydetails()
{
	var k ="<%=session.getAttribute("name") %>";
	var title = document.getElementById("itemid").value;
	var n = dt.length;
	var m;
	for(var i=0;i<n;i++)
	{
		var lc = dt[i].title;
		if(lc === title)
			m = dt[i].itemid;
	}
	var c = document.getElementById("status");	
	for(i=c.options.length-1;i>=0;i--)
		c.remove(i);
	
	var uri="webapi/webservice/getStatus/";
	uri=uri+k+"/"+m;
	//alert(uri);
	$.ajax({ 
 	   type: "GET",
 	   dataType: "json",
 	   url: uri,
 	   success: function(data){
 		  var status = document.getElementById("status");
 		  var option = document.createElement('option');
     	  option.text = option.value = data.status;
     	  //alert(data[i].title);
     	  status.appendChild(option);
     	  
     	// var status = document.getElementById("status");
   	  var option1 = document.createElement('option');
   	  option1.text = option1.value = "Item Received";
   	  //alert(data[i].title);
   	  status.appendChild(option1);
     	  
 	  },
  	error: function(e) {
  	        console.log(e.message);
  	    }
  	});
}

function updateItem()
{
	var uri="webapi/webservice/updateStatus/";
	var k ="<%=session.getAttribute("name") %>";
	var title = document.getElementById("itemid").value;

	var n = dt.length;
	var m;
	for(var i=0;i<n;i++)
	{
		var lc = dt[i].title;
		if(lc === title)
			m = dt[i].itemid;
	}
	var x="Item Received";
	//alert("Rating:"+ratingValue);
	uri=uri+k+"/"+m+"/"+x+"/"+ratingValue;
	//alert(uri);
	
	$.ajaxSetup({async:false});
	$.ajax({ 
	 	   type: "GET",
	 	   dataType: "json",
	 	   url: uri,
	 	   success: function(data){
	 		   if(data.numrows == 1)
	 			   alert("Status updated successfully");
	 		   	   var uri1 ="webapi/webservice/transferToSeller/";
	 		   	   uri1=uri1+k+"/"+m;
	 		   	   //alert(uri1);
	 		   	$.ajax({ 
	 		 	   type: "GET",
	 		 	   dataType: "json",
	 		 	   url: uri1,
	 		 	   success: function(data){
	 		 		  	   if(data.numrows == 1)
	 		 		  		   alert("Payment Transaction Successful");
	 	   },
	 	  error: function(e) {
	  	        console.log(e.message);
	  	    }
	});
	 	   },
	error: function(e) {
	        console.log(e.message);
	    }
	 });
}

</script>

