<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Doctor Login</title>

	
	<!-- Bootstrap -->
	<link href="../bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="../fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="../css/style.css" rel="stylesheet">
	
	
    
    <script src="../bs/js/jquery-2.1.1.min.js"></script>
    <script src="../bs/js/bootstrap.min.js"></script>
 	<script src="../bs/js/jquery.cookie.js"></script>
	<script src="../bs/js/jquery.session.js"></script>
	<script src="../js/values.js"></script>
	 <script src="../js/inc.js"></script>
	<script src="../js/Chart.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			
			history.forward();
			$('#header').load("../navHeader.html");
			$('[data-toggle="tooltip"]').tooltip();
	       
	    });	
		
	</script>
</head>

<body oncontextmenu="return false" class="bgcolor">

<div class="bgcolor">
<nav class="navbar navbar-default" style="background-color: #FFA726; width:100%; padding-top: 0px; border-bottom: 5px solid #FFB74D;">
	
	<div class="container">
		<a class="navbar-brand" style="color: white;">PUSH - D</a>
		
	</div>
</nav>
		<div id="myModal">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-primary">
					Doctor Login
					
				</div>
				<form action="login1.jsp" method="post">
				<div class="modal-body">
						<div class="form-group">
							<input
								type="text" class="form-control" onkeyup="hide()" style="color: black;" id="userName" name="userName"
								placeholder="Username">
						</div>
						<div class="form-group">
							<input
								type="password" class="form-control" onkeyup="hide()" style="color: black;" id="userPassword" name="userPassword"
								placeholder="Password">
						</div>
						
						<div class="form-group text-center">
							<span id="err" class="hidden" style="color: red">Wrong username and password</span>
						</div>
				</div>
				
				<div class="modal-footer">
					<!-- <button type="submit" class="btn btn-success pull-right">Login</button> -->
					<button type="button" onclick="login()" class="btn btn-success pull-right">LOGIN</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	
	

</div>	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript">

		
		$(document).ready(function() {
		
			
		});
		function hide() {
			$('#err').addClass("hidden");
		}
		function func()
		{
			$('#new').removeClass("hidden");
		}
		function login() {
			
			var strDIV;
             var isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
               var element = document.getElementById('text');
                if (isMobile) {
                        strDIV="Mobile";
               } else {
            	       strDIV="Desktop";
           }
			
			
			formData = "name="+$('#userName').val() + "&pwd=" + $('#userPassword').val()+"&app_type="+strDIV+" Browser";
			$.ajax({
				  type: "POST",
				  url: serverURL + "users/doctor/login",
				  data: formData,
				  success: function(data) {
					 
					  	 var doctor_id = data;
					  	 
					  	if( doctor_id > 0) {
					  		
					  		localStorage.setItem("doctorId", doctor_id);
					  		window.location.replace("../login1.jsp?id="+doctor_id);
					  		
						}else if(doctor_id == -1){
							alert("Your account is deativated");
						}
				   	 	else {
				   	 		$('#err').removeClass("hidden");
				   	 	} 
				  },
				  error: function() {
				  } 
			});
		}
		
	</script>
</body>
</html>