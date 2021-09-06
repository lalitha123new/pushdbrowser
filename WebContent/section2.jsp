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
		response.sendRedirect(request.getContextPath() + "/logout.jsp");
	}
	
%>
	
	
	<!-- Bootstrap -->
	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	
	
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
 	<script src="bs/js/jquery.cookie.js"></script>
	<script src="bs/js/jquery.session.js"></script>
	<script src="js/values.js"></script>
	<script src="js/inc.js"></script>
	<script src="js/Chart.min.js"></script>
 	
	<script type="text/javascript">
		$(function(){
			
			history.forward();
			
			$('#header').load("navHeader.html");
			$("#includedContent").load("sectionSideNav4.html"); 
			$("#review").load("review.html");
			$('#progress').load("progressBar.html");
	        $('[data-toggle="tooltip"]').tooltip();
	       
	    });	
		
		
	</script>
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
		<div class="col-md-10">
			<div class="">
				<div id="progress">
				</div>
				<div id="quotes" class="text-justify opensans"></div>
               	<h3><b id="section-name"></b>&emsp;<small><em id="pr" class="hidden">Personally Relevant</em></small></h3>
               <!--<h3><small><em id="id3" class="hidden"><b>Baby Steps to move ahead</b></em></small></h3>  -->	
               	<h3><small><em id="id7" class="hidden"><b>Coping with strong negative emotions</b></em></small></h3>  
				<hr style="border-bottom: 1px solid black;">
				
				<!-- Section Details like Estimated Time and so on -->
                <div id="content" class="row">
               		<div class="col-md-6">
                		<div>
							<h4>What is here?</h4>
							<div id="subsection-list">
							</div>
							<div class="panel-body">
								<div class="form-group row">
									<label class="col-sm-6 text-right" for="estimated-time">Estimated time to complete</label>
									<div class="col-sm-6">
										<p id="estimated-time"></p>
									</div>								
								</div>
								<div class="form-group row">
									<label class="col-sm-6 text-right" for="no-of-sittings">Recommended number of sessions (approximately)</label>
									<div class="col-sm-6">
										<p id="no-of-sittings"></p>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-6 text-right" for="no-of-sittings">Number of exercises</label>
									<div class="col-sm-6">
										<p id="no-of-exercises"></p>
									</div>
								</div>
								<hr>
								<div class="form-group row">
									<h5 class="col-sm-6 text-right"><strong>I am ready</strong></h5>
									<div class="col-sm-6">
										<a id="start" type="button" onclick="getNextSubSection2()" 
												class="btn btn-success has-spinner"> 
											<span class="spinner"><i class="icon-spin icon-refresh"></i></span>
											&emsp;Start&emsp;
										</a> 
										<!-- <a href="#" id="start" type="button" class="btn btn-success" onclick="getNextSubSection()">&emsp;Start&emsp;</a> -->
									</div>								
								</div>
							</div>	
						</div>
                    </div>
        			<div class="col-md-2 text-center">
                		<canvas id="myChart1" width="150" height="150"></canvas><br>
                		<label class="text-center"><strong id="s"></strong>/10 Sections <br>Completed</label>
                	</div>
                	<div class="col-md-2 text-center">
                		<canvas id="myChart2" width="150" height="150"></canvas>
                		<label class="text-center"><strong id="e"></strong>/30 Exercises <br>Completed</label>
                	</div>
                	<div class="col-md-2 text-center">
                		<a href="monitor.jsp"><i class="fa fa-bar-chart" style="font-size: 10em; color: #FDB45C;"></i></a>
                		<label class="text-center"><strong><a href="monitor.jsp">Monitor <br>Your<br> Pattern</a></strong></label>
                	</div>
                	<!-- <div class="col-md-6 text-center">
                		<br>
                		<h3 id="fb1" class="hidden">Good Start !</h3>
                		<h3 id="fb2" class="hidden">Good work! Keep going!</h3>
                		<h3 id="fb3" class="hidden">Very Good! You are at it!</h3>
                		<h3 id="fb4" class="hidden">Wow! You have almost completed your essential zone journey!</h3>
                		<h3 id="fb5" class="hidden">Congratulations!  Essential Zone travelled! You may want to explore optional zone.</h3>
                	</div> -->
                </div>
   			</div>
		</div>
	</div>
