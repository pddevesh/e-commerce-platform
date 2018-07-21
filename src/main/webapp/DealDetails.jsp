<!DOCTYPE html>
<html>

<%! String dealspid;
    int initialquantity;
	int dealtype;
 
%>

<% 
dealspid=request.getParameter("dealspid");
initialquantity = Integer.parseInt(request.getParameter("initialquantity"));
dealtype=Integer.parseInt(request.getParameter("dealtype"));
session.setAttribute("dealspid",dealspid);
session.setAttribute("initialquantity",initialquantity);
session.setAttribute("dealtype",dealtype);
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>demo1</title>
    <link rel="stylesheet" href="assets/css/styles2.css">
    <link rel="stylesheet" href="assets/css/untitled.css">
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
	
     <jsp:include page="headerwithname.jsp" />
    <div id="allp">
        <div class="row" id="bodyraw">
            <div class="col-md-4"><img src="assets/img/p3.jp" id="pimage"></div>
            <div class="col-md-5" id="details">
                <div class="table-responsive" id="details1">
                    <table class="table">
                        <thead>
                            <tr>
                                <th id="pname"></th>
                            </tr>
                        </thead>
                        <tbody>
                        	<tr id="trdetails">
                                <td id="ratings"><h4 style="float:left">Ratings:</h4>
                                
										  <!-- Rating Stars Box -->
										  <div class='rating-stars text-center' style="float:left;margin:0" >
										    <ul id='stars' >
										      <li class='star' title='Poor' data-value='1'>
										        <i class='fa fa-star fa-fw' id="s1"></i>
										      </li>
										      <li class='star' title='Fair' data-value='2'>
										        <i class='fa fa-star fa-fw' id="s2"></i>
										      </li>
										      <li class='star' title='Good' data-value='3'>
										        <i class='fa fa-star fa-fw' id="s3"></i>
										      </li>
										      <li class='star' title='Excellent' data-value='4'>
										        <i class='fa fa-star fa-fw' id="s4"></i>
										      </li>
										      <li class='star' title='WOW!!!' data-value='5'>
										        <i class='fa fa-star fa-fw' id="s5"></i>
										      </li>
										    </ul>
										  </div>
                                </td>
                            
                            </tr>
                        
                        	<tr id="trdetails">
                                <td id="trdetails21"></td>
                            </tr>
                            
                            <tr id="trdetails">
                                <td id="trdetails22"></td>
                            </tr>
                            
                            <tr id="trdetails">
                                <td id="trdetails1"></td>
                            </tr>
                            <tr id="trdetails">
                                <td id="trdetails2"></td>
                            </tr>
                            <tr id="trdetails">
                                <td id="trdetails10">Price: <del id="trdetails7"></del>   <ins id="trdetails9"></ins> <ins id="trdetails12"></ins></td>
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
                                <td  id="trdetails8"></td>
                            </tr>
                            
                             <tr id="trdetails">
                                <td  id="trdetails23"></td>
                            </tr>
                             <tr id="trdetails">
                                <td  id="trdetails24"></td>
                            </tr>
                            <tr id="trdetails">
                                <td  id="trdetails20"></td>
                            </tr>
                            
                            <tr id="trdetails">
                                <td  id="trdetails9"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-2" id="buy">
              <!--    <div class="radio" id="we">
                    <label>
                        <input type="radio">With Exchange</label>
                </div>
                <div class="buy">
                    <div class="radio" id="wth">
                        <label>
                            <input type="radio">Without Exchange</label>
                    </div> -->
                     Quantity:
                         <input type="text" name="quantity" id="dealsqty">
                        <br>
       
                   
                    <button class="btn btn-default ppage" type="button">Add to Cart</button>
                   <button class="btn btn-default ppage" type="submit" onclick="myFunction()">Buy Now</button>
                   <script>
function myFunction() {
	
	 location.href="Dealnow.jsp?dealspid=<%=dealspid%>&dealsqty="+ document.getElementById("dealsqty").value;;
   
	 
}
</script>
                   
                    <button class="btn btn-default" type="button" id="wl">Add to WishList</button>
                </div>
            </div>
        </div>
    </div>
    
    <script src="jquery-3.2.1.js"></script>  
    <script>
    $(document).ready(function(){
var k="<%=dealspid%>";
var uri="webapi/webservice/getDealDetails/";
console.log(k);
uri+=k;
console.log(uri);
$.ajax({ 
   type: "GET",
   dataType: "json",
   url: uri,
   success: function(data){
var title=data.title;
var a="Color: ";
var b="Brand: ";
var c="Price: ";
var d="Weight: ";
var e="Warranty: ";
//var f="Offer:Buy 1 Get ";
var g;
var n="Seller: ";
var z = "Seller Rating: ";
var o = "Deal ID: ";
var p ="Item ID: ";
var q ="Sum Rating: "
var r = "Count: "
var color=data.color;
var brand=data.brand;
var price=data.price;
var image=data.image1;
var weight=data.weight;
var warranty=data.warranty;
var used_fresh=data.used_fresh;
var discount=data.discount;
var actualquantity = data.quantity;
var rating = data.avgrating;
var dealtype= data.dealtype;
alert(dealtype);
var sellername=data.sellername;
var initialquantity = <%=initialquantity%>;
var f="Offer: BUY "+initialquantity+" GET "+dealtype;
var totaldealquantity = dealtype + initialquantity;
var m=price-price*(discount/100);
var dealid=data.dealid;
var itemid=data.itemid;
var sum=data.sum;
var count=data.count;

o+=dealid;
p+=itemid;
q+=sum;
r+=count;
a+=color;
b+=brand;
c+=price;
d+=weight;
e+=warranty;
//f+=dealtype;
g+=m;
n+=sellername;
z+=rating;
var h = "("+discount+"% OFF)";
$("#pname").text(title);
if(data.color == "NA")
	$("#trdetails1").hide();
else
	$("#trdetails1").text(a);
$("#trdetails2").text(b);
if(weight=="NA")
	$("#trdetails4").hide();
else
	$("#trdetails4").text(d);
if(warranty=="NA")
	$("#trdetails5").hide();
else
	$("#trdetails4").text(e);

//$("#trdetails5").text(e);
$("#trdetails6").text(f);
$("#pimage").attr("src",image);
/*if(price>m){
	var x="Price: ";
$("#trdetails7").text(price);
$("#trdetails9").text(m);
$("#trdetails12").text(h);

}else{
	$("#trdetails10").text(c);
}*/
$("#trdetails10").text(c);
$("#trdetails8").text(n);
$("#trdetails20").text(z);
$("#trdetails21").text(o);
$("#trdetails22").text(p);
$("#trdetails23").text(q);
$("#trdetails24").text(r);
if(actualquantity > 0)
	$("#trdetails9").text("In Stock");
else
	$("#trdetails9").text("Out of Stock");
if(rating > 0)
{
	$("#s1").css("color", "#FF912C");
}
if(rating > 1)
{
	$("#s2").css("color", "#FF912C");
}
if(rating > 2)
{
	$("#s3").css("color", "#FF912C");
}
if(rating > 3)
{
	$("#s4").css("color", "#FF912C");
}
if(rating > 4)
{
	$("#s5").css("color", "#FF912C");
}
 },
error: function(e) {
        console.log(e.message);
    }
});
});
    </script> 
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>

