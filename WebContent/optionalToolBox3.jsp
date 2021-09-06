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
	
	
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="js/values.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
     <script src="js/inc.js"></script>
	<script type="text/javascript">
    
	history.forward();
	
	$(function(){
		$('#header').load("navHeader.html");
		$('#next').load("nextButton3.html");
		$('#progress').load("progressBar.html");
        
   });

	
    </script>
</head>
<body class="bgcolor" oncontextmenu="return false">

	<div id="header">
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
					<div class=" " style="border:1px solid black;width:25%;" ><h6 style="text-align:center;font-weight:bold;">YOU ARE IN OPTIONAL ZONE</h6></div>
					<div class="hidden" id="section11"><h3><b>Sleep Health and Hygiene</b></h3></div>
					<div class="hidden" id="section16"><h3><b>Maintaining Wellbeing: Part one</b></h3></div>
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
							<div class="pull-right">
								<a href="#" class="btn btn-info" data-toggle="modal"
									data-target="#showtext">Want Elaboration...?</a>
							</div>
							<br>
							<br>
							<br>
							<p  class="text-justify"><b></b> </p>
							<br>
							<div class="clearfix">
							<div id="idpoint" class="hidden">
							<!--<strong>How volunteering may contribute to your wellbeing?</strong> <br><br> <li> Providing /widening our social network to interact in as well as opportunities to develop close relationships, </li><li> Broadening our perspective by interacting with people in different situations and from different backgrounds, </li>
							<li> Increasing our openness to interact with people different from us and tolerating individual differences, </li> 
							<li> Shifting attention away from our sense of misery/self-preoccupation, </li>
							<li> Appreciating what one has and experiencing gratitude </li>
							<li> Strengthening our sense of being able to contribute to something/someone </li>
							<li> Enhancing a sense of meaning in life</li>-->
							<div id="images">
							<p  class="text-justify"><b>How volunteering may contribute to your well being?</b> </p>
							<br><img class="img-responsive" alt="" src="images/volun-cont-opt6.2-poster1.png">
							</div>
            <br><br><strong>Broad types of volunteering:</strong><br><br>
            Informal volunteering is a type of volunteering that involves offering regular and voluntary help of some kind for someone other than your family/close friend, outside any formal organizational structure.
            On the other hand, formal volunteering is providing help for a cause/for a group of people through enrolling as a volunteer in an organization (e.g. an NGO).  			
            <br> <br>
            <p class="text-justify"><b>What do you need to take in account if you decide to volunteer?</b></p>  <br>
            <div id="images">
							<img class="img-responsive" alt="" src="images/volun-decide-opt6.2-poster2.png">
							</div>
           <!--<strong>What you need to take in account if you decide to volunteer: </strong>
            <br><br> <li> Look for opportunities that do not drain you but give you a chance to match your interests and skills</li>
            <li> Look for volunteering opportunities that help you slowly build your confidence in the volunteering tasks rather than take on something which is too challenging for you at any point of time </li>
            <li> Find ways to strike a right balance between your other roles/responsibilities and volunteering role </li>
            <li> Network with other volunteers to exchange experiences and insights </li>
            <li> Focus on the value of what you are doing and enjoying the process of doing your best rather than adding stress by exclusively focus on impact/ ultimate outcome. </li>
            <li> Remain aware about how volunteering experiences are influencing you as a person over time and decide the nature of your further involvement accordingly."</li>-->
              </div>
							<br>
							</div>
							
							<br>
						<p id="feedback"></p>	
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>		
		 	<div class="clearfix"></div>
		 	<br>
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
					<h5 id="exercise-title-exp">Elaboration</h5>
				</div>
				<div id="paragraph" class="text-justify" style="padding: 20px 40px; padding-left: 10px;">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------------------------------------------------------------- -->
	
	<br>
	<br>
	<br>
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript">
	
		var i=0;
		
		$(document).ready(function() {
			
			$.ajax({
				  type: "GET",
				  url: serverURL + "users/" + userId + "/currSubSection",
				  success: function(data){
			
					 	activeSectionId = data['activeSection'];
						activeSubSectionId = data['activeSubSection'];
						if(activeSectionId==16 && activeSubSectionId==2)
						{
						$("#idpoint").removeClass("hidden");
						$("#section16").removeClass("hidden");
						}
						else if(activeSectionId==11 && activeSubSectionId==2 || activeSectionId==11 && activeSubSectionId==3 || activeSectionId==11 && activeSubSectionId==4)
						{
						$("#section11").removeClass("hidden");
						}
							
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/toolbox",
							  success: function(data1){
					
								  	$("#subsection-name").html((activeSectionId-10)+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
								  	$("#exercise-title").html(data1['exerciseTitle']);
								  	$("#exercise-title-exp").html(data1['exerciseTitle']);
								  	
								  	myFunction(data1['lists']);
									myFunct(data1['image']);
									
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