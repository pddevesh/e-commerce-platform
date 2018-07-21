<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seller Dashboard</title>
<link rel="stylesheet" type="text/css" href="bootstrap.css" >
</head>
<body>
<!--  <div class="container">
<div class="jumbotron">
  <h1>Seller Dashboard</h1>
</div>
</div> -->
<h2>Welcome,<%=session.getAttribute("sellername") %></h2>

<!--  <a href="ItemAdd.jsp"><button type="button" class="btn btn-default">Add Item</button></a>
<a href="ItemDelete.jsp"><button type="button" class="btn btn-default">Delete Item</button></a>
<a href="SellerLogout.jsp"><button type="button" class="btn btn-default">Logout</button></a> -->

<ul class="nav nav-pills">
  <li role="presentation" class="active"><a href="ItemAdd.jsp">Add Item</a></li>
  <li role="presentation"><a href="ItemDelete.jsp">Delete Item</a></li>
  <li role="presentation"><a href="ItemUpdate.jsp">Update Item</a></li>
  <li role="presentation"><a href="SellerChangeStatus.jsp">Change Status</a></li>
  <li role="presentation"><a href="SellerLogout.jsp">Logout</a></li>
</ul>
</body>
</html>