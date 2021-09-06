<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
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
    <style type="text/css">
    .hidebtn {
  width: 60px;
  height: 50px;
  background: transparent;
  position: absolute;
  right: 235px;
  top: 470px;
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
				<div id=""><h3><b>Understanding Depression</b></h3></div>
					<h3><b id="subsection-name"></b></h3>
					<p id="subsection-desc" class="text-justify">
					</p>				
					<hr style="border-bottom: 1px solid black;">
					<h3 id="exercise-title"></h3>
					<p id="exercise-desc" class="text-justify">
					</p>
					<p id="paragraph"></p>
				</div>
			</div>
			<div class="clearfix"></div>		
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
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div id="feedback" class="modal-body text-justify">
				</div>
				<div class="modal-footer">
					<button id="myInput" type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
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
			
						
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/video",
							  success: function(data1){
					
								  	$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
									$("#exercise-title").html(data1['exerciseTitle']);
								  	
								  	
								  	myFunction(data1['paragraphs']);
								  	myFunc(data1['feedbacks']);	  	
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
			
			function myFunc(arr) {
				var out = '';
		    	   
	    	    for(i = 0; i < arr.length; i++) {
	    	    	
	    	    	out += '<p>' + arr[i] + '</p>';
				}
					
	    	    $('#feedback').html(out);
			}
	   	});
		
		var count = 0;
		
		function next() {
			
			if(count == 0 && $('#feedback').html() != '') {
				$('#myModal').modal('show');
			}
			else if(count == 1 || $('#feedback').html() == '') {
				getNextSubSection();
			}
			count++;
			
		}
	</script>
	
</body>
</html>