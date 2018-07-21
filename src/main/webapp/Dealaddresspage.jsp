<!DOCTYPE html>
<html>

<%! String dealspid;
String name;
%>

<% 

//out.print(pid);
name =(String)session.getAttribute("name");
dealspid =request.getParameter("dealspid");
%>
<script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>demo1</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
   <jsp:include page="headerwithname.jsp" />
<body style="margin-top:13%;">

<center>
    <div>
        <button onClick="myFunction()" >Select New Address</button>
        </div>
       </center>

<div >
    <div id="allp" >
        <div class="row" id="bodyraw" >
      
<script src="jquery-3.2.1.js"></script> 
<script>
$(document).ready(function(){
	
	var na = '<%=name%>';
	
	 var uri='webapi/webservice/getAllAddress/';
	 console.log(uri); 
	 uri+=na;
	 
	 console.log(uri);
	
			console.log("Hello");
	       
	        $.ajaxSetup({async:false});
	 $.ajax({
		   type: "GET",
		   dataType: "json",
		   url: uri,
         success: function (data) {
             console.log('Submission was successful.');
            // alert("success");
             var n=data.length;
             var strLinks='';
             console.log(n);
             console.log(data);
             console.log(data[0].email);
             console.log(data[0].addressCode);
          for(var i=0;i<n;i++){
        	  var addresscode = data[i].addressCode;
          var email= data[i].email;
          var address1 = data[i].address1;
          var address2=data[i].address2;
          var city=data[i].city;
          var state=data[i].state;
          var postalcode = data[i].postalcode;
       
          strLinks +='"<div style="border:1px solid black; text-align:center;" class="col-md-3 item"><h6 class="text-center">'+email+' </h6><h6 class="text-center">'+address1+' </h6><h6 class="text-center">'+address2+' </h6><h6 class="text-center">'+city+' </h6><h6 class="text-center">'+state+' </h6><h6 class="text-center">'+postalcode+' </h6> <button  class="text-center" style="font-size:20px;" onclick="myFinal(\'' + addresscode + '\')">Continue</button></div>';
      
          console.log(state);
          document.getElementById("allp").innerHTML = strLinks;
          }      
         },
         error: function (data) {
             console.log('An error occurred.');
             console.log(data);
             alert("error");
         }
     });
	   
});

</script>

 

        </div>    
        </div>
        
    </div>
    
      <script>
      
function myFinal(addressCode) {
	var addd='<%=name%>';
	 var uri='webapi/webservice/updateTxDetails/';
	 console.log(uri);
	 uri+=addd+'/'+addressCode;
	 console.log(uri);
	 
		console.log("Hello");
	      
	 $.ajax({
		   type: "GET",
		   dataType: "json",
		   url: uri,
         success: function (data) {
         console.log('Submission was successful.');
            },
         error: function (data) {
             console.log('An error occurred.');
             console.log(data);
             alert("error");
         },
     });
console.log("Final Status");
       var u ="Dealfinalstatus.jsp?addresscode="+addressCode;
	 console.log(u);
       window.location.href =u;
     
}  
</script>
       
         <script>
function myFunction() {
	
	 console.log("Select New Address");
	  window.location.href ="Dealaddressform.jsp";
    

}
</script>
        
</body>

</html>