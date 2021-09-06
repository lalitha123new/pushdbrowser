<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
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
    		$('#next').load("nextButton.html");
	        $("#includedContent").load("sectionSideNav2.html");
	        $('#progress').load("progressBar.html");
	        $('[data-toggle="tooltip"]').tooltip();
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
				
				<div class="col-md-2 col-sm-4" id = "side_image">
				
					<img class="img-responsive" alt="" src="images/ss-cp1.jpg">
					
				</div>
				
				<div class="col-md-10 col-sm-8">
				
					<div class="row">
					<div class="hidden" id="section5"><h3><b>Manage excessive worries</b></h3></div>
					<div class="hidden" id="section7"><h3><b>Strengthen Self-Soothing skills</b></h3></div>
					<div class="hidden" id="section8"><h3><b>Regaining a sense of mastery</b></h3></div>
					<div class="hidden" id="section9"><h3><b>Harness the power of support</b></h3></div>
					
						<h3><b id="subsection-name"></b></h3>
						
						<p id="subsection-desc" class="text-justify"></p>	
									
						<hr style="border-bottom: 1px solid black;">
						
						<div class="clearfix"></div>
						
						
						<h4 id="exercise-title"></h4>
						
						<p id="exercise-desc" class="text-justify"></p>
						
						<div class="col-md-10 text-justify" style="padding-top: 25px;" id="exercise">
						</div>
						
						<div class="clearfix"></div>
						
						<p style="text-align:center;font-weight:bold;">This table is available in workbook to edit.</p>
						
						<br>
						
						<button id="submit" class="hidden btn btn-success" onclick="checkForEmptyFields()">Submit</button>	
						<button id="download" class="btn btn-warning hidden" onclick = "download()">Download</button>
						
					</div>
					
				</div>
				
				<div class="clearfix"></div>
				
				<br>
				<br>
						
			</div>
			
			<div class="clearfix"></div>
			
			<br>
			<br>
			
			<div class="row">
			
				<div class="col-md-9">
				</div>
				
				<div id="next" class="col-md-2 hidden">
				
					<div id="next" class="alert alert-info text-center" role="alert">	
					</div>
					
				</div>
				
			</div>
					
			<div class="clearfix"></div>
			
			<br>
			<br>
			<br>
			
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
	
	<!-- end of modal -->
	
	<div class="clearfix"></div>
	
	<br>
	<br>
	<br>
	

	<script type="text/javascript">
	
	var i=0;
	var sectionId;
	var subsectionId;
	var activeSectionId;
	var activeSubSectionId;
	
	var parsed_data57 = {};
	var splitted_data =null;
	var splitted_data1 =null;
	var splitted_data2 =null;
	var splitted_data3 =null;
	var splitted_data4 =null;
	var splitted_data5 =null;
	var splitted_data6 =null;
	var splitted_data7 =null;
	var arr_splitted_data1 = []; 
	var arr_splitted_data2 = []; 
	var arr_splitted_data3 = [];
	var arr_splitted_data4 = [];
	var arr_splitted_data5 = [];
	var arr_splitted_data6 = [];
	var arr_splitted_data7 = [];
	var arr_splitted_data1_new = [];
	var arr_splitted_data2_new = [];
	var arr_splitted_data3_new = [];
	var arr_splitted_data4_new = [];
	var arr_splitted_data5_new = [];
	var arr_splitted_data6_new = [];
	var arr_splitted_data7_new = [];
	
	$(document).ready(function() {
	
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
						  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/check3",
						  success: function(data1){
					
							  	$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
								$("#exercise-title").html(data1['exerciseTitle']);
					        
						        
						        if(data1['exerciseType'] == "NM")
							  	$('#next').removeClass("hidden");

							    
							    var arr = data1;
						        exer = '';
						        
						      //begin code to retrieve 5.7 data from database
							  	if((sectionId==5 && subsectionId==7) || (activeSectionId==5 && activeSubSectionId==7)) {
							  		
							  		$("#section5").removeClass("hidden");
							  		var db_data=null;
							  		
									//ajax call to get the data from the database
									
							  		$.ajax({
										type : "GET",
										url : serverURL + "users/" + userId
												+ "/sections/" + 5 + "/subsections/"
												+ 7 + "/" + "3rdSecdata/1",
												
										contentType : "application/json",
										
										dataType : "json",
										
										success : function(data) {
											
											arr_splitted_data1 = data;
											
											if(data!= null){
												$("#download").removeClass("hidden");
												
												var data_new = data[0].response;
												var str1 = data_new.split(',');
												
												var MultiArray = new Array(3);
												
												
												for(var t=0;t<=str1.length;t++){
													
												MultiArray[t]=new Array(3);
													
												if(t<2){
														
													var str_12 = str1[t].split('_');
													MultiArray[0][t]=str_12[2];
														
												}
													
												} 
												
												arr_splitted_data1_new = MultiArray;
												

												for (k = 0; k < arr['exerciseDesc'].length; k++) {
													
													exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
													
												}
												
										    	minfields= data1['minfields'];
										    	
												count = arr['questions'].length;
												
												for (j = 0; j < arr['questions'].length; j++) {
												
												if(j == 0)
												
												exer += '<div id="div' + j + '">';
												
												else
												
												exer += '<div id="div' + j + '" class="">';
												
											
												exer +=	'<p>' + arr['questions'][j].ques + '</p>' +
													'<div id="lt'+j+'" class="col-md-8 form-horizontal">';
													
											
												arr1 = arr['questions'][j]['blanks'];
												
												for (var k = 0; k < arr1.length; k++) {
													
													exer +='<div class="form-group">'; 
													
													if(activeSectionId != sectionId){
									    			
													h = arr1[k].indexOf("<input");
														
													if(h != -1) {
															
														h = h + 6;
														arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
														
														}
														
														else {
															
															h = arr1[k].indexOf("<textarea");
															
															if(h != -1) {
																
																h = h + 9;
																arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
															
															}
														}
													}
													
													MultiArray[0][k] = MultiArray[0][k].replace(/#@@#/g, ",");
													exer +='<textarea type="text" class=" form-control" value="'+ MultiArray[0][k] +' " disabled>'+ MultiArray[0][k] +'</textarea>'+
													'</div>';
													
												}	//	for k
														
												
												cArr.push(k);
													
													exer += '</div><div class="clearfix"></div>' +
															'<div class="clearfix"></div></div>';
												}

												$('#exercise').html(exer);
												
												if(activeSectionId == sectionId) {
													if(data == null){
													
											  		
													$('#submit').removeClass("hidden");
													$('#next').removeClass("hidden");
													}else{
														$('#submit').addClass("hidden");
														$('#next').removeClass("hidden");
													}
													
											  	}
												
											  	else
											  		$('#next').removeClass("hidden");
													
							    				
											}
											//end of if db_data is not null for section 5.7
											
								else {//if db_data is null
											
											
								
									for (k = 0; k < arr['exerciseDesc'].length; k++) {
										
										exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
										
									}
									
							    	minfields= data1['minfields'];
							    	
									count = arr['questions'].length;
									
									for (j = 0; j < arr['questions'].length; j++) {
										
										if(j == 0)
											
											exer += '<div id="div' + j + '">';
											
										else
											
											exer += '<div id="div' + j + '" class="">';
											
										
										exer +=	'<p>' + arr['questions'][j].ques + '</p>' +
												'<div id="lt'+j+'" class="col-md-8 form-horizontal">';
												
										
										arr1 = arr['questions'][j]['blanks'];
										
										for (var k = 0; k < arr1.length; k++) {
											
											exer +=  	'<div class="form-group">'; 
											
											if(activeSectionId != sectionId){
							    			
												
												h = arr1[k].indexOf("<input");
												
												if(h != -1) {
													
													h = h + 6;
													
													arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " ");
													$('#submit').removeClass("hidden");
												
												}
												
												else {
													
													h = arr1[k].indexOf("<textarea");
													
													if(h != -1) {
														
														h = h + 9;
														arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
														
													
													}
												}
											}
											
											exer += 		arr1[k] + 
														'</div>';
										}	//	for k
												
										
										cArr.push(k);
										
										exer += '</div><div class="clearfix"></div>' +
												'<div class="clearfix"></div></div>';
									}

									$('#exercise').html(exer);
									
									if(activeSectionId == sectionId) {
										
								  		$('#submit').removeClass("hidden");
								  	}
									
								  	else
								  		$('#next').removeClass("hidden");//end of db_data is null
								}
											
							  	}, //end of success function for db_data
							  	
							  	
							  	error: function() {
							  		alert("Error: server encountered an internal error. Please try again after some time ");
									  //alert("Error Occured due to " + serverURL + "sections/" + sectionId + "/subsections/" + subsectionId + "/check3");
									 
								  } 
							  	
							  	}); //end of ajax call to get the data from the database
									
									
							  	} //end function to retrieve data for 5.7 from database
							  	
							  	
							  	else if ((sectionId==7 && subsectionId==4) || (activeSectionId==7 && activeSubSectionId==4)) {
							  		
							  		$("#section7").removeClass("hidden");
									//ajax call to get the data from the database
							  		$.ajax({
										type : "GET",
										url : serverURL + "users/" + userId
												+ "/sections/" + 7 + "/subsections/"
												+ 4 + "/" + "3rdSecdata/1",
												
										contentType : "application/json",
										
										dataType : "json",
										
										success : function(data) {
											
											arr_splitted_data1=data;											
											
											if(data!= null){
												$("#download").removeClass("hidden");
								    			var data_new = data[0].response;
												var str1 = data_new.split(',');
												
												var MultiArray = new Array(3);
												
												 for(var t=0;t<str1.length;t++){
													
													MultiArray[t]=new Array(3);
													
													if(t<4){
														
														var str_12 = str1[t].split('_');
														MultiArray[0][t]=str_12[2];
														
														}
												
												}
												 
												arr_splitted_data1_new = MultiArray; 
												
												for (k = 0; k < arr['exerciseDesc'].length; k++) {
													
													exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k]+ '</p>';
													
												}
												
										    	minfields= data1['minfields'];
										    	
												count = arr['questions'].length;
												
												for (j = 0; j < arr['questions'].length; j++) {
													
													if(j == 0)
														
														exer += '<div id="div' + j + '">';
														
													else
														
														exer += '<div id="div' + j + '" class="">';
														
													
													exer +=	'<p>' + arr['questions'][j].ques + '</p>' +
															'<div id="lt'+j+'" class="col-md-8 form-horizontal">';
															
													
													arr1 = arr['questions'][j]['blanks'];
													
													for (var k = 0; k < arr1.length; k++) {
														
														exer +=  	'<div class="form-group">'; 
														
														if(activeSectionId != sectionId){
										    			
															
															h = arr1[k].indexOf("<input");
															
															if(h != -1) {
																
																h = h + 6;
																arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
															
															}
															
															else {
																
																h = arr1[k].indexOf("<textarea");
																
																if(h != -1) {
																	
																	h = h + 9;
																	arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
																
																}
															}
														}
														
														MultiArray[0][k] = MultiArray[0][k].replace(/#@@#/g, ",");
														exer += 		'<textarea type="text" class=" form-control" value="'+ MultiArray[0][k] +' " disabled>'+ MultiArray[0][k] +'</textarea>'+ 
																	'</div>';
													}	//	for k
															
													
													cArr.push(k);
													
													exer += '</div><div class="clearfix"></div>' +
															'<div class="clearfix"></div></div>';
												}

												$('#exercise').html(exer);
												
												if(activeSectionId == sectionId) {
													
											  		
													$('#submit').addClass("hidden");
								    				$('#next').removeClass("hidden");
											  	}
												
											  	else
											  	$('#next').removeClass("hidden");
							    				
							    				
							    				
											}
											//end of if db_data is not null for section 7.4
											
		
								
								else {//if db_data is null
											
											
								
									for (k = 0; k < arr['exerciseDesc'].length; k++) {
										
										exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k]+ + '</p>';
										
									}
									
							    	minfields= data1['minfields'];
							    	
									count = arr['questions'].length;
									
									for (j = 0; j < arr['questions'].length; j++) {
										
										if(j == 0)
											
											exer += '<div id="div' + j + '">';
											
										else
											
											exer += '<div id="div' + j + '" class="">';
											
										
										exer +=	'<p>' + arr['questions'][j].ques + '</p>' +
												'<div id="lt'+j+'" class="col-md-8 form-horizontal">';
												
										
										arr1 = arr['questions'][j]['blanks'];
										
										for (var k = 0; k < arr1.length; k++) {
											
											exer +=  	'<div class="form-group">'; 
											
											if(activeSectionId != sectionId){
							    			
												
												h = arr1[k].indexOf("<input");
												
												if(h != -1) {
													
													h = h + 6;
													
													arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " ");
													$('#submit').removeClass("hidden");
												
												}
												
												else {
													
													h = arr1[k].indexOf("<textarea");
													
													if(h != -1) {
														
														h = h + 9;
														arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
													
													}
												}
											}
											
											exer += 		arr1[k] + 
														'</div>';
										}	//	for k
												
										
										cArr.push(k);
										
										exer += '</div><div class="clearfix"></div>' +
												'<div class="clearfix"></div></div>';
									}

									$('#exercise').html(exer);
									
									if(activeSectionId == sectionId) {
										
								  		$('#submit').removeClass("hidden");
								  	}
									
								  	else
								  		$('#next').removeClass("hidden");//end of db_data is null
								}
											
							  	}, //end of success function for db_data
							  	
							  	
							  	error: function() {
							  		alert("Error: server encountered an internal error. Please try again after some time ");
									
								  } 
							  	
							  	}); //end of ajax call to get the data from the database
									
									
							  	} //end function to retrieve data for 7.4 from database
							  	
						else if((sectionId==8 && subsectionId==5) || (activeSectionId==8 && activeSubSectionId==5)) {
							$("#section8").removeClass("hidden");
							  		var db_data=null;
							  		
									//ajax call to get the data from the database
							  		$.ajax({
										type : "GET",
										url : serverURL + "users/" + userId
												+ "/sections/" + 8 + "/subsections/"
												+ 5 + "/" + "3rdSecdata/1",
												
										contentType : "application/json",
										
										dataType : "json",
										
										success : function(data) {
											
											arr_splitted_data1=data;
											
											if(data!= null){
												$("#download").removeClass("hidden");
												 
								    			var data_new = data[0].response;
												var str1 = data_new.split(',');
												
												var MultiArray = new Array(3);
													
													MultiArray[t]=new Array(3);
													
													for(var t=0;t<=str1.length;t++){
														
														MultiArray[t]=new Array(3);
														
														if(t<3){
														
														var str_12 = str1[t].split('_');
														MultiArray[0][t]=str_12[2];
														
														
													}else if(t>=3 && t<6){
														
														var str_12 = str1[t].split('_');
														MultiArray[1][t-3]=str_12[2];
														
													}
														else if( t<=6){
														
														var str_12 = str1[t].split('_');
														MultiArray[2][t-6]=str_12[2];
														
													}
														
												}
													
													arr_splitted_data1_new = MultiArray;
													
												for (k = 0; k < arr['exerciseDesc'].length; k++) {
													
													exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
													
												}
												
										    	minfields= data1['minfields'];
										    	
												count = arr['questions'].length;
												
												for (j = 0; j < arr['questions'].length; j++) {
													
													if(j == 0)
														
														exer += '<div id="div' + j + '">';
														
													else
														
														exer += '<div id="div' + j + '" class="">';
														
													
													exer +=	'<p>' + arr['questions'][j].ques + '</p>' +
															'<div id="lt'+j+'" class="col-md-8 form-horizontal">';
															
													
													arr1 = arr['questions'][j]['blanks'];
													
													for (var k = 0; k < arr1.length; k++) {
														
														exer +=  	'<div class="form-group">'; 
														
														if(activeSectionId != sectionId){
										    			
															
															h = arr1[k].indexOf("<input");
															
															if(h != -1) {
																
																h = h + 6;
																arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
															
															}
															
															else {
																
																h = arr1[k].indexOf("<textarea");
																
																if(h != -1) {
																	
																	h = h + 9;
																	arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
																
																}
															}
														}
													
														MultiArray[j][k] = MultiArray[j][k].replace(/#@@#/g, ",");
														exer += 		'<textarea type="text" class=" form-control" value="'+ MultiArray[j][k] +' " disabled>'+ MultiArray[j][k] +'</textarea>'+  
																	'</div>';
													}	//	for k
															
													
													cArr.push(k);
													
													exer += '</div><div class="clearfix"></div>' +
															'<div class="clearfix"></div></div>';
												}

												$('#exercise').html(exer);
												
												if(activeSectionId == sectionId) {
													
											  			
													 	$('#submit').addClass("hidden");
									    				$('#next').removeClass("hidden");
												  		$('#skip').addClass("hidden");
											  	}
												
											  	else
											  		$('#next').removeClass("hidden");
							    				
								    				
							    				
											}
											//end of if db_data is not null for section 8.5
											
		
								
								else {//if db_data is null
											
											
								
									for (k = 0; k < arr['exerciseDesc'].length; k++) {
										
										exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
										
									}
									
							    	minfields= data1['minfields'];
							    	
									count = arr['questions'].length;
									
									for (j = 0; j < arr['questions'].length; j++) {
										
										if(j == 0)
											
											exer += '<div id="div' + j + '">';
											
										else
											
											exer += '<div id="div' + j + '" class="">';
											
										
										exer +=	'<p>' + arr['questions'][j].ques + '</p>' +
												'<div id="lt'+j+'" class="col-md-8 form-horizontal">';
												
										
										arr1 = arr['questions'][j]['blanks'];
										
										for (var k = 0; k < arr1.length; k++) {
											
											exer +=  	'<div class="form-group">'; 
											
											if(activeSectionId != sectionId){
							    			
												
												h = arr1[k].indexOf("<input");
												
												if(h != -1) {
													
													h = h + 6;
													
													arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), "  ");
													$('#submit').removeClass("hidden");
												
												}
												
												else {
													
													h = arr1[k].indexOf("<textarea");
													
													if(h != -1) {
														
														h = h + 9;
														arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
													
													}
												}
											}
											
											exer += 		arr1[k] + 
														'</div>';
										}	//	for k
												
										
										cArr.push(k);
										
										exer += '</div><div class="clearfix"></div>' +
												'<div class="clearfix"></div></div>';
									}

									$('#exercise').html(exer);
									
									if(activeSectionId == sectionId) {
										
								  		$('#submit').removeClass("hidden");
								  	}
									
								  	else
								  		$('#next').removeClass("hidden");//end of db_data is null
								}
											
							  	}, //end of success function for db_data
							  	
							  	
							  	error: function() {
							  		alert("Error: server encountered an internal error. Please try again after some time ");
									  
									
								  } 
							  	
							  	}); //end of ajax call to get the data from the database
									
									
							  	} //end of 8.5
							  	
							  	
							else if((sectionId==9 && subsectionId==4) || (activeSectionId==9 && activeSubSectionId==4)) {
							  		
								$("#section9").removeClass("hidden");
							  		
									//ajax call to get the data from the database
							  		$.ajax({
										type : "GET",
										url : serverURL + "users/" + userId
												+ "/sections/" + 9 + "/subsections/"
												+ 4 + "/" + "3rdSecdata/1",
												
										contentType : "application/json",
										
										dataType : "json",
										
										success : function(data) {
											
											arr_splitted_data1=data;
											
											if(data!= null){
												$("#download").removeClass("hidden");
												   
												
												
								    			var data_new = data[0].response;
												var str1 = data_new.split(',');
												
												var MultiArray = new Array(3);
												
												for(var t=0;t<=str1.length;t++){
													
													MultiArray[t]=new Array(3);
													
													if(t<1){
													
													var str_12 = str1[t].split('_');
													MultiArray[0][t]=str_12[2];
													
													
												}else if(t>0 && t<2){
													
													var str_12 = str1[t].split('_');
													MultiArray[1][t-1]=str_12[2];
													
												}
												 else if(t>1 && t<3){
													
													var str_12 = str1[t].split('_');
													MultiArray[2][t-2]=str_12[2];
													
												} 
													
												 else if(t>2 && t<4){
														
														var str_12 = str1[t].split('_');
														MultiArray[3][t-3]=str_12[2];
														
													} 
													
												 else if(t>3 && t<7){
														
														var str_12 = str1[t].split('_');
														MultiArray[4][t-4]=str_12[2];
														
													} 
													
											}
												
												arr_splitted_data1_new=MultiArray;
												
												for (k = 0; k < arr['exerciseDesc'].length; k++) {
													
													exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
													
												}
												
										    	minfields= data1['minfields'];
										    	
												count = arr['questions'].length;
												
												for (j = 0; j < arr['questions'].length; j++) {
													
													if(j == 0)
														
														exer += '<div id="div' + j + '">';
														
													else
														
														exer += '<div id="div' + j + '" class="">';
														
													
													exer +=	'<p>' + arr['questions'][j].ques + '</p>' +
															'<div id="lt'+j+'" class="col-md-8 form-horizontal">';
															
													
													arr1 = arr['questions'][j]['blanks'];
													
													for (var k = 0; k < arr1.length; k++) {
														
														exer +=  	'<div class="form-group">'; 
														
														if(activeSectionId != sectionId){
										    			
															
															h = arr1[k].indexOf("<input");
															
															if(h != -1) {
																
																h = h + 6;
																arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
															
															}
															
															else {
																
																h = arr1[k].indexOf("<textarea");
																
																if(h != -1) {
																	
																	h = h + 9;
																	arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
																
																}
															}
														}
														
														
														
														MultiArray[j][k] = MultiArray[j][k].replace(/#@@#/g, ",");
														exer +='<textarea type="text" class=" form-control" value="'+ MultiArray[j][k] +' " disabled>'+ MultiArray[j][k] +'</textarea>'+
																'</div>';
													}	//	for k
															
													
													cArr.push(k);
													
													exer += '</div><div class="clearfix"></div>' +
															'<div class="clearfix"></div></div>';
												}

												$('#exercise').html(exer);
												
												if(activeSectionId == sectionId) {
													
											  		
													$('#submit').addClass("hidden");
								    				$('#next').removeClass("hidden");
											  	}
												
											  	else
											  		$('#next').removeClass("hidden");
							    				
								    				
							    				
											}
											//end of if db_data is not null for section 9.4
											
		
								
								else {//if db_data is null
											
											
								
									for (k = 0; k < arr['exerciseDesc'].length; k++) {
										
										exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
										
									}
									
							    	minfields= data1['minfields'];
							    	
									count = arr['questions'].length;
									
									for (j = 0; j < arr['questions'].length; j++) {
										
										if(j == 0)
											
											exer += '<div id="div' + j + '">';
											
										else
											
											exer += '<div id="div' + j + '" class="">';
											
										
										exer +=	'<p>' + arr['questions'][j].ques + '</p>' +
												'<div id="lt'+j+'" class="col-md-8 form-horizontal">';
												
										
										arr1 = arr['questions'][j]['blanks'];
										
										for (var k = 0; k < arr1.length; k++) {
											
											exer +=  	'<div class="form-group">'; 
											
											if(activeSectionId != sectionId){
							    			
												
												h = arr1[k].indexOf("<input");
												
												if(h != -1) {
													
													h = h + 6;
													
													arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), "  ");
													$('#submit').removeClass("hidden");
												}
												
												else {
													
													h = arr1[k].indexOf("<textarea");
													
													if(h != -1) {
														
														h = h + 9;
														arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
													
													}
												}
											}
											
											exer += 		arr1[k] + 
														'</div>';
										}	//	for k
												
										
										cArr.push(k);
										
										exer += '</div><div class="clearfix"></div>' +
												'<div class="clearfix"></div></div>';
									}

									$('#exercise').html(exer);
									
									if(activeSectionId == sectionId) {
										
								  		$('#submit').removeClass("hidden");
								  	}
									
								  	else
								  		$('#next').removeClass("hidden");//end of db_data is null
								}
											
							  	}, //end of success function for db_data
							  	
							  	
							  	error: function() {
							  		alert("Error: server encountered an internal error. Please try again after some time ");
									  
									 // alert("Error Occured due to " + serverURL + "sections/" + sectionId + "/subsections/" + subsectionId + "/check3");
									  
								  } 
							  	
							  	}); //end of ajax call to get the data from the database
									
									
							  	} //end of 9.4
							  		
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
	
	var cArr = new Array();
	
	function myFunction(arr) {
		
	}
	
	var version = 0;
	var count = 0;
	var minfields=0;
	var formData1 = {};
	var temp_array = [];
	var temp_array_new = [];
	function checkForEmptyFields(){
		
	
		formData = '';
		var filled=0;
		var flag = true; // if empty fields then remains  true
		
		
		for (j = 1; j <= count; j++)	{
			
			for (k = 1; k <= cArr[j-1]; k++) {
				
				if($('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val()) {
					
					filled++;
					if(filled>=minfields)
					flag=false;
				}
				
			}	
			
		}	
		
		if(flag == true){
			
			if(minfields==1)
				
				alert("Please fill in atleast "+ minfields + " blank to continue!");
			
			else
				alert("Please fill in atleast "+ minfields + " blanks to continue!");
		}
		else{
			$("#download").removeClass("hidden");
			

			for (j = 1; j <= count; j++)	{
				
				for (k = 1; k <= cArr[j-1]; k++) {
					if($('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().includes(",")){
						
						p = ($('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().replace(/,/g, "#@@#"));
					}
					else {
						p= $('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val();
					}
					
					
					
					formData += j + '_' + k + '_' + p + ',';
					temp_array.push($('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val());
					
					
					$('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).prop("disabled", "disabled");
				}
			}
			makeThePostCall(formData);
			
		}
		
		
	}
	
	
	//function that makes the POST call
	function makeThePostCall(newData){
		
		if((sectionId==5 && subsectionId==7) || (activeSectionId==5 && activeSubSectionId==7)){
    	    
			
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData)
			
			
			var Indata = {
					userId : userId,
					section_id : 5,
					sub_section_id : 7,
					version_id : 1,
					response : table3arr1,
					category_id : 'null'
				};
			
			var myJSON = JSON.stringify(Indata);
			//rest call storeing 5.7 data type
			
			$.ajax({
				type : "POST",
				url : serverURL + "users/" + userId + "/sections/" + 5
						+ "/subsections/" + 7 + "/" + "3rdSecdata/1",
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
		
		else if((sectionId==7 && subsectionId==4) || (activeSectionId==7 && activeSubSectionId==4)){
    
	
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData)
			
			
			var Indata = {
					userId : userId,
					section_id : 7,
					sub_section_id : 4,
					version_id : 1,
					response : table3arr1,
					category_id : 'null'
				};
	
	var myJSON = JSON.stringify(Indata);
	//rest call storeing 7.4 data type
	
	$.ajax({
		type : "POST",
		url : serverURL + "users/" + userId + "/sections/" + 7
				+ "/subsections/" + 4 + "/" + "3rdSecdata/1",
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
		
		
		else if((sectionId==8 && subsectionId==5) || (activeSectionId==8 && activeSubSectionId==5)){
		    
			
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData)
			
			
			var Indata = {
					userId : userId,
					section_id : 8,
					sub_section_id : 5,
					version_id : 1,
					response : table3arr1,
					category_id : 'null'
				};
			
			var myJSON = JSON.stringify(Indata);
			//rest call storeing 8.5 data type
			
			$.ajax({
				type : "POST",
				url : serverURL + "users/" + userId + "/sections/" + 8
						+ "/subsections/" + 5 + "/" + "3rdSecdata/1",
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
		
		
			else if((sectionId==9 && subsectionId==4) || (activeSectionId==9 && activeSubSectionId==4)){
		    
			
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData)
			
			
			var Indata = {
					userId : userId,
					section_id : 9,
					sub_section_id : 4,
					version_id : 1,
					response : table3arr1,
					category_id : 'null'
				};
			
			var myJSON = JSON.stringify(Indata);
			//rest call storeing 9.4 data type
			
			$.ajax({
				type : "POST",
				url : serverURL + "users/" + userId + "/sections/" + 9
						+ "/subsections/" + 4 + "/" + "3rdSecdata/1",
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
	
	
		
		
		 //new code for table in excel sheet
	 function download(){
		 	var tab_text = '<table id="table245">';
		    var textRange; 
		    var j = 0;
		   
		    	
		    	if(activeSectionId==5 && activeSubSectionId==7){
	        	
	        	if(arr_splitted_data1== null){
	        		
	        	if(temp_array.length==0){
		    	tab_text = tab_text + "<tr><td>" +"i commit to schedule worry time at"+"</td></tr>"+
		        "<tr><td></td></tr>";
	        		}else {
	        			 tab_text = tab_text + "<tr><td>" +"i commit to schedule worry time at"+"</td></tr>"+
	     		        "<tr><td>"+temp_array[0]+"</td></tr>";
	        		}
	        		}else {
	        			 tab_text = tab_text + "<tr><td>" +"i commit to schedule worry time at"+"</td></tr>"+
		     		        "<tr><td>"+arr_splitted_data1_new[0][0]+"</td></tr>";
		        		 }

		    
		    }else  if(activeSectionId==7 && activeSubSectionId==4){
		    		
		    		if(arr_splitted_data1== null){
		        		
			        	if(temp_array.length==0){
				    	tab_text = tab_text + "<tr><td>" +"self-soothing activities that I think I can try for the next ten days"+"</td>"+
				    	"<tr><td></td></tr>"+
				    	"<td></td></tr>"+
				    	"<td></td></tr>";
				        
			        		}else {
			        			tab_text = tab_text + "<tr><td>" +"self-soothing activities that I think I can try for the next ten days"+"</td></tr>"+
						    	"<tr><td>"+temp_array[0]+"</td></tr>"+
						    	"<tr><td>"+temp_array[1]+"</td></tr>"+
						    	"<tr><td>"+temp_array[2]+"</td></tr>";
			        		}
			        		}else {
			        			tab_text = tab_text + "<tr><td>" +"self-soothing activities that I think I can try for the next ten days-"+"</td>"+
						    	"<tr><td>"+arr_splitted_data1_new[0][0]+"</td></tr>"+
						    	"<td>"+arr_splitted_data1_new[0][1]+"</td></tr>"+
						    	"<td>"+arr_splitted_data1_new[0][2]+"</td></tr>";
				        		 }

		    		
		    	} else if(activeSectionId==8 && activeSubSectionId==5){
		    		
						if(arr_splitted_data1== null){
		        		
			        	if(temp_array.length==0){
				    	tab_text = tab_text + "<tr><td>" +"From your list B, note down some of these things that you can start off within the next one-two weeks"+"</td>"+
				    	"<td>"+"Also, note down a few of the other things (from your List B) that you can start doing in about a month's time"+"</td>"+
				    	"<td>"+"Your planning notes here:"+"</td></tr>"+
				    	"<tr><td></td><td></td></td><td></td></tr>"+
				    	"<tr><td></td><td></td></tr>"+
				    	"<tr><td></td><td></td></tr>";
				        
			        		}else {
			        			tab_text = tab_text + "<tr><td>" +"From your list B, note down some of these things that you can start off within the next one-two weeks"+"</td>"+
						    	"<td>" +"Also, note down a few of the other things (from your List B) that you can start doing in about a month's time"+"</td>"+
						    	"<td>"+"Your planning notes here:"+"</td></tr>"+
						    	"<tr><td>"+temp_array[0]+"</td><td>"+temp_array[3]+"</td><td>"+temp_array[6]+"</td></tr>"+
			        			"<tr><td>"+temp_array[1]+"</td><td>"+temp_array[4]+"</td></tr>"+
			        			"<tr><td>"+temp_array[2]+"</td><td>"+temp_array[5]+"</td></tr>";
			        			
			        		}
			        		}else {
			        			tab_text = tab_text + "<tr><td>" +"From your list B, note down some of these things that you can start off within the next one-two weeks"+"</td>"+
						    	"<td>" +"Also, note down a few of the other things (from your List B) that you can start doing in about a month's time"+"</td>"+
						    	"<td>"+"Your planning notes here:"+"</td></tr>"+
						    	"<tr><td>"+arr_splitted_data1_new[0][0]+"</td><td>"+arr_splitted_data1_new[1][0]+"</td><td>"+arr_splitted_data1_new[2][0]+"</td></tr>"+
						    	"<tr><td>"+arr_splitted_data1_new[0][1]+"</td><td>"+arr_splitted_data1_new[1][1]+"</td></tr>"+
						    	"<tr><td>"+arr_splitted_data1_new[0][2]+"</td><td>"+arr_splitted_data1_new[1][2]+"</td></tr>";
						    	
				        		 }
		    	}else if(activeSectionId==9 && activeSubSectionId==4){
		    		
					if(arr_splitted_data1== null){
	        		
		        	if(temp_array.length==0){
			    	tab_text = tab_text + "<tr><td>" +"One person with whom I can talk on a general topic when I am feeling low and need to distract myself"+"</td>"+
			    	"<td>"+"One social activity that I can try to engage in, that may help me boost my mood."+"</td>"+
			    	"<td>"+"One person with whom I can try to discuss my issues."+"</td>"+
			    	"<td>"+"One person that I can connect to, when I am feeling very disturbed."+"</td>"+
			    	"<td>"+"The social activities that I can try to engage in a little more often (refer tool box for ideas)"+"</td></tr>"+
			    	"<tr><td></td><td></td><td></td><td></td><td></td></tr>"+
			    	"<tr><td></td><td></td><td></td><td></td><td></td></tr>"+
			    	"<tr><td></td><td></td><td></td><td></td><td></td></tr>";
			        
		        		}else {
		        			tab_text =tab_text + "<tr><td>" +"One person with whom I can talk on a general topic when I am feeling low and need to distract myself"+"</td>"+
					    	"<td>"+"One social activity that I can try to engage in, that may help me boost my mood."+"</td>"+
					    	"<td>"+"One person with whom I can try to discuss my issues."+"</td>"+
					    	"<td>"+"One person that I can connect to, when I am feeling very disturbed."+"</td>"+
					    	"<td>"+"The social activities that I can try to engage in a little more often (refer tool box for ideas)"+"</td></tr>"+
					    	"<tr><td>"+temp_array[0]+"</td><td>"+temp_array[1]+"</td><td>"+temp_array[2]+"</td><td>"+temp_array[3]+"</td><td>"+temp_array[4]+"</td></tr>"+
		        			"<tr><td></td><td></td><td></td><td></td><td>"+temp_array[5]+"</td></tr>"+
		        			"<tr><td></td><td></td><td></td><td></td><td>"+temp_array[6]+"</td></tr>";
		        			
		        		}
		        		}else {
		        			tab_text =tab_text + "<tr><td>" +"One person with whom I can talk on a general topic when I am feeling low and need to distract myself"+"</td>"+
					    	"<td>"+"One social activity that I can try to engage in, that may help me boost my mood."+"</td>"+
					    	"<td>"+"One person with whom I can try to discuss my issues."+"</td>"+
					    	"<td>"+"One person that I can connect to, when I am feeling very disturbed."+"</td>"+
					    	"<td>"+"The social activities that I can try to engage in a little more often (refer tool box for ideas)"+"</td></tr>"+
					    	"<tr><td>"+arr_splitted_data1_new[0][0]+"</td><td>"+arr_splitted_data1_new[1][0]+"</td><td>"+arr_splitted_data1_new[2][0]+"</td><td>"+arr_splitted_data1_new[3][0]+"</td><td>"+arr_splitted_data1_new[4][0]+"</td></tr>"+
					    	"<tr><td></td><td></td><td></td><td></td><td>"+arr_splitted_data1_new[4][1]+"</td></tr>"+
					    	"<tr><td></td><td></td><td></td><td></td><td>"+arr_splitted_data1_new[4][2]+"</td></tr>";
					    	
			        		 }
					
	    	}
		    	tab_text = tab_text + "</table>";
			    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
			    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
			    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params

			    downlodExcel(tab_text);
			
	 }
	
	</script>
</body>
</html>