<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	<script src="js/values.js"></script>
	<script src="js/inc.js"></script>
    <script type="text/javascript">
    
    	history.forward();
    	
    	$(function(){
    		
    		$('#header').load("navHeader.html");
    		$('#summary').load("summary.html");
    		$("#includedContent").load("sectionSideNav2.html");
	        $('#next').load("nextButton.html");
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
					<img class="img-responsive" alt="" src="images/ss-dp.jpg">
				</div>
				
				<div class="col-md-10 col-sm-8">
				
					<div class="row">
					
					<div id=""><h3><b>Understanding Depression</b></h3></div>
					
						<h3><b id="subsection-name"></b></h3>
						<p id="subsection-desc" class="text-justify"></p>				
						<hr style="border-bottom: 1px solid black;">
						<div class="clearfix"></div>
						<h4 id="exercise-title" style="font-size:20px;font-weight: bold;"></h4>
						<p id="exercise-desc" class="text-justify"></p>
						
						<div class="col-md-7 text-justify" style="padding-top: 25px;font-weight: bold;font-size:16px;" id="exercise">
						</div>
						
						<div class="col-md-4" style="padding-top: 20px;">
							<div id="choose" class="thumbnail">
							</div>
						</div>
						
						<div id="nextButton" class="col-md-1" style="padding-top: 20px;">
							<button id="ok" class="btn hidden btn-success btn-block text-center" onclick="next()">Next</button></div>
						</div>
						
						<div class="clearfix"></div>
						
						<div id="exp" class="thumbnail hidden" style="background-color:#FFE0B2;">			
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
				
				<div id="next" class="col-md-2 hidden">
				</div>
				
			</div>
					
		</div>
				
			<nav id="page" class="text-center">
			</nav>
			
		</div>
					
					
		
	</div>
	
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
	
	
	<!-- Modal -->
	
	<div class="modal fade" id="completeModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4>You can now review the myths and facts by clicking on the page numbers</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
			</div>
		</div>
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
			
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/discovery",
							  success: function(data1){
						
								  	$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
									$("#exercise-title").html(data1['exerciseTitle']);
							        $("#exercise-desc").html(data1['exerciseDesc']);
							     
							        reviewing(data1['questions'].length);
							        myFunction(data1['questions']);
							        
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
			function reviewing(length){
			
				flag1 = false; // set this to true if he is reviewing
				if(sectionId == activeSectionId){
				
					if(subsectionId == activeSubSectionId)
					{
						//he is not reviewing	data['questions']
					}
					else
					{
						flag1 = true;	
					}
				}
				else
				{
					flag1 = true;	
				}
				
				//flag is true then disable the checkboxes
				if(flag1 == true)
				{
					
					
					
					$("#next").removeClass("hidden");
					
				}
			}
		
			function myFunction(arr) {
	    	    var out1 = "",	//	exercise
	    	    	out2 = "";	//	explanations	out3 = option buttons
	    	    	
	    	    var out4 = '';	//	pagination
	    	  
	    	    
	    	    out4 = '<ul id="pagination" class="pagination">' +
    	    				'<li disabled>' + 
    	    					'<a href="#" aria-label="Previous">' + 
    	    						'<span aria-hidden="true">&laquo;</span>' + 
   	    						'</a>' +
   	    					'</li>';
    	    		
   	    		var out5 = '';
	    	    for(i = 0; i < arr.length; i++) {
	    	    	
	    	    	out1 = "";
	    	    	var exp = arr[i].explanations;
	    	    	out2 = '<div id="e' + arr[i].quesNo + '" class="caption hidden text-justify">' +
	    	    				'<p class="text-center" id="r' + arr[i].quesNo + '"></p><hr>' + 
    	    					'<span><strong>Explanation</strong></span>';
	    	    	
	    	    	for (j = 0; j < exp.length; j++) {
	    	    		
						out2 += '<p>' + exp[j] + '</p>';
					}
	    	    	
	    	    	out3 = "";
	    	    	if(i == 0) {
	    	    		
	    	    		out1 += '<div id="panel' + arr[i].quesNo + '" class="animated fadeInUp bs-callout bs-callout-primary" style="background-color: #99ebff;">' + 
									'<a style="text-decoration: none; color: black;" href="#e' + arr[i].quesNo + '" onclick="show(' + arr[i].quesNo + ')">' +
										arr[i].ques + '</a>' +
								'</div>';
	    	    		out3 = '<div id="option' + arr[i].quesNo + '" class="caption">'; 
	    	    		out4 += '<li id="l' + arr[i].quesNo + '" class="active">' + 
	    	    					'<a href="#panel' + arr[i].quesNo + '" onclick="show(' + arr[i].quesNo + ')">' + 
    	    							arr[i].quesNo + 
   	    							'</a>' + 
    							'</li>';
	    	    							
	    	    	}
	    	    	else {
	    	    		out1 += '<div id="panel' + arr[i].quesNo + '" class="animated fadeInUp bs-callout bs-callout-primary hidden" style="background-color: #99ebff;">' + 
									'<a style="text-decoration: none; color: black;" href="#e' + arr[i].quesNo + '" onclick="show(' + arr[i].quesNo + ')">' +
												arr[i].ques + '</a>' +
								'</div>'	
						out3 = '<div id="option' + arr[i].quesNo + '" class="caption hidden">'; 
	    	    	
						out4 += '<li id="l' + arr[i].quesNo + '" class="disabled">' + 
		    					'<a href="#panel' + arr[i].quesNo + '" onclick="show(' + arr[i].quesNo + ')">' + 
									arr[i].quesNo + 
									'</a>' + 
							'</li>';
						
	    	    	}
	    	    	
	    	    	out3  += 	'<h4>&emsp;Choose any one</h4>' + 
		    					'<div class="col-md-4" style="padding: 0px 10px;">' + 
		    						'<a type="button" id="a' + arr[i].quesNo + '" href="#e' + arr[i].quesNo + '" onclick="set(`a' + arr[i].quesNo + '`)" ' + 
		    							'class="btn btn-sm btn-success btn-block">Agree</a>' + 
	   							'</div>' + 
	   							'<div class="col-md-4" style="padding: 0px 10px;">' + 
	   								'<a type="button" id="d' + arr[i].quesNo + '" href="#e' + arr[i].quesNo + '" onclick="set(`d' + arr[i].quesNo + '`)" ' +
	   									'class="btn btn-sm btn-danger btn-block">Disagree</a>' + 
								'</div>' + 
								'<div class="col-md-4" style="padding: 0px 10px;">' + 
									'<a type="button" id="n' + arr[i].quesNo + '" href="#e' + arr[i].quesNo + '" onclick="set(`n' + arr[i].quesNo + '`)" ' +
										'class="btn btn-sm btn-warning btn-block">Not Sure</a>' + 
								'</div>' +
								'<br><br>' +
								'<input type="hidden" id="f' + arr[i].quesNo + '" name="feedback" value="' + arr[i].ans + '">'
   							'</div>';
   					
   					$('#choose').append(out3);	
	    	    	$('#exp').append(out2);
	    	    	$("#exercise").append(out1);
	    	    }
    	   		out4 += 	'<li>' + 
		    	   				'<a href="#" aria-label="Next">' + 
		    	   					'<span aria-hidden="true">&raquo;</span>' + 
	    	   					'</a>' + 
	   	   					'</li>' + 
   	   					'</ul>';
   	   			
   	   			$('#page').html(out4);
   	   			
    	   	}
	   	});
		
		var q;
		var formData = "";
		
		function set(btn) {
			
	    	$('#ok').removeClass("hidden");
			var b = btn.charAt(0);
			q = btn.substring(1,btn.length);
			if(q != 1)
				formData += "&";
			
			if($('#f'+q).val() == "agree") {
				
				if(b == 'a') {
					
					$("#r"+q).css('color','green');
					$("#r"+q).html("You are right!");
					formData += "check=1";
				}
				else if (b == 'd') {
					
					$("#r"+q).css('color','red');
					$("#r"+q).html("SORRY ! Please Check Your Belief !");
					formData += "check=2";
				}
				else {
					
					$("#r"+q).css('color','red');
					$("#r"+q).html("SORRY ! Please Check Your Belief !");
					formData += "check=3";	
				}
			}
			else {
				if(b == 'd') {
					
					$("#r"+q).css('color','green');
					$("#r"+q).html("You are right!");
					formData += "check=2";
				}
				else if (b == 'a') {
					
					$("#r"+q).css('color','red');
					$("#r"+q).html("SORRY ! Please Check Your Belief !");
					formData += "check=1";
				}
				
				else {
					
					$("#r"+q).css('color','red');
					$("#r"+q).html("SORRY ! Please Check Your Belief !");
					formData += "check=3";	
				}
			}	
			$("#a"+q).removeClass("btn-success btn-primary");
			$("#d"+q).removeClass("btn-danger btn-primary");
			$("#n"+q).removeClass("btn-warning btn-primary");
			$("#a"+q).addClass("disabled");
			$("#d"+q).addClass("disabled");
			$("#n"+q).addClass("disabled");
			$("#"+btn).addClass("btn-primary");
			for(l=1; l<=i; l++) {
				
	    		$("#option"+l).addClass("hidden");
	    		$("#e"+l).addClass("hidden");
		    }
			
	    	$("#option"+q).removeClass("hidden");
	    	$("#exp").removeClass("hidden");
	    	$("#e"+q).removeClass("hidden");
	    	//$("#ok").focus();
	    }
		
		function show(btn) {
			
			if($("#panel"+btn).hasClass("bs-callout-success")) {
				
				$("#exp").removeClass("hidden");
				for(l=1; l<=i; l++) {
					
		    		$("#option"+l).addClass("hidden");
		    		$("#e"+l).addClass("hidden");
		    		$("#l"+l).removeClass("active");	//	added
		    		$("#panel"+l).addClass("hidden");	//	added
			    }
				
				$("#l"+btn).addClass("active");			//	added
				$("#panel"+btn).removeClass("hidden");	//	added
				$("#option"+btn).removeClass("hidden");
				$("#e"+btn).removeClass("hidden");	
	    		
			}
			else {
				
				for(l=1; l<=i; l++) {
					
		    		$("#option"+l).addClass("hidden");
		    		$("#e"+l).addClass("hidden");
		    		$("#l"+l).removeClass("active");	//	added
		    		$("#panel"+l).addClass("hidden");	//	added
			    }
				$("#l"+btn).addClass("active");	//	added
				$("#panel"+btn).removeClass("hidden");	//	added
				$("#exp").addClass("hidden");
			}	
			$("#option"+btn).removeClass("hidden");
		}
		
		function next() {
			
			$('#ok').addClass("hidden");		/* Added */
			
				$("#exp").addClass("hidden");
				$("#panel"+q).removeClass("bs-callout-primary");
				$("#panel"+q).addClass("bs-callout-success hidden");
				$("#panel"+q).css('background-color','#99ff99');
				$("#panel"+q).css('color','#333');
				var flag = true;
				
				for(l=1; l<=i; l++) {
					
		    		$("#option"+l).addClass("hidden");
		    		$("#e"+l).addClass("hidden");
		    		$("#l"+l).removeClass("active");	//	added
		    		if(!($("#a"+l).hasClass("btn-primary") || $("#d"+l).hasClass("btn-primary") || $("#n"+l).hasClass("btn-primary")))
						
		    			flag = false;
			    }	
			
			q++;
			$("#option"+q).removeClass("hidden");
			$("#panel"+q).removeClass("hidden");
			$('#l'+q).removeClass("disabled");
			$("#l"+q).addClass("active");	//	added
			
			if(flag == true){
			
				$('#completeModal').modal('show');
				$("#next").removeClass("hidden");
				$("#pagination").removeClass("hidden");
				show(1);
				$("#ok").addClass("hidden");
			}
	    }
		
	    function showIcon() {
			
	    	$("#collapseOne").addClass("in");
	    	
	    	for (k = 1; k <= j; k++) {
	    		
	        	if(k == subsectionId) {
	        		
					$("#subsection" + k).addClass("btn-primary active");
					$("#glyph" + k).addClass("glyphicon glyphicon-play-circle");
				}
	        	else if(k < subsectionId) {
	        		
					$("#subsection" + k).addClass("btn-success");
					$("#glyph" + k).addClass("glyphicon glyphicon-ok");
				}
				else {
					
					$("#subsection" + k).addClass("btn-danger disabled");
					$("#glyph" + k).addClass("glyphicon glyphicon-lock");
				}
			}     	
	    }
		
	    function setSubsection() {
	    
	    	$.ajax({
				  type: "GET",
				  url: serverURL + "users/" + userId + "/sections",
				  success: function(data){
			
					  	sectionId = data['sectionId'];
					  	
					  	$.cookie("sectionId", sectionId);
				        $.cookie("subsectionId", data['currentSubSection']);
				        var sectionName = data['sectionName'];
				        
				  },
				  error: function() {
					  alert("Error: server encountered an internal error. Please try again after some time ");
					 
					  
				  } 
			});
		}
	</script>
</body>
</html>