<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
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
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="js/values.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
     <script src="js/inc.js"></script>
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
					<img class="img-responsive" alt="" src="images/ss-tb.jpg">
				</div>
				<div class="col-md-10 col-sm-8">
					<div class="row">
						<h3><b id="subsection-name"></b></h3>
						<div class="clearfix"></div>
						<p id="exercise-title" class="text-justify">
						</p>				
						<hr style="border-bottom: 1px solid black;">
						<div class="clearfix"></div>
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<div id="images">
							</div>
							<br>
							<br>
							<br>
							
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>		
		 	<br>
			<br>
			<br>
			<div class="clearfix"></div>
			<br>
			
			<div class="row">
				<div class="col-md-9">
				</div>
				<div id="next" class="col-md-2">
				</div>
			</div>
		</div>
	</div>
	</div>
	
	
	<br>
	<br>
	<br>
</div>
	<script type="text/javascript">
	
		var i=0;
		
		$(document).ready(function() {
			
			$.ajax({
				  type: "GET",
				  url: serverURL + "users/" + userId + "/currSubSection",
				  success: function(data){
			 		
						sectionId = data['currentSection'];
						subsectionId = data['currentSubSection'];
			
			 			activeSectionId = data['activeSection'];
						activeSubSectionId = data['activeSubSection'];
			
		//				setStatus("false");
						
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/toolbox",
							  success: function(data1){
					
								  	$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
									$("#exercise-title").html(data1['exerciseTitle']);
								  	
								  	myFunction(data1['lists']);
									myFunct(data1['image']);
									
							  },
							  error: function() {
								  alert("Error Occured due to " + serverURL + "sections/" + sectionId + "/subsections/toolbox/" + subsectionId);
								  //window.location.href = "error.html";
							  } 
						});	
					
				  },
				  error: function() {
					  alert("Error Occured due to " + serverURL + "users/" + userId + "/currSection");
					  //window.location.href = "error.html";
				  } 
			});
			
			function myFunction(arr) {
	    	    var out = '<ol>';
	    	   
	    	    for(i = 0; i < arr.length; i++) {
	    	    	
	    	    	out += '<li>' + arr[i] + '</li>';
				}
   				out += '</ol>';
   				
	    	    $('#paragraph').html(out);
    	   	}
			
			function myFunct(arr) {
				var out = '';
				out += '<img class="img-responsive" width="768px;" src="' + arr + '">';
				
	    	    $('#images').html(out);
			}
	   	});
		
		
	</script>
	
</body>
</html>