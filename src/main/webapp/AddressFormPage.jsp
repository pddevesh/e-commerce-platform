<!DOCTYPE html>
<html>

<%! String pid;
String qu;
%>

<% 
pid=request.getParameter("pid");
//out.print(pid);
System.out.println("Address Form = "+pid);

//qu=request.getParameter("qty");
//out.print(qu);
//int p = Integer.parseInt(pid);
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>demo1</title>
    <!--  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="assets/css/styles2.css">
    <link rel="stylesheet" href="assets/css/untitled.css">
</head>
 <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
<body style="margin-top:13%;">
	
     <jsp:include page="headerwithname.jsp" />
    <center>
<form  style="border:1px solid #ccc" id="signup">
  <div class="container">
   
    <hr>

    <label for="name"><b>Name</b></label>
    <input type="text" placeholder="Enter Name" name="name" required>
    </br></br>
    
     <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>
    </br></br>
    
    <label for="addressline1"><b>AddressLine1</b></label>
    <input type="text" placeholder="Enter AddressLine1" name="addressline1" required>
</br></br>
    <label for="addressline2"><b>AddressLine2</b></label>
    <input type="text" placeholder="Enter AddressLine2" name="addressline2" required>
</br></br>
  
    <label for="city"><b>City</b></label>
    <input type="text" placeholder="Enter City" name="city" required>   
</br></br>
 
    <label for="state"><b>State</b></label>
    <input type="text" placeholder="Enter State" name="state" required>
    </br></br>
    
    <label for="postalcode"><b>Postalcode</b></label>
    <input type="text" placeholder="Enter Postalcode" name="postalcode" required>
    </br></br>
    <div >
      
      <button type="submit" class="signupbtn">Continue</button>
    </div>
  </div>
</form>
<script type="text/javascript">
    var frm = $('#signup');

    frm.submit(function (e) {
		
        e.preventDefault();
		alert("hi");
        $.ajax({
            type: 'post',
            dataType: 'text',
            url: 'webapi/webservice/addAddress',
            contentType: 'application/x-www-form-urlencoded',
            data: frm.serialize(),
            success: function (data) {
                console.log('Submission was successful.');
                alert("success");
                
                console.log(data);
                window.location.href ="UserAddressPage.jsp?pid=<%=pid%>";
            },
            error: function (data) {
                console.log('An error occurred.');
                console.log(data);
                alert("error");
            },
        });
    });
</script>

</center>



   
</body>

</html>