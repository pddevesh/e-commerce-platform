<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String name;
%>

<%
name =(String)session.getAttribute("name");

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Amazon Pay Balance</title>
    <link rel="stylesheet" href="assets/css/styles.css">
 	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
</head>
<jsp:include page="headerwithname.jsp" />

<body style="margin-top:13%;" id="mainbody">

<img alt="Amazon Pay - Trusted and convenient way to pay" src="amazon_pay.jpg" height="100px" width="960px" title="Amazon Pay - Trusted and convenient way to pay">

<div class="container">
<div class="row">
<div class="col-sm-3">
<table class="table table-bordered">
    <thead >
      <tr>
        <th>Amazon Pay</th>
        <th>Balance</th>
       
      </tr>
    </thead>
    <tbody>
      <tr>
        <td >Money</td>
        <td id="balance"></td>
      </tr>
      
    </tbody>
  </table>
  
  <!--  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
        <a  target="_blank">
          <img src="add_moneypng.png" alt="Lights" style="width:100%" onclick="window.location.href='AddMoney.jsp'">
          <div class="caption">
            <p>Add Money </p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="view-statement.png" target="_blank">
          <img src="view-statement.png" alt="Nature" style="width:100%">
          <div class="caption">
            <p>View Statement</p>
          </div>
        </a>
      </div>
    </div>
   
  </div>
  
  <img alt="Why use Amazon Pay balance" src="why_amazon.jpg" height="250px" width="960px" title="Why use Amazon Pay balance"> -->
  
  </div>
  </div>
</div>

<script>
window.onload = function() {
  var xhttp = new XMLHttpRequest();
//alert("inside");
var email = '<%=name%>';
//alert(email);
  xhttp.open("GET", "webapi/webservice/getBalance/"+email, true);
  //alert(this.responseText);
  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	//alert(this.responseText);
	      document.getElementById("balance").innerHTML = this.responseText;
	    }
	  };
  xhttp.send();
}
</script>

</body>
</html>




                              
                                    