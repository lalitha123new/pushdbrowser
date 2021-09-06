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
	<title>Doctors</title>

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
	
    
	<script src="bs/js/jquery-2.1.1.min.js"></script>
	<script src="bs/js/jquery.cookie.js"></script>
	<script src="js/values.js"></script>
	<script src="js/inc.js"></script>
	
	<script type="text/javascript">
		
	history.forward();
	
	$.getJSON(serverURL + "users/admin/doctor", function(data){
		console.log(data);
		 var out = "";
		    var i;
			for(i = 0; i < data.length; i++) {
				if(data[i].mode =="ACTIVE"){
				
				 //out += '<tr id="e' + data[i].doctor_id +'">' + '<td>' + (i+1)+ '</td>' +
				 //'<td>' + data[i].doctor_id+ '</td>' +
     			out += '<tr id="e' + data[i].doctor_id +'"><td>' + data[i].doctor_id+ '</td>' +
     			'<td>' + data[i].doctor_name + '</td>' +
     			'<td>' + data[i].email + '</td>' +
     			'<td>'+'<button type="button" class="btn btn-primary" onclick="mode(\'' + data[i].doctor_id + '\')">Deactivate</button>' +
				'</td>'+
	        		'</tr>';
	        		
				}
		     
		 }
	 
			
			document.getElementById("table-body").innerHTML = out;
			
			
			
			
	});
	
	
	//to inactivate doctor
	function mode(doct_id){
		
		var deleteDoctor = confirm('Do you want to Inactivate this doctor?');
		if(deleteDoctor){
			
		$('#e'+doct_id).hide();
		//$('#e'+doct_id).remove();
		setMode("INACTIVE",doct_id);
		
		
		}
	}
	

	
	</script>
	
</head>

<body class="bgcolor" oncontextmenu="return false">
	<nav class="navbar navbar-inverse">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header col-md-8">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">PUSH-D</a>
			</div>

			<div class="col-md-1" style="padding: 10px 10px 0px 25px;">
			<a href="viewUsers.jsp" type="button" class="btn btn-success"
				data-toggle="tooltip" data-placement="top" title="Home"><i
				class="glyphicon glyphicon-home"></i></a>
		</div>
			<div class="collapse navbar-collapse col-md-3"
				id="navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="inactiveDoctors.jsp">Inactive Doctors</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
	
	<div class="container-fluid" style="height: 100%">
	<div class="row" style="padding: 20px 100px;">
		<!-- <h2>List of Users&emsp;&emsp;<a href="addUser.jsp" class="btn btn-primary">Add User</a></h2> -->
		<h2>List of Doctors&emsp;&emsp;<a href="addDoctor.jsp" class="btn btn-primary">Add Doctor</a>&emsp;&emsp;
		&emsp;&emsp;</h2>
		
			<table class="table" id="tableUsers">
				<thead>
					<tr>
						<!-- <th>Sl.No</th> -->
						<th>DoctorId</th>
						<th>Name</th>
						<th>EmailId</th>
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