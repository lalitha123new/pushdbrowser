<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Doctor</title>

<!-- Bootstrap -->
	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet"> 
	
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// --> 
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="bs/js/jquery-2.1.1.min.js"></script>
	<script src="bs/js/jquery.cookie.js"></script>
	<script src="js/values.js"></script>
	<script src="js/inc.js"></script>
	<script type="text/javascript">
		
	history.forward();
	</script>
</head>
<body class="bgcolor" oncontextmenu="return false">

<nav class="navbar navbar-inverse">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header col-md-9">
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
			<div class="collapse navbar-collapse col-md-1"
				id="navbar-collapse-2">
				<ul class="nav navbar-nav navbar-right">
							<li><a href="viewDoctors.jsp">Back</a></li>	
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
	
	
	<div class="container-fluid">
<div class="row">
		<div class="col-md-2">
		</div>
	<div class="col-md-10">
		<div class="row">
			<div class="col-md-10">
				<h2 class="text-center">Add Doctor</h2>
				<form id="addDoctor" class="form-horizontal">
					<div class="panel-body">
						<!-- <div class="form-group">
						    <label class="col-sm-3 control-label">Doctor Id</label>
					    	<div class="col-sm-8">
						    	<input type="number" title="Doctor Id should be a number" class="form-control" id="doctorId" name="id" placeholder="Doctor ID">
						    	<span id="err"> </span>
						    </div>
					  	</div> -->
						<div class="form-group">
						    <label class="col-sm-3 control-label">Doctor Name</label>
					    	<div class="col-sm-8">
						    	<input type="text" class="form-control" id="doctorName" name="name" placeholder="Doctor Name">
					    	</div>
						</div>
						
						<div class="form-group">
						    <label class="col-sm-3 control-label">User Name</label>
					    	<div class="col-sm-8">
						    	<input type="text" class="form-control" id="userName" name="name" placeholder="User Name">
					    	</div>
						</div>
						
						<div class="form-group">
						    <label class="col-sm-3 control-label">Password</label>
					    	<div class="col-sm-8">
						    	<input type="password" class="form-control" id="doctorPassword" name="password" placeholder="Password">
					    	</div>
						</div>
						
						<div class="form-group">
						<label class="col-sm-3 control-label">Mobile Number</label>
						<div class="col-sm-8">
							<input type="number" class="form-control" id="mobileNumber"
								name="mobileNumber" placeholder="Mobile Number">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Mail Id</label>
						<div class="col-sm-8">
							<input type="email" class="form-control" id="doctorMailId"
								name="mailId" placeholder="mailId">
						</div>
					</div>
						
						
						
					  	
				  	</div>
					
					
					<div class="panel-footer">
						<div class="row">
							<div class="col-md-12" style="text-align:center;">
								<div class="">
								    <button type="button" onclick="create()" class="btn btn-success" id="create_doctor">Create</button>
								    <!-- <button type="submit" class="btn btn-success">Create</button> -->
								</div>
							</div>
							
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-2">
			</div>
		</div>
	</div>
</div>
</div>
<script>
var doctor_id,doctor_name,username,psw,email,phone;
function create() {
	$("#create_doctor").attr("disabled", true);
	//doctor_id = $('#doctorId').val();
	doctor_name = $('#doctorName').val();
	username = $('#userName').val();
	psw = $('#doctorPassword').val();
	email = $('#doctorMailId').val();
	phone = $('#mobileNumber').val();
	
	if(doctor_name && psw && email){
	
	formData = "&doctor_name=" + $('#doctorName').val()+"&username=" + $('#userName').val() + "&psw="+$('#doctorPassword').val()+ "&email="+ 
	$('#doctorMailId').val()+ "&phone=" + $('#mobileNumber').val();
			
			
			$.ajax({
				  type: "POST",
				  url: serverURL + "users/admin/addDoctor",
				  data: formData,
				  success: function(data) {
					 
					 window.location.href="viewDoctors.jsp";
					
					  	
				  },
				  error: function() {
				  } 
			});
		}else{
			alert("Please fill the fields Doctor_id, User name, Password and Maild Id");
		}
	
	
}
</script>
</body>
</html>