<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%! String userdbName;
String userdbPsw;
String dbUsertype;
%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/AmazonDB";
String user = "root";
String dbpsw = "root";

String sql = "select * from seller where email=? and sellerpassword=?";

String name = request.getParameter("username");
String password = request.getParameter("password");

if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))))
{
try{
Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw);
ps = con.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, password);
rs = ps.executeQuery();
if(rs.next())
{  
userdbName = rs.getString("email");
userdbPsw = rs.getString("sellerpassword");
if(name.equals(userdbName) && password.equals(userdbPsw))
{
session.setAttribute("sellername",userdbName);
 
response.sendRedirect("SellerDashboard.jsp");
 
}     
}
else
response.sendRedirect("LoginError.jsp");
rs.close();
ps.close();
 
}
catch(SQLException sqe)
{
out.println(sqe);
}  
}
else
{
%>
<center><p style="color:red">Error In Login</p></center>
<% 
ServletContext context = getServletContext();

getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
}

%>
</body>
</html>

