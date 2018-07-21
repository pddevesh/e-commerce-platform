<!DOCTYPE html>
<html>

<%! String dealspid;
int dealsqty;
int initialquantity;
int dealtype;
%>

<% 
dealspid=request.getParameter("dealspid");
//out.print(pid);
dealsqty=Integer.parseInt(request.getParameter("dealsqty"));
session.setAttribute("dealsqty",dealsqty);
initialquantity = (Integer)session.getAttribute("initialquantity");
dealtype=(Integer)session.getAttribute("dealtype");
int num = dealsqty / initialquantity;
//int totalquantity = (initialquantity+dealtype) * dealsqty;
int totalquantity = num + dealsqty;
session.setAttribute("totalquantity",totalquantity);
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
                                <td id="trdetails_purchasedquantity"></td>
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
                             <td id="trdetails_totalitems"></td>
                            </tr>
                               <tr id="trdetails2">
                                <td  id="trdetails_totalamount" ></td>
                            </tr>
                    
                    </table>
                          <button class="btn btn-default ppage" type="submit" onclick="myFunction()">Buy Now</button>
                   <script>
function myFunction() {
	 var d =document.getElementById("myTable").rows[1].cells[0].innerHTML;
      var res = d.split(":");
	 
    location.href="Dealcarddetail.jsp?dealspid=<%=dealspid%>&dealamount="+res[1];
   
}
</script>
        

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
var f="Offer:Buy 1 Get ";
var g="Discount : ";

var i="Total amount:";
var q ="Total Quantity including Offers:";
var y = "Purchased Quantity:"

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
f+=data.dealtype;
var userquantity = <%=request.getParameter("dealsqty")%>;
var initialquantity = <%=initialquantity%>;
var dealtype = <%=dealtype%>;
var dealquantity = initialquantity + dealtype;
//var totalquantity = userquantity * dealquantity;
var totalquantity =  <%=totalquantity%>;
if(totalquantity > ad)
	location.href="Error.jsp";


a+=color;
b+=brand;
c+=price;
d+=weight;
e+=warranty;
f+=used_fresh;
g+=discount;
q+=totalquantity;
y+=userquantity;

//discounted_price=price-price*0.01*discount;
var amount =price*userquantity;
 
i+=amount;
$("#pname").text(title);
$("#trdetails_color").text(a);
$("#trdetails_brand").text(b);
$("#trdetails_price").text(amount);
$("#trdetails_weight").text(d);
$("#trdetails_warranty").text(e);
$("#trdetails_usedfresh").text(f);


$("#trdetails_totalamount").text(i);
$("#trdetails_totalitems").text(q);
$("#trdetails_purchasedquantity").text(y);
$("#pimage").attr("src",image)
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