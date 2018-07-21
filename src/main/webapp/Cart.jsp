<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>My Cart</title>
    <link rel="stylesheet" href="assets/css/styles.css">
 	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
</head>
<jsp:include page="headerwithname.jsp" />
<%
String email;
email =(String)session.getAttribute("name");
//System.out.println(email+ "jaan le lo");
%>

<body style="margin-top:13%;" id="mainbody">

    <div id="allp">
        <div class="row" id="bodyraw">
<script src="jquery-3.2.1.js"></script> 
<script>
var pids="";
var qids="";
var worths="";
var total=parseInt(0);
var dt={};
$(document).ready(function(){
	var na='<%=email%>';
	
	
var uri="webapi/webservice/getCartItems/";
uri+=na;
console.log("uri="+uri);
$.ajax({ 
   type: "GET",
   dataType: "json",
   url: uri,
   success: function(data){
   var n=data.length;
   var strLinks='';
   dt=data;
for(var i=0;i<n;i++){
	
var title= data[i].title;
var itemid = data[i].itemid;
var category=data[i].category;
var image1=data[i].image1;
var name=data[i].name;
var qty=data[i].att2;
var dis=data[i].discount;
var price = data[i].price-data[i].price*0.01*dis;
var addresscode=data[i].att1;
//alert(qty);
if(i==n-1){
	pids=pids+itemid;
}else{pids=pids+itemid+"B";}

if(i==n-1){
	qids=qids+qty;
}else{qids=qids+qty+"B";}

if(i==n-1){
	worths=worths+price;
}else{worths=worths+price+"B";}

	
total=(parseInt(price)*parseInt(qty))+parseInt(total);

strLinks += '<a href="ItemDetails.jsp?pid='+itemid+'"><div  class="col-md-3 item"><div id="imagediv"><img class="img-responsive" src="'+image1+'" id="productimg"></div><h3 class="text-center">'+title+' </h3><h3 class="text-center">Price: Rs.'+price+'/- </h3><h3 class="text-center">Quantity: '+qty+' </h3>  </a>   <button onclick="myFinal(\'' + itemid + '\')">Delete</button><input type="text" value="'+qty+'"  onchange="myFinal1(\'' + addresscode + '\')" id="'+addresscode+'" ></div>';


document.getElementById("allp").innerHTML = strLinks;
//document.getElementById("s2").value=itemid;
//document.getElementById("s3").value=price;

	
//alert(document.getElementById(addresscode).value);
}



//alert(pids);
//alert(qids)
//var vat = total * 0.04;
document.getElementById("total").value =""+total;
//document.getElementById("vat").value=""+vat;
   },
error: function(e) {
        console.log(e.message);
    }
});	
});


</script>
<script>
function myFinal1(addresscode) {
	var addd='<%=email%>';
	//alert("hello");
	var qty=document.getElementById(addresscode).value;
	 var uri='webapi/webservice/updateqtyCartItems/';
	 console.log(uri);
	 uri+=addresscode+"/"+qty;
	 console.log(uri);
	 
		console.log("Hello");
	      
	 $.ajax({
		   type: "GET",
		   dataType: "json",
		   url: uri,
         success: function (data) {
         console.log('Submission was successful.');
         location.replace("http://localhost:8080/akshay/Cart.jsp");
            },
         error: function (data) {
             console.log('An error occurred.');
             console.log(data);
             alert("error");
         },
     });

     
}  

</script>
<script>
function myFinal(itemid) {
	var addd='<%=email%>';
	 var uri='webapi/webservice/removeCartItems/';
	 console.log(uri);
	 uri+=itemid+'/'+addd;
	 console.log(uri);
	 
		console.log("Hello");
	      
	 $.ajax({
		   type: "GET",
		   dataType: "json",
		   url: uri,
         success: function (data) {
         console.log('Submission was successful.');
         location.replace("http://localhost:8080/akshay/Cart.jsp");
            },
         error: function (data) {
             console.log('An error occurred.');
             console.log(data);
             alert("error");
         },
     });

     
}  



</script>
<!--  <script>
$(document).ready(function(){
	var hello="Hello,";
	var k=$(name);
	alert(k);
	hello+=k;
	if(k!=){
		$("check").text(hello);
	}
		
});
</script> -->
            
    </div>
    </div>
     <input type="text" id="total" placeholder="Total amount"  readonly></input>
   <!--    <input type="text" id="vat" placeholder="VAT amount"  readonly></input> -->
        <div class="buy">
                 
                          <button class="btn btn-default ppage"  onclick="myFunction()">Proceed to Checkout</button>
                        <!--     <button class="btn btn-default ppage"  onclick="myExam31()">Exam 03/Q1</button>
                          <button class="btn btn-default ppage"  onclick="myExam32()">Exam 03/Q2</button>
                          <button class="btn btn-default ppage"  onclick="myExam33()">Exam 03/Q3</button>
                          <button class="btn btn-default ppage"  onclick="myHome()">Home</button> -->
                   <script>
function myFunction() {
	
	 var t= pids.concat("A");
	 t= t.concat(qids);
	 t=t.concat("A");
	 t=t.concat(worths);
	 //alert(t);
	// alert(total);
	// alert("http://localhost:8080/akshay/justademo.jsp?pqid="+t+"&amount="+total);
    location.href="http://localhost:8080/akshay/carddetails1.jsp?pqid="+t+"&amount="+total;
   
}

function myHome()
{
	location.href="NewFile.jsp";
}

function myExam32()
{
	location.href="comparison.jsp?pid="+pids;	
}

function myExam31()
{
	location.href="abhishek.jsp?pid="+pids;	
}

function myExam33()
{
	location.href="sellertable.jsp?pid="+pids;	
}
</script> 
        

                </div>
    
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
