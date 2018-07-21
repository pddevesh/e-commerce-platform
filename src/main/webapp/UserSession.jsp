<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
if(request.getSession().getAttribute("name") != null)
 if((String) request.getSession().getAttribute("login")=="\0")
 response.sendRedirect("Itemdetails.jsp?pid="+(String) request.getSession().getAttribute("login"));
 else
	 response.sendRedirect("NewFile.jsp");
else 
response.sendRedirect("NewFile.jsp");
%>

</body>
</html>