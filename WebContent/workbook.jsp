<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html> -->
<html ng-app>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Workbook</title>
	
	<!-- Bootstrap Core CSS -->
	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/workbook.css" rel="stylesheet">
	<link href="css/slimscroll.css" rel="stylesheet">
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	

	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
     
     
    <script src="js/values.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
    <script src="js/check3.js"></script>
    
     <script src="js/workbook.js"></script>
     
    <script src="js/practice4.js"></script>
    <script src="js/practice6.js"></script>
    <script src="js/practice7.js"></script>
    <script src="js/practice10.js"></script>
    <script src="js/3rdSectionworkbook.js"></script>
    <script src="js/practice15.js"></script>
    <script src="js/tool2.js"></script>
    <script src="js/slimscroll.js"></script>
   <script src="js/externalFiles/angular.min.js"></script>
   <script src="js/externalFiles/jspdf.min.js"></script>
    <script src="js/inc.js"></script>
    <script type="text/javascript">
    
   var session1 = sessionStorage.getItem("addVer");
   
   var CurrentDisplaySection = sessionStorage.getItem("currentSectionDisplay");
  
   
   
   if (session1 == "5") { 
	   
	    showPage(5);
	  } 
    
    	history.forward();
    	
	    window.onload = function() {
	    	
	    	//new code to highlight the last active section in the workbook
	    	$("#CurrentDisplaySection1").addClass("hidden");
	    	
	    	
	    	if(CurrentDisplaySection !== null){
	    		$("#CurrentDisplaySection1").removeClass("hidden");
	    		
	    	$("#CurrentDisplaySection1").append(CurrentDisplaySection);
	    	}
	    	
			if (!navigator.userAgent.match('Macintosh')) {
				var element = document
						.querySelectorAll('.slimScroll');
	
				// Apply slim scroll plugin
				var one = new slimScroll(
						element[0],
						{
							'wrapperClass' : 'scroll-wrapper unselectable mac',
							'scrollBarContainerClass' : 'scrollBarContainer',
							'scrollBarContainerSpecialClass' : 'animate',
							'scrollBarClass' : 'scroll',
							'keepFocus' : true
						});
	
				// resize example
				// To make the resizing work, set the height of the container in PERCENTAGE
				window.onresize = function() {
					one.resetValues();
				}
			} else {
				document
						.write("For Mac users, this custom slimscroll styles will not be applied");
			}
		}

	    $.get( serverURL + "users/" + userId + "/currSection", function( data ) {
	
			sid = data['currentSection'];
			
			$.get( serverURL + "sections", function( data ) {
				my(data, sid);
			});
		});
	    
	    function my(arr, sid) {		// side bar
			
	    	var out = "";
		    for(i = -1; i < arr.length; i++) {
		
		    	if(i == -1) {
		    		out +=  '<li id="list' + (i+1) + '" class="list-group-item list-group-item-warning">' +
								'<a href="#" onclick="showPage(0)" ' + 
		    						'class="truncate" data-toggle="tooltip" data-placement="right" ' + 
									'title="Table of Contents">&emsp;Table of Contents</a></div>';
		    	}
		    	else if(parseInt(arr[i].sectionId) == parseInt(sid)) {
		    		out +=  '<li id="list' + (i+1) + '" class="list-group-item list-group-item-warning">' +
								'<a href="#" onclick="showPage(' + (i+1) + ')" ' + 
		    						'class="truncate" data-toggle="tooltip" data-placement="right" ' + 
									'title="' + arr[i].sectionName + '">&emsp;' + 
									 arr[i].sectionName + '</a></div>';
		    	}
		    	else if(parseInt(arr[i].sectionId) < parseInt(sid)) {
		    		out +=  '<li id="list' + (i+1) + '" class="list-group-item list-group-item-success">' +
								'<a href="#" onclick="showPage(' + (i+1) + ')" ' + 
		    						'class="truncate" data-toggle="tooltip" data-placement="right" ' + 
									'title="' + arr[i].sectionName + '">&emsp;' + 
									 arr[i].sectionName + '</a></div>';
		    	}
		    	
		    }
		 
		    $("#list-section").html(out);
		}
	    
    	
    	
    	$.ajax({
    		  type: "GET",
    		  url: serverURL + "users/" + userId + "/workbookLinks",
    		  success: function(data){
    			  
    			sectionId = data['link'].sId;
    			subsectionId = data['link'].ssId;
    			
    			
    			
    			tableOfContent();
    			
    			if(data['links'].length > 0) {
    				for ( j = 0; j < data['links'].length; j++) {
    					getContent(data['links'][j]);
    				}
    			}
    		  },
    		  error: function() {
    			  alert("Error: server encountered an internal error. Please try again after some time ");
    			  
    		  } 
  		});
    
    	 $(function(){
    		 $('#header').load("navHeader.html");
	         $("#includedContent").load("sectionSideNav3.html"); 
	         
	         
	     });
		 
    	 (function($){
    		    $('#myform').submit(function(e){
    		    	
    		        var val = $(this).find('#in').val();
    		        $('ul.list').append('<li>' + val + '</li>');
    		        e.preventDefault();
    		    });
    		})(jQuery);
    	 
    	 
    	 
    	 function notecontroller($scope)
    		{
    			
    			$.getJSON(serverURL + "users/admin/"+<%= request.getParameter("userid") %>, function(data){
    				
    			});
    			$scope.notes=["note 1","note 2"];
    			$scope.addnote=function()
    			{
    				$scope.notes.push($scope.newnote);
    				
    				$.ajax({
    					type:"PUT",
    					url: serverURL + "users/"+userId+"/note/"+$scope.newnote,
    					success:function(data){},
    					error:function(){}
    				});
    				$scope.newnote=null;
    			}
    			
    			
    		}
    		
    		function feedbackcontroller($scope)
    		{
    			
    			$.getJSON(serverURL + "users/admin/"+<%= request.getParameter("userid") %>, function(data){
    				
    			});
    			$scope.feedbacks=["feedback 1","feedback 2"];
    		}
    </script>
    
	<style>
		.truncate {
		    width: 150px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    display: inline-block;
		    text-decoration: none;
		}
		a:focus, a:hover {
		    color: #23527C;
		    text-decoration: none;
		}
	</style>
</head>

<body class="bgcolor" oncontextmenu="return false">

