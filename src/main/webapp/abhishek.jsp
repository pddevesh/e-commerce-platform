<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="total1">
<input type="text" id="vat1">

<table style="width: 30%;">
		<tr>
		<th align="left">Serial No</th>
		<th align="left">Item Id</th>
		<th align="left">Price</th>
		</tr>
<% 
 String name = (String) session.getAttribute("name");
int total=0;
int vat=0;
%>
<%
String pid=(String) (request.getParameter("pid"));
String[] ids = pid.split("B");
//System.out.println(ids[0]+" " +ids[1]);
for(int i=0;i<ids.length;i++)
{
int id1 = Integer.parseInt(ids[0]);
int id2 = Integer.parseInt(ids[1]);



}
try{
	Class.forName("com.mysql.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amazondb",
	            "root", "root");
	 Statement st=con.createStatement();
	// String sql="select filename from image_table where id="+imageid+"";
	 //String sql="select image1,title,items.itemid,price,category,subcategory from deals,items where deals.itemid=items.itemid and dealid= '"+dealid+"'";
	   String sql = "select itemid,price from cart where email='"+name+"'";
	   //String sql1 =" select itemid,price,discount from items i,cart c where i.i"
	 ResultSet rs=st.executeQuery(sql);
	int i=1;
	
	 while(rs.next())
	 {
		// String image=rs.getString("Image1");
		 //String title=rs.getString("title");
		 
		 int itemid=rs.getInt("itemid");
		 int price=rs.getInt("price");
		 total = total + price;
		 vat = (total * 4) / 100;
		 //String cat=rs.getString("category");
		 //String subcat=rs.getString("subcategory");
		
		// int id=rs.getInt("id");
		 %>
		 <tr>
		 <td><%=i%></td>
		 <td><%=itemid%></td>
		 <td><%=price %></td>
	</tr>
	
		 <% i=i+1;%>
		 
		 <%
		 
	 }
	
	 
}catch(Exception e){}
%>
</table>
<br><br><br>
<input type="submit"  value="Home" onclick="myprev()"></input>
<input type="submit"  value="back" onclick="myback()"></input>
<input type="submit"  value="populate" onclick="populate()"></input>
<script type="text/javascript">

function myprev(){
	
	 location.replace("http://localhost:8080/akshay/NewFile.jsp");
}
function myback(){
	
	 location.replace("http://localhost:8080/akshay/Cart.jsp");
}

function populate(){
	
	 document.getElementById("total1").value=<%=total%>;
	 document.getElementById("vat1").value=<%=vat%>;
}

</script>
</body>
</html>