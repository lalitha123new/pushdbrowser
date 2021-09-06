<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	<link href="css/style.css" rel="stylesheet">
	
	
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="js/values.js"></script>
    <script src="js/inc.js"></script>
    
    <script type="text/javascript">

    	history.forward();
	    
    	$(function() {
    		$('#header').load("navHeader2.html");
	  	});
    </script>
    <style type="text/css">
    .row
    {
    margin-left:0px;
    margin-right:0px;
    
    
    }
    </style>
</head>
<body oncontextmenu="return false">
<div class="bgcolor">
	<div id="header">
	</div>
	<div class="container">
		<div class="row">
			
				<h2><b id="section-name" data-toggle="tooltip" data-placement="right" title="hello"></b></h2>
			
		</div>
		
		<p id="section-desc" class="text-justify"></p>				
		<hr>
		<div class="well col-md-10">
			<p><strong id="exercise-title"></strong></p>
			<p class="text-justify" id="exercise-desc"></p>
		</div>
		<div class="row">
			<div class="col-md-10">
				<form id="myForm">
					<ul id="section-ques" class="list-group">
					</ul>
					<button id="submit" type="button" onclick="checkCheckPointsSelected()" class="btn btn-primary">Submit</button>
				</form>
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
					<h5>Thank You !</h5>
				</div>
				<div class="modal-body text-justify">
					<p>Thank you!  Based, on your responses, a few sections have been identified as likely to be personally relevant. </p>
					<p id="e" class="hidden">These essential zone sections are as follows </p>
					<ul id="e-prSections" style="list-style:none;">
					</ul>
					<p>When you reach these personally relevant sections, you will receive a reminder, so that you can spend more time and attention on this section.  However, please remember that it is important to go through all the other essential sections which are typically useful for almost everyone experiencing depression.<br> You are also encouraged to visit the Optional Zone sections that are relevant for you.</p>
					<p id="o" class="hidden">These optional zone sections are as follows </p>
					<ul id="o-prSections" style="list-style:none;">
					
					</ul>
				</div>
				<div class="modal-footer">
					<button id="myInput" type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	<div class="row">
		<div class="col-md-9">
		</div>
		<div id="next" class="col-md-2 hidden">
			<button class="alert alert-info text-center btn-block" role="alert" 
				onclick="next()" style="text-decoration: none;">
				<strong>NEXT &emsp;</strong> 
				<span class="glyphicon glyphicon-chevron-right"></span>
			</button>
		</div>
	</div>
	
	
	<br>
	<br>
	<br>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bs/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	
		var i = 0;
	
		$(document).ready(function(){

			$.ajax({
				  type: "GET",
				  url: serverURL + "sections/0",
				  success: function(data){
					  myFunction(data);
				  },
				  error: function() {
					  alert("Error Occured Due To " + serverURL + "sections/0");
					 
				  }
			});
		    
		    function myFunction(arr) {
			    
		    	$("#section-name").html(arr['sectionName']);
		    	
		    	var sectionDesc = arr['sectionDesc'];
		    	
		    	var out = "";
			    
			    for(i = 0; i < sectionDesc.length; i++) {
			        out +=  '<p>' + sectionDesc[i] + '</p>';
				}	    
			    
			    $("#section-desc").html(out);
		    	$("#exercise-title").html(arr['exerciseTitle']);
			    var exerciseDesc = arr['exerciseDesc'];
			    out = "";
			    for(i = 0; i < exerciseDesc.length; i++) {
			        out +=  '<p>' + exerciseDesc[i] + '</p>';
				}	    
			    
			    $("#exercise-desc").html(out);
		    	
		    	var quesList = arr['questions'];
		    	out = "";
		    	for(i = 0; i < quesList.length; i++) {
			        out +=  '<li class="list-group-item">' + 
			        			'<div class="checkbox">' + 
			        				'<label>' + 
			        					'<input id="q' + quesList[i].quesNo + '" type="checkbox" name="check" value="' + quesList[i].prSectionId + '">' + 
			        						quesList[i].ques + 
	        						'</label>' + 
        					  	'</div>' + 
       					  	'</li>';
				}	    
			    $("#section-ques").html(out);
			}
		});
		
		function checkCheckPointsSelected()
		{
			var checked = false; //set it to true if none of the check boxes are filled
			var counter = 0;
				for ( j = 1; j <= i; j++) 
				{
					if($('#q' + j).is(":checked")) 
					{
						//OK
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
		
		
		function checkpoint() {
			
			var formData = $("#myForm").serialize();

			$.ajax({
				  type: "POST",
				  url: serverURL + "users/" + userId + "/baseline",
				  data: formData,
				  success: function(data){ 
					  myFunc(data);
				  },
				  error: function() {
				  }
			});

			for (j = 0; j <= i; j++) {
				$('#q'+j).prop('disabled', true);
			}
			
			$('#myModal').modal('show');
			$('#submit').addClass('hidden');
			$('#next').removeClass('hidden'); 
		}
		
		function myFunc(arr1) {
			arr = arr1['prSectionNames'];
			arr2 = arr1['prSectionIds'];
			out1 = "";
			out2 = "";
			flag1 = false;
			flag2 = false;
			
			for(i = 0; i < arr.length; i++) {
				if(arr2[i] < 11) {
					flag1 = true;
					out1 +=  '<li>'+"Section"+ arr[i] + '</li>';
				}	
			 	else {
			 		flag2 = true;
			 		out2 +=  '<li>'+"Section: " + arr[i] + '</li>';
			 	}
			}
			if(flag1 == true) {
				$('#e').removeClass("hidden");
				$('#e-prSections').html(out1);	
			}
			if(flag2 == true) {
				$('#o').removeClass("hidden");
				$('#o-prSections').html(out2);	
			}
		}
			
		function next() {
			window.location.href = "section.jsp";
		}
	</script>
	
</body>
</html>