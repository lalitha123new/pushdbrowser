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
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	
	<script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
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
					<img class="img-responsive" alt="" src="images/ss-pp.jpg">
				</div>
				<div class="col-md-10 col-sm-8">
					<div class="row">
					<div id="section4"><h3><b>Dealing with depressive thoughts</b></h3></div>
					
						<h3><b id="subsection-name"></b></h3>
						<p id="subsection-desc" class="text-justify">
						</p>				
						<hr style="border-bottom: 1px solid black;">
						<h3 id="exercise-title"></h3>
						<p id="exercise-desc" class="text-justify" style="font-weight:bold;">Please check any two correct choices. The right answers for each item will be shown in green after you select your responses.</p>
						<div class="row">
							<div id="exercise" class="col-md-11">
							</div>
							<div class="col-md-2">
								<button id="submit" style="margin-left: 25px;" onclick="CheckPointsSelected()" class="btn-block btn btn-primary">Submit</button>
							</div>
						</div>	
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
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/practice2",
							  success: function(data1){
					
								 	$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
		
								 	
								 	arr = data1['questions'];
								 	exer = '<ol>';
									max = arr.length;
									for (i = 0; i < arr.length; i++) {
										
										if(sectionId == activeSectionId) {
											if(i == 0)
												exer += '<li id="lt'+i+'" class="text-justify">';
											else
												exer += '<li id="lt'+i+'" class="hidden text-justify">';
										}else if(sectionId < 4){
											if(i == 0)
												exer += '<li id="lt'+i+'" class="text-justify">';
											else
												exer += '<li id="lt'+i+'" class="hidden text-justify">';
											
										}else {
											exer += '<li id="lt'+i+'" class="text-justify">';
										}	
										
										exer += 	'<div id="ques'+i+'"><p>' + arr[i]['ques'] + '</p></div>' +
													'<div id="options">';
														
										for (k = 0; k < arr[i]['answerOptions'].length; k++) {
											arr1 = arr[i]['answerOptions'][k];
											
											exer += 	'<div class="checkbox">'; 
															
											
											if(sectionId == activeSectionId) { 
												exer +=		'<label id="l-'+i+'-'+k+'">' +
																'<input id="chk-'+i+'-'+k+'" type="checkbox" value="'+arr1['answer']+'">'+ arr1['optionDesc'];
											}else if(sectionId < 4){
												
												exer +=		'<label id="l-'+i+'-'+k+'">' +
												'<input id="chk-'+i+'-'+k+'" type="checkbox" value="'+arr1['answer']+'">'+ arr1['optionDesc'];
												
											}
											else 	{
												if(arr1['answer'] == "true")
													exer +=	'<label style="color: green;">';
												else
													exer +=	'<label>';	
												
												exer += '<input disabled type="checkbox">'+ arr1['optionDesc'];
											}	
											exer +=			'</label>' +
														'</div>';
										}	//	for k				
										
										exer += 	'</div><div class="clearfix"></div><br>';
										
										if(sectionId == activeSectionId){
											exer += '<div id="exp'+i+'" class="hidden thumbnail" style="background-color: #FFE0B2; padding: 5px 15px;">';
										
										}else if(sectionId < 4){
											
											exer += '<div id="exp'+i+'" class="hidden thumbnail" style="background-color: #FFE0B2; padding: 5px 15px;">';
										}else {
											exer += '<div class="thumbnail" style="background-color: #FFE0B2; padding: 5px 15px;">';
											
										}
									
										exer +=			'<p id="feedback'+i+'_2" class="hidden">You are partly correct</p>'+ 
														'<p id="feedback'+i+'_1" class="hidden">Good! You are correct</p>'+
														'<p id="feedback'+i+'_3" class="hidden">Sorry! You are wrong</p>'+	
														'<strong>Explanation : </strong><br><p>' + arr[i]['explanations'] + '</p>' +
													'</div>' +
										 			'<div class="clearfix"></div><hr>' + 
												'</li>'; 
									}	// 	for i
									
									
									if(sectionId == activeSectionId){
										$('#submit').removeClass("hidden");
										
									}else if(sectionId < 4){
										$('#submit').removeClass("hidden");
										$('#next').removeClass("hidden");
									}else{
										$('#submit').addClass("hidden");
										$('#next').removeClass("hidden");
									}
									
										
									
									exer += '</ol>';

									$('#exercise').html(exer);
								 	
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
	
		
		var c = 0;
		var max = 0;
		var formData = '';
		
		function CheckPointsSelected()
		{
			var checked = false; //set it to true if none of the check boxes are filled
			var counter = 0;
				for ( j = 0; j <5; j++) 
				{
					if($('#chk-'+c+'-'+j).is(":checked")) 
					{
						
						counter++;
					} 
					else
					{
						//counter ++;
					}
				
			}
				if(counter==2)
				{
					submit();	
				}
				else
				{
					
					alert("Please select two checkboxes");	
				}
		}
	
		
	
	
	function submit()
	{
		/*
			1 = Correct
			2 = Partially Correct
			3 = Wrong
		*/
		
		var flag = true; //set it to false when user selects partially or wrong options
		var value = 1;
		var count = 0;
		for( j=0; j<5; j++) 
		{
			if($('#chk-'+c+'-'+j).val() == "true") 
				$('#l-'+c+'-'+j).css("color","green");
			
			if ($('#chk-'+c+'-'+j).is(":checked")) 
			{
				if($('#chk-'+c+'-'+j).val() == "false")
				{
					flag = false;
					$('#l-'+c+'-'+j).css("color","red");
				}
				else if($('#chk-'+c+'-'+j).val() == "true") 
				{
					$('#l-'+c+'-'+j).css("color","green");
					count++;
				}
		    }
			else
			{
				if($('#chk-'+c+'-'+j).val() == "true") 
				{
					flag = false;
					$('#l-'+c+'-'+j).css("color","green");
				}
			}
			
			$('#chk-'+c+'-'+j).prop("disabled","disabled");
		}
		
		

		if(flag == true)
		{	
			
			value = 1;	
			
			$('#feedback' + c + '_1').removeClass("hidden");
		}
		else if(flag == false && count >0)
		{
			
			value = 2;
			$('#feedback' + c + '_2').removeClass("hidden");
		}
		else
		{
			
			value = 3;	
			$('#feedback' + c + '_3').removeClass("hidden");
		}
			
		$('#exp'+c).removeClass("hidden");
		c++;
		if(c == max) 
		{
			$('#submit').addClass("hidden");
			$('#next').removeClass("hidden");
		}
		else
			$('#lt'+c).removeClass("hidden");
	}
	
	</script>
	
</body>
</html>