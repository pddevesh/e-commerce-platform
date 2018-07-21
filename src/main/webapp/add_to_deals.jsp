<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adding.....</title>
</head>
<%@ page import= "java.sql.Statement" %>
<%@ page import= "java.sql.Connection" %>
<%@ page import= "java.sql.DriverManager" %>
<%@ page import= "java.time.format.DateTimeFormatter"%>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.Date" %>
<%! int itemid;
	int initialquantity;
	int dealtype;
	int dealid;
	String startDate;
	String endDate;
	Date st1;
	Date et;
%>
<%
	String url="jdbc:mysql://localhost:3306/AmazonDB";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con= DriverManager.getConnection(url,"root","root");
	Statement st= con.createStatement();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
%>
<body>
	<%
	
	itemid = (Integer.parseInt(request.getParameter("id")));
	initialquantity= (Integer.parseInt(request.getParameter("InitialQuantity")));
	dealtype = (Integer.parseInt(request.getParameter("dealtype")));
    dealid = (Integer.parseInt(request.getParameter("dealid")));
	startDate = (request.getParameter("startDate"));
	endDate = (request.getParameter("endDate"));
	//st1 = sdf.parse(startDate);
	//et = sdf.parse(endDate);
	//out.println("Start Date"+st1);
	//out.println("End Date"+et);
	String sql=" insert into Deals(itemid,initialquantity,startDate,endDate,dealtype,dealid) values("+itemid+","+initialquantity+",'"+startDate+"','"+endDate+"',"+dealtype+","+dealid+")";    
	out.println(sql);
	try{
	st.executeUpdate(sql);
	
	st.close();
	con.close();
	response.sendRedirect("getItems.jsp?flag=1");
	
}catch(Exception ex){
	out.println(ex.getMessage());
	response.sendRedirect("addDeals.jsp?id="+request.getParameter("id")+"&flag="+ex);
}
	%>
</body>
</html>