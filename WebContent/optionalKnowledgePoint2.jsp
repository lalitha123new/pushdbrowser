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
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	
	
    
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
    		$('#next').load("nextButton3.html");
    		$('#progress').load("progressBar.html");
    		$('#reference').load("references.html");
	         
	    });
		
    </script>
        <style>
    	    .hidebtn1 {
  width: 60px;
  height: 50px;
  background: transparent;
  position: absolute;
  right: 245px;
  top: 925px;
}
	    .hidebtn2 {
  width: 60px;
  height: 50px;
  background: transparent;
  position: absolute;
  right: 245px;
  top: 1565px;
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
					<img class="img-responsive hidden" alt="" src="images/ss-kp.jpg" id = "kp">
				</div>
				<div class="col-md-10 col-sm-8">
					<div class="row">
					<div class=" " style="border:1px solid black;width:25%;" ><h6 style="text-align:center;font-weight:bold;">YOU ARE IN OPTIONAL ZONE</h6></div>
					<div class="hidden" id="section11"><h3><b>Sleep Health and Hygiene</b></h3></div>
					<div class="hidden" id="section12"><h3><b>Relaxation through Visualization</b></h3></div>
					<div class="hidden" id="section13"><h3><b>Depression and Interpersonal Relations</b></h3></div>
					<div class="hidden" id="section14"><h3><b>Managing Grief</b></h3></div>
					<div class="hidden" id="section15"><h3><b>Dealing with Suicidal Thoughts</b></h3></div>
					<div class="hidden" id="section16"><h3><b>Maintaining Wellbeing: Part one</b></h3></div>
					<div class="hidden" id="section17"><h3><b>Maintaining Wellbeing: Part two</b></h3></div>
					<div class="hidden" id="section18"><h3><b>References and Useful External Links</b></h3></div>
						<h3><b id="subsection-name"></b></h3>
						<div class="clearfix"></div>
						<p id="exercise-title" class="text-justify">
						</p>				
						<hr style="border-bottom: 1px solid black;">
						<div id="paragraph" class="text-justify">
						
						</div>
						<div id="reference" class="hidden">
						
						</div>
						<div class="clearfix"></div>
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<div id="images">
							</div>
						</div>
						<div class="col-md-1"></div>
						
						<table id="table" class="table text-center table-hover table-bordered">
							<thead id="thead">
							</thead>
							<tbody id="tbody">
							</tbody>
						</table>
					</div>
				</div>
			</div>		
		 	<br>
			<br>
			<div class="clearfix"></div>
			<br>
			<br>
			<div id="end" class="hidden">
			<p style="text-align: right;"><b>You have reached the end of the last section in the Optional Zone.</p><br><br><br><p style = "text-align:center;font-style:italic;font-size:20px;">If we did all the things we are capable of,<br> …we would literally astound ourselves.<br> Thomas A. Edison</b></p>
			
			</div>
			<div class="row">
				<div class="col-md-9">
				</div>
				<div id="next" class="col-md-2">
				</div>
			</div>
			<div class="hidden" id="op3"><p style="text-align: right;">This section is authored by Dr. Veena A. S. Assistant Professor, Department of Clinical Psychology, NIMHANS, Bangalore and Ms. Sukanya Srinivas Ananth, Consultant Psychologist, Columbia Asia Hospital, Hebbal, Bangalore.</p> </div>
			
		</div>
		
	</div>
	</div>
	
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
			
						activeSectionId = data['activeSection'];
						activeSubSectionId = data['activeSubSection'];
						if(activeSectionId==18 && activeSubSectionId==1 )
				  		{
				  		
							 $("#reference").removeClass("hidden");
							 $("#end").removeClass("hidden");
				  		}
						if(activeSectionId==13 && activeSubSectionId==3 )
							{
							$("#op3").removeClass("hidden");
							}
						if(activeSectionId!=18 )
				  		{
				  		
							 $("#kp").removeClass("hidden");
				  		}
						if(activeSectionId==11 && activeSubSectionId==1 )
						{
						$("#section11").removeClass("hidden");
						}else if(activeSectionId==12 && activeSubSectionId==1 )
						{
							$("#section12").removeClass("hidden");
							}else if(activeSectionId==13 && activeSubSectionId==1  || activeSectionId==13 && activeSubSectionId==3)
							{
								$("#section13").removeClass("hidden");
								}else if(activeSectionId==14 && activeSubSectionId==1 )
								{
								$("#section14").removeClass("hidden");
								}else if(activeSectionId==15 && activeSubSectionId==1 )
								{
								$("#section15").removeClass("hidden");
								}else if(activeSectionId==16 && activeSubSectionId==1 )
								{
								$("#section16").removeClass("hidden");
								}else if(activeSectionId==17 && activeSubSectionId==1 )
								{
								$("#section17").removeClass("hidden");
								}else if(activeSectionId==18 && activeSubSectionId==1 )
								{
								$("#section18").removeClass("hidden");
								}
		
						
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/knowledge",
							  success: function(data1){
					
								  	$("#subsection-name").html((activeSectionId-10)+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
									myFunction(data1['paragraphs']);
								  	myFun(data1['table']);		//	set table heads
								  	myFunc(data1['table']);	  	// 	set table body
								  	myFunct(data1['images']);
								  	
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
			
			function myFun(arr) {
			
				var out = '';
		    	arr = arr['thead'];
	    	    for(i = 0; i < arr.length; i++) {
	    	    	out += '<td><strong>' + arr[i] + '</strong></td>';
				}	
	    	    $('#thead').html(out);
	    	    
			}
			
			function myFunc(arr) {
				
	    	    var out = '';
		    	arr = arr['tbody'];
	    	    for(i = 0; i < arr.length; i++) {
		    		var tr = arr[i].item;
		    	    out += '<tr>';
		    		for(j = 0; j < tr.length; j++) {
			    		out += '<td>' + tr[j] + '</td>';
		    		}
					out += "</tr>"
	    		}	
	    	    $('#tbody').html(out);
			}
			
			function myFunct(arr) {
				var out = '';
	    	    for(i = 0; i < arr.length; i++) {
		    		
	    	    	out += '<img class="img-responsive" width="768px;" src="' + arr[i] + '"><br>';
		    		
	    		}	
	    	    $('#images').html(out);
			}
	   	});
		
		
	
	</script>
</body>
</html>