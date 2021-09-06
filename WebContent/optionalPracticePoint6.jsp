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
					<div class=" " style="border:1px solid black;width:25%;" ><h6 style="text-align:center;font-weight:bold;">YOU ARE IN OPTIONAL ZONE</h6></div>
					<div  id="section11"><h3><b>Sleep Health and Hygiene</b></h3></div>
					
						<h3><b id="subsection-name">Tool Box</b></h3>
						
						<p id="subsection-desc" class="text-justify"></p>	
									
						<hr style="border-bottom: 1px solid black;">
						
						<div class="clearfix"></div>
						
						<h4 id="exercise-title"></h4>
						
						<div class="clearfix"></div>
						
						<div class="col-md-1"></div>
						
						<div class="col-md-10">
						
							<div id="images">
							
							<img class="img-responsive" alt="" src="images/sleep-1.5.png">
							
							</div>
							
						</div>
						
						<p id="exercise-desc" class="text-justify"></p>
						
						<div class="col-md-10 text-justify" style="padding-top: 25px;" id="exercise">
						</div>
						
						<div class="clearfix"></div>
						
						<br>
						
						<button id="submit" class="btn btn-success" onclick="checkForEmptyFields()">Submit</button>
						<button id="skip" class="btn btn-primary" onclick="skip()">Skip</button>
							
					</div>
					
				</div>
				
				<div class="clearfix"></div>
				
				<br>
				
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
	
	
	<br>
	<br>
	<br>
	
	<script type="text/javascript">
	
	var i=0;
	
	var sectionId;
	var subsectionId;
	var activeSectionId;
	var activeSubSectionId;
	
	var parsed_data115 = {};
	var splitted_data =null;
	
	var arr_splitted_data1 = []; 
	var arr_splitted_data1_new = [];
	
	$(document).ready(function() {
	
		$.ajax({
			  type: "GET",
			  url: serverURL + "users/" + userId + "/currSubSection",
			  success: function(data){
		
				  	activeSectionId = data['activeSection'];
					activeSubSectionId = data['activeSubSection'];
					
		
					
					$.ajax({
						  type: "GET",
						  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/check3",
						  success: function(data1){
					
							  	$("#subsection-name").html((activeSectionId-10)+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
								$("#exercise-title").html(data1['exerciseTitle']);
					
							    var arr = data1;
						        exer = '';
								
						        
						        if(activeSectionId==11 && activeSubSectionId==5) {
							  		
							  		var db_data=null;
							  		
									//ajax call to get the data from the database
							  		$.ajax({
										type : "GET",
										url : serverURL + "users/" + userId
												+ "/sections/" + 11 + "/subsections/"
												+ 5 + "/" + "3rdSecdata/1",
												
										contentType : "application/json",
										
										dataType : "json",
										
										success : function(data) {
											
											
											
											if(data!= null){
												$('#submit').addClass("hidden");
												$('#skip').addClass("hidden");
												$('#next').removeClass("hidden");
												
												var data_new = data[0].response;
												
												var str1 = data_new.split(',');
												
												var MultiArray = new Array(3);
												
												
												for(var t=0;t<=str1.length;t++){
													
												MultiArray[t]=new Array(3);
													
												if(t<5){
														
													var str_12 = str1[t].split('_');
													MultiArray[0][t]=str_12[2];
														
												}
													
												} 
												
												
												for (k = 0; k < arr['exerciseDesc'].length; k++) {
													exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
												}
										    
												count = arr['questions'].length;
												minfields=data1['minfields'];
												
												
												MultiArray[0][0] =MultiArray[0][0].replace(/#@@#/g, ",");
												MultiArray[0][1] =MultiArray[0][1].replace(/#@@#/g, ",");
												MultiArray[0][2] =MultiArray[0][2].replace(/#@@#/g, ",");
												MultiArray[0][3] =MultiArray[0][3].replace(/#@@#/g, ",");
												MultiArray[0][4] =MultiArray[0][4].replace(/#@@#/g, ",");
												
												for (j = 0; j < arr['questions'].length; j++) {
													
													
													if(j == 0)
														exer += '<div id="div' + j + '">';
													else
														exer += '<div id="div' + j + '" class="">';
													
													exer +=	'<hr>' +
															'<p>' + arr['questions'][j].ques + '</p>' +
															'<div id="lt'+j+'" class="col-md-8 form-horizontal">';
														
													
														exer +=  	'<div class="form-group">' + 
																			'<textarea type="text" class="bl-11-5-1-1 form-control" value="'+MultiArray[0][0]+'" disabled>'+MultiArray[0][0]+'</textarea><br>'+
																			'<textarea type="text" class="bl-11-5-1-1 form-control" value="'+MultiArray[0][1]+'" disabled>'+MultiArray[0][1]+'</textarea><br>'+
																			'<textarea type="text" class="bl-11-5-1-1 form-control" value="'+MultiArray[0][2]+'" disabled>'+MultiArray[0][2]+'</textarea><br>'+
																			'<textarea type="text" class="bl-11-5-1-1 form-control" value="'+MultiArray[0][3]+'" disabled>'+MultiArray[0][3]+'</textarea><br>'+
																			'<textarea type="text" class="bl-11-5-1-1 form-control" value="'+MultiArray[0][4]+'" disabled>'+MultiArray[0][4]+'</textarea>';
																	'</div>';
													
													cArr.push(k);
													
													
													exer += '</div><div class="clearfix"></div>' +
															'<div class="clearfix"></div></div>';
												}

												$('#exercise').html(exer);
												
											}
											//end of if db_data is not null for section 4.6
											
		
								
								else {//if db_data is null
											
											
								
									for (k = 0; k < arr['exerciseDesc'].length; k++) {
										exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
									}
							    
									count = arr['questions'].length;
									minfields=data1['minfields'];
									
									
									for (j = 0; j < arr['questions'].length; j++) {
										
										if(j == 0)
											exer += '<div id="div' + j + '">';
										else
											exer += '<div id="div' + j + '" class="">';
										
										exer +=	'<hr>' +
												'<p>' + arr['questions'][j].ques + '</p>' +
												'<div id="lt'+j+'" class="col-md-8 form-horizontal">';
											
										for (var k = 0; k < arr['questions'][j]['blanks'].length; k++) {
											exer +=  	'<div class="form-group">' + 
																arr['questions'][j]['blanks'][k] +
														'</div>';
										}
										cArr.push(k);
										
										exer += '</div><div class="clearfix"></div>' +
												'<div class="clearfix"></div></div>';
									}

									$('#exercise').html(exer);
							    	    
							    	   
								}
											
							  	}, //end of success function for db_data
							  	
							  	
							  	error: function() {
							  		alert("Error: server encountered an internal error. Please try again after some time ");
									  
								  } 
							  	
							  	}); //end of ajax call to get the data from the database
									
									
							  	} //end function to retrieve data for 11.5 from database
								
								
								
				          },//end of success function
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
	var filled=0;
	var p_opt = '';
	function checkForEmptyFields()
	{
		formData = '';
		formData1 = {};
		var flag = true; // if empty fields then remains true
		
		for (j = 1; j <= count; j++)	{
			for (k = 1; k <= cArr[j-1]; k++) {
				
				if(		
						$('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val()) {
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
		else {
			
			for (j = 1; j <= count; j++)	{
				
				for (k = 1; k <= cArr[j-1]; k++) {
					
					
					if($('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().includes(",")){
						p_opt = $('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().replace(/,/g, "#@@#");
					}
					else {
						p_opt = $('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val();
					}
					
					formData += j + '_' + k + '_' + p_opt + ',';
					
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
				
				
				formData +=j + '_' + k + '_' + '&';
				$('.bl-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).prop("disabled", "disabled");	
			
			}
		}
		$('#submit').addClass("hidden");
		$('#skip').addClass("hidden");
		$('#next').removeClass("hidden");
		makeThePostCall(formData);
		
	}
	
	//function that makes the POST call
	function makeThePostCall(newData){
		
		
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData)
			console.log(formData);
			
			var Indata = {
					userId : userId,
					section_id : 11,
					sub_section_id : 5,
					version_id : 1,
					response : table3arr1,
					category_id : 'null'
				};
			
			var myJSON = JSON.stringify(Indata);
			//rest call storeing  data type
			
			$.ajax({
				type : "POST",
				url : serverURL + "users/" + userId + "/sections/" + 11
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
	
		
	</script>
</body>
</html>