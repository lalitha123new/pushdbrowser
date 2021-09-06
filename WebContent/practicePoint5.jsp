<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Sub-Section</title>
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
	<link href="css/style.css" rel="stylesheet">
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="js/values.js"></script>
     <script src="js/inc.js"></script>
   	<script src="bs/js/bootstrap.min.js"></script>
	 <!-- <script src="js/practice4.js"></script> -->
    <script type="text/javascript">
	    history.forward();
    	$(function(){
    		$('#header').load("navHeader.html");
    		$('#summary').load("summary.html");
    		$('#next').load("nextButton.html");
    		$('#progress').load("progressBar.html");
	        $("#includedContent").load("sectionSideNav2.html"); 
	    });
		
    </script>
</head>
<body class="bgcolor" oncontextmenu="return false">

	<div id="header">
	</div>
	
	<div id="summary">
	</div>
	
	<div class="container-fluid" style="height: 100%">
	<div class="row">
		<div class="col-md-1">
			<ul class="nav nav-pills nav-stacked text-center" id="includedContent">
			</ul>
		</div>
		<div class="col-md-11">
			<div class="">
				<div id="progress">
				</div>
				<div class="col-md-2 col-sm-4">
					<img class="img-responsive" alt="" src="images/ss-pp.jpg">
				</div>
				<div class="col-md-10 col-sm-8">
					<div class="row">
						<h3><b id="subsection-name">Practice Point</b></h3>
						<div class="clearfix"></div>
						<p id="exercise-title" class="text-justify">
						</p>				
						<hr style="border-bottom: 1px solid black;">
						<div id="paragraph" class="text-justify">
						</div>
						<div id="images">
						</div>
						<table id="table" class="table text-center table-hover table-bordered">
							<thead id="thead">
							</thead>
							<tbody id="tbody">
							</tbody>
						</table>
						<div class="clearfix"></div>
						<button id="submit" class="hidden btn btn-success" onclick="submitPractice4()">Submit</button>		
					</div>
				</div>
			</div>		
		 	<br>
			<br>
		</div>
		
	</div>
	</div>
	
	<br>
	<div class="clearfix"></div>
	<br>
	
	<div class="row">
		<div class="col-md-9">
		</div>
		<div class="col-md-2">
			<div id="next" class="alert alert-info text-center" role="alert">
				
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<script type="text/javascript">
		
		$(document).ready(function() {
			
			$.ajax({
				  type: "GET",
				  url: serverURL + "users/" + userId + "/currSubSection",
				  success: function(data){
			
						sectionId = data['currentSection'];
						subsectionId = data['currentSubSection'];
		
			 			activeSectionId = data['activeSection'];
						activeSubSectionId = data['activeSubSection'];
			
			//			setStatus("false");
				  },
				  error: function() {
					  alert("Error Occured due to " + serverURL + "users/" + userId + "/currSection");
					  //window.location.href = "error.html";
				  } 
			});
		
		});		

	</script>
</body>
</html>