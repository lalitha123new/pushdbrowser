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
					<img class="img-responsive" alt="" src="images/ss-dmp.jpg">
				</div>
				
				<div class="col-md-10 col-sm-8">
				
					<div class="row">
					<div class="hidden" id="section4"><h3><b>Dealing with depressive thoughts</b></h3></div>
					<div class="hidden" id="section5"><h3><b>Manage excessive worries</b></h3></div>
					<div class="hidden" id="section8"><h3><b>Regaining a sense of mastery</b></h3></div>
					
						<h3><b id="subsection-name"></b></h3>
						<div class="clearfix"></div>
						<p id="exercise-title" class="text-justify">
						</p>				
						<hr style="border-bottom: 1px solid black;">
						
						<div id="paragraph" class="text-justify">
						</div>
						
						<div class="clearfix"></div>
						
						<div class="col-md-1"></div>
						
						<div class="col-md-10">
							<div id="images">
							</div>
							<div id="videos">
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
			<div class="clearfix"></div>
			<br>
			<br>
			
			<div class="row">
			
				<div class="col-md-9">
				</div>
				
				<div id="next" class="col-md-2">
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
						if((sectionId==4 && subsectionId==3) || (activeSectionId==4 && activeSubSectionId==3))
			    	    {
							$("#section4").removeClass("hidden");
			    	    }else if((sectionId==5 && subsectionId==3) || (activeSectionId==5 && activeSubSectionId==3))
			    	    {
							$("#section5").removeClass("hidden");
			    	    }else if((sectionId==8 && subsectionId==3) || (activeSectionId==8 && activeSubSectionId==3))
			    	    {
							$("#section8").removeClass("hidden");
			    	    }
			
						
			    		
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/knowledge",
							  success: function(data1){
					
								  	$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
									myFunction(data1['paragraphs']);
								  	myFun(data1['table']);		//	set table heads
								  	myFunc(data1['table']);	  	// 	set table body
								  	myFunct(data1['images']);
								  	$('#videos').html(data1['video']);
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