</div>

</div>	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript">

		var ctx1 = document.getElementById("myChart1").getContext("2d");
		var ctx2 = document.getElementById("myChart2").getContext("2d");
	
		var pieData = [
		            {
				        value: 40,
				        color: "#FDB45C",
				        highlight: "#FFC870",
				        label: "Completed %"
				    },
		            {
		                value: 60,
		                color:"#ef9a9a",
		                highlight: "#FF5A5E",
		                label: "Remaining %"
		            }
		        ];
		var pieData2 = [
			            {
					        value: 40,
					        color: "#9FA8DA",
					        highlight: "#C5CAE9",
					        label: "Completed %"
					    },
			            {
			                value: 60,
			                color:"#8D6E63",
			                highlight: "#A1887F",
			                label: "Remaining %"
			            }
			        ];

		var options =
		{
		    //Boolean - Whether we should show a stroke on each segment
		    segmentShowStroke : true,

		    //String - The colour of each segment stroke
		    segmentStrokeColor : "#fff",

		    //Number - The width of each segment stroke
		    segmentStrokeWidth : 3,

		    //Number - The percentage of the chart that we cut out of the middle
		    percentageInnerCutout : 70, // This is 0 for Pie charts

		    //Number - Amount of animation steps
		    animationSteps : 100,

		    //String - Animation easing effect
		    animationEasing : "easeOutBounce",

		    //Boolean - Whether we animate the rotation of the Doughnut
		    animateRotate : true,

		    //Boolean - Whether we animate scaling the Doughnut from the centre
		    animateScale : false,

		}

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
		
		
		var unlock_data_array = 0;
		var unlock_data_array1 = [];
		$(document).ready(function() {
			
			
			
			//new code for completed unlocked section data for reflecting the monitor circle of "sections completed"
	    	$.get( serverURL + "users/" + userId + "/getUnlockSectonData", function( data ) {
	    		
			if(data !=null){
				
				unlock_data_array1 = data;
			}
			 
			});
			//end of new code
			
			
		
			 $.ajax({
				  type: "GET",
				  url: serverURL + "users/" + userId + "/currSection",
				  success: function(data){
			
				        if(data['prSection'] == "true") {
							  $("#pr").removeClass("hidden");
						}
						
				
					
					 	sectionId = data['currentSection'];
						subsectionId = data['currentSubSection'];
						
				 		activeSectionId = data['activeSection'];
						activeSubSectionId = data['activeSubSection'];
						
						
						if(activeSectionId==7)  //sectionId==7 || 
							{
							$("#id7").removeClass("hidden");
							}
						$.cookie('sectionId', sectionId);
						$.cookie('subsectionId', subsectionId);
						
						if(subsectionId > 0) {
			        		$("#start").html("&emsp;Resume&emsp;");
			 			}
			 			
			 			$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId,
							  success: function(data){
						
								  	
							        
							      	$("#section-name").html(data['sectionName']);
							        $("#estimated-time").html(data['estimatedTime']);
							        
							        if(data['noOfSittings']==1){
							        	
								            $("#no-of-sittings").html(data['noOfSittings'] + " session");
								  		
							        }else{
				 			 				$("#no-of-sittings").html(data['noOfSittings'] + " sessions");
								       
							        }
							        $("#no-of-exercises").html(data['noOfExercises']);
							     
							        myFunction(data['sectionDesc']);
									myFunc(data['quotes']);
							
									$("#section-name").css('font-family', 'alegreya');
									$("#content").css('font-family', 'opensans');
									
									
									
									var data2;
									
									var total_exercises = 0;
									//new code for completed unlocked section data display
									$.get( serverURL + "users/" + userId + "/getUnlockSectonData", function( data ) {
										data2 = data;
										
										
									});
									$.ajax({
										  type: "GET",
										  url: serverURL + "users/" + userId + "/stats",
										  success: function(data1){
											  
											  if(data2 !=null){
													sectionId = data2.length;
													//new code
													pieData[0]['value'] = (sectionId) * 10;
													pieData[1]['value'] = (10-(sectionId-1)) * 10;
													if(data1['exercisesCompleted']== 30)
														{
														pieData[0]['value'] = (sectionId-1) * 10;
														pieData[1]['value'] = (10-sectionId) * 10;
														$('#s').html(""+(sectionId));
														}
													else{
														
											 		$('#s').html(""+(sectionId));
													}
													
													for(var p = 0;p<data2.length;p++){
														if(data2[p] == 1)
															total_exercises = total_exercises + 3;
														else if(data2[p] == 2)
															total_exercises = total_exercises + 0;
														else if(data2[p] == 3)
															total_exercises = total_exercises + 9;
											 			else if(data2[p] == 4)
											 				total_exercises = total_exercises + 4;
														else if(data2[p] == 5)
															total_exercises = total_exercises + 3;
														else if(data2[p] == 6)
															total_exercises = total_exercises + 3;
														else if(data2[p] == 7)
															total_exercises = total_exercises + 2;
														else if(data2[p] == 8)
															total_exercises = total_exercises + 2;
														else if(data2[p] == 9)
															total_exercises = total_exercises + 3;
														else if(data2[p] == 10)
															total_exercises = total_exercises + 1;
														
									
													}
													
											}else{
												pieData[0]['value'] = (sectionId-1) * 10;
												pieData[1]['value'] = (10-(sectionId-1)) * 10;
												
										 		$('#s').html(""+(sectionId-1));
										 		total_exercises = data1['exercisesCompleted'];
												
											}
														
														var myPieChart = new Chart(ctx1).Pie(pieData,options);
														
														pieData2[0]['value'] = parseInt(((total_exercises) * 100) / 30);
														pieData2[1]['value'] = parseInt(((30-total_exercises) * 100) / 30);
												 		$('#e').html(""+(total_exercises));
														myPieChart = new Chart(ctx2).Pie(pieData2,options);
														
														if((sectionId) >= 1 && (sectionId) < 3) {
															$('#fb1').removeClass("hidden");	
														}
														else if((sectionId) >= 3 && (sectionId) < 6) {
															$('#fb2').removeClass("hidden");	
														}
														else if((sectionId) >= 6 && (sectionId) < 9) {
															$('#fb3').removeClass("hidden");	
														}
														else if((sectionId) >= 9 && (sectionId) <= 10 && total_exercises!=30) {
															$('#fb4').removeClass("hidden");	
														}
														else if((sectionId) == 10 && total_exercises==30) {
															$('#fb5').removeClass("hidden");	
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
	    	    	out +=  '<li>&emsp;' + activeSectionId + '.' + (i+1) + '&emsp;' + 
			    				'<i>' + arr[i] + '</i>' + 
			    			'</li>';
	    	    }
	    	    out += '</ul>';
	    	    
	    	    $("#subsection-list").html(out);
	    	    
				$("#collapseOne").addClass("in");
		    	
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
	    	    	out +=  '<blockquote style="border: 1px solid #EEB; background:#FFCCBC">' + 
	    	    				'<p><i>' + arr[i].quote + '</p></i>' +  
	    	    		  		'<footer><cite>' + arr[i].author + '</cite></footer>' + 
    	    		  		'</blockquote>';
	    	    }
	    	    $("#quotes").html(out);
	    	    
			}
			
			
			
		});
		
	</script>
</body>
</html>