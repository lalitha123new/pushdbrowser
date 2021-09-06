<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
	<script src="bs/js/jquery.cookie.js"></script>
    <script src="js/values.js"></script>
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
	<style>
	    .hidebtn {
  width: 60px;
  height: 50px;
  background: transparent;
  position: absolute;
  right: 60px;
  top: 10px;
}
</style>
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
					<img class="img-responsive" alt="" src="images/ss-kp.jpg">
				</div>
				<div class="col-md-10 col-sm-8">
					<div class="row">
					<div class="hidden" id="section1"><h3><b>Understanding Depression</b></h3></div>
					<div class="hidden" id="section3"><h3><b>Activate: Baby steps to move ahead</b></h3></div>
					<div class="hidden" id="section4"><h3><b>Dealing with depressive thoughts</b></h3></div>
						<h3><b id="subsection-name"></b></h3>
						<div class="clearfix"></div>
						<p id="exercise-title" class="text-justify">
						</p>				
						<hr style="border-bottom: 1px solid black;">
						<div class="clearfix"></div>
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<div id="videos">
							</div>
							<!-- <div class="pull-right">
								<a href="#" class="btn btn-info" data-toggle="modal"
									data-target="#showtext">Want Elaboration...?</a>
							</div> -->
							<br>
							<br>
							<br>
							<div id="images">
							</div>
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
	<br><br>
	
	<!-- --------Model ------------------------ -->
	<div class="modal fade" id="showtext" role="dialog" >
		<div class="modal-dialog modal-lg" >
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success text-center">
					<h5>Elaboration</h5>
				</div>
				<div id="paragraph" class="text-justify" style="padding: 20px 50px;">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------------------------------------------------------------- -->
	
	
	<br>
	<br>
	<br>
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
						if((sectionId==1 && subsectionId==5) || (activeSectionId==1 && activeSubSectionId==5))
			    	    {
			    	    $("#section1").removeClass("hidden");
			    	    }
						else if((sectionId==3 && subsectionId==1) || (activeSectionId==3 && activeSubSectionId==1))
			    	    {
			    	    $("#section3").removeClass("hidden");
			    	    }
					  	else if((sectionId==4 && subsectionId==1) || (activeSectionId==4 && activeSubSectionId==1))
			    	    {
			    	    $("#section4").removeClass("hidden");
			    	    }
						
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/knowledge",
							  success: function(data1){
								  		
								  	$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
									myFunction(data1['paragraphs']);
								  	
								  	myFunct(data1['images']);
									
								  	if(data1['video']) {
								  		myFunctionVideo(data1['video']);	
							  		}
								  	
							  },
							  error: function() {
								  alert("Error: server encountered an internal error. Please try again after some time ");
								 
							  } 
						});	
					
				  },
				  error: function() {
					  alert("Error: server encountered an internal error. Please try again after some time ");
					  
				  } 
			});
		
			function myFunction(arr) {
	    	    var out = '';
	    	   	
	    	    for(i = 0; i < arr.length; i++) {
	    	    	out += '<p>' + arr[i] + '</p>';
				}	
	    	    $('#paragraph').html(out);
		   	}
			
			function myFunct(arr) {
				var out = '';
	    	    for(i = 0; i < arr.length; i++) {
		    		out += '<img class="img-responsive" width="768px;" src="' + arr[i] + '"><br>';
		    	}	
	    	    $('#images').html(out);
			}
			
			function myFunctionVideo(arr) {
				var out = '';
	    	 	
				out +=  arr + '<br><br>';
		    	
	    	    $('#videos').html(out);
			}
	   	});
		
	</script>
</body>
</html>