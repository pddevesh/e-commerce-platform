<!DOCTYPE html>
<html>

<%! String dealspid;
String amount;
%>

<% 
dealspid=request.getParameter("dealspid");

%>
  <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
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
    <center>
    <form id="signup">
    <h1>Payment Successful</h1>
 <button  onclick="myFunction()">Select Address</button>
 <script>
function myFunction() {
	var frm = $('#signup');

    frm.submit(function (e) {
		
        e.preventDefault();

	 console.log("UserAdd");
	  window.location.href ="Dealaddresspage.jsp?dealspid=<%=dealspid%>";
    });
}  
</script>
<button  onclick="mBack()" >Back</button>
<script>
function mBack() {
	
		var frm = $('#signup');

	    frm.submit(function (e) {
			
	        e.preventDefault();
	
	  window.location.href ="DealDetails.jsp?dealspid=<%=dealspid%>";
	    });
} 
</script>
 
</form>
</center>

  

  
</body>

</html>