<div id="header">
</div>
<div class="container-fluid" style="height: 100%">
	<div class="row">
		<div class="col-md-2">
			<ul class="nav nav-pills nav-stacked text-center">
				<li id="dashboard"><a href="home3.jsp">Home</a></li>
				<li id="section"><a href="section.jsp">Essential Zone</a></li>
				<li id="exercise"><a onclick="getPage(11)">Optional Zone</a></li>
				<li id="workbook" class="">
					<a class="" role="button" data-toggle="collapse" data-parent="#accordion" 
						href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">&emsp;Workbook &emsp;<span class="caret"></span></a>
					<div id="collapseOne" class="collapse out in" role="tabpanel" aria-expanded="true" aria-labelledby="headingOne">
						<ul id="list-section" class="text-left list-group">
						</ul>
					</div>
				</li>
				<li id="dsl" class="">
					<a class="" role="button" data-toggle="collapse" data-parent="#accordion" 
						href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">&emsp;Direct Links &emsp;<span class="caret"></span></a>
					<div id="collapseTwo" class="collapse out in" role="tabpanel" aria-expanded="true" aria-labelledby="headingTwo">
						<ul class="text-left list-group">
							<li class="list-group-item"><a class="truncate" data-toggle="tooltip" data-placement="right" href="#subsection-3-3" onclick="showPage(3)" title="Your Potential List">E 9: Your Potential List</a></li>
							<li class="list-group-item"><a class="truncate" data-toggle="tooltip" data-placement="right" href="#subsection-3-3" onclick="showPage(3)" title="Weekly Planner">E 10: Weekly Planner</a></li>
							<li class="list-group-item"><a class="truncate" data-toggle="tooltip" data-placement="right" href="#subsection-3-7" onclick="showPage(3)" title="Weekly Monitor">E 11: Weekly Monitor</a></li>
							<li class="list-group-item"><a class="truncate" data-toggle="tooltip" data-placement="right" href="#subsection-4-6" onclick="showPage(4)" title="Monitoring and correcting errors in thinking">E 15: Monitoring and correcting errors in thinking</a></li>
							<li class="list-group-item"><a class="truncate" data-toggle="tooltip" data-placement="right" href="#subsection-5-8" onclick="showPage(5)" title="Worry Diary">E 19: Worry Diary</a></li>
							<li class="list-group-item"><a class="truncate" data-toggle="tooltip" data-placement="right" href="#subsection-6-4" onclick="showPage(6)" title="Self-compassionate thoughts">E 21: Self-compassionate thoughts</a></li>
							<li class="list-group-item"><a class="truncate" data-toggle="tooltip" data-placement="right" href="#subsection-7-5" onclick="showPage(7)" title="Recording your application of self-soothing practice">E 24: Recording your application of self-soothing practice</a></li>
							<li class="list-group-item"><a class="truncate" data-toggle="tooltip" data-placement="right" href="#subsection-8-4" onclick="showPage(8)" title="Regaining sense of mastery">E 25: Regaining sense of mastery</a></li>
					
						</ul>
					</div>
				</li>
				<li id="summary"><a href="workbooksummary.jsp">Summary & Review</a></li>
				<li id="message" style="list-style:none;"><a href="message.jsp">Messages from the Push-D</a></li>
				
			</ul>
			
			
		</div>
		<div class="col-md-10">
			<div class="slimScroll" style="overflow-y: auto; height: 270vh; width: 100%;">
				<div id="page-0">
					<div id="overview">
						<h3>&emsp;Table of Contents</h3><br>
						<p id="CurrentDisplaySection1" style="font-weight:bold;color:blue; "><span style="font-weight:bold;color:blue;">&emsp;Recently updated Section:  </span></p>
						<table class="table table-of-content">
							<thead id="th1" class="hidden">
								<tr><th><a href="#" onclick="showPage(1)">Section 1</a></th>
									<th><a href="#" onclick="showPage(1)">Understand Depression</a></th>
								</tr>	 
							</thead>
							<tbody id="tb1" class="table-of-content hidden">
								<tr><td colspan="2">
										<input id="tbs1" type="hidden" value="5"><!-- no of subsections -->
										<ul style="list-style-type: square;">
											<li id="ts1-1" class="hidden"><a href="#subsection-1-1" onclick="showPage(1)">Discovery Point : Quiz</a></li>
											<li id="ts1-2" class="hidden"><a href="#subsection-1-2" onclick="showPage(1)">Tool Box</a></li>
										</ul>
									</td>
								</tr>
								<tr><td><br></td></tr>
							</tbody>
							<thead id="th2" class="hidden">
								<tr><th><a href="#" onclick="showPage(2)">Section 2</a></th>
									<th><a href="#" onclick="showPage(2)">Enhance Self-Care Motivation</a></th>
								</tr>	 
							</thead>
							<tbody id="tb2" class="table-of-content hidden">
								<tr><td colspan="2">
										<input id="tbs2" type="hidden" value="2">
										<ul style="list-style-type: square;">
											<li id="ts2-1" class="hidden"><a href="#subsection-2-1" onclick="showPage(2)">A letter from us</a></li>
											<li id="ts2-2" class="hidden"><a href="#subsection-2-2" onclick="showPage(2)">Another letter from us</a></li>
										</ul>
									</td>
								</tr>
								<tr><td><br></td></tr>
							</tbody>
							<thead id="th3" class="hidden">
								<tr><th><a href="#" onclick="showPage(3)">Section 3</a></th>
									<th><a href="#" onclick="showPage(3)">Activate</a></th>
								</tr>	 
							</thead>
							<tbody id="tb3" class="table-of-content hidden">
								<tr><td colspan="2">
										<input id="tbs3" type="hidden" value="7">
										<ul style="list-style-type: square;">
											<li id="ts3-2" class="hidden"><a href="#subsection-3-2" onclick="showPage(3)">Practice Point - 1 : Developing an activation plan</a></li>
											<!-- <li id="ts3-3" class="hidden"><a href="#subsection-3-3" onclick="showPage(3)">Potential List and Weekly Planner</a></li> -->
											<li id="ts3-4" class="hidden"><a href="#subsection-3-4" onclick="showPage(3)">Check point</a></li>
											<li id="ts3-5" class="hidden"><a href="#subsection-3-5" onclick="showPage(3)">Tool box : Planning, implementing, rewarding</a></li>
											<li id="ts3-6" class="hidden"><a href="#subsection-3-6" onclick="showPage(3)">Practice Point - 2 : Self-reward planning</a></li>
											<!-- <li id="ts3-7" class="hidden"><a href="#subsection-3-7" onclick="showPage(3)">Weekly Monitor</a></li> -->
										</ul>
									</td>
								</tr>
								<tr><td><br></td></tr>
							</tbody>
							<thead id="th4" class="hidden">
								<tr><th><a href="#" onclick="showPage(4)">Section 4</a></th>
									<th><a href="#" onclick="showPage(4)">Learning to deal with thoughts to influence feelings!</a></th>
								</tr>	 
							</thead>
							<tbody id="tb4" class="table-of-content hidden">
								<tr><td colspan="2">
										<input id="tbs4" type="hidden" value="7">
										<ul style="list-style-type: square;">
											<li id="ts4-3" class="hidden"><a href="#subsection-4-3" onclick="showPage(4)">Demo Point : Identifying cognitive errors</a></li>
											<li id="ts4-5" class="hidden"><a href="#subsection-4-5" onclick="showPage(4)">Tool Box : Questioning your thoughts</a></li>
											<li id="ts4-6" class="hidden"><a href="#subsection-4-6" onclick="showPage(4)">Practice Point-2 : Applying what you learnt in your day-day life</a></li>
											<li id="ts4-7" class="hidden"><a href="#subsection-4-7" onclick="showPage(4)">Practice Point-3 : Applying what you learnt in your day-day life</a></li>
										</ul>
									</td>
								</tr>
								<tr><td><br></td></tr>
								
							</tbody>
							<thead id="th5" class="hidden">
								<tr><th><a href="#" onclick="showPage(5)">Section 5</a></th>
									<th><a href="#" onclick="showPage(5)">Manage Excessive Worries</a></th>
								</tr>	 
							</thead>
							<tbody id="tb5" class="table-of-content hidden">
								<tr><td colspan="2">
										<input id="tbs5" type="hidden" value="8">
										<ul style="list-style-type: square;">
											<li id="ts5-2" class="hidden"><a href="#subsection-5-2" onclick="showPage(5)">Tool Box : Strategies to manage excessive worry</a></li>
											<li id="ts5-4" class="hidden"><a href="#subsection-5-4" onclick="showPage(5)">Practice Point-1 : Exercises to identify different mind-states</a></li>
											<li id="ts5-6" class="hidden"><a href="#subsection-5-6" onclick="showPage(5)">Practice Point-2 : Applying what you learnt</a></li>
											<li id="ts5-7" class="hidden"><a href="#subsection-5-7" onclick="showPage(5)">Commitment point</a></li>
											<li id="ts5-8" class="hidden"><a href="#subsection-5-8" onclick="showPage(5)">Practice Point-3 : Your Diary for Practice</a></li>
										</ul>
									</td>
								</tr>
								<tr><td><br></td></tr>
							</tbody>
							<thead id="th6" class="hidden">
								<tr><th><a href="#" onclick="showPage(6)">Section 6</a></th>
									<th><a href="#" onclick="showPage(6)">Learn Self-compassion</a></th>
								</tr>	 
							</thead>
							<tbody id="tb6" class="table-of-content hidden">
								<tr><td colspan="2">
										<input id="tbs6" type="hidden" value="8">
										<ul style="list-style-type: square;">
											<li id="ts6-1" class="hidden"><a href="#subsection-6-1" onclick="showPage(6)">Discovery Point</a></li>
											<li id="ts6-7" class="hidden"><a href="#subsection-6-7" onclick="showPage(6)">Tool Box and Practice Points</a></li>
											<li id="ts6-8" class="hidden"><a href="#subsection-6-8" onclick="showPage(6)">Practice Point-2 : Mindfulness practice</a></li>
										</ul>
									</td>
								</tr>						
								<tr><td><br></td></tr>
							</tbody>
							<thead id="th7" class="hidden">
								<tr><th><a href="#" onclick="showPage(7)">Section 7</a></th>
									<th><a href="#" onclick="showPage(7)">Strengthen self-soothing skills</a></th>
								</tr>	 
							</thead>
							<tbody id="tb7" class="table-of-content hidden">
								<tr><td colspan="2">
										<input id="tbs7" type="hidden" value="5">
										<ul style="list-style-type: square;">
											<li id="ts7-1" class="hidden"><a href="#subsection-7-1" onclick="showPage(7)">Knowledge point</a></li>
											<li id="ts7-2" class="hidden"><a href="#subsection-7-2" onclick="showPage(7)">Tool box</a></li>
											<li id="ts7-3" class="hidden"><a href="#subsection-7-3" onclick="showPage(7)">Note of caution</a></li>
											<li id="ts7-4" class="hidden"><a href="#subsection-7-4" onclick="showPage(7)">Commitment Point</a></li>
											<li id="ts7-5" class="hidden"><a href="#subsection-7-5" onclick="showPage(7)">Practice point</a></li>
										</ul>
									</td>
								</tr>
								<tr><td><br></td></tr>
							</tbody>
							<thead id="th8" class="hidden">
								<tr><th><a href="#" onclick="showPage(8)">Section 8</a></th>
									<th><a href="#" onclick="showPage(8)">Regain a sense of mastery</a></th>
								</tr>	 
							</thead>
							<tbody id="tb8" class="table-of-content hidden">
								<tr><td colspan="2">
										<input id="tbs8" type="hidden" value="5">
										<ul style="list-style-type: square;">
											<li id="ts8-4" class="hidden"><a href="#subsection-8-4" onclick="showPage(8)">Practice point-Regaining a sense of mastery</a></li>
											<li id="ts8-5" class="hidden"><a href="#subsection-8-5" onclick="showPage(8)">Commitment point</a></li>
										</ul>
									</td>
								</tr>
								<tr><td><br></td></tr>
							</tbody>
							<thead id="th9" class="hidden">
								<tr><th><a href="#" onclick="showPage(9)">Section 9</a></th>
									<th><a href="#" onclick="showPage(9)">Reach-Out : Harness the power of support</a></th>
								</tr>	 
							</thead>
							<tbody id="tb9" class="table-of-content hidden">
								<tr><td colspan="2">
										<input id="tbs9" type="hidden" value="6">
										<ul style="list-style-type: square;">
											<li id="ts9-1" class="hidden"><a href="#subsection-9-1" onclick="showPage(9)">Knowledge point</a></li>
											<li id="ts9-3" class="hidden"><a href="#subsection-9-3" onclick="showPage(9)">Tool box</a></li>
											<li id="ts9-4" class="hidden"><a href="#subsection-9-4" onclick="showPage(9)">Commitment point</a></li>
											<li id="ts9-5" class="hidden"><a href="#subsection-9-5" onclick="showPage(9)">Warning shots</a></li>
										</ul>
									</td>
								</tr>
								<tr><td><br></td></tr>
							</tbody>
							<thead id="th10" class="hidden">
								<tr><th><a href="#" onclick="showPage(10)">Section 10</a></th>
									<th><a href="#" onclick="showPage(10)">Step-Up</a></th>
								</tr>	 
							</thead>
							<tbody id="tb10" class="table-of-content hidden">
								<tr><td colspan="2">
										<input id="tbs10" type="hidden" value="4">
										<ul style="list-style-type: square;">
											<li id="ts10-1" class="hidden"><a href="#subsection-10-1" onclick="showPage(10)">Knowledge point</a></li>
											<li id="ts10-2" class="hidden"><a href="#subsection-10-2" onclick="showPage(10)">Discovery point</a></li>
											<li id="ts10-3" class="hidden"><a href="#subsection-10-3" onclick="showPage(10)">Tool box-1</a></li>
											<li id="ts10-4" class="hidden"><a href="#subsection-10-4" onclick="showPage(10)">Tool box-2</a></li>
										</ul>
									</td>
								</tr>
								<tr><td><br></td></tr>
							</tbody>
						</table>
					</div>
					<br>
					<br>
				</div>
				<div id="page-1" class="hidden">
					<div id="section-1">
						<div class="section-title">
							<h3>Section 1 - Understand Depression</h3>
						</div>
						<br>
						<div id="subsection-1-1" class="hidden">
							<h4 class="subsection-title">1.1 &emsp; Discovery Point - Quiz</h4>		
							<div class="subsection-content">
								<p>Beliefs influence actions You busted the common myths about depression.</p>
							</div>
						</div>
						<br>
						<div id="hr-1-2" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-1-2" class="hidden">
							<h4 class="subsection-title">1.2 &emsp; Tool Box</h4>		
							<div class="subsection-content">
								<strong>So, here is the right checklist to carry in our minds!</strong>
								<ol>
									<li>Depression is a common mental health condition</li>
									<li>Depression is multifactorial</li>
									<li>Depression can happen to anyone, including people who may be seen as 'strong'</li>
									<li>Depression can occur even without any obvious negative life event/triggering situation.</li>
									<li>Depression as a mental health condition involves a group of symptoms and it is not just about being sad.</li>
									<li>Effective methods of interventions are available to manage depression</li>
									<li>Depression is often accompanied by low motivation to do things, it would be wrong to say that someone who is depressed is being lazy. </li>
									<li>People with depression can take simple steps to help their own process of recovery, along with utilizing available professional support, as may be needed.</li>
									<li>Seeking professional help for depression is a sign of strength rather than weakness</li>
								</ol>
							</div>
						</div>
						<br>
						<br>
					</div>
				</div>
				<div id="page-2" class="hidden">
					<div id="section-2">
						<div class="section-title">
							<h3>Section 2 - Enhance Self-Care Motivation</h3>
						</div>
						<br>
						<div id="subsection-2-1" class="hidden">
							<h4 class="subsection-title">2.1 &emsp; A letter to you from us ...</h4>	
							<br>	
							<div class="subsection-content">
								<p>
									Hi,<br />
									<br /> This program cannot be finished in one-go/ in a jiffy,
									same as many other things in life which requires putting in time
									and efforts. It is likely that at various times, you may feel
									like giving up and not continuing with this program. Hence this
									letter for you!<br />
									<br /> There is such a long list of reasons why you may not feel
									like completing this self-care program!! We have already
									anticipated this! But we want to tell you about why you should
									give this program a good try!
								</p>
								<p>
									<strong>Why should you give this program a good try?</strong>
								</p>
								<ul>
									<li>Grounded in current research</li>
									<li>Overlap with clinically effective techniques used in
										face to face psychotherapies.</li>
									<li>Self-care management can be first- line management for
										low- grade depression.</li>
									<li>Can be helpful to maintaining or enhancing well-being.</li>
		
		
								</ul>
								<br />
								<p>You can go over the audio- letter again at any point of
									time by going back to the section on Enhance Self-care
									motivation!</p>
							</div>
							</div>
						<br>
						<div id="hr-2-2" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-2-2" class="hidden">
							<h4 class="subsection-title">2.2 &emsp; Strategies to keep up your motivation (Some questions and points to ponder)</h4>
							<br>				
							<div class="subsection-content">
								<table id="ss-2-2" class="table table-bordered table-hover">
									<thead class="text-center">
										<tr>
											<th class="col-md-5">Questions to ask myself/points to ponder</th>
											<th>My thoughts/notes to myself</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Have I set the right time, place and day to schedule these sessions for myself, by myself?(I need to spend at least half an hour on 2-3 occasions per week.)</td>
											<td><textarea id="bl-1" rows="2" class="form-control" style="resize: none;"></textarea> </td>
										</tr>
										<tr>
											<td>If I am feeling helpless and pessimistic about this program, is this probably a symptom of depression itself?</td>
											<td><textarea id="bl-2" rows="2" class="form-control" style="resize: none;"></textarea> </td>
										</tr>
										<tr>
											<td>Can I use and consistently practice what is relevant to me?Can I give it a good try?</td>
											<td><textarea id="bl-3" rows="2" class="form-control" style="resize: none;"></textarea> </td>
										</tr>
										<tr>
											<td>Can I focus on small gains I can make?</td>
											<td><textarea id="bl-4" rows="2" class="form-control" style="resize: none;"></textarea> </td>
										</tr>
										<tr>
											<td>Will it help me if I expect ups and downs and not get easily disheartened by these?</td>
											<td><textarea id="bl-5" rows="2" class="form-control" style="resize: none;"></textarea> </td>
										</tr>
										<tr>
											<td>Do I value small steps I take and the efforts I make?</td>
											<td><textarea id="bl-6" rows="2" class="form-control" style="resize: none;"></textarea> </td>
										</tr>
										<tr>
											<td>Let me visualize recovering from depressed mood.</td>
											<td><textarea id="bl-7" rows="2" class="form-control" style="resize: none;"></textarea> </td>
										</tr>
										<tr>
											<td>Is it not worth investing time and efforts in taking care to feel and function well?</td>
											<td><textarea id="bl-8" rows="2" class="form-control" style="resize: none;"></textarea> </td>
										</tr>
										<tr>
											<td>What are those little things I did -based on the program -for which I need to pat myself on my back?</td>
											<td><textarea id="bl-9" rows="2" class="form-control" style="resize: none;"></textarea> </td>
										</tr>
										<tr>
											<td>Can I take someone's help in order to complete this program?</td>
											<td><textarea id="bl-10" rows="2" class="form-control" style="resize: none;"></textarea> </td>
										</tr>
										<tr>
											<td>What can inspire me? Can I keep such cues close to me?</td>
											<td><textarea id="bl-11" rows="2" class="form-control" style="resize: none;"></textarea> </td>
										</tr>
										<tr>
											<td>What motivational statements I can use to help me?</td>
											<td><textarea id="bl-12" rows="2" class="form-control" style="resize: none;"></textarea> </td>
										</tr>
										<tr>
											<td colspan="2" class="text-center"><strong>Let me be responsible and take care of my mental health needs!</strong></td>
										</tr>
									</tbody>
								</table>
								<button class="btn btn-success" id="submit1" onclick="submitSection2_2()">Submit</button>
								
						
							</div>
						</div>
						<br>
						<br>
					</div>
				</div>
				<div id="page-3" class="hidden">
					<div id="section-3">
						<div class="section-title">
							<h3>Section 3 - Activate</h3>
						</div>
						<br>
						<div id="subsection-3-2" class="hidden">							<!-- Partially Completed -->
							<h4 class="subsection-title">3.2 &emsp; Practice Point : Developing an activation plan</h4>		
							<br>
							<div class="tabbable">
								<ul id="tabs-3-2" class="nav nav-tabs" title="Please click the Add button to modify the form">
									<li class="active"><a href="#tab-3-2-1" data-toggle="tab">Home</a></li>
									<li><a href="#tab-3-2-2" data-toggle="tab" >Add</a></li>
								</ul>
								<div id="ss-3-2" class="tab-content">
									<div class="tab-pane" id="tab-3-2-1">
							
									</div>
									<div class="tab-pane" id="tab-3-2-2">
									</div>
								</div>
								
						<!--  		<div class="form-group" id="feedback">
									<label>FeedBack:</label>
									<textarea class="form-control" rows="5" id="feedback_3_2" disabled> </textarea>
								</div> -->
							</div>
						</div>
						<br>
						<div id="hr-3-3" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						
						<br>
						
						<br>
						<div id="subsection-3-4" class="hidden">									<!-- Completed -->
							<h4 class="subsection-title">3.4 &emsp; Check Point</h4>		
							<br>
							<div class="tabbable">
								<ul id="tabs-3-4" class="nav nav-tabs" title="Please click the Add button to modify the form">
									<li class="active"><a href="#tab-3-4-1" data-toggle="tab">Home</a></li>
									<li><a href="#tab-3-4-2" data-toggle="tab">Add</a></li>
								</ul>
								<div id="ss-3-4" class="tab-content">
									<div class="tab-pane active" id="tab-3-4-1">
									</div>
									<div class="tab-pane" id="tab-3-4-2">
									</div>
								</div>
								
						
							</div>
						</div>
						<br>
						<div id="hr-3-5" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-3-5" class="hidden">
							<h4 class="subsection-title">3.5 &emsp; Tool Box : Planning, implementing, rewarding</h4>		
							<br>
							<div id="ss-3-5" class="subsection-content">
								<strong>Some useful tips while planning and implementing your plans:</strong>
								<ol>
									<li>Start with planning small changes.</li>
									<li>Notice and appreciate small gains.</li>
									<li>Reward yourself in proportion to your efforts. </li>
									<li>Gradually increase the amount of efforts. </li>
									<li>Practice visual imagery that motivates you. </li>
									<li>Expect ups and downs during your journey to well-being. </li>
									<li>Don't expect a steady upward graph.</li>
								</ol>
							</div>
						</div>
						<br>
						<div id="hr-3-6" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-3-6" class="hidden">									<!-- Completed -->
							<h4 class="subsection-title">3.6 &emsp; Practice Point - 2 : Self-reward planning</h4>		
							<br>
							<div class="tabbable">
								<ul id="tabs-3-6" class="nav nav-tabs" title="Please click the Add button to modify the form">
									<li class="active"><a href="#tab-3-6-1" data-toggle="tab">Home</a></li>
									<li><a href="#tab-3-6-2" data-toggle="tab">Add</a></li>
								</ul>
								<div id="ss-3-6" class="tab-content">
									<div class="tab-pane active" id="tab-3-6-1">
									</div>
									<div class="tab-pane" id="tab-3-6-2">
									</div>
								</div>
							</div>
							
						
						</div>
						<br>
						<div id="hr-3-7" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						
						<br>
						<br>
					</div>
				</div>
				<div id="page-4" class="hidden">
					<div id="section-4">
						<div class="section-title">
							<h3>Learning to deal with thoughts to influence feelings!!</h3>
						</div>
						<br>
						<div id="subsection-4-3" class="hidden">
							<h4 class="subsection-title">4.3 &emsp; Demo Point : Identifying cognitive errors</h4>
							<br>
							<table class="table table-bordered">
								<thead class="text-center">
									<tr><th>S No</th>
										<th>Examples</th>
										<th>Thinking Errors</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>You are a homemaker. You serve your family a special dinner that you have cooked and after the dinner is over, your partner comments: , "The rice has come out very well although the vegetables in the side dish could have been cooked for a little while longer",<br> You think to yourself: "I am a total failure. I can't even make a simple dinner for my family. I am bad homemaker and there is no point in trying at all." You feel very upset and sad.</td>
										<td>Magnification<br>Catastrophization</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Over a casual meeting at the canteen, your manager mentions to you and your team mates that the company is facing a tough time these days and that the management is concerned about overall cutting of costs. You begin to feel tense and worried, unable to concentrate on the rest of the conversation and eventually start feeling sad. Your thought on hearing these words before feeling sad and tense are:  He means, "I will lose my job and they will be asking me to leave. This certainly is the end of the road for me. I am doomed now; I will never get a job."</td>
										<td>Jumping to Conclusion<br>Personalization</td>
									</tr>
									<tr>
										<td>3</td>
										<td>You have been asked to make a short speech at your friend's farewell party and the gathering consists of a few close friends. As you start getting up to speak, you notice your heart pounding, your face is getting flushed. You feel tense and nervous and you tell yourself "I am feeling so tense, so I am sure the speech will go wrong and I will go blank and end up making a fool of myself. Everybody will think I am incapable of doing this small activity."</td>
										<td>Emotional reasoning<br>Jumping to Conclusion&emsp;(fortune telling and mind-reading)</td>
									</tr>
									<tr>
										<td>4</td>
										<td>You have postponed writing a report needed at your office. Every night when you try to get down to it, the whole project seems so difficult that you end up doing something else instead.  Every time you think of starting, you put it off as you tell yourself, unless I have all the information I need I cannot start, I must have everything which is required before I begin working on it.  I must be sure of what I am doing. As the day of submission deadline comes closer, you begin to feel overwhelmed and guilty.</td>
										<td>All or none thinking<br>Fortune Telling</td>
									</tr>
									<tr>
										<td>5</td>
										<td>Your job interview did not go as well as you expected, the offer did not come through, as the company explained that they wanted somebody with a different set of qualifications. Although you felt bad, you understand that the reasons were valid. However now that you have another offer, you start feeling anxious and tense, and wonder if you shouldn't go for the interview. This is because you think "I am sure the same thing that happened the last time will happen again, there is no point in going there."</td>
										<td>Over-generalization</td>
									</tr>
								</tbody>
							</table>
						</div>
						<br>
						<div id="hr-4-5" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-4-5" class="hidden">
							<h4 class="subsection-title">4.5 &emsp; Tool Box : Questioning your thoughts</h4>
							<br>
							<p>What can you ask yourself to challenge your depressive thought which may be unrealistic?</p>
							<p>You can use one or more of the following questions to examine your depressive thoughts:</p>
							<br>
							<ul>
								<li>Have I had any experiences that show that this thought is not completely true all the time?</li>
								<li>If my best friend or someone I loved had this thought, what would I tell them?</li>
								<li>If my best friend or someone who loves me knew I was thinking this, what would they say to me? What evidence would they point out to me that would suggest that my thoughts were not 100% true ? </li>
								<li>When I have felt this way in the past, what did I think about that helped me feel better?</li>
								<li>What have I learned from prior experiences that could help me now?</li>
								<li>Five years from now, if I look back at this situation, will I look at it any differently?</li> 
								<li>When I am not feeling this way, do I think about this type of situation any differently? How?</li>
								<li>Are there any strengths or positives in me or the situation that I am ignoring?</li>
								<li>Am I jumping to any conclusions when I do not really have much evidence?</li>
								<li>Am I blaming myself for something over which I do not have complete control?</li>
								<li>What is the effect of thinking this way?</li>
								<li>What is an alternative way of looking at this situation and what would the effect of that be?</li>
								<li>What are the advantages and disadvantages of thinking this way?</li>
								<li>What is the worst that can happen and how can I deal with that?</li>
								<li>Am I confusing a thought with a fact?</li>
								<li>Am I responding and concluding based only on how I am feeling?</li> 
							</ul>
							<div class="drop_div" id="drop_box" style = "padding-left:40px;background-color:FFE0B2; border : 1px solid black;height:240px;"><p style = "text-align:center; color:blue;">My favorite questions  to   correct my thinking errors</p>
							</div>
							<p style = " color: blue;text-align: center;">Carry it as a set of reminder questions to deal with negative thoughts.</p>
							<p><strong>Tip : </strong>Questioning your depressive/negative thoughts using one or more of the above questions may help in   reducing the intensity of your emotions and help you to take more rational and effective decisions than when you are emotionally upset or disturbed due to these thoughts.</p>
							<button type="button" id="download45" class="btn btn-warning pull-left" onclick = "download4_5()">Download</button>
						</div>
						<br>
						<div id="hr-4-6" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-4-6" class="hidden">									<!-- Completed -->
							<h4 class="subsection-title">4.6 &emsp; Practice Point - 2 : Applying what you learnt in your day-day life</h4>
							<br>				
							<div class="subsection-content">
														
								<div class="tabbable">
									<ul id="tabs-4-6" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-4-6-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-4-6-2" data-toggle="tab">Add</a></li>
									</ul>
									<div id="ss-4-6" class="tab-content">
										<div class="tab-pane active" id="tab-4-6-1">
										</div>
										<div class="tab-pane" id="tab-4-6-2">
									You can re-visit
										</div>
									</div>
									
									
								</div>
							</div>
						</div>
						<br>
						<div id="hr-4-7" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-4-7" class="hidden">									<!-- Completed -->
							<h4 class="subsection-title">4.7 &emsp; Practice Point - 3 : Applying what you learnt in your day-day life</h4>
							<br>				
							<div class="subsection-content">
								<div class="tabbable">
									<ul id="tabs-4-7" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-4-7-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-4-7-2" data-toggle="tab">Add</a></li>
									</ul>
									<div id="ss-4-7" class="tab-content">
										<div class="tab-pane active" id="tab-4-7-1">
										</div>
										<div class="tab-pane" id="tab-4-7-2">
										</div>
									</div>
									
							
								</div>
							</div>
						</div>
						<br>
						<br>
					</div>
				</div>
				<div id="page-5" class="hidden">
					<div id="section-5">
						<div class="section-title">
							<h3>Mastering your Worries</h3>
						</div>
						<br>
						<div id="subsection-5-2" class="hidden">
							<h4 class="subsection-title">5.2 &emsp; Tool Box: Strategies to manage excessive worry</h4>
							<br>
							<ol>
								<li>Scheduling 'worry time' </li>
								<li>Talk back to worrying- thoughts</li>
							</ol>
						</div>
						<br>
						<div id="hr-5-4" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-5-4" class="hidden">
							<h4 class="subsection-title">5.4 &emsp; Practice Point - 1 : Exercises to identify different mind-states</h4>
							<br>
							<table class="table table-bordered">
								<thead class="text-center">
									<tr><th>S No</th>
										<th>Worrier Statement</th>
										<th>Emotional Mind</th>
										<th>Rational Mind</th>
										<th>Wise Mind</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>I do not know how I am going to manage all these new responsibilities</td>
										<td>It is going to be too much work. If there is one mistake, things would start going wrong and the whole project may collapse and fall flat. It will be a disaster.</td>
										<td>It is unnecessary to imagine such scenarios. We have a backup plan, a safety net. We also have two hard working staff.</td>
										<td>It is a new project and hence it is natural to feel stressed. Perhaps most people would feel this way in this situation. Some mistakes can happen at the beginning but these may not have major consequences.  I have two very hard working staff and a back-up plan. There is a good chance that we will be able to manage the whole thing</td>	
									</tr>
									<tr>
										<td>2</td>
										<td>He said that I am no good as a parent and that I am setting a bad example for my child.</td>
										<td>I feel so terrible about it. I must be very bad and incapable mother. I myself get such doubts about myself and now he also said something similar</td>
										<td>I do not need to bother myself with what he says as long as I know I am doing/trying to do the right thing in terms of parenting</td>
										<td>The fact is that I have been trying hard to spend time with my child, play, teach and gently correct his mistakes. No parent can be perfect. I need not take in his remark and upset myself. Yes, it hurt a lot when I heard such a remark from him. I wish he was more objective in his judgment and not labeled me as a bad mother, just because of a small mistake. Let me keep doing what I am doing well. May be I can discuss this with him when both of us are in a calmer state</td>	
									</tr>
									<tr>
										<td>3</td>
										<td>They ignored me completely and continued talking. I feel so bad.</td>
										<td>Ya... It feels as though I am stupid, a person who is not valued/counted. It is terrible</td>
										<td>It is actually nothing to feel bad about. It is a rather trivial event. Also, they were too preoccupied finishing their urgent talk. It is nothing to do with me</td>
										<td>It does hurt and I feel sad. It is natural to expect some basic courtesy. But they seemed preoccupied at that moment. It is unlikely to be related to how I am valued as a person by them. Also, In the long run, this event is hardly going to matter much, though I am feeling troubled right now</td>	
									</tr>
								</tbody>
							</table>
							<br>
							<strong>So what did you discover? </strong>
							<p>When we are worrying, the emotional mind increases the intensity of emotions by dwelling on the negative aspects of the situation. It is like we are putting a stamp of validity on our fears and apprehensions. The negativity biases are stronger when the worrier is in emotional mind state. It is like sinking in the emotions. </p>
							<p>The rational mind state uses a logical/rational approach, a matter- of-fact style and tends to deny the importance of emotions or of the experience of emotions.</p>
							<p>On the other hand, the wise mind-state characteristics are</p>
							<ul>
								<li>Acknowledgement of emotions and emotional experiences rather than rejecting/denying emotions</li>
								<li>View things  objectively and holistically, from different angles, while at the same time being compassionate and self-soothing in approach</li>
								<li>Balancing between emotional mind and rational mind states, as necessary </li>
							</ul>
						</div>
						<br>
						<div id="hr-5-6" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-5-6" class="hidden">									<!-- Completed -->
							<h4 class="subsection-title">5.6 &emsp; Practice Point - 2 : Applying what you learnt</h4>
							<br>				
							<div class="subsection-content">
								<div class="tabbable">
									<ul id="tabs-5-6" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-5-6-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-5-6-2" data-toggle="tab">Add</a></li>
									</ul>
									<div id="ss-5-6" class="tab-content">
										<div class="tab-pane active" id="tab-5-6-1">
										</div>
										<div class="tab-pane" id="tab-5-6-2">
										</div>
									</div>
									
							
								</div>
							</div>
						</div>
						<br>
						<div id="hr-5-7" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-5-7" class="hidden">									<!-- Completed -->
							<h4 class="subsection-title">5.7 &emsp; Commitment Point</h4>
							<br>				
							<div class="subsection-content">
								<div class="tabbable">
									<ul id="tabs-5-7" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-5-7-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-5-7-2" data-toggle="tab">Add</a></li>
									</ul>
									<div id="ss-5-7" class="tab-content">
										<div class="tab-pane active" id="tab-5-7-1">
										</div>
										<div class="tab-pane" id="tab-5-7-2">
										</div>
									</div>
									
								
								</div>
							</div>
						</div>
						<br>
						<div id="hr-5-8" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-5-8" class="hidden">									<!-- Completed -->
							<h4 class="subsection-title">5.8 &emsp; Practice Point - 3 : Your Diary for Practice</h4>
							<br>				
							<div class="subsection-content">
								<div class="tabbable">
									<ul id="tabs-5-8" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-5-8-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-5-8-2" data-toggle="tab">Add</a></li>
									</ul>
									<div id="ss-5-8" class="tab-content">
										<div class="tab-pane active" id="tab-5-8-1">
										</div>
										<div class="tab-pane" id="tab-5-6-2">
										</div>
									</div>
									
							
								</div>
							</div>
						</div>
						<br>
						<br>
					</div>
				</div>
				<div id="page-6" class="hidden">
					<div id="section-6">
						<div class="section-title">
							<h3>Learn Self Compassion</h3>
						</div>
						<br>
						<div id="subsection-6-1" class="hidden">									<!-- Completed -->
							<h4 class="subsection-title">6.1 &emsp; Discovery Point</h4>
							<br>				
							<div class="subsection-content">
								<div class="tabbable">
									<ul id="tabs-6-1" class="nav nav-tabs" >
										<li class="active"><a href="#tab-6-1-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-6-1-2" data-toggle="tab"> </a></li>
									</ul>
									<div id="ss-6-1" class="tab-content">
										<div class="tab-pane active" id="tab-6-1-1">
										</div>
										<div class="tab-pane" id="tab-6-1-2">
										</div>
									</div>
									
								
								</div>
							</div>
						</div>
						<br>
						<div id="hr-6-3" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-6-3" class="hidden">
							<h4 class="subsection-title">6.3 &emsp; Tool Box</h4>
							<br>
							<ol>
								<li><strong>Become aware and catch your self- criticality (inner critical voice) in action.</strong><br>Just observe each time you notice yourself becoming self-critical. What exactly do you tell yourself?<br>There may be something valuable about our internal criticism and this can guide us to do better. But, look for the times when you are being excessively harsh/global/over- generalized and unfairly critical of yourself.<br>Don't be harsh and critical of yourself when you catch this self-criticality! Merely observe or use humor if it helps you ("Oh there my critique goes again!")<br><br></li>
								<li><strong>Talk back gently to your inner critical voice</strong><br>For example, you may talk back to your inner critique saying ."Ok... yes there is a point... I should have been more careful about this. I feel disappointed. But such mistakes can happen with anyone. I can try to be more careful next time. Perhaps I will use a strategy so that I don't forget such things. Anyway, it does not make me a "stupid person".<br>Make use of what you learnt earlier in the section on changing NATs and also about using wise mind- talk.<br><br></li>
								<li><strong>Practice how to talk back gently to your inner critical voice</strong><br><br></li>
								<li><strong>Imagine feeling and showing  compassion to a friend : </strong><br>Ask yourself how you might talk to a friend who commits the same mistake/who is suffering due to something he/she did wrong. Think about your tone of voice, your words and your views that you might bring to forefront to help the friend deal with it and move on. Try using that same style with your own self.<br><br></li>
								<li><strong>Ask a friend to show you how to be compassionate : </strong><br>If possible, share/express your inner critical voice to someone you trust and someone who is gentle, compassionate as well as authentic. Listen to what this person says as a compassionate response. This will give you a few ideas about what you can tell yourself when trying to be more self-compassionate<br><br></li>
								<li><strong>Imagine that you have a best friend and write a letter to yourself as though your best friend is writing the letter : </strong><br>You do not have to repeatedly depend on the availability of a compassionate friend to learn to be self-compassionate. Adopt the perspective of a compassionate friend - Try writing a letter to yourself as your own imaginary compassionate friend.<br><br></li>
								<li><strong>Practicing mindfulness can also help in dealing with excessive self-criticality.</strong><br></li>
							</ol>
						</div>
						<br>
						<div id="hr-6-4" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-6-4" class="hidden">									<!-- Completed -->
							<h4 class="subsection-title">6.4 &emsp; Practice Point - 1</h4>
							<br>				
							<div class="subsection-content">
								<div class="tabbable">
									<ul id="tabs-6-4" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-6-4-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-6-4-2" data-toggle="tab">Add</a></li>
									</ul>
									<div id="ss-6-4" class="tab-content">
										<div class="tab-pane active" id="tab-6-4-1">
										</div>
										<div class="tab-pane" id="tab-6-4-2">
										</div>
									</div>
									
							
								</div>
							</div>
						</div>
						<br>
						<div id="hr-6-5" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-6-5" class="hidden">
							<h4 class="subsection-title">6.5 &emsp; Example - Short letter</h4>
							<br>				
							<div class="subsection-content">
								<strong>Here is an example of a short letter that Neena wrote to herself- using a compassionate friend's perspective: </strong>
								<br>
								<br>
								<strong>Dear Neena,</strong>
								<br>
								<p>I know you have been going through a very tough time. You keep thinking as to what is wrong with you and why you can't cope with these things in your life when other people seem to be doing so much better at handling their own challenges in life. </p>
								<p>In reality, Neena, you are being human- you have your limitations and weaknesses just as other human beings have their own. This does not make you a 'bad' person or an 'unlovable' person.</p>
								<p>I know that you are trying your best to correct things that went wrong and your genuine need to correct things is in itself worthy of appreciation, even if you are not very successful in correcting these things at this point- simply because some of this is not totally in your control .  </p>
								<strong>Your best friend</strong>
							</div>
						</div>
						<br>
						<div id="hr-6-6" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-6-6" class="hidden">									<!-- Completed -->
							<h4 class="subsection-title">6.6 &emsp; Exercise - Letter</h4>
							<br>				
							<div class="subsection-content">
								<div class="tabbable">
									<ul id="tabs-6-6" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-6-6-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-6-6-2" data-toggle="tab">Add</a></li>
									</ul>
									<div id="ss-6-6" class="tab-content">
										<div class="tab-pane active" id="tab-6-6-1">
										</div>
										<div class="tab-pane" id="tab-6-6-2">
										</div>
									</div>
									
							
								</div>
							</div>
						</div>
						<br>
						<div id="hr-6-8" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-6-8" class="hidden">
							<h4 class="subsection-title">6.8 &emsp; Practice Point - 2 : Mindfulness practice </h4>
							<br>				
							<div class="subsection-content">
								<p>Some simple ways by which you can learn to be mindful in your everyday activities are mentioned below. </p>
								<p>Some of these activities are the ones we pay very little attention to- or complete them rather hurriedly and mechanically or in what is known as an "autopilot mode".</p>
								<p>Examples for practicing mindfulness: Choosing to eat a meal mindfully and observing the texture of the food, savoring the taste in the mouth and chewing slowly; walking mindfully by observing the steps taken, the pressure of each foot on the floor and by feeling the movement as one walks; watching the time go by: watching the clock for a whole minute as the second's hands moves gradually and just observing it as it reaches the full minute. Similarly bathing mindfully, observing nature and so on can also be practiced.</p>
							</div>
						</div>
						<br>
						<br>
					</div>
				</div>
				<div id="page-7" class="hidden">
					<div id="section-7">
						<div class="section-title">
							<h3>Self-Soothing practices</h3>
						</div>
						<br>
						<div id="subsection-7-1" class="hidden">
							<h4 class="subsection-title">7.1 &emsp; Knowledge Point</h4>
							<br>
							<div class="subsection-content">
								<p>Depression and other emotional problems can be helped through a variety of self-care practices. There are self-care strategies that you can learn to help you get through your difficult moments with a little more comfort, if you find that you are struggling with managing your distress/negative emotions.</p>
								<p>Of course, for many of us, it is nice to have someone with us when we are feeling distressed- someone who may soothe us/ comfort us /make us feel better. It is important to reach out to someone when that is needed or when self-care is not proving sufficient. </p>
								<p>But it is not always possible to have a figure like that, available to us, immediately when we need that the most. Moreover, even if we have someone like that in our life, it is a healthy practice to strike a good balance between reaching out and seeking comfort from others and  using skills to comfort ourselves. </p>
								<p>Our capacity to tolerate distress improves, when we have some ready-to-use well-practiced and healthy ways of calming ourselves and regaining emotional balance when we need that. </p>
								<p>Self-soothing practices are a kind of self-care practices. . Self-soothing is about being comforting, nurturing and gentle to oneself.</p>
							</div>
						</div>
						<br>
						<div id="hr-7-2" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-7-2" class="hidden">
							<h4 class="subsection-title">7.2 &emsp; Tool Box</h4>				
							<br>
							<div class="subsection-content">
								<p>A way to remember these skills are to think of soothing each of the five senses when we are feeling very distressed. They are:-</p>
								<ol>
									<li>Vision- for e.g.  Watching a  video, looking at the fishes swimming in a pool of water</li>
									<li>Hearing- for e.g.  Listening to your favorite songs or to soothing  instrumental music</li>
									<li>Smell- for e.g.  Walking  outside after rains and  enjoying  the smells of nature</li> 
									<li>Taste- for e.g.  Eating  your favorite dish slowly, enjoying every bite</li>
									<li>Touch -for e.g. Pampering  yourself by   taking a good shower, walking on a patch of grass, hugging a soft object/ patting your pet- animal</li>
									
								</ol>
								<p>These are merely some examples. It would be important for you, to notice experiment and discover what might work for you.</p>
								<p>If you have difficulties regulating your distress and tend to become intensely emotional, it might be worth trying out what kinds of self-soothing practices might work for you, especially when you find that you are all by yourself and distressed.</p>
								<p>It is not always necessary that a self-soothing activity you choose needs to belong to the one of the five senses. Most often these activities can involve more than one sense as well. And many other times, they are just activities that make you feel better.</p>
								<p><strong>Here is a potential set of activities which you may wish to consider - involving all these senses and otherwise.</strong></p>
								<ul>
									<li>Paying attention to the nature around you  in small details and savoring them ( e.g. the fluffy white moving clouds, the touch and feel of a flower or the  different shades of green leaves on the trees around you)</li>
									<li>Engaging  in creative endeavors like painting, dancing, quelling, stitching, designing, any other do it yourself mini- projects etc. or even just splashing many colors on a piece of paper</li>
									<li>Keeping a journal/ diary</li>
									<li>Writing a letter to your loved ones ( you need not send it)</li>
									<li>Writing a letter to your future self</li>
									<li>Reading  a book </li>
									<li>Visiting  a  gallery</li>
									<li>Engaging  in spiritual endeavors like prayer, reading spiritual materials, going to spiritual centers</li>
									<li>Going for a long walk or cycling </li>
									<li>Smelling food being cooked </li>
									<li>Noticing all the different smells or sounds  around you</li>
									<li>Engaging in practices like yoga, meditation, tai chi</li>
									<li>Cooking a meal  for yourself</li>
									<li>Watching a  good movie</li>
									<li>Trying doing some gardening -using mud and feeling the wet mud on your hands.</li>
								</ul>
								<p>Try to start with any one or two of the activities that can help you to self-soothe. Remember to focus attention and try to savor and enjoy the experience fully. </p>
							</div>
						</div>
						<br>
						<div id="hr-7-3" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-7-3" class="hidden">
							<h4 class="subsection-title">7.3 &emsp; A Note of Caution</h4>				
							<br>
							<div class="subsection-content">
								<ul style="list-style-type: square;">
									<li>Avoid self-soothing strategies that may give you immediate relief but are harmful in the long run.</li>
									<li>We deserve to comfort ourselves. We do not need to completely depend on an external source for comfort. </li>
									<li>Learn to enjoy your alone-times.</li>
									<li>Self-soothing is not always the total solution. It is just to help decrease the intensity of our negative emotions so that we can think calmly about different ways to resolve a problem/issue.</li>
									<li>Reaching out to seek support is as important as learning to self-soothe. Both these skills are needed in life.</li>
								</ul>
							</div>
						</div>
						<br>
						<div id="hr-7-4" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-7-4" class="hidden">										<!-- Completed -->
							<h4 class="subsection-title">7.4 &emsp; Commitment Point</h4>				
							<br>				
							<div class="subsection-content">
								<div class="tabbable">
									<ul id="tabs-7-4" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-7-4-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-7-4-2" data-toggle="tab">Add</a></li>
									</ul>
									<div id="ss-7-4" class="tab-content">
										<div class="tab-pane active" id="tab-7-4-1">
										</div>
										<div class="tab-pane" id="tab-7-4-2">
										</div>
									</div>
									
								
								</div>
							</div>
						</div>
						<br>
						<div id="hr-7-5" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-7-5" class="hidden">										<!-- Completed -->
							<h4 class="subsection-title">7.5 &emsp; Practice Point</h4>				
							<br>				
							<div class="subsection-content">
								<div class="tabbable">
									<ul id="tabs-7-5" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-7-5-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-7-5-2" data-toggle="tab">Add</a></li>
									</ul>
									<div id="ss-7-5" class="tab-content">
										<div class="tab-pane active" id="tab-7-5-1">
										</div>
										<div class="tab-pane" id="tab-7-5-2">
										</div>
									</div>
									
						
								</div>
							</div>
						</div>
						<br>
						<br>
					</div>
				</div>
				<div id="page-8" class="hidden">
					<div id="section-8">
						<div class="section-title">
							<h3>Regaining a sense of Mastery</h3>
						</div>
						<br>
						<div id="subsection-8-1" class="hidden">
							<h4 class="subsection-title">Knowledge Point</h4>
							<br>
							<div class="subsection-content">
								<p>There are times when we get so preoccupied with some bothersome issues in our life that we fail to realize that this absorbs most of our time, effort and attention. Brooding over these not just takes away our energy but also adds to our sense of lack of control and mastery in life.</p>
								<p>On the other hand, introspection may help us realize that there are many aspects of our life which are partially under our control -- about which we can do something.</p>
								<p>The overall sense of mastery can be increased by becoming aware of such things/aspects of our life and redirecting adequate attention to them. Thus by regaining some sense of mastery, we can experience an enhancement in our sense of wellbeing.</p>
								<p><strong>TIP : </strong>Overall sense of mastery can be increased by paying attention to various aspects of the environment or life-situations which can be changed to some extent, making effective use of opportunities that may be potentially available, engaging in activities that are in line with your values and that have potentially useful long term impact.</p>
							</div>
						</div>
						<br>
						<div id="hr-8-4" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-8-4" class="hidden">										<!-- Completed -->
							<h4 class="subsection-title">8.4 &emsp; Practice Point : Regaining a sense of mastery</h4>				
							<br>				
							<div class="subsection-content">
								<div class="tabbable">
									<ul id="tabs-8-4" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-8-4-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-8-4-2" data-toggle="tab">Add</a></li>
									</ul>
									<div id="ss-8-4" class="tab-content">
										<div class="tab-pane active" id="tab-8-4-1">
										</div>
										<div class="tab-pane" id="tab-8-4-2">
										</div>
									</div>
									
							
								</div>
							</div>
						</div>
						<br>
						<div id="hr-8-5" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-8-5" class="hidden">										<!-- Completed -->
							<h4 class="subsection-title">8.5 &emsp; Commitment Point</h4>				
							<br>				
							<div class="subsection-content">
								<div class="tabbable">
									<ul id="tabs-8-5" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-8-5-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-8-5-2" data-toggle="tab">Add</a></li>
									</ul>
									<div id="ss-8-5" class="tab-content">
										<div class="tab-pane active" id="tab-8-5-1">
										</div>
										<div class="tab-pane" id="tab-8-5-2">
										</div>
									</div>
									
							
								</div>
							</div>
						</div>
						<br>
						<br>
					</div>
				</div>
				<div id="page-9" class="hidden">
					<div id="section-9">
						<div class="section-title">
							<h3>Breaking internal barriers to mobilizing Support</h3>
						</div>
						<br>
						<div id="subsection-9-1" class="hidden">
							<h4 class="subsection-title">9.1 &emsp; Knowledge Point</h4>
							<br>	
							<div class="subsection-content">
								<p><strong>Breaking internal barriers to mobilizing support : </strong></p>
								<p>Support is one of the important factors that influence our well-being.</p>
								<p>Though support influences us at all times; when we are feeling sad or depressed is the time when emotional support from others can be very helpful.</p>
								<p>But we may experience many mental blocks/ internal barriers to reaching out and receiving support either because we are usually reluctant to ask for or receive support  or because depression itself is resulting in withdrawal from others and negative thoughts.</p>
							</div>
						</div>
						<br>
						<div id="hr-9-2" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-9-2" class="hidden">
							<h4 class="subsection-title">9.2 &emsp; Discovery Point</h4>				
							<br>				
							<div class="subsection-content">
								<p><strong>Please check the mental blocks /barriers which you think you have and try to substitute these statements with other more realistic statements</strong></p>
								<ol>
									<li>People will make fun of me.<br><strong>Alternative self-statement- </strong><i>I should not assume things by myself without testing the reality.</i><br><br></li>
									<li>Nobody wants to help me so I should not seek help.<br><strong>Alternative self-statement-</strong><i> There are people who have been helpful to me in the past.</i><br><br></li>
									<li>Others will think badly about me if I share my problems with them<br><strong>Alternative self-statement-</strong><i> Everybody has their share of problems. And, I can share with one or two persons who are trustworthy.</i><br><br></li>
									<li>I know it will fail.<br><strong>Alternative self-statement-</strong><i> It's ok to try and fail. There is a chance that sharing may provide me a new way of looking at the situation, a new way to handle the situation or at least some relief. Is it not worth taking the chance?</i><br><br></li>
									<li>I know I cannot initiate talking on emotional matters.<br><strong>Alternative self-statement-</strong><i> I can think through/rehearse how I may want to start this conversation, with whom and when. This may make things easier.</i><br><br></li>
									<li>Nobody will understand my emotions<br><strong>Alternative self-statement-</strong><i> Nobody can exactly understand others' emotional experience. But some people do make a sincere effort and understand to some extent which might mean that I would not feel totally alone and not understood.</i><br><br></li> 
									<li>People will think I cannot handle my problems.<br><strong>Alternative self-statement-</strong><i> I have been solving several of my problems for such a   long time. If I put across my situation properly to the right person, he/she may not underestimate me. Most of all, I should not underestimate myself just because I am sharing my emotions /problems with someone.</i><br><br></li>  
									<li>I will lose my friends if they come to know about my emotional problems.<br><strong>Alternative self-statement-</strong><i> Good friends are meant to help each other. I can/have help them in times of need too.</i><br><br></li>
									<li>Others will think I am emotionally weak.<br><strong>Alternative self-statement-</strong><i> Everyone has their strengths and weaknesses. Moreover, opening up to discuss a difficult issue is not necessarily a sign of weakness.</i><br><br></li> 
									<li>My good friends should know what I am feeling. I need not have to tell them<br><strong>Alternative self-statement-</strong><i> Yes, my good friends can guess what I am feeling. But, sometimes they may be preoccupied/distracted by something else. Moreover even in the circle of good friends, communication gaps can happen. I should not expect friends to mind-read me all the time.</i><br><br></li>
								</ol>
							</div>
						</div>
						<br>
						<div id="hr-9-3" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-9-3" class="hidden">									<!-- Completed -->
							<h4 class="subsection-title">9.3 &emsp; Tool Box</h4>				
							<br>				
							<div class="subsection-content">
							<div class="tabbable">
									<ul id="tabs-9-3" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-9-3-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-9-3-2" data-toggle="tab">Add</a></li>
									</ul>					
								<div id="ss-9-3" class="tab-content">
								<div class="tab-pane active" id="tab-9-3-1">
										</div>
										<div class="tab-pane" id="tab-9-3-2">
										</div>
								</div>
								</div>
								
							
							</div>
						</div>
					
						<br>
						<div id="hr-9-4" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-9-4" class="hidden">										<!-- Completed -->
							<h4 class="subsection-title">9.4 &emsp; Commitment Point</h4>				
							<br>				
							<div class="subsection-content">
								<div class="tabbable">
									<ul id="tabs-9-4" class="nav nav-tabs" title="Please click the Add button to modify the form">
										<li class="active"><a href="#tab-9-4-1" data-toggle="tab">Home</a></li>
										<li><a href="#tab-9-4-2" data-toggle="tab">Add</a></li>
									</ul>
									<div id="ss-9-4" class="tab-content">
										<div class="tab-pane active" id="tab-9-4-1">
										</div>
										<div class="tab-pane" id="tab-9-4-2">
										</div>
									</div>
									
								
								</div>
							</div>
						</div>
						<br>
						<div id="hr-9-5" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-9-5" class="hidden">
							<h4 class="subsection-title">9.5 &emsp; Warning Shots</h4>				
							<br>				
							<div class="subsection-content">
								<strong>Some useful tips while planning and implementing your plans:</strong>
								<ol>
									<li>Avoid getting overly dependent on your support system.</li>
									<li>Don't set unrealistic expectations. </li>
									<li>Excessive or indiscriminate disclosures to multiple people may not help. </li>
									<li>Maintain a balance in receiving and giving support. </li>
									<li>All our needs cannot /need not be met by a single person.</li>
									<li>Don't expect someone to read your mind and offer the exact kind of support you want, without your expressing yourself.</li>
									<li>Avoid making overgeneralizations that no one would help or that you are not worthy of support, if you fail to receive support as expected in a given context!</li>
								</ol>
							</div>
						</div>
						<br>
						<br>
					</div>
				</div>
				<div id="page-10" class="hidden">
					<div id="section-10">
						<div class="section-title">
							<h3>Step Up</h3>
						</div>
						<br>
						<div id="subsection-10-1" class="hidden">
							<h4 class="subsection-title">10.1 &emsp; Knowledge Point</h4>
							<br>
							<div class="subsection-content">
								<p>Although some ups and downs in your mood and functioning etc. are common during the process of recovering, sometimes your depressive symptoms can worsen due to a variety of reasons. It then becomes necessary to use/seek different kinds of methods available to deal with depression, rather than merely rely on self-help. </p>
							</div>
						</div>
						<br>
						<div id="hr-10-2" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-10-2" class="hidden">									<!-- Not Completed -->
							<h4 class="subsection-title">10.2 &emsp; Discovery Point</h4>				
							<br>				
							<div class="subsection-content">
								<p id="subsection-desc" class="text-justify">When to Step Up ?
								</p>				
								
								<h5 id="exercise-title">Please check which is true for you for the following</h5>
								
								<div class="clearfix"></div>
								<div id="ss-10-2">
								</div>
								
							
							</div>
						</div>
						<br>
						<div id="hr-10-3" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-10-3" class="hidden">
							<h4 class="subsection-title">10.3 &emsp; Tool Box - 1</h4>				
							<br>				
							<div class="subsection-content">
								<strong class="text-center">Overcoming your mental blocks to seeking direct face to face help From a mental health professional</strong>
								<p>It is very common for people to have some mental barriers/blocks to seeking help from a mental health professional, even if they need such help/know that it may be of some use. This may be due to a variety of factors such as sense of stigma/fear of being stigmatized, fear of the unknown, doubts about oneself etc.</p> 
								<p>Try one or more of the  strategies  mentioned in the video to overcome your internal barriers to seeking professional help:</p>
							</div>
						</div>
						<br>
						<div id="hr-10-4" class="hidden">
							<hr style="border: 5px solid lightblue;">
						</div>
						<br>
						<div id="subsection-10-4" class="hidden">
							<h4 class="subsection-title">10.4 &emsp; Tool Box - 2</h4>				
							<br>				
							<div class="subsection-content">
								<strong class="text-center">Preparing you to seek direct face to face help form a mental health professional</strong>
								<strong class="text-center">If you decide to take direct face to face help from a mental health professional, you can do one /more of the following-to feel better prepared:</strong>
								<ul>
									<li>First of all, you can ask us and clarify your doubts regarding seeking direct professional help</li>
									<li>Do some background exploration and check as to which kind of professional might be best suited to address your needs.</li>
									<li>Give yourself a chance to decide after meeting a trained professional  and gauging your comfort level</li>
									<li>Take charge of your situation by preparing to ask all the questions  about your problem and  options of interventions - when you meet a professional</li>
									<li>Keep open the possibility of taking along with you someone you trust and feel comfortable with ( at least for the first session/till you gain confidence)</li>
									<li>If one of your attempts at taking help from a professional has been unsatisfactory, do not shy away from trying another source of professional help, after some background check (Just because you did not benefit from consultation with one professional does not mean that professional help for mental health problems is ineffective or that everyone has the same professional style/expertise that matches your needs. Avoid overgeneralizing!)</li>
								</ul>
								<br>
								<br>
								<strong>How /whom to approach : </strong>
								<p>Just drop us a mail and we will guide you through the possible options for seeking additional professional help for your mental health condition.</p>
								<br>
								<br>
							</div>
						</div>
					</div>				
				</div>	
			<!--  feedback showpage -->
			<div id="page-11" class="hidden">
				<div ng-controller="feedbackcontroller">
				<h3>Feedback from PushD team</h3>
				<ul>
				<li>feedback dummy</li>
				<li ng-repeat="feedback in feedbacks">{{feedback}}</li>
				</ul>
				<hr>
				
				</div>
				
			</div>
			
			
			<!--   mynotes showpage   -->
			<div id="page-12" class="hidden">
				<div ng-controller="notecontroller">
				<h3>My notes</h3>
				<ul>
				<li>note dummy</li>
				<li ng-repeat="note in notes">{{note}}</li>
				</ul>
				<hr>
				<div class="form-group">
  <label for="comment">Add note</label>
  <textarea class="form-control" rows="5" id="comment" ng-model="newnote" ></textarea>
 <br>
 <button type="button" class="btn btn-default" ng-click="addnote()">Submit</button>
  
</div>
				
			</div>
			</div>
				
			</div> <!-- slimScroll -->
		</div> <!-- col-md-10 -->
	</div>
	
	<div class="modal fade" id="ss-10-2-modal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success">
					Feedback
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body text-justify">
					<p id="feedback1" class="hidden">Based on your responses, we recommend that you seek direct face to face contact with a mental health professional. Please get in touch with us so that we can help you in seeking direct mental health professional services.</p>
					<p id="feedback2" class="hidden">We strongly recommend that you seek direct face to face contact with a mental health professional. Please get in touch with us so that we can help you in seeking direct mental health professional services.  We would also be shortly getting in touch with you. We also suggest you to go over the Additional Section on managing suicidal thoughts.</p>
					<p id="feedback3" class="hidden">Based on your responses, it appears that your symptoms have not worsened and we recommend you tocontinue to work on this self-care program. At any point, if you notice worsening of your depression, please do contact us over phone/email for assistance.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>
