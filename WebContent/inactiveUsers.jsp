<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<title>Admin - Home</title>

<%

	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	
	if(session.getAttribute("USERID")==null){
		response.sendRedirect(request.getContextPath() + "/sessionExpired.jsp");
	}
	
%>
	<!-- Bootstrap -->
	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet"> 
	
	
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="bs/js/jquery-2.1.1.min.js"></script>
	<script src="bs/js/jquery.cookie.js"></script>
	<script src="js/values.js"></script>
	<script src="js/inc.js"></script>
	<script type="text/javascript">
		
	history.forward();
	
	$.getJSON(serverURL + "users", function(data){
	    myFunction(data);
	});
	

	function myFunction(arr) {
	    var out = "";
	    var i;
	    
	    for(i = 1; i < arr.length; i++) {
	    	
	      
   					if(arr[i].mode == "Inactive")
   					{
   					
   					  out += '<tr id="e' + arr[i].id +'" >' + '<td>' + arr[i].id   + '</td>' +
	        			'<td>' + arr[i].name + '</td>' +
	        			'<td>' + arr[i].gender + '</td>' +
	        			'<td>' + arr[i].age + '</td>' +
	        			'<td><a href="user.jsp?userid='+arr[i].id+'" type="button" class="btn btn-primary" ' +
	        					'data-toggle="tooltip" data-placement="top" title="User Details">' + 
	        					'<span class="glyphicon glyphicon-info-sign"></span></a> ' +
  					'</td>' + '<td>'+'<span class="glyphicon glyphicon-warning-sign hidden" id = "' + arr[i].id + '"></span> &nbsp; &nbsp;' +
  					'</td>'+ '<td>' + '<a href="#" id="chk1" class="btn btn-primary text-center" style="text-decoration: none; margin-top: 0px; padding-top: 5px; padding-bottom: 5px;" onclick="mode(\'' + arr[i].id + '\')">&emsp;Activate&emsp;</a>'
 					+ '</td>' + '</tr>';
   					}
		
			
	    }
		document.getElementById("table-body").innerHTML = out;
		
		for(i = 1; i < arr.length; i++) {
			if(arr[i].flag == "true")
			{
			$('#' + arr[i].id).removeClass("hidden");
			}
			
			 }
		 }
		
	function mode(ui)
	{
		var deleteUser = confirm('Do you want to Activate this user?');
		if(deleteUser){
		$('#e'+ui).hide();
	//	alert(ui);
		setMode("active",ui);
		}
	}
	
	function deleteFunction(userId)
	{
		alert("delete function");
		$.getJSON(serverURL + "users/admin/"+userId+"deleteUser" , function(data){
		   alert("User "+data.name+" deleted Successfully");
		});	
	}
	
	</script>
</head>
<body class="bgcolor" oncontextmenu="return false">
	<nav class="navbar navbar-inverse">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header col-md-9 col-sm-9">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">PUSH-D</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="col-md-1 col-sm-1" style="padding: 10px 10px 0px 25px;">


			<a href="viewUsers.jsp" type="button"
				class="btn btn-success pull-right" data-toggle="tooltip"
				data-placement="top" title="Home"><i
				class="glyphicon glyphicon-home"></i></a>
		</div>
		<div class="collapse navbar-collapse col-md-1 col-sm-1" id="navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>
		</div><!-- /.container-fluid -->
	</nav>
	
	<div class="container-fluid" style="height: 100%">
	<div class="row" style="padding: 20px 100px;">
		<h2>List of Inactive Users&emsp;&emsp;</h2>
			<hr>
			<table class="table">
				<thead>
					<tr>
						<th>UserID</th>
						<th>Name</th>
						<th>Gender</th>
						<th>Age</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="table-body">
				</tbody>
			</table>
	</div>
	</div>
		
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bs/js/bootstrap.min.js"></script>
	
</body>
</html>