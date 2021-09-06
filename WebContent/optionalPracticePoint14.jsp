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
    
    <style>
   	
   	input[type='radio'] { transform: scale(1.5);
   	border-color
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
					<div id="section17"><h3><b>Maintaining Wellbeing: Part two</b></h3></div>
						<h3><b id="subsection-name"></b></h3>
						<div class="clearfix"></div>
						<hr style="border-bottom: 1px solid black;">
						<p id="exercise-title" class="text-justify">
						</p>				
						<p class="text-justify">
						Positive and negative emotions as well as their balance are only one approach to gauge our well-being and it is often referred to as emotional well-being.
							Another approach to understand well-being is to explore how we are functioning psychologically rather than how we are feeling. In this approach, feelings are given secondary importance and seen as a by-product of how we are leading our lives. There are different components of psychological well-being.<br><br><span style="font-weight:bold;">Let us focus on four of them here.These can be seen as indicators of psychological well-being:</span></p><br><br>
						
						<div class="clearfix"></div>
						<div class="col-md-1"></div>
						
						<div class="col-md-10">
							<div id="images">
							<img class="img-responsive" alt="" src="images/Psycho-opt7.3.png">
							</div>
							<br>
							<br>
							<p class="text-justify">
						You can take a brief questionnaire here to get a feel of how you are doing currently on these dimensions of psychological well-being.

					Your scores are not going to be compared to others to tell you if you are doing better or worse than others. This questionnaire is merely to help you discover and decide for yourself which dimensions or aspects you might want to focus upon, in order to experience an overall increase in your well-being. These dimensions also provide you the idea that you could enhance your well-being in multiple ways.<br>
                            <br><strong>The following set of statements deals with how you feel about yourself and your life. Please click  on the option that is applicable to you. Please remember that there are no right or wrong answers.<br></strong>
</p>
						<div id="exercise">
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
				<button id="skip" class="hidden  btn btn-primary" data-toggle="tooltip" data-placement="bottom"
						title="Please answer all the questions" onclick="skip()">Skip</button>
						<button id="submit" class="  btn btn-primary"
						onclick="submit1()" disabled>Submit</button>
				<div id="next" class="hidden col-md-2">
				</div>
			</div>
		</div>
		
	</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success text-center">
					<h5>Feedback</h5>
				</div>
				<div class="modal-body text-justify">
					<p>Your scores</p>
					<p id="sa"><strong>Self-Acceptance</strong> : <span>(</span> </p>
					<p id="mc"><strong>Sense of mastery and competence</strong> : <span>( </span></p>
					<p id="pr"><strong>Sense Positive Relations</strong> : <span>(</span> </p>
					<p id="eg"><strong>Sense of engagement and growth</strong> : <span>(</span> </p> 
					<p id="fb1" class="hidden">)This is perhaps an area you definitely want to work upon</p>
					<p id="fb2" class="hidden">)You may be doing fair enough, though there is scope to enhance this aspect of your well-being.</p>
					<p id="fb3" class="hidden">) This is perhaps an area wherein you are doing pretty well. Keep it up.</p>
					<p id="fb4"><strong>Highest mean score on</strong> : <i id="max">Sense Positive Relations</i> (The aspect /dimension of well-being wherein you are doing better than other dimensions)</p>
					<p id="fb5"><strong>Lowest mean score on</strong> &nbsp;: <i id="min">Sense of mastery and competence</i> (The aspect /dimension of well-being wherein you are not doing as well as other dimensions)</p>
					
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
		
		var i=0;
		function skip() {
			
			$('#skip').addClass("hidden");
			$('#submit').addClass("hidden");
		  	$('#next').removeClass("hidden");
		}
		
		$(document).ready(function() {
		
			$.ajax({
				  type: "GET",
				  url: serverURL + "users/" + userId + "/currSubSection",
				  success: function(data){
			
			 			activeSectionId = data['activeSection'];
						activeSubSectionId = data['activeSubSection'];
			
		
						
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/discovery2",
							  success: function(data1){
					
								  	$("#subsection-name").html((activeSectionId-10)+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
								  	$("#exercise-title").html(data1['exerciseTitle']);
							       
									myFunc(data1['exerciseDesc']);
							        
								  	myFunction(data1);
								  	$('#next').addClass("hidden");
								  	$('#skip').removeClass("hidden");
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
				
				//old background-color:#D8E6AD
	    	    exer += '<div style="border:1px solid black;background-color:#ffffff;">' +
  	    					'<p><strong>' + arr['ques'] + '</strong></p>' +
  	    					'<div class="clearfix"></div>' +
  							'<ol>';
					
	    		for (j = 0; j < arr['quesLists'].length; j++) {	//arr['quesLists'].length
	    				
	    				arr2 = arr['quesLists'];
	    				
						exer += 	 	'<li id="qo-'+j+'">' +
											'<p style="padding-left: 20px; margin-bottom: 0px;">' + arr2[j]['ques'] +
											'</p>' +
											'<input type="hidden" id="qo-'+j+'-exp" value="'+arr2[j]['explanations'][0]+'">' +
											'<div style=" margin-left: 5px;">';
						
						temp = arr1['options'].length;				
						for (k = 0; k < arr1['options'].length; k++) {
							exer += 			'<div class="col-md-2 radio" style="margin-top: 5px;">' +
													'<label>';
							if(arr2[j]['ans'] == "true")						
								exer += 				'<input type="radio" id="qo-'+j+'-o-'+k+'" name="qo-'+j+'-o"  onchange="showExp(`qo-'+j+'-o-'+k+'`, '+j+')" value="'+temp+'">' + arr1['options'][k];
							else
								exer += 				'<input type="radio" id="qo-'+j+'-o-'+k+'" name="qo-'+j+'-o"  onchange="showExp(`qo-'+j+'-o-'+k+'`, '+j+')" value="'+(k+1)+'">' + arr1['options'][k];	
							
							exer += 				'</label>' +
												'</div>';
							temp-- ;					
						}
						
						 exer += 			'</div>' +
											'<div class="clearfix"></div>' +
											'<br>' +
										'</li>';
										
				}
	    		
	    		count = j;	//	total no of questions
	    		
    			exer +=			'</ol>' +
    						'</div>' +
    						'<div class="clearfix"></div>' + 
    						'<hr>';	
	    	    
	    	    $("#exercise").append(exer);
		   	}
			
			
		});
	
		var count = 0;
		var sa = 0, 
			pr = 0,
			mc = 0,
			eg = 0;
		
		function showExp(id, j) {
			
			for (l = 0; l < k; l++) {
				$('#qo-'+j+'-o-'+l).prop("enabled", "enabled");
			}
			
			v = parseInt($('input[name="qo-'+j+'-o"]:checked').val());
			
		
			
			if($('#qo-'+j+'-exp').val() == "PR") {
				pr += v;	
			}
			else if($('#qo-'+j+'-exp').val() == "SA") {
				sa = sa + v;					
			}
			else if($('#qo-'+j+'-exp').val() == "MC") {
				mc = mc + v;
			}
			else if($('#qo-'+j+'-exp').val() == "EG") {
				eg = eg + v;
			}
			
			
			flag = false;
			
			for (a = 0; a < count; a++) {
				if(! $('#qo-'+a+'-o-0').prop("enabled"))
					flag = true;
			}
			
			
			if(flag == false) {
			
			$('#next').addClass("hidden");
			$('#skip').addClass("hidden");
			$('#submit').removeAttr("disabled");
			
			function submit1(){
				min = 120;	//	6 * 20 questions
				max = 0;	//	
				
				minAspect = '';
				maxAspect = '';
				
				pr = parseInt(pr/5);
				
				max = min = pr;
				maxAspect = minAspect = 'Sense Positive Relations';
				
				sa = parseInt(sa/4);
				if(sa < min) {
					min = sa;
					minAspect = 'Self-Acceptance';
				}
				if(sa > max) {
					max = sa;
					maxAspect = 'Self-Acceptance';
				}
				
				mc = parseInt(mc/6);
				if(mc < min) {
					min = mc;
					minAspect = 'Sense of mastery and competence';
				}
				if(mc > max) {
					max = mc;
					maxAspect = 'Sense of mastery and competence';
				}
				
				eg = parseInt(eg/5);
				if(eg < min) {
					min = eg;
					minAspect = 'Sense of engagement and growth';
				}
				if(eg > max) {
					max = eg;
					maxAspect = 'Sense of engagement and growth';
				}
				
				
				if(pr <= 2) {
					
					$('#pr').append(pr + " " + $('#fb1').html());
				}
				else if(pr == 3 || pr == 4) {
					$('#pr').append(pr + " " + $('#fb2').html());
				}
				else if(pr >= 5) {
					$('#pr').append(pr + " " + $('#fb3').html());
				}
				
				if(sa <= 2) {
					
					$('#sa').append(sa + " " + $('#fb1').html());
				} 
				else if(sa == 3 || sa == 4) {
					$('#sa').append(sa + " " + $('#fb2').html());
				}
				else if(sa >= 5) {
					$('#sa').append(sa + " " + $('#fb3').html());
				}
				
				if(mc <= 2) {
					
					$('#mc').append(mc + " " + $('#fb1').html());
				} 
				else if(mc == 3 || mc == 4) {
					$('#mc').append(mc + " " + $('#fb2').html());
				}
				else if(mc >= 5) {
					$('#mc').append(mc + " " + $('#fb3').html());
				}
				
				if(eg <= 2) {
					
					$('#eg').append(eg + " " + $('#fb1').html());
				} 
				else if(eg == 3 || eg == 4) {
					$('#eg').append(eg + " " + $('#fb2').html());
				}
				else if(eg >= 5) {
					$('#eg').append(eg + " " + $('#fb3').html());
				}
					
				$('#max').html(maxAspect);
				$('#min').html(minAspect);
				$('#myModal').modal("show");
			$('#next').removeClass("hidden");
			$('#skip').addClass("hidden");
			$('#submit').addClass("hidden");
			
			
				
			}
			
			$(document).ready(function(){
			    $('#submit').click(function(event){
			        submit1();
			    });
			});
			}
			
			
				
		}
	
	</script>
</body>
</html>