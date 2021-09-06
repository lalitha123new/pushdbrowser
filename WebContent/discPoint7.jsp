<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	<link href="css/style.css" rel="stylesheet">
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	
	
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="js/values.js"></script>
    <script src="js/inc.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
	
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
					<img class="img-responsive" alt="" src="images/ss-dp.jpg">
				</div>
				<div class="col-md-10 col-sm-8">
					<div class="row">
					<div id="section9"><h3><b>Harness the power of support</b></h3></div>
						<h3><b id="subsection-name"></b></h3>
						<p id="subsection-desc" class="text-justify">
						</p>				
						<hr style="border-bottom: 1px solid black;">
						<h5 id="exercise-title"></h5>
						<p id="exercise-desc" class="text-justify">
						</p>	
						<div class="clearfix"></div>
						<div class="row">
							<div class="col-md-10">
								<form id="myForm">
									<ul id="section-ques" class="list-group">
									</ul>
									<button id="submit" type="button" onclick="checkCheckPointsSelected()" class="btn btn-primary">Submit</button>
								</form>
							</div>
						</div>	<!-- row -->
					</div>	<!-- row -->
				</div>	<!-- col-md-10 -->		
			</div>
			<br>
			<div class="clearfix"></div>
			<br>
			<br>
			
			<div class="row">
				<div class="col-md-9">
				</div>
				<div id="next" class="col-md-2 hidden">
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
					Summary
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body text-justify">
					<p id="feedback"></p>
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
	
		$(document).ready(function(){

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
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/practice1",
							  success: function(data1){
								  
								  $("#subsection-name").html(activeSectionId+"."+activeSubSectionId+" "+data1['subSectionName']);
								  $("#subsection-desc").html(data1['subSectionDesc']);
								  $("#exercise-title").html(data1['exerciseTitle']);
						          $("#exercise-desc").html(data1['exerciseDesc']);
						          $('#feedback').html(data1['feedback']);
						         
						         	
						          	arr = data1['questions'];
						
						       
					          		var out = "";
								    for(i = 0; i < arr.length; i++) {
								        out +=  '<li class="list-group-item"> <div class="checkbox"><label> <input type="checkbox" onchange="showExp(' + arr[i].quesNo + ')" id="' + arr[i].quesNo + '" name="check" value="' + arr[i].quesNo + '">' + 
								        						arr[i].ques + '</label>' + 
							        					  '</div>' +  '<div class = "hidden" id = "e' + arr[i].quesNo + '" >' + arr[i].explanations + '</div>'
							       					  '</li>'
							       					 
							    				;
					    				ans.push(arr[i].ans);
									}
								  
								    $("#section-ques").html(out);
								   
								   
								    
								   disableCheckBoxesWhenReviewing(data1['questions'].length);
								    
							   
							   	
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
			    
		    	
			}
		});
		
		function showExp(id) {
            if($('#'+ id).prop("checked") == true){
            	
            	$('#e'+ id).removeClass("hidden");
            }
            else {
            	$('#e'+ id).addClass("hidden");
            }
		}
		
	    
		function disableCheckBoxesWhenReviewing(length)
		{
			flag = false; // set this to true if he is reviewing
			if(sectionId == activeSectionId)
			{
				if(subsectionId == activeSubSectionId)
				{
					//he is not reviewing	data['questions']
				}
				else
				{
					
					flag = false;	
				}
			}
			else
			{
				flag = false;
				$("#next").removeClass("hidden");
			}
			
			//flag is true then disable the checkboxes
			if(flag == true)
			{
				checkpoint();
				for(i=1; i<=length; i++)
				{
					$('#' + i).prop("disabled", "disabled");
				}
			}
		}
		
		function checkCheckPointsSelected()
		{
			var checked = false; //set it to true if none of the check boxes are filled
			var counter = 0;
				for ( j = 1; j <= i; j++) 
				{
					if($('#' + j).is(":checked")) 
					{
						
						counter++;
					} 
					else
					{
						//counter ++;
					}
				
			}
				if(counter > 0)
				{
					checkpoint();	
				}
				else
				{
					
					alert("Please select atleast one checkbox");	
				}
		}
		
		
		var ans = [];
		var count = 0;
		
		function checkpoint() {
			str = '';
			formData = '';
			flag = false;
			
			for ( j = 1; j <= i; j++) {
				
				if($('#' + j).is(":checked")) {
					formData += 'check=' + j + '&';		
					count ++;
				} 
					
				if(("-"+$('#' + j).is(":checked")) == ("-"+ans[(j-1)])) {
					if(ans[(j-1)] == "true") {
						formData += 'suicide=true&';
						flag = true;
					}
				}	
				
				$('#' + j).prop("disabled", true);
			}
			
			$('#submit').addClass("hidden");
			$('#myModal').modal('show');
			$('#next').removeClass("hidden");
		}
	</script>
	
</body>
</html>