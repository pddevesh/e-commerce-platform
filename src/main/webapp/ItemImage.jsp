<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Images</title>
<link rel="stylesheet" type="text/css" href="bootstrap.css" >
</head>
<body>
	<h2>Upload files</h2>
	<form action="http://localhost:8080/akshay/webapi/webservice/uploadfile2" enctype="multipart/form-data" method="post">
		<div class="container">
			<label>Select files</label><input type= "file" name="uploadFile1"/> <br/><br/>
			<label>Select File</label><input type= "file" name="uploadFile2" /> <br/><br/>
			<label>Select File</label><input type= "file" name="uploadFile3" /> <br/><br/>
		
			<input type="submit" title="Save"/>
			<input type="button"  value="Back to Item Page" onclick="window.location.href='http://localhost:8080/akshay/ItemAdd.jsp'" />
			<input type="button"  value="Back to Dashboard" onclick="window.location.href='http://localhost:8080/akshay/SellerDashboard.jsp'" />
		</div>
	</form>
	
</body>
</html>