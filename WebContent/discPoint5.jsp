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
	<link href="css/style.css" rel="stylesheet">
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	
	
    
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
					<img class="img-responsive" alt="" src="images/ss-dp.jpg">
				</div>
				<div class="col-md-10 col-sm-8">
					<div class="row">
					<div id="section10"><h3><b>Step Up: When you need to</b></h3></div>
						<h3><b id="subsection-name"></b></h3>
						<p id="subsection-desc" class="text-justify">
						</p>				
						<hr style="border-bottom: 1px solid black;">
						<h5 id="exercise-title"></h5>
						<p id="exercise-desc" class="text-justify">
						</p>
						<div class="clearfix"></div>
						<div class="row">
							<div class="col-md-10">
								<form id="myForm">
									<ul id="section-ques" class="list-group">
									</ul>
									<button id="submit" type="button" onclick="checkCheckPointsSelected()" class="btn btn-primary">Submit</button>
								</form>
							</div>	
						</div>	
					</div>	<!-- row -->
				</div>	<!-- col-md-10 -->		
			</div>	<!-- "" -->
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
			
		</div>	<!-- col-md-11 -->
	</div>	<!-- row -->
		
	</div>
	
	<br>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success">
					Feedback
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body text-justify">
					<p id="feedback1" class="hidden">Based on your responses, we recommend that you seek direct face to face contact with a mental health professional. Please get in touch with us so that we can help you in seeking direct mental health professional services.</p>
					<p id="feedback2" class="hidden">We strongly recommend that you seek direct face to face contact with a mental health professional. Please get in touch with us so that we can help you in seeking direct mental health professional services. We also suggest you to go over the Additional Section on managing suicidal thoughts.</p>
					<p id="feedback3" class="hidden">Based on your responses, it appears that your symptoms have not worsened and we recommend you to continue to work on this self-care program. At any point, if you notice worsening of your depression, please do contact us over phone/email for assistance.</p>
					<p id="feedback4" class="hidden">Thank You.  It appears that you are experiencing  some  improvement/ have not had any worsening.   However, it  is good to know  when self-help may  not be sufficient and how to overcome mental blocks to seeking help any time we need the same.</p>
				</div>
				<div class="modal-footer">
					<button id="myInput" type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="clearfix"></div>
	<br>
	<br>
	<br>
	<script type="text/javascript">
	var new_db_data;
	
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
						  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/practice1",
						  success: function(data1){
							  
							  $("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
							  $("#subsection-desc").html(data1['subSectionDesc']);
							  $("#exercise-title").html(data1['exerciseTitle']);
					          $("#exercise-desc").html(data1['exerciseDesc']);
						        
					          myFunction(data1['questions']);
					          disableCheckBoxesWhenReviewing(data1['questions'].length);
					          
					          if((sectionId==10 && subsectionId==2) || (activeSectionId==10 && activeSubSectionId==2)){
				   		    	    
									
									 db_data=null;
									//ajax call to get the data from the database
								
								$.ajax({
									type : "GET",
									url : serverURL + "users/" + userId
											+ "/sections/" + 10 + "/subsections/"
											+ 2 + "/" + "3rdSecdata/1",
											
									contentType : "application/json",
									
									dataType : "json",
									
									success : function(data) {
										
										db_data=data;
										new_db_data = data;
										
										
										if(db_data!= null){
									 		
				   							 var inputs = document.querySelectorAll("[type=checkbox]");
				   							for (var i = 0; i < inputs.length; i++) {
				   								inputs[i].disabled = true;
				   								$("#submit").addClass('hidden');
				   								$("#next").removeClass('hidden');
				   							} 
							 				
											
										
									
									 			}//end of if data_data
									 			
									 			else {
									 				
								   					        
									 				checkCheckPointsSelected();
									 				
									 				 var inputs = document.querySelectorAll("[type=checkbox]");
							   							for (var i = 0; i < inputs.length; i++) {
							   								inputs[i].disabled = false;
							   								$("#next").removeClass('hidden');
							   								$("#submit").removeClass('hidden');
							   								
							   							} 
									 				
									 				
								   					}//end of else
								   							 		
								   							
								   						 
									},//end of success for db data
									});//end of ajax call for db data
									
					   		    	 }	////end of section is 3 and subsection is 6
						        //end of 10.2
					          
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
		
		function disableCheckBoxesWhenReviewing(length)
		{
			flag = false; // set this to true if he is reviewing
			if(sectionId == activeSectionId)
			{
				if(subsectionId == activeSubSectionId)
				{
					//he is not reviewing	data['questions']
				}
				else
				{
					flag = true;	
				}
			}else if(sectionId <10){
				// this part of code is for handling unlocked 10.2
				$.ajax({
					type : "GET",
					url : serverURL + "users/" + userId
							+ "/sections/" + 10 + "/subsections/"
							+ 2 + "/" + "3rdSecdata/1",
							
					contentType : "application/json",
					
					dataType : "json",
					
					success : function(data) {
						
						db_data=data;
						new_db_data = data;
						
						
						if(db_data!= null){
					 		
   							 var inputs = document.querySelectorAll("[type=checkbox]");
   							for (var i = 0; i < inputs.length; i++) {
   								inputs[i].disabled = true;
   								$("#submit").addClass('hidden');
   								$("#next").removeClass('hidden');
   							} 
			 				
							
						
					
					 			}//end of if data_data
					 			else {
					 				
					 				
					 				 var inputs = document.querySelectorAll("[type=checkbox]");
			   							for (var i = 0; i < inputs.length; i++) {
			   								inputs[i].disabled = false;
			   								$("#next").removeClass('hidden');
			   								$("#submit").removeClass('hidden');
			   								
			   							} 
			   							
				   					}//end of else
				   							 		
				   						 
					},//end of success for db data
					});//end of ajax call for db data
				
			}else
			{
				flag = true;	
			}
			
			//flag is true then disable the checkboxes
			if(flag == true)
			{
				checkpoint();
				for(i=1; i<=length; i++)
				{
					$('#' + i).prop("disabled", "disabled");
				}
			}
		}
		
		function myFunction(arr) {
		    
	    	var out = "";
		    for(i = 0; i < arr.length; i++) {
		        out +=  '<li class="list-group-item">' +
		        			'<div class="checkbox">' +
		        				'<label>';
		        if(sectionId == activeSectionId){
		         	
		         		out +=	'<input type="checkbox" id="' + arr[i].quesNo + '" name="check" value="' + arr[i].quesNo + '" onclick="check_value(this)">';
		        }else if(sectionId < 10){
		        	out +=	'<input type="checkbox" id="' + arr[i].quesNo + '" name="check" value="' + arr[i].quesNo + '" onclick="check_value(this)">';
			        
		        	
		        }else	
	         		out +=	'<input disabled type="checkbox">';
		        
	         	out += 					arr[i].ques + 
	         						'</label>' + 
        					 	'</div>' + 
       					  	'</li>';
       					  	
				ans.push(arr[i].ans);
			}	    
		    
		    $("#section-ques").html(out);
		}
	});
	
	function check_value(c){
		var h = ($(c).val());
		
		 if(h==1 || h==2 || h==3 || h==4 || h==5 || h==6){
				$('#7').attr('checked',false);
			}else if($('#7').is(':checked')){
			
			$('#1').attr('checked',false);
			$('#2').attr('checked',false);
			$('#3').attr('checked',false);
			$('#4').attr('checked',false);
			$('#5').attr('checked',false);
			$('#6').attr('checked',false);
			
		}
	}
	
	function checkCheckPointsSelected()
	{
		var checked = false; //set it to true if none of the check boxes are filled
		var counter = 0;
			for ( j = 1; j <= i; j++) 
			{
				if($('#' + j).is(":checked")) 
				{
					
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
	
	var ans = [];
	var count = 0;
	var flag2 = false;
	var formData1 = {};
	
	function checkpoint() {
		
		str = '';
		formData = '';
		flag = false;
		flag2 = false;
		if($('#7').is(":checked"))
			flag2 = true;
		
		for ( j = 1; j <= i; j++) {
			
			if($('#' + j).is(":checked")) {
				formData += j + '_';	
				
				count ++;
			} 
				
			if(("-"+$('#' + j).is(":checked")) == ("-"+ans[(j-1)])) {
				if(ans[(j-1)] == "true") {
				
					flag = true;
				}
				
			}	
			
			$('#' + j).prop("disabled", "disabled");
		}
		
		if(count == 1 && flag == false && flag2 == false)
			str = 'feedback1';
		else if((count >= 2 || flag == true) && flag2 == false)
			str = 'feedback2';
		else if(flag2==true)
			str = 'feedback4';
		else
			str = 'feedback3';
		
		
		$('#'+str).removeClass("hidden");
		
		$('#checked').html(count);
		$('#submit').addClass("hidden");
		$('#myModal').modal('show');
		
		
		if(sectionId==10 && subsectionId==2 || sectionId<10 && new_db_data == null){
    	    
			
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData)
			
			var Indata = {
					userId : userId,
					section_id : 10,
					sub_section_id : 2,
					version_id : 1,
					response : table3arr1,
					category_id : 'null'
				};
			
			var myJSON = JSON.stringify(Indata);
			//rest call storeing 6.1 data type
			
			$.ajax({
				type : "POST",
				url : serverURL + "users/" + userId + "/sections/" + 10
						+ "/subsections/" + 2 + "/" + "3rdSecdata/1",
				data : myJSON,
				contentType : "application/json",
				dataType : "json",
				
				success : function(data) {
					
                 
					$('#next').removeClass('hidden');
					$('#skip').addClass('hidden');
					$('#submit').addClass('hidden');
				},
				
				error : function() {
					alert("Error: server encountered an internal error. Please try again after some time ");
					
                  
				}
			});
		}
	    	
		

		
	}
	</script>
	
</body>
</html>