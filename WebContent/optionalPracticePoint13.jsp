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
    		$('#next').load("nextButton3.html");
    		$('#progress').load("progressBar.html");
	    
	    });
		
    </script>

<!-- code for big radio button optional zone section 6 subsection3 -->
<style>
input[type='radio'] {
	transform: scale(1.5);
}
a.visited {
color:red;
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
				<img class="img-responsive" alt="" src="images/ss-pp.jpg">
		</div>
		
		
		<div class="col-md-10 col-sm-8">
		<div class="row">
		<div class=" " style="border:1px solid black;width:25%;" ><h6 style="text-align:center;font-weight:bold;">YOU ARE IN OPTIONAL ZONE</h6></div>
				<div  id="section16"><h3><b>Maintaining Wellbeing: Part one</b></h3></div>
				<h3><b id="subsection-name"></b></h3>
				
		<div class="clearfix">
		</div>
		
				<hr style="border-bottom: 1px solid black;">
				
				<p id="exercise-title" class="text-justify">
				</p>		
						
				<p id="exercise-desc" class="text-justify">
				</p>
						
		<div class="row">
		
		<div class="col-md-2"></div>
		<div class="col-md-10">
						
				<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Want to take stock of your personal growth goal? Click here.</button>-->
				<h3>
									<a data-toggle="modal" href="#myModal1"><span
										style="color: #111111; text-decoration: underline; text-decoration-color: red;">Want
											to take stock of your personal growth goal? Click here.</span></a>
								</h3>
								<br>
						
		</div>
		</div>
						
		</div>
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
				
				
		<div id="next" class="hidden col-md-2">
		</div>
		
		</div>
		</div>
		
		</div>
		
	
	<!-- Modal for feedback -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success text-center">
					<h5>Feedback</h5>
				</div>
				<div class="modal-body text-justify">
					<p>You can assess your status on two dimension of well-being :</p>
					<p><strong>Contemplation</strong> : How much you seem to think about your personal growth goal?  Please see your response to the first set of items. Which of the four statements you marked? What does it tell you about your preoccupation with this goal?</p> 
					<p><strong>Action</strong> : To what extent you have started working on your growth goal? For how many of the 12 items have you marked agree or strongly agree?This would give you an idea about the extent to which you are taking actions to move towards your personal growth goals.</p>
					<p>If you find yourself to be high on contemplation (thinking about it): Check out if you are also acting on it. It helps to think about the change we wish to make. But only 'thinking' about it repeatedly over a long period can be a frustrating experience!</p>
					<p>If you find yourself to be rather low on the action dimension, clarify within yourself: Is this the change that I really want to work upon as a goal? If yes, what can I do to start taking small steps that move me further in terms of acting on this goal?</p> 
					<p>Start enjoying and appreciating the efforts you are making towards growing as a person- because it is actually a continuous process rather than an end-point you have to reach.</p>
				</div>
				<div class="modal-footer">
					<button id="myInput" type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end of modal for feedback -->
	
	<!-- Modal1 for displaying the question part-->
	<div class="modal fade" id="myModal1" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success text-center">
					<h4>Personal growth goal</h4>
				</div>
				<div class="modal-body text-justify">
				<strong>The change that I wish to make in me </strong><br><br>
				<textarea rows='2' id='td-16-3' class='form-control' style='resize: none;' placeholder='e.g. I want to reduce my anger'></textarea><br>
				<p>Now keeping in mind this desire or the wish- please read carefully all the following statements.</p><br>
				<div id="exercise">
						</div>
						<div class="row">
				<div class="col-md-9">
				</div>
						</div>
				<div class="modal-footer">
					<button id="myInput" type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- end of modal for displaying the question part -->
	
	<!-- begin feedback modals -->
	<div id="myModaltable" class="modal fade">
	
	<div class="modal-dialog">
	
	<div class="modal-content">
	
	<div class="modal-headerclass">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Personal Growth</h4>
	</div>
	
	<div class="modal-body">

					<p class="pclass1">
					<small>Your level of mental engagement (thinking
					about this goal) with this goal seems to be high. It is
					also likely that you are not merely thinking about the
					change you wish to make but also actively taking steps to
					make this change. Appreciate yourself for your efforts and
					keep at it!</small>
					</p>
					
	</div>
	
	<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

	</div>
																			
	</div>
	</div>
	</div>

	<div id="myModaltable2" class="modal fade">
	<div class="modal-dialog">
	<div class="modal-content">
	
	<div class="modal-headerclass">
	
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Personal Growth</h4>
						
	</div>
	
	<div class="modal-body">

						<p class="pclass1">
						<small>Your level of mental engagement and
						preoccupation with this goal seems to be high. However, it
						is likely that there is a scope to turn your desire into a
						goal and an action-plan. You may find that you are not
						being able to take consistent actions to work on this
						aspect. It would help to take small, yet consistent steps
						towards the change you desire. Taking positive actions on
						what you value would add to your sense of growth and well
						being.
						</small>
						</p>
						
	</div>
	
	<div class="modal-footer">
	
						<button type="button"  class="btn btn-default"  data-dismiss="modal">Close</button>

			
	</div>
	
	</div>
	</div>
	</div>

	<div id="myModaltable3" class="modal fade">
	<div class="modal-dialog">
	<div class="modal-content">
	
	<div class="modal-headerclass">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Personal Growth</h4>
	
	</div>
	<div class="modal-body">

						<p class="pclass1">
						<small>Your level of mental engagement or
						preoccupation with this growth goal is modest/low.
						Perhaps, you do not find the need to work on it very
						deliberately and consciously! But you seem to be taking
						some steps/actions to make this change. Appreciate
						yourself for your efforts and keep at it and also discover
						new growth goals you value/ wish to work upon!</small>
						</p>
											
	</div>
											
	<div class="modal-footer">
						<button type="button"  class="btn btn-default"  data-dismiss="modal">Close</button>

	</div>
					
	</div>
	</div>
	</div>


	<div id="myModaltable4" class="modal fade">
	<div class="modal-dialog">
  	<div class="modal-content">
  	
	<div class="modal-headerclass">
	
					<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Personal Growth</h4>
						
						
	</div>
	
	<div class="modal-body">

						<p class="pclass1">
						<small>Your level of mental engagement or
						preoccupation with this growth goal is modest/low. Also,
						it seems that you may not be taking active steps to work
						on this aspect of yourself. Perhaps it is merely a
						desire/wish and not really set as a growth goal. At times,
						this may be the case when we want to do something that
						others may want us to work upon without having our own
						conviction in the need for doing so. It may be useful to
						think independently whether you want to work on this or
						any other personal growth goal (develop any personal
						quality) that you value/that may help you to achieve your
						other life goals. </small>
						</p>
						
	</div>
	
	<div class="modal-footer">
	
						<button type="button"  class="btn btn-default"  data-dismiss="modal">Close</button>

	</div>
	
	</div>
	</div>
	</div>
								
								<!-- end of feedback modals -->
	
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
			
						//setStatus("false");
						
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/discovery2",
							  success: function(data1){
					
								  	$("#subsection-name").html((activeSectionId-10)+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
								  	$("#exercise-title").html(data1['exerciseTitle']);
							       
									myFunc(data1['exerciseDesc']);
							        
								  	myFunction(data1);
								  	$('#next').removeClass("hidden");
								  	
						      },
							  error: function() {
								  alert("Error: server encountered an internal error. Please try again after some time ");
							  } 
						});	
					
				  },
				  error: function() {
				  } 
			});
	   	
			function myFunc(arr) {
	    	    var out = '';
	    	   	
	    	    for(i = 0; i < arr.length; i++) {
	    	    	out += '<p>' + arr[i] + '</p>';
				}	
	    	    $('#exercise-desc').html(out);
		   	}
			
			function myFunction(arr1) {
				
				arr = arr1['questions'][0];
				var exer = "";	//	exercise
	    	    
	    	    exer += '';
	    	    
				i = 0;
				
	    	    exer += '<div>' +
  	    					'<p><strong>' + arr['ques'] +'</strong></p>' +
  	    					'<div class="clearfix"></div>' +
  							'<ol type="I" style="border:1px solid black; background-color:#ffffff;">';
					
	    		for (j = 0; j < arr['quesLists'].length; j++) {	//
	    				
	    				arr2 = arr['quesLists'];
	    		
						exer += 	 	'<li id="qo-'+j+'">' +
											'<p style="padding-left: 20px; margin-bottom: 0px;">' + arr2[j]['ques'] +
											'</p>' +
											'<div style=" margin-left: 5px;">';
	    	
	    		
						if(j==0)
							{
						k=0;
							exer += 			'<div class="col-md-9 radio" style="margin-top: 5px;">' +
							'<label>' + 
								'<input type="radio" id="qo-'+j+'-o-'+k+'" name="qo-'+j+'-o"  onchange="showExp(`qo-'+j+'-o-'+k+'`, '+j+')" value="'+5+'">' + "Currently, the thoughts about making this change come to my mind once in a while/ occasionally." + 
							'</label>' +
						'</div>';
						
						k=1;
							exer += 			'<div class="col-md-9 radio" style="margin-top: 5px;">' +
							'<label>' + 
								'<input type="radio" id="qo-'+j+'-o-'+k+'" name="qo-'+j+'-o"  onchange="showExp(`qo-'+j+'-o-'+k+'`, '+j+')" value="'+6+'">' + "Currently, the thoughts about making this change come to my mind a few times" + 
							'</label>' + 
						'</div>';
						k=2;
							exer += 			'<div class="col-md-9 radio" style="margin-top: 5px;">' +
							'<label>' + 
								'<input type="radio" id="qo-'+j+'-o-'+k+'" name="qo-'+j+'-o"  onchange="showExp(`qo-'+j+'-o-'+k+'`, '+j+')" value="'+7+'">' + "Currently, the thoughts about making this change come to my mind several times " + 
							'</label>' +
						'</div>';
						k=3;
							exer += 			'<div class="col-md-9 radio" style="margin-top: 5px;">' +
							'<label>' + 
								'<input type="radio" id="qo-'+j+'-o-'+k+'" name="qo-'+j+'-o"  onchange="showExp(`qo-'+j+'-o-'+k+'`, '+j+')" value="'+8+'">' + "Currently, the thoughts about making this change come to my mind very frequently/ almost all the time." + 
							'</label>' + '<br>' + '<br>'+'<p>Your response tells you to what extent the idea of making this change is dominant in your mind.</p>'+ 
						'</div>' ;
							}
						else
							{
						for (k = 0; k < arr1['options'].length ; k++) {
							exer += 			'<div class="col-md-2 radio" style="margin-top: 5px;">' +
													'<label>' + 
														'<input type="radio" id="qo-'+j+'-o-'+(k)+'" name="qo-'+j+'-p"  onchange="showExp(`qo-'+j+'-o-'+k+'`, '+j+')" value="'+arr1['options'][k]+'">' + arr1['options'][k] + 
													'</label>' +
												'</div>';
						}
							}
						
						 exer += 			'</div>' +
											'<div class="clearfix"></div>' +
											'<br>' +
										'</li>';
										
				
	    		}
	    		count = j;	//	total no of questions
	    		
    			exer +=			'</ol>' +
    			
    						'</div>' +
    						'<button id="submit" class="btn btn-primary"  onclick="submit1()" disabled>submit</button>'+
    						'<div class="clearfix"></div>' ;
    					
	    	    $("#exercise").append(exer);
		   	
			}
			
		})
	
		
		
		
		var ques_part1 = 0;
		var ques_part2 ;
		
		var count1 = 0;
		var count2 = 0;
		var count3 = 0;
		var count4 = 0;
		var count5 = 0;
		
		var sum1 = 0;
		var sum2 = 0;
		
		function showExp1(id,j){
			
		}
		
		function showExp(id, j) {
			
			ques_part1 = $('input[name=qo-'+0+'-o]:checked').val();
			ques_part2 = $('input[name=qo-'+j+'-p]:checked').val();
			
			
			if(ques_part2 == "Strongly Disagree"){
				
				count1++;
					
			}
			
			else if(ques_part2 == "Disagree"){
				
				count2++;
				
			}
			
			else if(ques_part2 == "Can't say"){
				
				count3++;
						
			}
			else if(ques_part2 == "Agree"){
				
				count4++;
				
			}
			else if(ques_part2 == "Strongly Agree"){
				
				count5++;
				
			}
			
			sum1 = count1 + count2 + count3;
			sum2 = count4 + count5;
			
			for (l = 0; l < k; l++) {
				
				$('#qo-'+j+'-o-'+l).prop("enabled", "enabled");
				
			}
			
			
			
			flag = false;
			
			for (a = 0; a < count; a++) {
				
				if(! $('#qo-'+a+'-o-0').prop("enabled"))
					flag = true;
			}
			
			if(flag == false) {
	
				$('#next').addClass("hidden");
				$('#submit').removeAttr("disabled");
				
				function submit1(){
					
					
						if((ques_part1 ==7) || (ques_part1 ==8)) {
							
						if(sum2 >= 6){
							
						$('#myModal1').modal("hide");
						$('#myModaltable').modal("show");	
						
					}
						else if(sum2 < 6){
							$('#myModal1').modal("hide");
							$('#myModaltable2').modal("show");	
							
							}
						
						}
				
						else if((ques_part1 ==5) || (ques_part1 ==6)) {
							
							
							if(sum2 >= 6){
								
							$('#myModal1').modal("hide");
							$('#myModaltable3').modal("show");	
							
						}
							else if(sum2 < 6){
								
							
								$('#myModal1').modal("hide");
								$('#myModaltable4').modal("show");	
								
								}	
							
						}
						
						
										
						$('#submit').addClass("hidden");
						$('#next').removeClass("hidden");
				}
				
				function open_modal(){
					$('#myModal1').modal("show");
					
				}
				
				
				
				
				$(document).ready(function(){
				    $('#submit').click(function($){
				        submit1();
				    });
				});
				}
				
				
			
			
		}
	
	</script>
</body>
</html>