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
    <script src="js/inc.js"></script>
	<script src="js/values.js"></script>

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
				
				<div class="col-md-2 col-sm-4">
				
					<img class="img-responsive" alt="" src="images/ss-pp.jpg">
					
				</div>
				
				<div class="col-md-10 col-sm-8">
				
					<div class="row">
					<div class="hidden" id="section4"><h3><b>Dealing with depressive thoughts</b></h3></div>
					<div class="hidden" id="section5"><h3><b>Manage excessive worries</b></h3></div>
					<div class="hidden" id="section6"><h3><b>Learn Self-Compassion</b></h3></div>
					<div class="hidden" id="section8"><h3><b>Regaining a sense of mastery</b></h3></div>
					
						<h3><b id="subsection-name">Tool Box</b></h3>
						
						<p id="subsection-desc" class="text-justify"></p>	
									
						<hr style="border-bottom: 1px solid black;">
						
						<div class="clearfix"></div>
						
						<h4 id="exercise-title"></h4>
						
						<div class="clearfix"></div>
						
						<div class="col-md-1"></div>
						
					<div class="col-md-10">
						
							<div id="images">
							
							<img class="img-responsive" alt="" src="images/Sleep- optional 1.5.png">
							
							</div>
							
					</div>
					
						<p id="exercise-desc" class="text-justify"></p>
						
						<div class="col-md-10 text-justify" style="padding-top: 25px;" id="exercise">
						</div>
						
						<div class="clearfix"></div>
						
						<p style="text-align:center;font-weight:bold;">This table is available in workbook to edit.</p>
						
						<br>
						
						<button id="submit" class="hidden btn btn-success" onclick="checkForEmptyFields()">Submit</button>
						<button id="download" class="btn btn-warning hidden" onclick = "download()">Download</button>
						<button id="skip" class="hidden btn btn-primary" onclick="skip()">Skip</button>	
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
	
	//arrays and objects for storing data for section 4.7 from database
	
	var parsed_data47 = {};
	var splitted_data =null;
	var splitted_data1 = null;
	var splitted_data2 = null;
	
	var arr_splitted_data1 = []; 
	var arr_splitted_data1_new = [];
	
	var arr_splitted_data2 = [];
	var arr_splitted_data2_new = [];
	
	var arr_splitted_data3 = [];
	var arr_splitted_data3_new = [];
	
	var arr_splitted_data4 = [];
	var arr_splitted_data4_new = [];
	
	
	//arrays and objects for storing data for section 5.6 from database
	var parsed_data56 = {};
	
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
								minfields=data1["minfields"];
							
					
							    var arr = data1;
						        exer = '';
						        

							  	//begin code to retrieve 4.6 data from database
							  	if((sectionId==4 && subsectionId==7) || (activeSectionId==4 && activeSubSectionId==7)) {
							  		$("#section4").removeClass("hidden");
							  		
							  		var db_data=null;
							  		
									//ajax call to get the data from the database
							  		$.ajax({
										type : "GET",
										url : serverURL + "users/" + userId
												+ "/sections/" + 4 + "/subsections/"
												+ 7 + "/" + "3rdSecdata/1",
												
										contentType : "application/json",
										
										dataType : "json",
										
										success : function(data) {
											
											arr_splitted_data1=data;
											if(data!= null){
												$("#download").removeClass("hidden");
												
											
								    			
								    			var data_new = data[0].response;
								    			data_new = data_new.replace(/\\n/g, '');
												var str1 = data_new.split(',');
												
												var MultiArray = new Array(3);
												
												for(var t=0;t<=str1.length;t++){
													
													MultiArray[t]=new Array(3);
													
													if(t<4){
														
														var str_12 = str1[t].split('_');
														MultiArray[0][t]=str_12[2];
														
														
													}
												
													
													
												}
												
												arr_splitted_data1_new=MultiArray;
								    			
												var arr = data1;
										        exer = '';

												for (k = 0; k < arr['exerciseDesc'].length; k++) {
													exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
												}
												
												
												count = arr['questions'].length;
												
												
												for (j = 0; j < arr['questions'].length; j++) {
													
													if(j == 0)
														exer += '<div id="div' + j + '">';
														
													else
														exer += '<div id="div' + j + '" class="">';
													
													exer +=	'<hr>' +
															'<p>' + arr['questions'][j].ques + '</p>' +
															'<div id="lt'+j+'" class="col-md-10 form-horizontal">';
															
														
													arr1 = arr['questions'][j]['blanks'];
													
													
													for (var k = 0; k < arr1.length; k++) {
														
														exer +=  	'<div class="form-group" id ="download_div">'; 
																	
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
														exer += '<textarea type="text" class=" form-control" value="'+ MultiArray[0][k] +' " disabled>'+ MultiArray[0][k] +'</textarea>'+
															    '</div>';
															    
											
													}	//	for k
													
													cArr.push(k);
													
													exer += '</div><div class="clearfix"></div>' +
															'<div class="clearfix"></div></div>';
												}	//	for j
												

												$('#exercise').html(exer);
												
												if(activeSectionId == sectionId) {
													
											  		$('#submit').addClass("hidden");
											  		
											  		$('#next').removeClass("hidden");
											  		if(data1['exerciseType'] == "NM"){
											  			if(data == null){
												  	$('#skip').removeClass("hidden");
											  			}else{
											  				$('#skip').addClass("hidden");
											  			}
											  		}
											  	}
												
											  	else
											  		$('#next').removeClass("hidden");
							    				
							    					
							    				
											}
											//end of if db_data is not null for section 4.6
											
		
								
								else {//if db_data is null
									var arr = data1;
							        exer = '';
											
								
								for (k = 0; k < arr['exerciseDesc'].length; k++) {
									exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
								}
								
								
								count = arr['questions'].length;
								
								for (j = 0; j < arr['questions'].length; j++) {
									
									if(j == 0)
										exer += '<div id="div' + j + '">';
										
									else
										exer += '<div id="div' + j + '" class="">';
									
									exer +=	'<hr>' +
											'<p>' + arr['questions'][j].ques + '</p>' +
											'<div id="lt'+j+'" class="col-md-10 form-horizontal">';
											
										
									arr1 = arr['questions'][j]['blanks'];
									
									for (var k = 0; k < arr1.length; k++) {
										
										exer +=  	'<div class="form-group" id ="download_div">'; 
													
										if(activeSectionId != sectionId){
						    			
					    					h = arr1[k].indexOf("<input");
											
											if(h != -1) {
												
												h = h + 6;
												//arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
												arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), "  ");
												
												$('#submit').removeClass("hidden");
										  		if(data1['exerciseType'] == "NM")
											  	$('#skip').removeClass("hidden");
											}
											
											else {
												
												
												h = arr1[k].indexOf("<textarea");
												
												if(h != -1) {
													
													h = h + 9;
													arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
												}
											}
										}
										
										exer += arr1[k] + 
											    '</div>';
							
									}	//	for k
									
									cArr.push(k);
									
									exer += '</div><div class="clearfix"></div>' +
											'<div class="clearfix"></div></div>';
								}	//	for j
								

								$('#exercise').html(exer);
								
								if(activeSectionId == sectionId) {
									
							  		$('#submit').removeClass("hidden");
							  		if(data1['exerciseType'] == "NM")
								  	$('#skip').removeClass("hidden");
							  	}
								
							  	else
							  		$('#next').removeClass("hidden");
								} //end of db_data is null
								
											
							  	}, //end of success function for db_data
							  	
							  	
							  	error: function() {
							  		alert("Error: server encountered an internal error. Please try again after some time ");
									  
									  
								  } 
							  	
							  	}); //end of ajax call to get the data from the database
									
									
							  	} //end function to retrieve data for 4.7 from database
							  	
							  //begin code to retrieve 4.6 data from database
							  else	if((sectionId==5 && subsectionId==6) || (activeSectionId==5 && activeSubSectionId==6)) {
								  $("#section5").removeClass("hidden");
							  		
							  		var db_data=null;
							  		
									//ajax call to get the data from the database
							  		$.ajax({
										type : "GET",
										url : serverURL + "users/" + userId
												+ "/sections/" + 5 + "/subsections/"
												+ 6 + "/" + "3rdSecdata/1",
												
										contentType : "application/json",
										
										dataType : "json",
										
										success : function(data) {
											
											
											arr_splitted_data1 =data;
											if(data!= null){
												$("#download").removeClass("hidden");
												
												
								    			var data_new = data[0].response;
								    			data_new = data_new.replace(/\\n/g, '');
												var str1 = data_new.split(',');
												
												var MultiArray = new Array(3);
												
												 for(var t=0;t<=str1.length;t++){
													
													MultiArray[t]=new Array(3);
													
													if(t<5){
														
														var str_12 = str1[t].split('_');
														MultiArray[0][t]=str_12[2];
														
														
													}
												
													
												}
												
												arr_splitted_data1_new =MultiArray; 
												var arr = data1;
										        exer = '';
												
												for (k = 0; k < arr['exerciseDesc'].length; k++) {
													exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
												}
												
												
												count = arr['questions'].length;
												
												for (j = 0; j < arr['questions'].length; j++) {
													
													if(j == 0)
														exer += '<div id="div' + j + '">';
														
													else
														exer += '<div id="div' + j + '" class="">';
													
													exer +=	'<hr>' +
															'<p>' + arr['questions'][j].ques + '</p>' +
															'<div id="lt'+j+'" class="col-md-10 form-horizontal">';
															
														
													arr1 = arr['questions'][j]['blanks'];
													
													for (var k = 0; k < arr1.length; k++) {
														
														exer +=  	'<div class="form-group" id ="download_div">'; 
																	
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
														MultiArray[0][j] = MultiArray[0][j].replace(/#@@#/g, ",");
														exer += '<textarea type="text" class=" form-control" value="'+ MultiArray[0][j] +' " disabled>'+ MultiArray[0][j] +'</textarea>'+
															    '</div>';
											
													}	//	for k
													
													cArr.push(k);
													
													exer += '</div><div class="clearfix"></div>' +
															'<div class="clearfix"></div></div>';
												}	//	for j
												

												$('#exercise').html(exer);
												
												if(activeSectionId == sectionId) {
													$('#skip').removeClass("hidden");
											  		
											  		if(data1['exerciseType'] == "NM"){
											  			if(data == null)
												  	$('#skip').removeClass("hidden");
											  		}
											  	}
												
											  	else
											  		$('#next').removeClass("hidden");
							    				
											}
											
											
		
								
								else {//if db_data is null
											
									var arr = data1;
							        exer = '';		
								
								for (k = 0; k < arr['exerciseDesc'].length; k++) {
									exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
								}
								
								
								count = arr['questions'].length;
								
								for (j = 0; j < arr['questions'].length; j++) {
									
									if(j == 0)
										exer += '<div id="div' + j + '">';
										
									else
										exer += '<div id="div' + j + '" class="">';
									
									exer +=	'<hr>' +
											'<p>' + arr['questions'][j].ques + '</p>' +
											'<div id="lt'+j+'" class="col-md-10 form-horizontal">';
											
										
									arr1 = arr['questions'][j]['blanks'];
									
									for (var k = 0; k < arr1.length; k++) {
										
										exer +=  	'<div class="form-group" id ="download_div">'; 
													
										if(activeSectionId != sectionId){
						    			
					    					h = arr1[k].indexOf("<input");
											
											if(h != -1) {
												
												h = h + 6;
												
												arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " ");
												$('#submit').removeClass("hidden");
										  		if(data1['exerciseType'] == "NM")
											  	$('#skip').removeClass("hidden");
											}
											
											else {
												
												
												h = arr1[k].indexOf("<textarea");
												
												if(h != -1) {
													
													h = h + 9;
													
													arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " ");
													$('#submit').removeClass("hidden");
											  		if(data1['exerciseType'] == "NM")
												  	$('#skip').removeClass("hidden");
												}
											}
										}
										
										exer += arr1[k] + 
											    '</div>';
							
									}	//	for k
									
									cArr.push(k);
									
									exer += '</div><div class="clearfix"></div>' +
											'<div class="clearfix"></div></div>';
								}	//	for j
								

								$('#exercise').html(exer);
								
								if(activeSectionId == sectionId) {
									
							  		$('#submit').removeClass("hidden");
							  		if(data1['exerciseType'] == "NM")
								  	$('#skip').removeClass("hidden");
							  	}
								
							  	else
							  		$('#next').removeClass("hidden");
								} //end of db_data is null
								
											
							  	}, //end of success function for db_data
							  	
							  	
							  	error: function() {
							  		alert("Error: server encountered an internal error. Please try again after some time ");
									  //alert("Error Occured due to " + serverURL + "sections/" + sectionId + "/subsections/" + subsectionId + "/check3");
									  //window.location.href = "error.html";
								  } 
							  	
							  	}); //end of ajax call to get the data from the database
									
									
							  	} //end function to retrieve data for 5.6 from database
							  	
							else	if((sectionId==6 && subsectionId==6) || (activeSectionId==6 && activeSubSectionId==6)) {
								$("#section6").removeClass("hidden");
							  		var db_data=null;
							  		
									//ajax call to get the data from the database
							  		$.ajax({
										type : "GET",
										url : serverURL + "users/" + userId
												+ "/sections/" + 6 + "/subsections/"
												+ 6 + "/" + "3rdSecdata/1",
												
										contentType : "application/json",
										
										dataType : "json",
										
										success : function(data) {
											
											arr_splitted_data1=data;
											
											if(data!= null){
												$("#download").removeClass("hidden");
												var arr = data1;
										        exer = '';
												
												
								    			var data_new = data[0].response;
								    			data_new = data_new.replace(/\\n/g, '');
								    			
								    			//new working code to remove \n from the data
								    			//data_new = data_new.replace(/\\n/g, "");
								    			//var str1 = data_new.split('#');
												var str1 = data_new.split(',');
												
												var MultiArray = new Array(3);
											
												  for(var t=0;t<str1.length;t++){
													
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
												
												
												count = arr['questions'].length;
												
												for (j = 0; j < arr['questions'].length; j++) {
													
													if(j == 0)
														exer += '<div id="div' + j + '">';
														
													else
														exer += '<div id="div' + j + '" class="">';
													
													exer +=	'<hr>' +
															'<p>' + arr['questions'][j].ques + '</p>' +
															'<div id="lt'+j+'" class="col-md-10 form-horizontal">';
															
														
													arr1 = arr['questions'][j]['blanks'];
													
													for (var k = 0; k < arr1.length; k++) {
														
														exer +=  	'<div class="form-group" id ="download_div">'; 
																	
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
															exer += 		'<textarea rows="15" type="text" class=" form-control" placeholder="Dear ... ,"  value="'+ MultiArray[0][k] +' " disabled>'+ MultiArray[0][k] + 
															'</textarea>'+
															    '</div>';
											
													}	//	for k
													
													cArr.push(k);
													
													exer += '</div><div class="clearfix"></div>' +
															'<div class="clearfix"></div></div>';
												}	//	for j
												

												$('#exercise').html(exer);
												
												if(activeSectionId == sectionId) {
													$('#next').removeClass("hidden");
											  		
											  		if(data1['exerciseType'] == "NM")
												  	$('#skip').removeClass("hidden");
											  	}
												
											  	else
											  		$('#next').removeClass("hidden");
							    				
											}
											//end of if db_data is not null for section 4.6
											
		
								
								else {//if db_data is null
											
											
									var arr = data1;
							        exer = '';
								for (k = 0; k < arr['exerciseDesc'].length; k++) {
									exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
								}
								
								
								count = arr['questions'].length;
								
								for (j = 0; j < arr['questions'].length; j++) {
									
									if(j == 0)
										exer += '<div id="div' + j + '">';
										
									else
										exer += '<div id="div' + j + '" class="">';
									
									exer +=	'<hr>' +
											'<p>' + arr['questions'][j].ques + '</p>' +
											'<div id="lt'+j+'" class="col-md-10 form-horizontal">';
											
										
									arr1 = arr['questions'][j]['blanks'];
									
									for (var k = 0; k < arr1.length; k++) {
										
										exer +=  	'<div class="form-group" id ="download_div">'; 
													
										if(activeSectionId != sectionId){
						    			
					    					h = arr1[k].indexOf("<input");
											
											if(h != -1) {
												
												h = h + 6;
												
												arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), "  ");
												$('#submit').removeClass("hidden");
										  		if(data1['exerciseType'] == "NM")
											  	$('#skip').removeClass("hidden");
											}
											
											else {
												
												
												h = arr1[k].indexOf("<textarea");
												
												if(h != -1) {
													
													h = h + 9;
													arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), "  ");
													$('#submit').removeClass("hidden");
											  		if(data1['exerciseType'] == "NM")
												  	$('#skip').removeClass("hidden");
												}
											}
										}
										
										exer += arr1[k] + 
											    '</div>';
							
									}	//	for k
									
									cArr.push(k);
									
									exer += '</div><div class="clearfix"></div>' +
											'<div class="clearfix"></div></div>';
								}	//	for j
								

								$('#exercise').html(exer);
								
								if(activeSectionId == sectionId) {
									
							  		$('#submit').removeClass("hidden");
							  		if(data1['exerciseType'] == "NM")
								  	$('#skip').removeClass("hidden");
							  	}
								
							  	else
							  		$('#next').removeClass("hidden");
								} //end of db_data is null
								
											
							  	}, //end of success function for db_data
							  	
							  	
							  	error: function() {
							  		alert("Error: server encountered an internal error. Please try again after some time ");
									
								  } 
							  	
							  	}); //end of ajax call to get the data from the database
									
									
							  	
							  	} //end function to retrieve data for 6.6 from database
							  	
			else if((sectionId==8 && subsectionId==4) || (activeSectionId==8 && activeSubSectionId==4)) {
				
									$("#section8").removeClass("hidden");
							  		
							  		var db_data=null;
							  		
									//ajax call to get the data from the database
							  		$.ajax({
										type : "GET",
										url : serverURL + "users/" + userId
												+ "/sections/" + 8 + "/subsections/"
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
													if(t<=4){
													
													var str_12 = str1[t].split('_');
													MultiArray[0][t]=str_12[2];
													
													
												}else if(4<t && t<=9){
													
													var str_12 = str1[t].split('_');
													MultiArray[1][t-5]=str_12[2];
													
												}
											}
												
												arr_splitted_data1_new =MultiArray; 
												
												
												for (k = 0; k < arr['exerciseDesc'].length; k++) {
													exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
												}
												
												
												count = arr['questions'].length;
												
												for (j = 0; j < arr['questions'].length; j++) {
													
													
													if(j == 0)
														exer += '<div id="div' + j + '">';
														
													else
														exer += '<div id="div' + j + '" class="">';
													
													exer +=	'<hr>' +
															'<p>' + arr['questions'][j].ques + '</p>' +
															'<div id="lt'+j+'" class="col-md-10 form-horizontal">';
															
														
													arr1 = arr['questions'][j]['blanks'];
													
													for (var k = 0; k < arr1.length; k++) {
														
														
														exer +=  	'<div class="form-group" id ="download_div">'; 
																	
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
																	arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), "disabled");
																	
																	
																}
															}
														}
														MultiArray[j][k] = MultiArray[j][k].replace(/#@@#/g, ",");
														exer += '<textarea type="text" class=" form-control" value="'+ MultiArray[j][k] +' " disabled>'+ MultiArray[j][k] +'</textarea>'+
														
															    '</div>';
											
													}	//	for k
													
													cArr.push(k);
													
													exer += '</div><div class="clearfix"></div>' +
															'<div class="clearfix"></div></div>';
												}	//	for j
												

												$('#exercise').html(exer);
												
												if(activeSectionId == sectionId) {
													$('#next').removeClass("hidden");
											  		
											  		if(data1['exerciseType'] == "NM")
												  	$('#skip').removeClass("hidden");
											  	}
												
											  	else
											  		$('#next').removeClass("hidden");
							    				
											}
											//end of if db_data is not null for section 4.6
											
		
								
								else {//if db_data is null
											
											
								
								for (k = 0; k < arr['exerciseDesc'].length; k++) {
									exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
								}
								
							
								count = arr['questions'].length;
								
								for (j = 0; j < arr['questions'].length; j++) {
									
									if(j == 0)
										exer += '<div id="div' + j + '">';
										
									else
										exer += '<div id="div' + j + '" class="">';
									
									exer +=	'<hr>' +
											'<p>' + arr['questions'][j].ques + '</p>' +
											'<div id="lt'+j+'" class="col-md-10 form-horizontal">';
											
										
									arr1 = arr['questions'][j]['blanks'];
									
									for (var k = 0; k < arr1.length; k++) {
										
										exer +=  	'<div class="form-group" id ="download_div">'; 
													
										if(activeSectionId != sectionId){
						    			
					    					h = arr1[k].indexOf("<input");
											
											if(h != -1) {
												
												h = h + 6;
												
												
												
												//new code for unlock for section
												arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " ");
												$('#submit').removeClass("hidden");
										  		if(data1['exerciseType'] == "NM")
											  	$('#skip').removeClass("hidden");
										  	
											}
											
											else {
												
												
												h = arr1[k].indexOf("<textarea");
												
												if(h != -1) {
													
													h = h + 9;
													arr1[k] = arr1[k].replace(arr1[k].slice(h, h+1), " disabled ");
												}
											}
										}
										
										exer += arr1[k] + 
											    '</div>';
							
									}	//	for k
									
									cArr.push(k);
									
									exer += '</div><div class="clearfix"></div>' +
											'<div class="clearfix"></div></div>';
								}	//	for j
								

								$('#exercise').html(exer);
								
								if(activeSectionId == sectionId) {
									
							  		$('#submit').removeClass("hidden");
							  		if(data1['exerciseType'] == "NM")
								  	$('#skip').removeClass("hidden");
							  	}
								
							  	else
							  		$('#next').removeClass("hidden");
								} //end of db_data is null
								
											
							  	}, //end of success function for db_data
							  	
							  	
							  	error: function() {
							  		alert("Error: server encountered an internal error. Please try again after some time ");
									 
								  } 
							  	
							  	}); //end of ajax call to get the data from the database
									
									
							  	} //end oof 8.4
							  	
							  	
							  	
				          }, //end of success function for section and subsection id
				          
				          
						  error: function() {
							  alert("Error: server encountered an internal error. Please try again after some time ");
							
						  } 
				          
					});	//end of ajax call to get sectionid and subsectionid
					
			  }, //end of success function for document.ready function
			  
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
					var p ='';
					if($('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().includes(",")){
						p = $('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().replace(/,/g, "#@@#");
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
	function skip() {
		
		formData = '';
		
		for (j = 1; j <= count; j++)	{
			
			for (k = 1; k <= cArr[j-1]; k++) {
				
				formData += j + '_' + k + '_' + ',';
				
				$('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).prop("disabled", "disabled");	
			}
		}
		makeThePostCall(formData);
		$('#next').removeClass("hidden");
	}
	
	
	//function that makes the POST call
	function makeThePostCall(newData){
		
		if((sectionId==4 && subsectionId==7) || (activeSectionId==4 && activeSubSectionId==7)){
    	    
			
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData)
			
			
			var Indata = {
					userId : userId,
					section_id : 4,
					sub_section_id : 7,
					version_id : 1,
					response : table3arr1,
					category_id : 'null'
				};
			
			var myJSON = JSON.stringify(Indata);
			//rest call storeing 4.6 data type
			
			$.ajax({
				type : "POST",
				url : serverURL + "users/" + userId + "/sections/" + 4
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
		
		else if((sectionId==5 && subsectionId==6) || (activeSectionId==5 && activeSubSectionId==6)){
    	    
			
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData)
			
			
			var Indata = {
					userId : userId,
					section_id : 5,
					sub_section_id : 6,
					version_id : 1,
					response : table3arr1,
					category_id : 'null'
				};
			
			var myJSON = JSON.stringify(Indata);
			//rest call storeing 4.6 data type
			
			$.ajax({
				type : "POST",
				url : serverURL + "users/" + userId + "/sections/" + 5
						+ "/subsections/" + 6 + "/" + "3rdSecdata/1",
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
		
		
else if((sectionId==6 && subsectionId==6) || (activeSectionId==6 && activeSubSectionId==6)){
    	    
			
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData)
			
			
			var Indata = {
					userId : userId,
					section_id : 6,
					sub_section_id : 6,
					version_id : 1,
					response : table3arr1,
					category_id : 'null'
				};
			
			var myJSON = JSON.stringify(Indata);
			//rest call storeing 4.6 data type
			
			$.ajax({
				type : "POST",
				url : serverURL + "users/" + userId + "/sections/" + 6
						+ "/subsections/" + 6 + "/" + "3rdSecdata/1",
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
			
		
		else if((sectionId==8 && subsectionId==4) || (activeSectionId==8 && activeSubSectionId==4)){
    
	
	var section_id;
	var sub_section_id;
	var version_id;
	var response;
	var category_id;
	var table3arr1 = JSON.stringify(formData)
	
	
	var Indata = {
			userId : userId,
			section_id : 8,
			sub_section_id : 4,
			version_id : 1,
			response : table3arr1,
			category_id : 'null'
		};
	
	var myJSON = JSON.stringify(Indata);
	//rest call storeing 4.6 data type
	
	$.ajax({
		type : "POST",
		url : serverURL + "users/" + userId + "/sections/" + 8
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
	
	
	//old code as pdf file
	 function download1() {
		 
			
				
	        var pdf = new jsPDF('p', 'pt', 'letter');
	        
	        if(activeSectionId==4 && activeSubSectionId==7){
	        	
	        	if(arr_splitted_data1== null){
	        		if(temp_array.length==0){
	        		
	        		 pdf.setFontSize(13);
	        		 pdf.text(35, 15, 'Applying what you learnt in your day-to-day life');
	        		 pdf.setFontSize(11);
	        		 pdf.text(35, 45, 'Watch the pattern over a week');
	        		 pdf.text(35, 75, 'You may not be experiencing this severity of depressive symptoms.');
	        		 pdf.text(35, 105, 'If you do, then we strongly recommend you to not rely only on PUSH-D but seek face to face');
	        		 pdf.text(35, 135, 'consultation and treatment at the earliest.');
	        		 source = $('#download_div')[0];
	        		}else {
	        			 pdf.setFontSize(13);
		        		 pdf.text(35, 15, 'Applying what you learnt in your day-to-day life');
		        		 pdf.setFontSize(11);
		        		 pdf.text(35, 45, 'Watch the pattern over a week');
		        		 pdf.text(35, 75, 'You may not be experiencing this severity of depressive symptoms.');
		        		 pdf.text(35, 105, 'If you do, then we strongly recommend you to not rely only on PUSH-D but seek face to face');
		        		 pdf.text(35, 135, 'consultation and treatment at the earliest.');
		        		 pdf.text(35, 155, temp_array[0]);
		        		 pdf.text(35, 175, temp_array[1]);
		        		 pdf.text(35, 195, temp_array[2]);
		        		 
		        		 source = $('#download_div')[0];
	        			
	        		}
	        		
	        	}
	        	
	        	else {
	        		 pdf.text(35, 25, 'Applying what you learnt in your day-to-day life');
	        		 
	        		 pdf.setFontSize(11);
	        		 pdf.text(35, 50, arr_splitted_data1_new[0][0]);
	        		 pdf.text(35, 100, arr_splitted_data1_new[0][1]);
	        		 pdf.text(35, 150, arr_splitted_data1_new[0][2]);
	        		 source = $('#download_div')[0];
	     	         
	        		
	        	}
	        	
		       
		       }
	         else  if(activeSectionId==5 && activeSubSectionId==6){
	        	
	        	 if(arr_splitted_data1== null){
	        		 if(temp_array.length==0){
	        		
	        		 pdf.text(15, 25, 'Applying what you learnt');
	        		 source = $('#exercise')[0];
	        		 }
	        		 
	        		 else {
	        			 
	        		 
	        		 pdf.text(15, 25, 'Applying what you learnt');
	        		 pdf.setFontSize(11);
	        		 pdf.text(35, 50, 'It is possible to practice and learn to shift from one mind-state to another.');
	        		 pdf.text(35, 70, 'Do you want to try it out now?');
	        		 pdf.text(35, 90, 'Write one of your current worries here:');
	        		 pdf.text(35, 110, temp_array[0]);
	        		 pdf.text(35, 130, 'Write down how you might respond to this worry when you are in emotional mind-state:');
	        		 pdf.text(35, 150, temp_array[1]);
	        		 pdf.text(35, 170, 'Write down how you might respond to this worry when you are in rational mind-state:');
	        		 pdf.text(35, 190, temp_array[2]);
	        		 pdf.text(35, 210, 'Write down how you might respond to this worry when you are in wise mind-state:');
	        		 pdf.text(35, 230, temp_array[3]);
	        		 source = $('#exercise-title')[0];
	        		 }	 
	        		 
	        	} 
	        	
	        	else {
	        		 
	        		
	        		 pdf.text(15, 25, 'Applying what you learnt');
	        		 pdf.setFontSize(11);
	        		 pdf.text(35, 50, 'It is possible to practice and learn to shift from one mind-state to another.');
	        		 pdf.text(35, 70, 'Do you want to try it out now?');
	        		 pdf.text(35, 90, 'Write one of your current worries here:');
	        		 pdf.text(35, 110, arr_splitted_data1_new[0][0]);
	        		 pdf.text(35, 130, 'Write down how you might respond to this worry when you are in emotional mind-state:');
	        		 pdf.text(35, 150, arr_splitted_data1_new[0][1]);
	        		 pdf.text(35, 170, 'Write down how you might respond to this worry when you are in rational mind-state:');
	        		 pdf.text(35, 190, arr_splitted_data1_new[0][2]);
	        		 pdf.text(35, 210, 'Write down how you might respond to this worry when you are in wise mind-state:');
	        		 pdf.text(35, 230, arr_splitted_data1_new[0][3]);
	        		 source = $('#exercise-title')[0];
	        		
	        		
	      
	        		
	        	}
	        	
		       
		       }
	        
	        
	         else  if(activeSectionId==6 && activeSubSectionId==6){
		        	
	        	 if(arr_splitted_data1== null){
	        		 
	        		 if(temp_array.length==0){
	        		
	        		
	        		 
	        		 source = $('#exercise')[0]; 
	        		 }
	        		 
	        		 else
	        			{ 
	        			 
				
	        		 
	        		 source = $('#exercise')[0]; 
	        		 pdf.setFontSize(11);
	        		 pdf.text(35, 300, temp_array[0]);
	        			} 
	        		 
	        		
	        	} 
	        	
	        	else {
	        		 pdf.text(15, 25, 'Practice Point2');
	        		
	        		 source = $('#exercise')[0]; 
	        		 pdf.setFontSize(11);
	        		
	      
	        		
	        	}
	        	
		       
		       }
	        
	        else  if(activeSectionId==8 && activeSubSectionId==4){
	        	
	        	 if(arr_splitted_data1==null){
	        		 if(temp_array.length==0){
	        		
	        		 pdf.text(15, 25, 'Regaining a sense of mastery');
	        		 pdf.setFontSize(11);
	        		 pdf.text(15, 55, 'Now think of your life and put in all those things/situations/aspects that are bothering you');
	        		 pdf.text(15, 65, 'and taking most of your attention/mind-space : Fill them in here ...');
	        		 pdf.text(15, 85, 'Your List A');
	        		 
	        		 
	        		 source = $('#download_div')[0]; 
	        		
	        		 pdf.text(15, 300, 'Now think hard about the aspects of your life/issues/things that you are tending to ignore/pay less attention');
	        		 pdf.text(15, 325, 'due to being preoccupied with other issues that you feel are stressing/overwhelming you.');
	        		 pdf.text(15, 355, 'Make a list of these aspects which contain some action points for you (like the list B of Rakesh)');
	        		 
	        		 pdf.text(15, 375, 'Your List B'); 
	        		 }
	        		 else 
	        			 {
	        			 pdf.text(15, 25, 'Regaining a sense of mastery');
		        		 pdf.setFontSize(11);
		        		 pdf.text(15, 55, 'Now think of your life and put in all those things/situations/aspects that are bothering you');
		        		 pdf.text(15, 65, 'and taking most of your attention/mind-space : Fill them in here ...');
		        		 pdf.text(15, 85, 'Your List A');
		        		 
		        		 pdf.text(15, 110, temp_array[0]);
		        		 pdf.text(15, 130, temp_array[1]);
		        		 pdf.text(15, 160, temp_array[2]);
		        		 pdf.text(15, 190, temp_array[3]);
		        		 pdf.text(15, 220, temp_array[4]);
		        		 
		        		 
		        		 
		        		 source = $('#download_div')[0]; 
		        		
		        		 pdf.text(15, 300, 'Now think hard about the aspects of your life/issues/things that you are tending to ignore/pay less attention');
		        		 pdf.text(15, 325, 'due to being preoccupied with other issues that you feel are stressing/overwhelming you.');
		        		 pdf.text(15, 355, 'Make a list of these aspects which contain some action points for you (like the list B of Rakesh)');
		        		 
		        		 pdf.text(15, 375, 'Your List B'); 
		        		 pdf.text(15, 400, temp_array[5]);
		        		 pdf.text(15, 430, temp_array[6]);
		        		 pdf.text(15, 460, temp_array[7]);
		        		 pdf.text(15, 490, temp_array[8]);
		        		 pdf.text(15, 520, temp_array[9]);
	        			 }
	        	} 
	        	
	        	else {
	        		 pdf.text(15, 25, 'Regaining a sense of mastery');
	        		 pdf.setFontSize(11);
	        		 pdf.text(15, 55, 'Now think of your life and put in all those things/situations/aspects that are bothering you');
	        		 pdf.text(15, 65, 'and taking most of your attention/mind-space : Fill them in here ...');
	        		 pdf.text(15, 85, 'Your List A');
	        		 
	        		 
	        		 source = $('#download_div')[0];
	        		 pdf.text(15, 100, arr_splitted_data1_new[0][0]);
	        		 pdf.text(15, 125, arr_splitted_data1_new[0][1]);
	        		 pdf.text(15, 150, arr_splitted_data1_new[0][2]);
	        		 pdf.text(15, 175, arr_splitted_data1_new[0][3]);
	        		 pdf.text(15, 200, arr_splitted_data1_new[0][4]);
	        		 
	        		 
	        		 pdf.text(15, 300, 'Now think hard about the aspects of your life/issues/things that you are tending to ignore/pay less attention');
	        		 pdf.text(15, 325, 'due to being preoccupied with other issues that you feel are stressing/overwhelming you.');
	        		 pdf.text(15, 355, 'Make a list of these aspects which contain some action points for you (like the list B of Rakesh)');
	        		 
	        		 pdf.text(15, 375, 'Your List B'); 
	        		 
	        		 pdf.text(15, 400, arr_splitted_data1_new[1][0]);
	        		 pdf.text(15, 425, arr_splitted_data1_new[1][1]);
	        		 pdf.text(15, 450, arr_splitted_data1_new[1][2]);
	        		 pdf.text(15, 475, arr_splitted_data1_new[1][3]);
	        		 pdf.text(15, 500, arr_splitted_data1_new[1][4]);
	        		 
	        		
	        	}
	        	
		       
		       } 
	        
	       
	        
	        specialElementHandlers = {
		        		
		            	
	        
	       		 };
				        margins = {
				            top: 80,
				            bottom: 60,
				            left: 40,
				            width: 522
				        };
				        
				        
				        pdf.fromHTML(
				            source, // HTML string or DOM elem ref.
				            margins.left, // x coord
				            margins.top, { // y coord
			                'width': margins.width, // max width of content on PDF
			                'elementHandlers': specialElementHandlers
			                
				            },

	            function (dispose) {
				            	
	               
	                pdf.save('practicepoint.pdf');
				            
	           		 }, margins
	        );
	        
	   		}
	 
	 //new code for table in excel sheet
	 function download(){
		 	var tab_text = '<table id="table245">';
		    var textRange; 
		    var j = 0;
		    
		   	 
		    	
		    	if(activeSectionId==4 && activeSubSectionId==7){
	        	
	        	if(arr_splitted_data1== null){
	        		
	        	if(temp_array.length==0){
		    	tab_text = tab_text + "<tr><td>" +"Write down at least one and three minimum/statements you have recently used to help you to substitute your depressing thoughts with alternative thoughts"+"</td></tr>"+
		        "<tr><td></td></tr>"+
		        "<tr><td></td></tr>"+
		        "<tr><td></td></tr>";
	        		}else {
	        			 tab_text = tab_text + "<tr><td>" +"Write down at least one and three minimum/statements you have recently used to help you to substitute your depressing thoughts with alternative thoughts"+"</td></tr>"+
	     		        "<tr><td>"+temp_array[0]+"</td></tr>"+
	     		        "<tr><td>"+temp_array[1]+"</td></tr>"+
	     		        "<tr><td>"+temp_array[2]+"</td></tr>";
	        		}
	        		}else {
	        			 tab_text = tab_text + "<tr><td>" +"Write down at least one and three minimum/statements you have recently used to help you to substitute your depressing thoughts with alternative thoughts"+"</td></tr>"+
		     		        "<tr><td>"+arr_splitted_data1_new[0][0]+"</td></tr>"+
		     		        "<tr><td>"+arr_splitted_data1_new[0][1]+"</td></tr>"+
		     		        "<tr><td>"+arr_splitted_data1_new[0][2]+"</td></tr>";
		        		 }

		    tab_text = tab_text + "</table>";
		    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
		    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
		    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params

		    downlodExcel(tab_text);
		    	}else  if(activeSectionId==5 && activeSubSectionId==6){
		    		
		    		if(arr_splitted_data1== null){
		        		
			        	if(temp_array.length==0){
				    	tab_text = tab_text + "<tr><td>" +"Write one of your current worries here:"+"</td>"+
				    	"<td>"+"Write down how you might respond to this worry when you are in emotional mind-state:"+"</td>"+
				    	"<td>"+"Write down how you might respond to this worry when you are in rational mind-state:"+"</td>"+
				    	"<td>"+"Write down how you might respond to this worry when you are in wise mind-state"+"</td></tr>"+
				    	"<tr><td></td><td></td><td></td><td></td></tr>";
				        
			        		}else {
			        			tab_text = tab_text + "<tr><td>" +"Write one of your current worries here:"+"</td>"+
						    	"<td>"+"Write down how you might respond to this worry when you are in emotional mind-state:"+"</td>"+
						    	"<td>"+"Write down how you might respond to this worry when you are in rational mind-state:"+"</td>"+
						    	"<td>"+"Write down how you might respond to this worry when you are in wise mind-state"+"</td></tr>"+
						    	"<tr><td>"+temp_array[0]+"</td><td>"+temp_array[1]+"</td><td>"+temp_array[2]+"</td><td>"+temp_array[3]+"</td></tr>";
			        		}
			        		}else {
			        			tab_text = tab_text + "<tr><td>" +"Write one of your current worries here:"+"</td>"+
						    	"<td>"+"Write down how you might respond to this worry when you are in emotional mind-state:"+"</td>"+
						    	"<td>"+"Write down how you might respond to this worry when you are in rational mind-state:"+"</td>"+
						    	"<td>"+"Write down how you might respond to this worry when you are in wise mind-state"+"</td></tr>"+
						    	"<tr><td>"+arr_splitted_data1_new[0][0]+"</td><td>"+arr_splitted_data1_new[0][1]+"</td><td>"+arr_splitted_data1_new[0][2]+"</td><td>"+arr_splitted_data1_new[0][3]+"</td></tr>";
				        		 }

				    tab_text = tab_text + "</table>";
				    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
				    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
				    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params

				    downlodExcel(tab_text);
		    		
		    	}  else  if(activeSectionId==6 && activeSubSectionId==6){
		    		
		    		if(arr_splitted_data1== null){
		        		
			        	if(temp_array.length==0){
				    	tab_text = tab_text + "<tr><td>" +"Letter from your warm, compassionate and wise friend:"+"</td></tr>"+
				        "<tr><td></td></tr>";
			        		}else {
			        			 tab_text = tab_text + "<tr><td>" +"Letter from your warm, compassionate and wise friend:"+"</td></tr>"+
			     		        "<tr><td>"+temp_array[0]+"</td></tr>";
			        		}
			        		}else {
			        			 tab_text = tab_text + "<tr><td>" +"Letter from your warm, compassionate and wise friend:"+"</td></tr>"+
				     		        "<tr><td>"+arr_splitted_data1_new[0][0]+"</td></tr>";
				        		 }

				    tab_text = tab_text + "</table>";
				    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
				    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
				    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params

				    downlodExcel(tab_text);
		    	}
		    		else  if(activeSectionId==8 && activeSubSectionId==4){
		    	
		    		
						if(arr_splitted_data1== null){
		        		
			        	if(temp_array.length==0){
				    	tab_text = tab_text + "<tr><td>" +"Your list A :"+"</td>"+
				    	"<td>"+"Your list B :"+"</td></tr>"+
				    	"<tr><td></td><td></td></tr>"+
				    	"<tr><td></td><td></td></tr>"+
				    	"<tr><td></td><td></td></tr>"+
				    	"<tr><td></td><td></td></tr>"+
				    	"<tr><td></td><td></td></tr>";
				        
			        		}else {
			        			tab_text = tab_text + "<tr><td>" +"Your list A :"+"</td>"+
						    	"<td>" +"Your list B :"+"</td></tr>"+
						    	"<tr><td>"+temp_array[0]+"</td><td>"+temp_array[5]+"</td></tr>"+
			        			"<tr><td>"+temp_array[1]+"</td><td>"+temp_array[6]+"</td></tr>"+
			        			"<tr><td>"+temp_array[2]+"</td><td>"+temp_array[7]+"</td></tr>"+
			        			"<tr><td>"+temp_array[3]+"</td><td>"+temp_array[8]+"</td></tr>"+
			        			"<tr><td>"+temp_array[4]+"</td><td>"+temp_array[9]+"</td></tr>";
			        		}
			        		}else {
			        			tab_text = tab_text + "<tr><td>" +"Your list A :"+"</td>"+
						    	"<td>" +"Your list B :"+"</td></tr>"+
						    	"<tr><td>"+arr_splitted_data1_new[0][0]+"</td><td>"+arr_splitted_data1_new[1][0]+"</td></tr>"+
						    	"<tr><td>"+arr_splitted_data1_new[0][1]+"</td><td>"+arr_splitted_data1_new[1][1]+"</td></tr>"+
						    	"<tr><td>"+arr_splitted_data1_new[0][2]+"</td><td>"+arr_splitted_data1_new[1][2]+"</td></tr>"+
						    	"<tr><td>"+arr_splitted_data1_new[0][3]+"</td><td>"+arr_splitted_data1_new[1][3]+"</td></tr>"+
						    	"<tr><td>"+arr_splitted_data1_new[0][4]+"</td><td>"+arr_splitted_data1_new[1][4]+"</td></tr>";
				        		 }
						tab_text = tab_text + "</table>";
					    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
					    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
					    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params

					    downlodExcel(tab_text);
		    	}
			
	 }
	
		
	</script>
</body>
</html>