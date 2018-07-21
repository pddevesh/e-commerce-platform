<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Filter by Subcategory and Color</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<script src="jquery-3.2.1.js"></script> 
</head>
<body>
<label for="price"><b>Student Name : Akash Shendge</b></label><br>
<label for="price"><b>Student Roll No: MT2017010</b></label><br>
<input type="text" class="form-control" placeholder="Subcategory" name="subcategory" id="subcategory"><br>
<input type="text" class="form-control" placeholder="Color" name="color" id="color"><br><br>
<button type="button" class="delete-row" onclick="fetchitem()">Fetch</button>
<button type="button" class="delete-row" onclick="nextpage()">Price Filter</button>
<div id="allp">
        <div class="row" id="bodyraw">
</div></div>
 <script>
function fetchitem()
{
alert("Hi");
var subcat = document.getElementById("subcategory").value;
var color = document.getElementById("color").value;
var uri="webapi/webservice/getItemsbysubcatcolor/";
uri=uri+subcat+'/'+color;
console.log("uri="+uri);
alert(uri);
$.ajax({ 
   type: "GET",
   dataType: "json",
   url: uri,
   success: function(data){
   var n=data.length;
   var strLinks='';
for(var i=0;i<n;i++){
var title= data[i].title;
var itemid = data[i].itemid;
var category=data[i].category;
var subcategory=data[i].subcategory;
var image1=data[i].image1;
var name=data[i].name;
var price = data[i].price;
var color = data[i].color;
strLinks += '<a href="ItemDetails.jsp?pid='+itemid+'"<div class="col-md-3 item"><div id="imagediv"><img class="img-responsive" src="'+image1+'" id="productimg"></div><h3 class="text-center">'+itemid+' </h3><h3 class="text-center">'+subcategory+' </h3><h3 class="text-center">'+color+' </h3><h3 class="text-center">'+price+' </h3> </div>';
document.getElementById("allp").innerHTML = strLinks;
}
   },
error: function(e) {
        console.log(e.message);
    }
});
}

</script>
<script>
function nextpage()
{
alert("next page");
var subcat = document.getElementById("subcategory").value;
var color = document.getElementById("color").value;
location.href="http://localhost:8080/akshay/pricefilter.jsp?subcat="+subcat+"&color="+color;

}
</script>
</body>
</html>