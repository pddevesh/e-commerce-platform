<!DOCTYPE html>
<html>

<%! 
 String name;
%>

<% 
name=(String)session.getAttribute("name");
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
	
     <jsp:include page="header.html" />
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
                                <td id="trdetailsamount"></td>
                            </tr>
                            <tr id="trdetails">
                                <td id="trdetailsquantity"></td>
                            </tr>
                            
                            <tr id="trdetails">
                                <td id="trdetailssellername"></td>
                            </tr>
                            <tr id="trdetails">
                                <td id="trdetailsname"></td>
                            </tr>
                            <tr id="trdetails">
                                <td  id="trdetailsemail"></td>
                            </tr>
                            <tr id="trdetails">
                                <td  id="trdetailsaddressline1"></td>
                            </tr>
                             <tr id="trdetails">
                                <td  id="trdetailsaddressline2"></td>
                            </tr>
                             <tr id="trdetails">
                                <td  id="trdetailsstate"></td>
                            </tr>
                             <tr id="trdetails">
                                <td  id="trdetailscity"></td>
                            </tr>
                             <tr id="trdetails">
                                <td  id="trdetailspostalcode"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-2" id="buy">
                
                    
                    <button class="btn btn-default ppage" type="button">Track Order</button>
                   <button class="btn btn-default ppage" type="submit">Check Status</button>
         
                   
                </div>
            </div>
        </div>
    </div>
    
    <script src="jquery-3.2.1.js"></script>  
    <script>
    $(document).ready(function(){
var k="<%=name%>";
var uri="webapi/webservice/getUserOrderDetails/";
console.log(k);
uri+=k;
console.log(uri);
$.ajax({ 
   type: "GET",
   dataType: "json",
   url: uri,
   success: function(data){
console.log(data);




var len = data.length;
for(var i=0;i<len;i++)
{
var addresscode = data[i].addressCode;
var name =  data[i].name;
 var email = data[i].email;
 var addressline1=data[i].address1;
 var addressline2=data[i].address2;
 var city=data[i].city;
 var state=data[i].state;
 var postalcode=data[i].postalcode;
 var itemid=data[i].itemid;
 var category=data[i].category;
 var subcategory=data[i].subcategory;
 var productid=data[i].productid;
 var title=data[i].title;
 var brand=data[i].brand;
 var color=data[i].color;
 var weight=data[i].weight;
 var price=data[i].price;
 var size=data[i].size;
 var quantity=data[i].quantity; 
 var warranty=data[i].warranty;
 var used_fresh=data[i].used_fresh;
 var discount=data[i].discount; 
 var image1=data[i].image1;
 var sellername=data[i].sellername; 
 var amount=data[i].amount;

 var a="Amount: ";
 var b="Quantity: ";
 var c="Sellername: ";
 var d="Buyername: ";
 var e="Buyeremail: ";
 var f="Addressline1: ";
 var h="Addressline2: ";
 var i="City: ";
 var j="State: ";
 var k="Postalcode: ";
 
 a+=amount;
 b+=quantity;
 c+=sellername;
 d+=name;
 e+=email;
 f+=addressline1;
 h+=addressline2;
 i+=city;
 j+=state;
 k+=postalcode;
 

$("#pname").text(title);
$("#pimage").attr("src",image1);
$("#trdetailsamount").text(a);
$("#trdetailsquantity").text(b);
$("#trdetailssellername").text(c);
$("#trdetailsname").text(d);
$("#trdetailsemail").text(e);
$("#trdetailsaddressline1").text(f);
$("#trdetailsaddressline2").text(h);
$("#trdetailscity").text(i);
$("#trdetailsstate").text(j);
$("#trdetailsepostalcode").text(k);
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

