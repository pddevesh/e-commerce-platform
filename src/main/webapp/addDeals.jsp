<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Deal Details</title>
<link rel="stylesheet" type="text/css" href="bootstrap.css" >
</head>

<body>
<%if(request.getParameter("flag")!=null){
	out.println(request.getParameter("flag"));
}
%>
<form action="add_to_deals.jsp" method="post">
<div class="container">
 <label><b>ItemId :</b></label><label><%= request.getParameter("id") %></label>
<input type="hidden" name="id" value="<%= request.getParameter("id") %>"><br>

<label><b>Deal ID</b></label>
<input type="text" placeholder="Deal ID" class="form-control" name="dealid">

<label><b>Discount</b></label>
<input type="text" placeholder="Discount" class="form-control" name="discount">

<label><b>Buy X</b></label>
<input type="text" placeholder="Enter X" class="form-control" name="InitialQuantity">

<label><b>Get Y</b></label>
<input type="text" placeholder="Enter Y" class="form-control" name="dealtype">

<label><b>Start date</b></label>
<input type="date" placeholder="Start Date" class="form-control" name="startDate">

<label><b>End Date</b></label>
<input type="date" placeholder="End Date" class="form-control" name="endDate">

<input type="submit" value="submit" title="Submit">
<!--  Buy X:<input type="number" name="InitialQuantity" placeholder="Initial Quantity"> <br> 
Remaining Quantity:<input type="number" name="RemainingQuantity" placeholder="Remaining Quantity"> <br> 
Start Date:<input type="date" name ="startDate" placeholder="YYYY/MM/DD"> <br>
End Date:<input type="date" name ="endDate" placeholder="YYYY/MM/DD"> <br>
 Start Time:<input type="time" name="startTime" placeholder="HH:MM:SS"> <br>
End Time:<input type="time" name="endTime" placeholder="HH:MM:SS"> <br> 
Get Y: <input type="text" name="dealtype"><br> -->
</form>

</body>
</html>