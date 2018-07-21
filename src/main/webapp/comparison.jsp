<!DOCTYPE html>
<html>

<%! String pid;
%>

<% 
/*pid=request.getParameter("pid");
String[] ids = pid.split("B");
System.out.println(ids[0]+" " +ids[1]);
int id1 = Integer.parseInt(ids[0]);
int id2 = Integer.parseInt(ids[1]);*/
//out.print(pid);
//am =(String)session.getAttribute("amount"); 
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>demo1</title>
    <link rel="stylesheet" href="assets/css/styles3.css">
    
</head>

<body style="margin-top:13%;">
	
     <jsp:include page="headerwithname.jsp" />
    <!--   <label for="price"><b>Student Name : Akash Shendge</b></label>
<label for="price"><b>Student Roll No: MT2017010</b></label> -->
<input type="submit"  value="Back" onclick="myprev()"></input>
    <div style="margin-left:25%;width:90%">
     <h2 style="margin-left:18%;">Product Comparison</h2>
    <div class="row">
        <div class="col-md-8" id="table" >
            <div class="table-responsive">
                <table class="table">
                   <thead>
                        <tr>
                            <th>Select a product </th>
                            <th> <select name="dp1" id="dropdown1">
                           			 <option value="default">Select a product</option>
  									<option value="volvo">Volvo</option>
 									
								</select></th>
                            <th> <select name="dp2" id="dropdown2">
                           			 <option value="default">Select a product</option>
  									<option value="volvo">Volvo</option>
 									 
								</select>
            				</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td> </td>
                            <td  class="imagetd"><img  id="image1" src="assets/img/noimage.png" class="img5"></td>
                            <td  class="imagetd"><img  id="image2" src="assets/img/noimage.png" class="img5"></td>
                        </tr>
                        <tr >
                            <td>Price</td>
                            <td id="trdetails10"><del id="trdetails7"></del><ins id="trdetails9"></ins> <ins id="trdetails12"></ins></td>
                            <td id="trdetails100"><del id="trdetails70"></del><ins id="trdetails90"></ins> <ins id="trdetails120"></ins></td>
                        </tr>
                        <tr >
                            <td>Color</td>
                            <td  id="tr2">NA</td>
                            <td  id="tr20">NA</td>
                        </tr>
                        <tr >
                            <td>Category</td>
                            <td  id="tr3">NA</td>
                            <td  id="tr30">NA</td>
                        </tr>
                        <tr>
                            <td>Subcategory</td>
                            <td  id="tr5">NA</td>
                            <td  id="tr50">NA</td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td  id="tr6">NA</td>
                            <td  id="tr60">NA</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>


<script>
$(document).ready(function(){
	
	var uri="webapi/webservice/getAllItems/";
$.ajax({ 
		   type: "GET",
		   dataType: "json",
		   url: uri,
		   success: function(data){
			   var str1='';
			   var str2='';
			   str1 +='<option value="default">Select a Product</option>';
			   for(var i=0;i<data.length;i++){
				   //if(data[i].itemid == item1 || data[i].itemid == item2)
				   str1 +=' <option value='+data[i].itemid+'>'+data[i].title+'</option>';
			   }
			   document.getElementById("dropdown1").innerHTML = str1;
			   document.getElementById("dropdown2").innerHTML = str1;
		   },error: function(e) {
		        console.log("Fail");
		    }
				});
			   
});

$('select[name="dp1"]').change(function(){

var id=$(this).val();
var uri="webapi/webservice/getItemDetails/"+id;

$.ajax({ 
	   type: "GET",
	   dataType: "json",
	   url: uri,
	   success: function(data){
		   var price=data.price;
		   var image=data.image1;
		   var brand=data.brand;
		   var color=data.color;
		   var discount=data.discount;
		   var warranty=data.warranty;
		   var used_fresh=data.used_fresh;
		   var category = data.category;
		   var subcategory =  data.subcategory;
		   var name =  data.title;
		   var m=price-price*(discount/100);
		   var h = "("+discount+"% OFF)";
		   
		   if(price>m){
			$("#trdetails7").text(price);
			$("#trdetails9").text(m);
			$("#trdetails12").text(h);

			}else{
				$("#trdetails10").text(price);
			}
		  
		   
		   $("#tr2").text(color);
		   $("#tr3").text(category);
		   $("#tr5").text(subcategory);
		   $("#tr6").text(name);
		   $("#image1").attr("src",image);
		   
	   },error: function(e) {
	        console.log("Fail");
	    }
			});
		   
});



$('select[name="dp2"]').change(function(){

	var id=$(this).val();
	var uri="webapi/webservice/getItemDetails/"+id;

	$.ajax({ 
		   type: "GET",
		   dataType: "json",
		   url: uri,
		   success: function(data){
			   var price=data.price;
			   var image=data.image1;
			   var brand=data.brand;
			   var color=data.color;
			   var discount=data.discount;
			   var warranty=data.warranty;
			   var used_fresh=data.used_fresh;
			   var category = data.category;
			   var subcategory =  data.subcategory;
			   var name =  data.title;
			   var m=price-price*(discount/100);
			   
			   var h = "("+discount+"% OFF)";
			   
			   
			   if(price>m){
				   console.log(price+' '+m+' '+h);
				   
				$("#trdetails70").text(price);
				$("#trdetails90").text(m);
				$("#trdetails120").text(h);

				}else{
					$("#trdetails100").text(price);
				}
			   
			   $("#tr20").text(color);
			   $("#tr30").text(category);
			   $("#tr50").text(subcategory);
			   $("#tr60").text(name);
			   $("#image2").attr("src",image);
			   
		   },error: function(e) {
		        console.log("Fail");
		    }
				});
			   
	});


</script>
<script>
function myprev()
{
location.href="Cart.jsp";	
}
</script>
</html>