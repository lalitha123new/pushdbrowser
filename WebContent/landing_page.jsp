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
	<title>Display Sections</title>

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
	
	
	
	 <script type="text/javascript">
	 
	 	history.forward();
	 	
		
			$(window).load(function(){
			
			$('#header').load("navHeader.html");
			$("#includedContent").load("sectionSideNav6.html"); 
			$("#review").load("review.html");
			$('#progress').load("progressBar.html");
	        $('[data-toggle="tooltip"]').tooltip();
	        
	    });	
		
		
		
	</script>
	<style>
	table{
	width:100%;
	}
	th{
	color:blue;
	}
	ul{
	list-style:none;
	}
	li{
	color:black;
	font-weight:normal;
	
	}
	.truncate1 {
	    width: 150px;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: inline-block;
	    text-decoration: none;
	}
	
	</style>
</head>

<body oncontextmenu="return false">

<div class="bgcolor">

		<div id="header">
		</div>
			
		<div id="review">
		</div>
	
	<br>
	
	<div class="container-fluid" style="height: 100%">
	
	
	<div class="row">
	
		
	
		<div id="includedContent" class="col-md-2">
		</div>
		<div class="col-md-1">
		</div>
		
		<div class="col-md-9" id="content_new">
		
</div>
		<div class="col-md-1"></div>
		
	</div>
	
