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
	<link href="css/animate.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	
	
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
	<script src="js/values.js"></script>
	 <script src="js/inc.js"></script>
	 
    <script type="text/javascript">
    history.forward();
    	$(function(){
    		$('#header').load("navHeader.html");
    		$('#summary').load("summary.html");
    		$('#next').load("nextButton3.html");
	        $('[data-toggle="tooltip"]').tooltip();
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
					<img class="img-responsive" alt="" src="images/ss-dp.jpg">
				</div>
				<div class="col-md-10 col-sm-8">
					<div class="row">
					<div class=" " style="border:1px solid black;width:25%;" ><h6 style="text-align:center;font-weight:bold;">YOU ARE IN OPTIONAL ZONE</h6></div>
					<div id="section17"><h3><b>Maintaining Wellbeing: Part two</b></h3></div>
						<h3><b id="subsection-name"></b></h3>
						<p id="subsection-desc" class="text-justify"></p>				
						<hr style="border-bottom: 1px solid black;">
						<div class="clearfix"></div>
						<h4 id="exercise-title"></h4>
						<p id="exercise-desc" class="text-justify"></p>
						<div id="exercise">
						</div>
						<div id = "ratio" style="text-align:justify;"></div>
						<div class="row">
				<div class="col-md-9">
				</div>
				<div class="btn-group">
			<button id="skip" class="  btn btn-primary" data-toggle="tooltip" data-placement="bottom"
						title="Please answer all the questions" onclick="skip()">Skip</button>
						<button id="submit" class="   btn btn-primary" 
						 onclick="submit1()" disabled>submit</button></div>
						 </div>
						 
						
					</div>
				</div>		
			</div>
			<br>
			<div class="clearfix">
			</div>
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

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					My Notes
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<textarea rows="5" class="form-control" placeholder="Today I am thinking about ....."></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal1" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success text-center">
					<h5>Feedback</h5>
				</div>
				<div class="modal-body text-justify">
					<strong>Your Positivity ratio for today:</strong><p id="ratio1" ></p>:1
				
					<br>
					<strong>(Positive:negative emotions)</strong>
					
				<br><br>Remember that one day’s ratio does not reflect your average/typical ratio. It would be best to check it out at intervals of at least few weeks or so, for a couple of times and estimate your average over a given period of time.This can provide you with some ideas about how you are doing on your journey of self-care.<br><br>Remember to be self-compassionate when tracking your positive and negative emotions.  You may be going through a highly challenging life situation during which it is understandable to experience frequent negative emotions. With your own efforts as well as through utilizing support that you need, you would be able to move ahead from where you are at the moment. In fact, you may find that you have strengths and resources that you never knew existed within you! So don’t, pass a judgement on yourself based on the emotions you are experiencing -it would be unjust and non-compassionate way of managing your challenges.";
					
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
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript">
	 
		var i=0;
		function skip() {
			//alert("Please answer all the questions to get feedback");
			$('#skip').addClass("hidden");
			$('#submit').removeClass("hidden");
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
							        $("#exercise-desc").html(data1['exerciseDesc']);
							        
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
					  alert("Error: server encountered an internal error. Please try again after some time ");
				  } 
			});
		
			
			function myFunction(arr1) {
				
		       	
		        arr = arr1['questions'];
		        
	    	    var exer = "";	//	exercise
	    	    
	    	    exer += '';
	    	    
	    	    //old background-color:#D8E6AD
	    	    for(i = 0; i < arr.length; i++) {	//arr.length
	    	    	exer +=  
	    	    				'<div id="q'+i+'" style="border:1px solid black; background-color:#ffffff;">' +
	    	    					'<p><strong>' + arr[i]['ques'] + '</strong></p>' +
	    	    					'<div class="clearfix"></div>' +
	    							'<ol id="qo-'+i+'">';
 					
	    			for (j = 0; j < arr[i]['quesLists'].length; j++) {
	    				
	    				arr2 = arr[i]['quesLists'];
	    				
						exer += 	 	'<li id="qo-'+i+'-'+j+'">' +
											'<p style="padding-left: 20px; margin-bottom: 0px;">' + arr2[j]['ques'] +
											'<input type="hidden" id="qo-'+i+'-'+j+'-ans" value="'+ arr2[j]['ans'] + '">' +
											'</p>' +
											'<div style="width: 100%; margin-left: 5px;">';
						
						for (k = 0; k < arr1['options'].length; k++) {
							exer += 			'<div class="col-md-2 radio" style="margin-top: 5px;">' +
													'<label>' + 
														'<input type="radio" id="qo-'+i+'-'+j+'-o-'+k+'" name="qo-'+i+'-'+j+'-o" onchange="showExp(`qo-'+i+'-'+j+'-o-'+k+'`, '+i+', '+j+')" value="'+arr1['options'][k]+'">' + arr1['options'][k] + 
													'</label>' +
												'</div>';
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
	    					
	    	    }
	    	   
	    	    
	    		$("#exercise").append(exer);
	    		
          }
			
		
		});

var count = 20;
var ratio = 0;
var ratio1 = 0;
var ratio1_a = 0;
var ratio2 = 0;
var count1=0;
var count2=0;
	function showExp(id, i, j) {
	   
		for (k = 0; k < 5; k++) {
			$('#qo-'+i+'-'+j+'-o-'+k).prop("enabled", "enabled");
		}
		flag = false;
		for (var a = 0; a < count; a++) {
			
		if(! $('#qo-0'+'-'+a+'-o-0').prop("enabled"))
			{
			flag = true;
			}
			
			
		}
		
		
		if((j+1) == 2 ||(j+1) ==3 || (j+1) ==5 || (j+1) ==6 || (j+1) ==7 || (j+1) ==9 || (j+1) ==10 || (j+1) ==17 || (j+1) ==18 ||(j+1) ==20)
		{
		
		for (k = 0; k < 5; k++) {
	if($('#qo-'+i+'-'+j+'-o-'+k).is(':checked'))
		{
		if(k>=1){
		count1 ++;
		}
		
		}
		}
		
		}   
		
		//: 1/4/8/11/12/13/14/15/16/19 
		if((j+1) == 1 ||(j+1) ==4 || (j+1) ==8 || (j+1) ==11 || (j+1) ==12 || (j+1) ==13 || (j+1) ==14 || (j+1) ==15 || (j+1) ==16 ||(j+1) == 19)
		{
		
		for (k = 0; k < 5; k++) {
	if($('#qo-'+i+'-'+j+'-o-'+k).is(':checked'))
		{
		if(k>=2){
		count2 ++;
		}
		
		
		}
		}
		
		}
		
		if(flag==false){
			
			$("input[type=radio]").attr('disabled', true);
			$("#skip").addClass("hidden");
			$("#submit").removeAttr("disabled");
			
			var count_ratio = count2/count1;
			ratio1 = (count_ratio * 100 )/100;
		    ratio1_a = ratio1.toFixed(2);
		    ratio2 = ratio1_a;
		    
			function submit1(){
				
				
				$('#ratio1').after(ratio1_a);
				$('#ratio2').append(ratio2);
				$('#myModal1').modal("show");

				$('#next').removeClass("hidden");
				$('#skip').addClass("hidden");
				$('#submit').addClass("hidden");
			}
			
			
			
			$(document).ready(function(){
			    $('#submit').click(function($){
			        submit1();
			    });
			});
			
		}
		
		
		
	}

		
			
		
	//}
	
	</script>
</body>
</html>