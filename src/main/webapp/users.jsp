<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<title>Data Revealed !!</title>
<link rel="stylesheet" href="http://127.0.0.1:8887/upload/w3.css">

   <style>
table, th, td {
   border: 1px solid black;,
   text-align: center;
}
th, td {
    padding: 15px;
}
</style>
</head>
<jsp:include page="headerwithname.jsp" />
<body>
<br>
<br>
<br>
<br>
<br>

<h2 align="center">This data is confidential. Don't disclose at any cost. Disclosure is punishable by Death.</h2>

<h4 align="center">Admin Id: root</h4>
<h4 align="center">Admin Password: root</h4>

<table  class="w3-table-all w3-centered" style="width:50%" align="center" cellspacing="10"><tr><th>Customer Id</th><th>Password</th></tr>
<%@ page import="java.sql.*" %>
<%
String connectionURL =  "jdbc:mysql://localhost:3306/AmazonDB";
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection  con= DriverManager.getConnection(connectionURL, "root", "root");
Statement st = con.createStatement();

String sql="Select  email, password from userprofile";
ResultSet rs = st.executeQuery(sql);
while(rs.next()) { 
	
	%>
<tr>
 <td><%= rs.getString("email") %></td>
 <td><%= rs.getString("password") %></td>
 </tr>
 
 <% 
}
%>
</table>
<br>
<table  class="w3-table-all w3-centered" style="width:50%" align="center" cellspacing="10"><tr><th>Seller Id</th><th>Password</th></tr>
<%@ page import="java.sql.*" %>
<%
 connectionURL =  "jdbc:mysql://localhost:3306/AmazonDB";
Class.forName("com.mysql.jdbc.Driver").newInstance();
con= DriverManager.getConnection(connectionURL, "root", "root");
 st = con.createStatement();

 sql="Select  email, sellerpassword from seller";
 rs = st.executeQuery(sql);
while(rs.next()) { 
	
	%>
<tr>
 <td><%= rs.getString("email") %></td>
 <td><%= rs.getString("sellerpassword") %></td>
 </tr>
 
 <% 
}
%>

</table>
<br>
<table  class="w3-table-all w3-centered" style="width:50%" align="center" cellspacing="10"><tr><th>Item Id</th><th>Category</th><th>SubCategory</th></tr>
<%@ page import="java.sql.*" %>
<%
 connectionURL =  "jdbc:mysql://localhost:3306/AmazonDB";
Class.forName("com.mysql.jdbc.Driver").newInstance();
con= DriverManager.getConnection(connectionURL, "root", "root");
 st = con.createStatement();

 sql="Select itemid,category,subcategory from items";
 rs = st.executeQuery(sql);
while(rs.next()) { 
	
	%>
<tr>
 <td><%= rs.getString("itemid") %></td>
 <td><%= rs.getString("category") %></td>
 <td><%= rs.getString("subcategory") %></td>
 </tr>
 
 <% 
}
%>
</table>
</body>
</html>