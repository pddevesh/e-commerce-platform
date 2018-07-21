<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seller Table</title>
</head>
<body>
<table style="width: 30%;">
		<tr>
		<th align="left">Serial No</th>
		<th align="left">Item Id</th>
		<th align="left">Seller Id</th>
	    <th align="left">Seller Address</th>
		</tr>
<% 
 String name = (String) session.getAttribute("name");

%>
<%
String pid=(String) (request.getParameter("pid"));
String[] ids = pid.split("B");
//System.out.println(ids[0]+" " +ids[1]);
int id3=0,id4=0,id5=0;
int id1 = Integer.parseInt(ids[0]);
int id2 = Integer.parseInt(ids[1]);
if(ids.length == 3)
	id3 = Integer.parseInt(ids[2]);
if(ids.length == 4)
	id4 = Integer.parseInt(ids[3]);
if(ids.length == 5)
	id5 = Integer.parseInt(ids[4]);

try{
	Class.forName("com.mysql.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amazondb",
	            "root", "root");
	 Statement st=con.createStatement();
	// String sql="select filename from image_table where id="+imageid+"";
	 //String sql="select image1,title,items.itemid,price,category,subcategory from deals,items where deals.itemid=items.itemid and dealid= '"+dealid+"'";
	    String sql = "select i.itemid,s.email,s.addressline1 from items i,seller s,selleritem si where i.itemid=si.itemid and s.sellerid=si.sellerid and i.itemid in (select itemid from cart where email='"+name+"')";
	 ResultSet rs=st.executeQuery(sql);
	int i=1;
	 while(rs.next())
	 {
		// String image=rs.getString("Image1");
		 //String title=rs.getString("title");
		 
		 int itemid=rs.getInt("itemid");
		 
		 String email=rs.getString("email");
		 String address = rs.getString("addressline1");
		 System.out.println("From Exam:"+itemid+" "+email+" "+address);
		 //String cat=rs.getString("category");
		 //String subcat=rs.getString("subcategory");
		
		// int id=rs.getInt("id");
		 %>
		 
		
		
		 <tr>
		 <td><%=i%></td>
		 <td><%=itemid%></td>
		 <td><%=email %></td>
		 <td><%=address %></td>
	</tr>
	
		 <% i=i+1;%>
		 
		 <%
		 
	 }
	
	 
}
catch(Exception e){}
%>
</table>
<br><br><br>
<input type="submit"  value="Home" onclick="myprev()"></input>
<input type="submit"  value="back" onclick="myback()"></input>
<script type="text/javascript">

function myprev(){
	
	 location.replace("http://localhost:8080/akshay/NewFile.jsp");
}
function myback(){
	
	 location.replace("http://localhost:8080/akshay/Cart.jsp");
}

</script>
</body>
</html>