</div>
	

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript">
	
	
		$(document).ready(function() {
		
	
		$.ajax({
			  type: "GET",
			  url: serverURL + "users/" + userId + "/currSection",
			  success: function(data){
				
				  	sectionId = data['currentSection'];
					subsectionId = data['currentSubSection'];
					
					activeSectionId = data['activeSection'];
					activeSubSectionId = data['activeSubSection'];
					
					
					
					if(data['review'] == null) {
			      			$('#reviewModal').modal({
					        	  backdrop: 'static',
					        	  keyboard: false
			      		 	});
						}
					
					
		 				
			  },
			  error: function() {
				  alert("Error: server encountered an internal error. Please try again after some time ");
			  }
				 
			 
		});
		
	function A(){
		
		return $.get( serverURL + "sections", function( data ) {
			
			
		});
	}

	
	$.get( serverURL + "sections/optional", function( data ) {
		my2(data);
		
	});	
	
	function B(){
		
		return  $.ajax({
			 
			 type: "GET",
			  url: serverURL + "users/getlocksection?userId="+ userId,
			  success: function(data){

				  
				  
			  }
			 
		 });	 
	}
	var unlockarray = [];
	$.when(A(),B()).done(function(data1,data2){
	
		var section = data1[0];
		var unlockarray = JSON.parse("[" + data2[0] + "]");
		my(section,unlockarray);
	
		
	})
	var new_array;
	function my2(arr) {
		new_array = arr;
		
	}
	function my(arr,blockedSec) {

		var out1 = "";
		
	  
	    	out1+='<h3 style="color:#800000;">'+"Table of contents"+'</h3><br>';
	    	out1+='<h4>'+"Essential zone"+'</h4>';
	    	out1 += '<table>'+
	    	'<tr><th><a href="#" onclick="getPage(`' + arr[0].sectionId + '`)"  id="section' + arr[0].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section1 : Understanding depression" + '</a>'+
					'<ul>'+
				    '<li>'+"1.1 Discovery point-Quiz"+'</li>'+
				    '<li>'+"1.2 Tool box"+'</li>'+
				    '<li>'+"1.3 A window to the inner world of depression: Video"+'</li>'+
				    '<li>'+"1.4 Practice-Point"+'</li>'+
				    '<li>'+"1.5 Knowledge Point"+'</li>'+
				   	'</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + arr[1].sectionId + '`)"  id="section' + arr[1].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 2: Enhance Self-care motivation" + '</a>'+
					'<ul>'+
				    '<li>'+"2.1 A letter from us"+'</li>'+
				    '<li>'+"2.2 Another letter from us"+'</li>'+
				   	'</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + arr[2].sectionId + '`)"  id="section' + arr[2].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 3: Activate: Baby steps to move ahead" + '</a>'+
					'<ul>'+
				    '<li>'+"3.1 Knowledge Point Behavioral Activation-What and Why"+'</li>'+
				    '<li>'+"3.2 Practice Point-1: Developing an activation plan"+'</li>'+
				    '<li>'+"3.3 Practice Point-1: Potential List and Weekly Planner"+'</li>'+
				    '<li>'+"3.4 Check Point"+'</li>'+
				    '<li>'+"3.5 Tool Box: Planning, implementing, rewarding"+'</li>'+
				    '<li>'+"3.6 Practice Point-2: Self-reward planning and Weekly monitoring"+'</li>'+
				   	'</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + arr[3].sectionId + '`)"  id="section' + arr[3].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 4: Dealing  with depressive thoughts" + '</a>'+
					'<ul>'+
				    '<li>'+"4.1 Knowledge Point: Negative automatic thoughts"+'</li>'+
				    '<li>'+"4.2 Knowledge Point: Commom thinking errors"+'</li>'+
				    '<li>'+"4.3 Demo Point: Identifying cognitive errors"+'</li>'+
				    '<li>'+"4.4 Practice Point - 1 : Identifying cognitive errors"+'</li>'+
				    '<li>'+"4.5 Tool Box:Questioning your thoughts"+'</li>'+
				    '<li>'+"4.6 Practice Point - 2: Applying what you learnt in your day-to-day life"+'</li>'+
				    '<li>'+"4.7 Practice Point - 3: Applying what you learnt in your day-to-day life"+'</li>'+
				   	'</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + arr[4].sectionId + '`)"  id="section' + arr[4].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 5: Manage excessive worries" + '</a>'+
					'<ul>'+
				    '<li>'+"5.1 Knowledge Point"+'</li>'+
				    '<li>'+"5.2 Tool Box: Strategies to manage excessive worry"+'</li>'+
				    '<li>'+"5.3 Demo-Point: Video"+'</li>'+
				    '<li>'+"5.4 Practice Point-1 Exercises to identify different mind-states"+'</li>'+
				    '<li>'+"5.5 Tool Box: So what did you discover?"+'</li>'+
				    '<li>'+"5.6 Practice Point-2- Applying what you learnt"+'</li>'+
				    '<li>'+"5.7 Commitment Point"+'</li>'+
				    '<li>'+"5.8 Practice Point-3- Your diary for practice"+'</li>'+
				   	'</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + arr[5].sectionId + '`)"  id="section' + arr[5].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 6: Learn Self-Compassion" + '</a>'+
					'<ul>'+
				    '<li>'+"6.1 Discovery Point"+'</li>'+
				    '<li>'+"6.2 Knowledge Point : Busting myths about self-compassion"+'</li>'+
				    '<li>'+"6.3 Tool Box and Practice Points"+'</li>'+
				    '<li>'+"6.4 Practice Point-1"+'</li>'+
				    '<li>'+"6.5 Knowledge Point"+'</li>'+
				    '<li>'+"6.6 Practice Point-2"+'</li>'+
				    '<li>'+"6.7 Knowledge Point : Mindfulness"+'</li>'+
				    '<li>'+"6.8 Practice Point-3 : Mindfulness practice with video"+'</li>'+
				   	'</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + arr[6].sectionId + '`)"  id="section' + arr[6].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 7: Strengthen Self-Soothing skills" + '</a>'+
					'<ul>'+
				    '<li>'+"7.1 Knowledge Point"+'</li>'+
				    '<li>'+"7.2 Tool Box"+'</li>'+
				    '<li>'+"7.3 Tool Box"+'</li>'+
				    '<li>'+"7.4 Commitment Point"+'</li>'+
				    '<li>'+"7.5 Practice Point"+'</li>'+
				    '</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + arr[7].sectionId + '`)"  id="section' + arr[7].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 8: Regaining a sense of mastery" + '</a>'+
					'<ul>'+
				    '<li>'+"8.1 Knowledge Point:Sense of mastery and well being"+'</li>'+
				    '<li>'+"8.2 Knowledge Point"+'</li>'+
				    '<li>'+"8.3 Demo Point: Regaining a sense of mastery"+'</li>'+
				    '<li>'+"8.4 Practice Point: Regaining a sense of mastery"+'</li>'+
				    '<li>'+"8.5 Commitment Point"+'</li>'+
				    '</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + arr[8].sectionId + '`)"  id="section' + arr[8].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 9: Harness the power of support" + '</a>'+
					'<ul>'+
				    '<li>'+"9.1 Knowledge Point"+'</li>'+
				    '<li>'+"9.2 Discovery Point"+'</li>'+
				    '<li>'+"9.3 Tool Box"+'</li>'+
				    '<li>'+"9.4 Commitment Points"+'</li>'+
				    '<li>'+"9.5 Warning Shots"+'</li>'+
				    '</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + arr[9].sectionId + '`)"  id="section' + arr[9].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 10: Step Up: When you need to" + '</a>'+
					'<ul>'+
				    '<li>'+"10.1 Knowledge Point"+'</li>'+
				    '<li>'+"10.2 Discovery Point"+'</li>'+
				    '<li>'+"10.3 Tool Box-1 Overcoming internal barriers to seeking professional help"+'</li>'+
				    '<li>'+"10.4 Tool-Box-2 Feeling better prepared to seek professional help"+'</li>'+
				   '</ul>';
				   	out1+='<th>';
					out1+='</tr><br>';
					
					
					
					out1+='<tr><th style="color:black;"><h4>'+"Optional zone"+'</h4><br></th></tr>'+
					'<tr><th><a href="#" onclick="getPage(`' + new_array[0].sectionId + '`)"  id="section' + new_array[0].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 1: Sleep Health and Hygiene" + '</a>'+
					'<ul>'+
				    '<li>'+"1.1 Knowledge Point"+'</li>'+
				    '<li>'+"1.2 Tool Box 1"+'</li>'+
				    '<li>'+"1.3 Tool Box 2"+'</li>'+
				    '<li>'+"1.4 Tool Box 3"+'</li>'+
				    '<li>'+"1.5 Practice Point"+'</li>'+
				   '</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + new_array[1].sectionId + '`)"  id="section' + new_array[1].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 2: Relaxation through Visualization" + '</a>'+
					'<ul>'+
				    '<li>'+"2.1 Knowledge Point"+'</li>'+
				    '</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + new_array[2].sectionId + '`)"  id="section' + new_array[2].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 3: Depression and Interpersonal Relations" + '</a>'+
					'<ul>'+
				    '<li>'+"3.1 Knowledge Point"+'</li>'+
				    '<li>'+"3.2 Tool Box"+'</li>'+
				    '<li>'+"3.3 Knowledge Point"+'</li>'+
				    '</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + new_array[3].sectionId + '`)"  id="section' + new_array[3].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 4: Managing Grief" + '</a>'+
					'<ul>'+
				    '<li>'+"4.1 Knowledge Point"+'</li>'+
				    '<li>'+"4.2 Tool Box"+'</li>'+
				    '</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + new_array[4].sectionId + '`)"  id="section' + new_array[4].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 5: Dealing with Suicidal Thoughts" + '</a>'+
					'<ul>'+
				    '<li>'+"5.1 Knowledge Point"+'</li>'+
				    '<li>'+"5.2 Tool Box"+'</li>'+
				    '</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + new_array[5].sectionId + '`)"  id="section' + new_array[5].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 6: Maintaining Wellbeing: Part one" + '</a>'+
					'<ul>'+
				    '<li>'+"6.1 Knowledge Point"+'</li>'+
				    '<li>'+"6.2 Tool Box"+'</li>'+
				    '<li>'+"6.3 Practice Point"+'</li>'+
				    '</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + new_array[6].sectionId + '`)"  id="section' + new_array[6].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 7: Maintaining Wellbeing: Part two" + '</a>'+
					'<ul>'+
				    '<li>'+"7.1 Knowledge Point"+'</li>'+
				    '<li>'+"7.2 Discovery Point"+'</li>'+
				    '<li>'+"7.3 Practice Point"+'</li>'+
				    '<li>'+"7.3  Tool Box"+'</li>'+
				    '</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='<tr><th><a href="#" onclick="getPage(`' + new_array[7].sectionId + '`)"  id="section' + new_array[7].sectionId + '" ' + 
					'class="" data-toggle="tooltip" >'+ "Section 8: References and Useful External Links" + '</a>'+
					'<ul>'+
				    '<li>'+"8.1 References and External Links"+'</li>'+
				    '</ul>';
				   	out1+='<th>';
					out1+='</tr>';
					
					out1+='</table>';
	       
	    $("#content_new").html(out1);
	}
	});
	
	

	

	</script>
	 
    
	
 	<script src="js/Chart.min.js"></script>
	<script src="js/values.js"></script>
	<script src="js/inc.js"></script>
	</div>
</body>
</html>