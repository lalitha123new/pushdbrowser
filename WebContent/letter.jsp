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

	<!-- Bootstrap -->
	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">	
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
 	<script src="js/values.js"></script> 
 	<script src="js/inc.js"></script>   
    <script src="bs/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	    
    	$(function(){
    		$('#header').load("navHeader.html");
    		$('#summary').load("summary.html");
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
  right: 245px;
  top: 100px;
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
					<img class="img-responsive" alt="" src="images/ss-letter.png">
				</div>
				<div class="col-md-10 col-sm-8">
					<div class="row">
					<div id=""><h3><b>Enhance Self-care motivation</b></h3></div>
						<h3><b id="subsection-name"></b></h3>
						<p id="subsection-desc" class="text-justify">
						</p>				
						<hr style="border-bottom: 1px solid black;">
						<h3 id="exercise-title"></h3>
						<p id="exercise-desc" class="text-justify">
						</p>
						<p id = "paragraph"></p>
						
						 <div id = "slider" class = "hidden"><img class="img-responsive" alt="" src="images/another-letter-_27119097-page-001.jpg" style=padding-bottom:50px;">
						<a href="workbook.jsp#subsection-2-2"><span><b>Click here to go to workbook to do the exercise</b></span></a>
						</div>
						
						
						<div class="clearfix"></div>
						
						
						
					 	<br>
						<br>
					</div>
				</div>
			</div>
			<br>
			<div class="clearfix"></div>
			<br>
			<br>
			
			<div class="row">
				<div class="col-md-9">
				</div>
				<div id="next" class="col-md-2">
					<button class="alert alert-info text-center btn-block" role="alert" 
							onclick="next()" style="text-decoration: none;">
						<strong>NEXT &emsp;</strong> 
						<span class="glyphicon glyphicon-chevron-right"></span>
					</button>
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
									
									 if((sectionId==2 && subsectionId==2) || (activeSectionId==2 && activeSubSectionId==2))
									{
										
								  		$('#slider').removeClass("hidden");
								  		
									}
								  	
								  	$("#video").html('<source src="' + data1['video'] + '" type="video/mp4">');	//prop("src",data['video']);
								  	
								  
								  	var arr = data1['paragraphs'];
								  	var out = '';
	    	   
						    	    for(i = 0; i < arr.length; i++) {
						    	    	out += '<p>' + arr[i] + '</p>';
									}
										
						    	    $('#paragraph').html(out);
						    	    
								  	
						    	    
						    	    arr = data1['feedbacks'];
						    	    out = '';
							    	   
						    	    for(i = 0; i < arr.length; i++) {
						    	    	out += '<p>' + arr[i] + '</p>';
									}
										
						    	    $('#feedback').html(out);
						    	    
						    	    /**********************************/
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
	   	});
		
		var count = 0;
		
		function next() {
			
			if(activeSectionId == sectionId && activeSubSectionId == subsectionId) {
				if(count == 0 && $('#feedback').html() != '') {
					$('#myModal').modal('show');
				}
				else if(count == 1 || $('#feedback').html() == '') {
					setStatus("true");
				}	
			}
			else {
				setStatus("true");
			}
				
			
			count++;
			
		}
	</script>
	
</body>
</html>