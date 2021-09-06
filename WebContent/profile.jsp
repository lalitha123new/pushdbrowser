<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Profile</title>

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
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.session.js"></script>
	<script src="bs/js/jquery.cookie.js"></script>
	<script src="bs/js/bootstrap.min.js"></script>
    <script src="js/values.js"></script>
    <script src="js/inc.js"></script>
    <style type="text/css">
    	.image { 
		   position: relative; 
		   width: 100%; /* for IE 6 */
		}
		
		h2 { 
		   position: absolute; 
		   top: 70px; 
		   right: -100px;
		   width: 100%;
		   text-align: right; 
		}
    </style>
    <script>
	    
    	history.forward();
    	
    	$(function(){
    		$('#header').load("navHeader.html");
    		
	    });
    </script>
	<script type="text/javascript">
	
	$.getJSON(serverURL + "users/admin/"+userId, function(data){
	    myFunction(data);
	});

	function myFunction(arr) {
	    var out = "";
	    var i;
	 

	   var i;
	   var out;
		
	 
	}
	
	</script>

</head>
<body class="bgcolor" oncontextmenu="return false">
	<div id="header">
	</div>

	<div class="container-fluid" style="height: 100%">
	<div class="row">
		<div class="col-md-2">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="home3.jsp">
					<i class="fa fa-home">&emsp;Home</i></a>
				</li>
				<li><a href="section.jsp">
					<i class="fa fa-tasks">&emsp;Sections</i></a>
				</li>
				<li class="active"><a href="#">
					<i class="fa fa-user">&emsp;Profile</i></a>
				</li>
				<li><a href="monitor.jsp">
					<i class="fa fa-bar-chart">&emsp;Monitor your Pattern</i></a>
				</li>
				
			</ul>
		</div>
		
				<div class="col-md-10 col-sm-8">
					<div class="row">
				<!--  	<h3 id="userName"></h3>--><h3>User Profile</h3>
					<br>
					
              
	<div> <p> Profile picture </p></div>
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->

	
</body>
</html>