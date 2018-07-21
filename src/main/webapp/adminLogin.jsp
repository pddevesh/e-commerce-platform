<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}


.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 21%;
    border-radius: 32%;
}

.container {
    padding: 16px;
}
</style>
<title>Admin Login</title>
</head>
<%
if((Boolean)request.getAttribute("flag")!= null){
	out.println("Wrong user name or password");
}
%>

<body>
<h2>Login Form</h2>

<form action="admincheck.jsp" method="post">
  <div class="imgcontainer">
    <img src="admin.png" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label for="useremail"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="useremail" required>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
        
    <button type="submit">Login</button>
   
  </div>

  <div class="container" style="background-color:#f1f1f1">
   
  </div>
</form>

</body>
</html>