<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="admin.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Available Items List</title>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>
<body>
<%if(request.getParameter("flag")!=null){
	out.println("Success");
}

	%>

<table cellspacing="10"><tr><th>ItemId</th><th>Title</th><th>Category</th><th>SubCategory</th><th>ProductId</th><th>Price</th></tr>
<%@ page import="java.sql.*" %>
<%
String connectionURL =  "jdbc:mysql://localhost:3306/AmazonDB";
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection  con= DriverManager.getConnection(connectionURL, "root", "root");
Statement st = con.createStatement();

String sql="Select * from Items order by Category,SubCategory";
ResultSet rs = st.executeQuery(sql);
while(rs.next()) { 
	
	%>
<tr><td> <a href="addDeals.jsp?id=<%= rs.getInt("ItemId")%>"> <%= rs.getInt("ItemId")%></a></td>

 <td><%= rs.getString("Title") %></td>
 <td><%= rs.getString("Category") %></td>
 <td><%= rs.getString("SubCategory") %></td>
 <td><%= rs.getBigDecimal("ProductId") %></td>
 <td><%= rs.getBigDecimal("price") %></td>
 </tr>
 
 <% 
}
%>
</table>
<%
con.close();
st.close();
rs.close();
%>
<a href="admin.jsp">
<input type="button" value="Go Back">
</a>
</body>
</html>