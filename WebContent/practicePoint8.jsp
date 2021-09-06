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
	<link href="css/animate.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	
	<script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
    <script src="js/inc.js"></script>
	<script src="js/values.js"></script>

    <script type="text/javascript">
    history.forward();
    	$(function(){
    		$('#header').load("navHeader.html");
    		$('#summary').load("summary.html");
    		$('#next').load("nextButton.html");
	        $("#includedContent").load("sectionSideNav2.html");
	        $('#progress').load("progressBar.html");
	        $('[data-toggle="tooltip"]').tooltip();
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
					<div id="section5"><h3><b>Manage excessive worries</b></h3></div>
						<h3><b id="subsection-name"></b></h3>
						<p id="subsection-desc" class="text-justify"></p>				
						<hr style="border-bottom: 1px solid black;">	
						<div class="clearfix"></div>
						<h4 id="exercise-title"></h4>
						<p class="text-justify">For each worry statement given below, 3 different responses (ways of self-talk) are provided. Identify the mind state associated with each of the 3 responses given for each worry.</p>
						<br>
						<p id="exercise-desc" class="text-justify"></p>
						<div id="exercise">
						</div>
					</div>
				</div>		
			</div>
			<div class="clearfix"></div>
			<br>
			<br>
			<div class="row">
				<div class="col-md-9">
				</div>
				<div id="next" class="col-md-2 hidden">
				</div>
			</div>
			<div class="clearfix"></div>
			<br>
			<br>
			<br>
			
		</div>
	</div>
	</div>
	<div class="clearfix"></div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					My Notes
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<textarea rows="5" class="form-control" placeholder="Today I am thinking about ....."></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="clearfix"></div>
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
			
						
						
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/discovery2",
							  success: function(data1){
						
								  	$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
									$("#exercise-title").html(data1['exerciseTitle']);
							        $("#exercise-desc").html(data1['exerciseDesc']);
							      
							        
							       
							        var arr1 = data1;
							        
							        arr = arr1['questions'];
						    	    var exer = "";	//	exercise
						    	    
						    	    exer += '<ol>';
						    	    
						    	    for(i = 0; i < arr.length; i++) {	//arr.length
						    	    	exer += '<li  style = "border:1px solid black;margin-bottom:60px;background-color:#FFE0B2;padding-left:5px;">' + 
						    	    				'<div id="q'+i+'">' +
						    	    					'<p><strong>' + arr[i]['ques'] + '</strong></p>' +
						    	    					'<div class="clearfix"></div>' +
						    							'<ol id="qo-'+i+'">';
					 					
						    			for (j = 0; j < arr[i]['quesLists'].length; j++) {
						    				
						    				arr2 = arr[i]['quesLists'];
						    				
											exer += 	 	'<li id="qo-'+i+'-'+j+'">' +
																'<p style="padding-left: 20px; margin-bottom: 0px;text-align:justify;">' + arr2[j]['ques'] +
																'<input type="hidden" id="qo-'+i+'-'+j+'-ans" value="'+ arr2[j]['ans'] + '">' +
																'</p>' +
																'<div style="width: 50%; margin-left: 5px;">';
											
											for (k = 0; k < arr1['options'].length; k++) {
												exer += 			'<div class="col-md-4 radio" style="margin-top: 5px;">';
																		
												
													if(sectionId == activeSectionId) {
													exer +=					'<label><input type="radio" id="qo-'+i+'-'+j+'-o-'+k+'" name="qo-'+i+'-'+j+'-o" onchange="showExp(`qo-'+i+'-'+j+'-o-'+k+'`, '+i+', '+j+')" value="'+arr1['options'][k]+'">' + arr1['options'][k];
													}else if(sectionId < 5){
														exer +=					'<label><input type="radio" id="qo-'+i+'-'+j+'-o-'+k+'" name="qo-'+i+'-'+j+'-o" onchange="showExp(`qo-'+i+'-'+j+'-o-'+k+'`, '+i+', '+j+')" value="'+arr1['options'][k]+'">' + arr1['options'][k];
														
														
													}else {
													if(arr2[j]['ans'] == arr1['options'][k])
														exer += 			'<label style="color: green;"><input type="radio" checked disabled>' + arr1['options'][k];
													else	
														exer += 			'<label><input type="radio" disabled>' + arr1['options'][k];
												}	
												
												exer +=					'</label>' +
																	'</div>';
											}
											
											exer += 			'</div>' +
																'<div class="clearfix"></div>' +
																'<div id="qo-'+i+'-'+j+'-exp" class="hidden thumbnail" style="background-color: lightblue; padding: 10px 15px;">' + 
																	'<p id="qo-'+i+'-'+j+'-exp-'+1+'" class="hidden" style="color: green; margin-bottom: 0px;">You got it RIGHT ! </p>' +
																	'<p id="qo-'+i+'-'+j+'-exp-'+2+'" class="hidden" style="color: red; margin-bottom: 0px;">SORRY ! The correct answer is <strong>: ' + arr2[j]['ans'] + '</strong></p>' +
																'</div>' +
																'<br>' +
															'</li>';
										}
						    			exer +=			'</ol>' +
						    						'</div>' +
						    						'<div class="clearfix"></div>' + 
						    						'<hr>' + 
						    					'</li>';	
						    	    }
						    	    
						    	    exer += '</ol>';
						    	    
						    		$("#exercise").append(exer);
						    		
						    		if(sectionId != activeSectionId) {
						    			$('#next').removeClass("hidden");
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
		
			function myFunction(arr1) {
				
	       	}
		
	   	});
		

	function showExp(id, i, j) {
		if($('#'+id).val() == $('#qo-'+i+'-'+j+'-ans').val()) {
			$('#qo-'+i+'-'+j+'-exp').removeClass("hidden");
			$('#qo-'+i+'-'+j+'-exp-1').removeClass("hidden");
		}
		else {
			$('#qo-'+i+'-'+j+'-exp').removeClass("hidden");
			$('#qo-'+i+'-'+j+'-exp-2').removeClass("hidden");
		}
		for (k = 0; k < 3; k++) {
			$('#qo-'+i+'-'+j+'-o-'+k).prop("disabled", "disabled");
		}
		flag = true;
		for (a = 0; a < 3; a++) {
			for (b = 0; b < 3; b++) {
				if($('#qo-'+a+'-'+b+'-exp').hasClass("hidden"))
					flag = false;
			}
		}
		if(flag == true)
			$('#next').removeClass("hidden");
	}
	</script>
</body>
</html>