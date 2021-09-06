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
	<title>Admin Login</title>

	<%-- <%
		String USERID = (String) request.getSession().getAttribute("USERID");
		System.out.println("auth.jsp USERID:" + USERID);
		
		if(USERID == null) {
			response.sendRedirect("index.jsp");
		}
	%> --%>
	
	<!-- Bootstrap -->
	<link href="../bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="../fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="../css/style.css" rel="stylesheet">
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="../bs/js/jquery-2.1.1.min.js"></script>
    <script src="../bs/js/bootstrap.min.js"></script>
 	<script src="../bs/js/jquery.cookie.js"></script>
	<script src="../bs/js/jquery.session.js"></script>
	<script src="../js/values.js"></script>
	 <script src="../js/inc.js"></script>
	<script src="../js/Chart.min.js"></script>
 	<!-- <link rel="stylesheet" href="css/jquery-ui.min.css">
 	<link rel='stylesheet' type='text/css' href='css/timepicki.css'/>
	<script src="js/jquery-ui.min.js"></script>
	<script type='text/javascript' src='js/timepicki.js'></script> -->
	<script type="text/javascript">
		$(function(){
			
			history.forward();
			
			$('#header').load("../navHeader.html");


			//$('#browser').load("browser.html");
			//$("#logout").load("logout.html");
	        $('[data-toggle="tooltip"]').tooltip();
	        //$('#reviewModal').modal('show');
	//        $(".datepicker").datepicker();
	//        $('#timepicker').timepicki(); 
	    });	
		
		/* window.onbeforeunload = function () {
	        return "Please logout first ... ";
	    };
	     */
	</script>
</head>
<body oncontextmenu="return false">

<div class="bgcolor">
<nav class="navbar navbar-default" style="background-color: #FFA726; width:100%; padding-top: 0px; border-bottom: 5px solid #FFB74D;">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		
			
			<a class="navbar-brand" style="color: white;">PUSH - D</a>
		
		
		
	</div><!-- /.container-fluid -->
	
</nav>
		<div id="myModal">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-primary">
					Admin Login
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button>-->
				</div>
				<form action="login.jsp" method="post">
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
						<div class="form-group">
						<a href="#"  class="hidden" onclick="return func();">New user?</a>
						</div>
						<div class="form-group">
						<p id="new" class="hidden"><small>If you wish to know the registration process, write to us at push.d.nimhans@gmail.com.</small></p>
						</div>
						<p> 
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
	
	<br>

	<div class="container-fluid" style="height: 100%">
	<div class="row">
	
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
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
			//alert(serverURL + "users/admin/login");
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
				  url: serverURL + "users/admin/login",
				  data: formData,
				  success: function(data) {
					 
					  console.log(data);
					//  alert(data);
					  	var userid = data.id;
					  	if( userid != "invalid") {
					   		window.location.replace("../login.jsp?id="+userid+"&admin="+data.adminId);
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