<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Section</title>

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
	<script src="bs/js/jquery.session.js"></script>
	<script src="bs/js/bootstrap.min.js"></script>
 	<script src="js/values.js"></script>
	<script src="js/Chart.min.js"></script>
	 <script src="js/inc.js"></script>
	<style>
	.right
	{
	text-align:right;
	}
	</style>
 	
	<script type="text/javascript">
		
		history.forward();
		
		$(function(){
			
			$('#header').load("navHeader.html");
			$("#includedContent").load("sectionSideNav5.html"); 
	        $('[data-toggle="tooltip"]').tooltip();
	        $('#progress').load("progressBar.html");
	        
	    });	
		
		
	</script>
</head>
<body class="bgcolor" oncontextmenu="return false">
<div class="bgcolor">
	<div id="header">
	</div>
	
	<div id="review">
	</div>
		
	<div class="container-fluid" style="height: 100%">
	<div class="row">
		<div id="includedContent" class="col-md-2">
			
		</div>
		<div class="col-md-10">
			<div class="">
				<div id="progress">
				</div>
				<div id="quotes" class="text-justify"></div>
               	<h3><b id="section-name" style="font-family: alegreya;"></b>&emsp;<small><em id="pr" class="hidden">Personally Relevant</em></small></h3>
               	<h3><small><em id="id16" class="hidden"><b>Cultivating positive emotions</b></em></small></h3> 
				<hr>
				
				<!-- Section Details like Estimated Time and so on -->
                <div id="content" style="font-family: opensans;" class="row">
               		<div class="col-md-6">
                		<div>
							<h4>What is here?</h4>
							<div id="subsection-list">
							</div>
							<br>
							<br>
							<div class="panel-body">
								<div class="form-group row">
									<h5><strong>I am ready</strong>&emsp;<a id="start" type="button" onclick="getNextSubSection3()" 
											class="btn btn-success has-spinner"> 
										<span class="spinner"><i class="icon-spin icon-refresh"></i></span>
										&emsp;Start&emsp;
									</a> </h5>
									&emsp;
									
																
								</div>
							</div>	
							
						</div>
                    </div>
                </div>
   			</div>
		</div>
	</div>
</div>
</div>	
	<script type="text/javascript">
	
		function setFont(id) {
			if(id == 1) {
				$("#section-name").css('font-family', 'ptsans');
				$("#content").css('font-family', 'ptserif');
			}
			else if(id == 2) {
				$("#section-name").css('font-family', 'alegreya');
				$("#content").css('font-family', 'opensans');
			}
			else if(id == 3) {
				$("#section-name").css('font-family', 'baskerville');
				$("#content").css('font-family', 'ptserif');
			}
			else {
				$("#section-name").css('font-family', 'baskerville');
				$("#content").css('font-family', 'opensans');
			}
			
				
		}
		
		$(document).ready(function() {
		
			 $.ajax({
				  type: "GET",
				  url: serverURL + "users/" + userId + "/currSection",
				  success: function(data){
			
				        if(data['prSection'] == "true") {
							  $("#pr").removeClass("hidden");
						}
						
				 		sectionId = data['activeSection'];
						subsectionId = data['activeSubSection'];
						
						
						if(sectionId==16)
						{
						$("#id16").removeClass("hidden");
						}
						
						$('#start').attr("onclick", "getNextSubSection3("+sectionId+", "+subsectionId+")");
						
						$.cookie('sectionId', sectionId);
						$.cookie('subsectionId', subsectionId);
						
						if(sectionId != 1) {
							
							if(data['review'] == '') {
				      			$('#reviewModal').modal({
						        	  backdrop: 'static',
						        	  keyboard: false
				      		 	});
							}
				      	}
						
			 			if(subsectionId > 0) {
			        		$("#start").html("&emsp;Resume&emsp;");
			 			}
			 			
			 			$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + sectionId,
							  success: function(data){
						
								  	sectionId = data['sectionId'];
								  	
							        
							      	$("#section-name").html(data['sectionName']);
							        
							        if(data['noOfExercises'] != "")
							        	$("#no-of-exercises").html(data['noOfExercises']);
							        else
							        	$("#no-of-exercises").addClass("hidden");
							        
							        myFunction(data['sectionDesc']);
									
									$("#section-name").css('font-family', 'alegreya');
									$("#content").css('font-family', 'opensans');
									
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
			 
			 var blockedSec = [];
			 $.ajax({
				 
				 type: "GET",
				  url: serverURL + "users/getlocksection?userId="+ userId,
				  success: function(data){
					  blockedSec = JSON.parse("[" + data + "]");
				 } 
			 });
			
			function myFunction(arr) {
	    	    var out = '<ul class="list-unstyled">';
	    	    for(i = 0; i < arr.length; i++) {
	    	    	out +=  '<li>&emsp;' + (sectionId-10) + '.' + (i+1) + '&emsp;' + 
			    				'<i>' + arr[i] + '</i>' + 
			    			'</li>';
	    	    }
	    	    out += '</ul>';
	    	    
	    	    $("#subsection-list").html(out);
	    	    
				$("#collapseTwo").addClass("in"); 
		    	
				var blockedSec = [8];
		    	for (x = 1; x <= 10; x++) {
		        	if(x == sectionId) {
						$("#section" + x).addClass("btn-primary active");
						$("#glyph" + x).addClass("glyphicon glyphicon-play-circle");
					}
		        	else if(x < sectionId) {
						$("#section" + x).addClass("btn-success");
						$("#glyph" + x).addClass("glyphicon glyphicon-ok");
					}
		        	else if(blockedSec.indexOf(x)!=-1){	
		        		$("#section" + x).addClass("btn-success");
						$("#glyph" + x).addClass("glyphicon glyphicon-ok");
		        	}
					else {
						$("#section" + x).addClass("btn-danger disabled");
						$("#glyph" + x).addClass("glyphicon glyphicon-lock");
					}
				}
	    	}		
			
			function myFunc(arr) {
				var out = "";
	    	    for(i = 0; i < 1; i++) {	//arr.length
	    	    	out +=  '<blockquote style="border: 1px solid #EEB;">' + 
	    	    				'<p>' + arr[i].quote + '</p>' +  
	    	    		  		'<footer><cite>' + arr[i].author + '</cite></footer>' + 
    	    		  		'</blockquote>';
	    	    }
	    	    $("#quotes").html(out);
	    	    
			}
		});
		
	</script>
</body>
</html>