<!DOCTYPE html>
<html>

<%! String pid;
String qu;
String name;
%>

<%
name =(String)session.getAttribute("name");
pid=request.getParameter("pid");
//out.print(pid);
qu=request.getParameter("qty");
System.out.println("Buy now = "+pid);
session.setAttribute("productid",pid);
session.setAttribute("quantity",qu);


//int p = Integer.parseInt(pid);
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>demo1</title>
  <!--   <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"> --> 
    <link rel="stylesheet" href="assets/css/styles2.css">
    <link rel="stylesheet" href="assets/css/untitled.css">
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
                                <td id="trdetails_color"></td>
                            </tr>
                            <tr id="trdetails">
                                <td id="trdetails_brand"></td>
                            </tr>
                           <tr id="trdetails">
                                <td id="trdetails_quantity"></td>
                            </tr>
                            
                           <!--    
                            <tr id="trdetails">
                                <td id="trdetails_weight"></td>
                            </tr>
                            
                            <tr id="trdetails">
                                <td id="trdetails_warrenty"></td>
                            </tr>
                            <tr id="trdetails">
                                <td  id="trdetails_usedfresh"></td>
                            </tr>
                             
                            <tr id="trdetails">
                                <td  id="trdetails_discount"></td>
                            </tr>
                            -->
                            <tr id="trdetails">
                                <td  id="trdetails8"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-2" id="buy">
                
                <div class="buy">
                    <table class="table" id="myTable">
                    
                        
                          <tr id="trdetails1">
                             <td id="trdetails_price"></td>
                            </tr>
                            
                             <tr id="trdetails1">
                                <td  id="trdetails_discount"></td>
                            </tr>
                               <tr id="trdetails2">
                                <td  id="trdetails_totalamount" ></td>
                            </tr>
                    
                    </table>
                          <button class="btn btn-default ppage" type="submit" onclick="myFunction()">Buy Now</button>
                   <script>
function myFunction() {
	var na='<%=name%>';
	 //alert(na);
	var d =document.getElementById("myTable").rows[0].cells[0].innerHTML;
    var res = d.split(":");
	 //alert(res);
	 var quantity = <%=request.getParameter("qty")%>;
	 var pay = res[1]*quantity;
	 //alert(pay);
  
  
  var d1 =document.getElementById("myTable").rows[2].cells[0].innerHTML;
  var res1 = d1.split(":");
  
  var disc_amount = res1[1];
  //alert(disc_amount);
 var balance = pay - disc_amount;
 //alert(balance);
 
 
 
 //update wallet
 
 var xhttp = new XMLHttpRequest();
	 var email = '<%=name%>';
	 //alert(email);
	 //var balance = document.getElementById("amount")
	//alert("inside");
	 alert(balance);
	  xhttp.open("GET", "webapi/webservice/addMoney/"+email+"/"+balance, true);
	  //alert(this.responseText);
	  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    	alert("add Money Success");
		      //document.getElementById("balance").innerHTML = this.responseText;
		    }
		  };
	  xhttp.send();
	  
      if(na != "null")
	  location.href="carddetails.jsp?pid=<%=pid%>&amount="+pay;
	  else
		  location.href="amazonlogin.jsp";
 
   
}
</script>
        

                </div>
            </div>
        </div>
    </div>
   

    
    <script src="jquery-3.2.1.js"></script>  
    <script>
    $(document).ready(function(){
var k="<%=pid%>";
var uri="webapi/webservice/getItemDetails/";
console.log(k);
uri+=k;
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
var f="Used/Fresh: ";
var g="Discount : ";

var i="Total amount:";
var q ="Quantity:";

var discounted_price="";
var color=data.color;
var brand=data.brand;
var price=data.price;
var image=data.image1;
var weight=data.weight;
var warranty=data.warranty;
var used_fresh=data.used_fresh;
var discount=data.discount;
var ad = data.quantity;
var quantity = <%=request.getParameter("qty")%>;


if(quantity > ad)
	location.href="Error.jsp";


a+=color;
b+=brand;
c+=price;
d+=weight;
e+=warranty;
f+=used_fresh;
g+=discount;
q+=quantity;
if(discount > 0)
{
discounted_price=price-price*0.01*discount;
var amount =(discounted_price)*quantity;
}
else
	var amount =price*quantity;
 
i+=amount;
$("#pname").text(title);
if(data.color == "NA")
	$("#trdetails_color").hide();
else
	$("#trdetails_color").text(a);
$("#trdetails_brand").text(b);
$("#trdetails_price").text(c);
$("#trdetails_weight").text(d);
$("#trdetails_warranty").text(e);
$("#trdetails_usedfresh").text(f);
if(discount > 0)
	$("#trdetails_discount").text(g+"%");
else
	$("#trdetails_discount").hide();

$("#trdetails_totalamount").text(i);
$("#trdetails_quantity").text(q);

$("#pimage").attr("src",image);
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