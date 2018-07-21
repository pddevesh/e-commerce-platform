<!DOCTYPE html>
<html>

<%! String pid;
String p;
String amount;
String name;
String q;
String am;
%>

<% 
pid=request.getParameter("pid");
//out.print(pid);
amount=request.getParameter("amount");
System.out.println("From CardDetails:"+amount);
name =(String)session.getAttribute("name");
q=(String)session.getAttribute("quantity");
session.setAttribute("amount",amount);
 p=(String)session.getAttribute("productid"); 
//am =(String)session.getAttribute("amount"); 


%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>demo1</title>
   <!--   <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="assets/css/styles2.css">
    <link rel="stylesheet" href="assets/css/untitled.css">
</head>
 <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
<body style="margin-top:13%;">
	
     <jsp:include page="headerwithname.jsp" />
    <center>
    <form id="signup">
    
  <fieldset>
  <legend>Card information:</legend>
    Card Owner Name:
    <input type="text" name="info" id="Name"/></br></br>
   
    Card number:
    <input type="text" name="cardnumber" /></br></br>
   Expiry Month:
  <select name='Month' id='dayddl'>
<option value='1'>1</option>
<option value='2'>2</option>
<option value='3'>3</option>
<option value='4'>4</option>
<option value='5'>5</option>
<option value='6'>6</option>
<option value='7'>7</option>
<option value='8'>8</option>
<option value='9'>9</option>
<option value='10'>10</option>
<option value='11'>11</option>
<option value='12'>12</option>
</select>
Expiry Year:
 <select name='year' id='day11'>
<option value='1'>2018</option>
<option value='2'>2019</option>
<option value='3'>2020</option>
<option value='4'>2021</option>
<option value='5'>2022</option>
<option value='6'>2023</option>
<option value='7'>2024</option>
<option value='8'>2025</option>
<option value='9'>2026</option>
<option value='10'>2027</option>
<option value='11'>2028</option>
<option value='12'>2029</option>
</select><br><br>
  Card CVC number:
    <input type="text" name="cardnumber1" ></br></br></br>
   <button name="submit" onClick="myFunction()">Submit</button>
    <script type="text/javascript">
 function myFunction()
 {
	 var na='<%=name%>';
	 var qu ='<%=q%>';
	var amount ='<%=amount%>';
	 var p = '<%=p%>';
	 var uri='webapi/webservice/getaccountinfo/';
	 console.log(uri); 
	 uri+=na+"/"+amount;
	 
	 console.log(uri);
	 var frm = $('#signup');

	    frm.submit(function (e) {
			console.log("Hello");
	        e.preventDefault();
	        $.ajaxSetup({async:false});
	 $.ajax({
		   type: "GET",
		   dataType: "json",
		   url: uri,
         success: function (data) {
        	
        	 //alert(data.successful);
             console.log('Submission was successful.');
             var n=data.successful;
             
             if(n==="1")
             { 

                       	 
            	 var uri='webapi/webservice/putTxDetails/';
            	 console.log(uri);
            	 uri+=na+"/"+p+"/"+qu+"/"+amount;
            	// uri+=p;
            	// uri+=qu;
            	 //uri+=am;
            	 console.log(uri);
            	 
            			console.log("Hello");
            	      
            	 $.ajax({
            		   type: "GET",
            		   dataType: "json",
            		   url: uri,
                     success: function (data) {
                    	
                    	 //alert(data.successful);
                         console.log('Submission was successful.');
                        
                         
                         
                     },
                     error: function (data) {
                         console.log('An error occurred.');
                         console.log(data);
                         alert("error");
                     },
                 });
            	  
               	 
            	 
            	 var uri='webapi/webservice/updateBankDetails/';
            	 console.log(uri);
            	 uri+=na+"/"+amount;
            	// uri+=p;
            	// uri+=qu;
            	 //uri+=am;
            	 console.log(uri);
            	 
            			console.log("Hello welcom to bank table");
            	      
            	 $.ajax({
            		   type: "GET",
            		   dataType: "json",
            		   url: uri,
                     success: function (data) {
                    	
                    	 //alert(data.successful);
                         console.log('Update Bank table successful.');
                        
                         
                         
                     },
                     error: function (data) {
                         console.log('Failed to update Bank table');
                         console.log(data);
                         alert("error");
                     },
                 });
            	  
            	  window.location="PaymentSuccess.jsp?pid=<%=pid%>";
             console.log(data);
             }
             else
            	 {
            	 window.location="PaymentFail.jsp?pid=<%=pid%>";
                 console.log(data);
            	 }
         },
         error: function (data) {
             console.log('An error occurred.');
             console.log(data);
             alert("error");
         },
     });
	    });
 }
 </script>
  </fieldset>
    
</form>
</center>



   
</body>

</html>