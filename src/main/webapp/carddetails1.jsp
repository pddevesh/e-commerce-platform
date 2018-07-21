<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
<!DOCTYPE html>

<html>

<%! String pqid;
String p;
String amount;
String name;
String q;
String am;
%>

<% 
pqid=(String)request.getParameter("pqid");
System.out.println(pqid);
//out.print(pid);
String[] ids=pqid.split("A");
System.out.println(ids.length);
String[] pids=ids[0].split("B");
System.out.println(pids.length);
String[] qids=ids[1].split("B");
System.out.println(qids.length);
String[] prices= ids[2].split("B");


System.out.println(prices);
amount=request.getParameter("amount");
System.out.println("From CardDetails:"+amount);
name =(String)session.getAttribute("name");

session.setAttribute("amount",amount);
 p=(String)session.getAttribute("productid"); 
//am =(String)session.getAttribute("amount"); 


%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter  Card Details</title>
   <!--   <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="assets/css/styles2.css">
    <link rel="stylesheet" href="assets/css/untitled.css">
</head>
 <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
  
 function myFunction()
 {
	// alert("hello");
	 var na='<%=name%>';
	 
		var amount ='<%=amount%>';
		
		 var uri='webapi/webservice/getaccountinfo/';
		 uri+=na+"/"+amount;
		 
		 console.log(uri);
	//	 alert("before post");
		  $.get(uri,
				    {
				        name:na,
				        amount:amount
				    },
				    function(data, status){
				    	
				      //  alert("Data: " + data + "\nStatus: " + status);
				        
				        if(status==="success")
			              {    
				        //	alert("me under aa gaya");

				              var t= '<%= pids.length%>';
				 					var e=parseInt(t);
				 					var pids=[];
				 					var qids=[];
				 					var prices=[];
				 				<% for (int i=0;i<pids.length;i++){
				 						
					 					
					 					%>
					 					pids.push('<%= pids[i]%>');
					 					 qids.push('<%= qids[i]%>');
					 					 prices.push('<%= prices[i]%>');
					 					
					 				<%
					 					}
					 					
					 					%>
					 					
				 					
				 					
				 					 for(var i=0;i<e;i++) {   
				 						 var uri='webapi/webservice/putTxDetails/';
				 		            	 console.log(uri);
				 		            	
				 		            	//alert(""+i+"");
				 		            	 var rt=pids[i];
				 		            	 var qu=qids[i];
				 		            	 var p=prices[i];
				 		            	var qu1=parseInt(qu);
				 		            	var p1=parseInt(p)*qu1;
				 		            	 uri+=na+"/"+ rt +"/"+qu+"/"+p1;
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
						 		                    	
						 		                    	 alert(data.successful);
						 		                         console.log('Submission was successful.');
						 		                        
						 		                      
						 		                         
						 		                     },
						 		                     error: function (data) {
						 		                         console.log('An error occurred.');
						 		                         console.log(data);
						 		                         alert("error");
						 		                      
						 		                     },
						 		                 });
						 		            	  
						 		           }
				             			
				            	 
				            	 var uri='webapi/webservice/updateBankDetails/';
				            	 console.log(uri);
				            	 uri+=na+"/"+amount;
				            	// uri+=p;
				            	// uri+=qu;
				            	 //uri+=am;
				            	 console.log(uri);
				            	 
				            			console.log("Hello welcome to bank table");
				            	      
				            	 $.ajax({
				            		   type: "GET",
				            		   dataType: "json",
				            		   url: uri,
				                     success: function (data) {
				                    	
				                    	// alert(data.successful);
				                         console.log('Update Bank table successful.');
				                        
				                         
				                     },
				                     error: function (data) {
				                         console.log('Failed to update Bank table');
				                         console.log(data);
				                         alert("error");
				                     },
				                 });
				            	 // alert("hi paymentsuccess");
				            	  window.location="paymentsuccess1.jsp?pids="+'<%= ids[0]%>';
				             console.log(data); 
			            
			              }
				        else
		            	 {
		            	 window.location="paymentfail1.jsp?pids="+'<%= ids[0]%>';
		                 console.log(data);
		            	 }
		           
		         });
			    
         	
 }
 </script>
    
<body style="margin-top:13%;">
	
     <jsp:include page="headerwithname.jsp" />
    <center>

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
   <button name="submit" onclick="myFunction()">Submit</button>
   
  </fieldset>
    

</center>



   
</body>

</html>