<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	
    <script src="js/TableExport-master/TableExport-master/dist/js/tableexport.js"></script>
    <script src="js/externalFiles/jspdf.min.js"></script>
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
				
				<div class="col-md-2 col-sm-4">
					<img class="img-responsive" alt="" src="images/ss-chkp.jpg">
				</div>
				
				<div class="col-md-10 col-sm-8">
				
					<div class="row">
					
					<div id=""><h3><b>Activate: Baby steps to move ahead</b></h3></div>
						<h3><b id="subsection-name"></b></h3>
						<p id="subsection-desc" class="text-justify"></p>				
						<hr style="border-bottom: 1px solid black;">
						<div class="clearfix"></div>
						<h4 id="exercise-title"  style="font-weight:bold;"></h4>
						<p id="exercise-desc" class="text-justify"></p>
						<div class="col-md-10 text-justify" style="padding-top: 25px;" id="exercise">
						</div>
						
					</div>
					
				</div>
				
				<div class="clearfix"></div>
				
				</div>
				
				<br>
				<div class="clearfix"></div>
				<br>
				
				<div class="row">
				
					<div class="col-md-9">
					</div>
					
					<div id="next" class="col-md-2 hidden">
					</div>
					<!-- 	<button id="download" class="btn btn-warning pull-left" onclick = "download()">Download</button> -->
				
				</div>
				
				<div class="clearfix"></div>
				<br>
				<br>
				<br>
				
			</div>
			
		</div>
		
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="notesModal" role="dialog">
	
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
	
	<br>
	<br>
	<br>

	<script type="text/javascript">
	
	var i=0;
	var sectionId;
	var subsectionId;
	var activeSectionId;
	var activeSubSectionId;
	
	var parsed_data34 = {};
	var array_34 = [];
	var splitted_data1 = [];
	var splitted_data1_new = [];
	var splitted_data1_new_array = [];
	var new_array = 0;
	var new_array1 = [];
	var splitted_data1_new1 = [];
	
	$(document).ready(function() {
	
		$.ajax({
			  type: "GET",
			  url: serverURL + "users/" + userId + "/currSubSection",
			  success: function(data){
		
					sectionId = data['currentSection'];
					subsectionId = data['currentSubSection'];
	
					activeSectionId = data['activeSection'];
					activeSubSectionId = data['activeSubSection'];
					
					callajax();
							
			  },
			  error: function() {
				  alert("Error: server encountered an internal error. Please try again after some time ");
				  
				 
			  } 
		});
	
	});	
	
	//Function to check the Empty Fields
	var formData1 = {};
	var temp_array = [];

	function checkForEmptyFields(c)
	{	
		
		var p ='';
		var flag = false; //set it true if you find a empty flag
		for (k = 1; k <= max; k++){
		
			if($('#f'+k+'_'+c).val()){
				if($('#f'+k+'_'+c).val().includes(",")){
					p = ($('#f'+k+'_'+c).val().replace(/,/g, "#@@#"));
				}
				else {
					p= $('#f'+k+'_'+c).val();
				}
				
				
			
				formData += k+'_'+(c+1)+'_' + p + ',';
				temp_array.push($('#f'+k+'_'+c).val());
				//formData1[k] += $('#f'+k+'_'+c).val() + '#@@#';
			}
			else
			{
				flag = true;
				break;
			}
			
			$('#f'+k+'_'+c).prop("disabled", "disabled");
			
		}
		
		if(flag == true){
		
			alert("Please dont leave the blanks empty");	
		}
		else{
		
			submit(c);
			
		}

	}
	
	function callajax(){
		
		
		
		
		$.ajax({
			  type: "GET",
			  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/check3",
			  success: function(data1){
		
					$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
					$("#exercise-title").html(data1['exerciseTitle']);
			      
			        if(data1['exerciseType'] == "NM")
				  		$('#next').removeClass("hidden");

			        exer = '';
					arr = data1;
					
					
					//begin code to retrieve 3.4 data from database
				  	if((sectionId==3 && subsectionId==4) || (activeSectionId==3 && activeSubSectionId==4)) {
				  		
						//ajax call to get the data from the database
				  		$.ajax({
							type : "GET",
							url : serverURL + "users/" + userId
									+ "/sections/" + 3 + "/subsections/"
									+ 4 + "/" + "3rdSecdata/1",
									
							contentType : "application/json",
							
							dataType : "json",
							
							success : function(data) {
								
								arr_splitted_data1 = data;
								
								if(data!= null){
									var data_new_sp = data[0].response.split('""');
									
									
									var data_new = data_new_sp[0];
									
									var str1 = data_new.split(',');
									
									var MultiArray1 = new Array(3);
									
									for(var t=0;t<(str1.length-1);t++){
										
										MultiArray1[t]=new Array();
										
										if(t<(str1.length-1)){
											
											var str_12 = str1[t].split('_');
											MultiArray1[0][t]=str_12[2];
											
											
										}
									}
									
									var data_new1 = data_new_sp[1];
									
									var str11 = data_new1.split(',');
									
									var MultiArray2 = new Array(3);
									
									for(var k=0;k<(str11.length-1);k++){
										
										MultiArray2[k]=new Array();
										
										if(k<(str11.length-1)){
											
											var str_121 = str11[k].split('_');
											
											MultiArray2[0][k]=str_121[2];
											
											
										}
									}
									
									splitted_data1_new = MultiArray1;
									splitted_data1_new1 = MultiArray2;
									out = '';
									arr = data1;
									
									for (k = 0; k < arr['exerciseDesc'].length; k++) {
										out +=	'<p class="text-justify">' + arr['exerciseDesc'][0] + '</p>';
										
									}
									
									$("#exercise-desc").html(out);
									for (j = 0; j < arr['questions'].length; j++) {
										
									if(j == 0){
									exer += '<div id="div' + j + '">';
									
									
									}else {
											if(activeSectionId == sectionId){
												
												exer += '<div id="div' + j + '">';
												
											}else{	
												exer += '<div id="div' + j + '">';
												
												
											}
											
									}
									var cnt=0;
									if(j==0)
									cnt=MultiArray1[0].length-1;
									else
									cnt=MultiArray2[0].length-1;	
									
										exer +=	'<hr>' +
											'<h5>' + arr['questions'][j].ques + '</h5>' +
											'<div id="lt'+j+'" class="col-md-8 form-horizontal">';
										
										for (var k = 0; k <= cnt; k++) {
											
											//MultiArray1[0][k] = MultiArray1[0][k].replace(/#/g, ",");
											//MultiArray2[0][k] = MultiArray2[0][k].replace(/#/g, ",");
												
										exer +=  	'<div class="form-group input-group">' + 
															'<span class="input-group-addon">' + (k+1) + '.</span>';
										if(sectionId == activeSectionId){
											
											
											if(j==0){
												exer +=			'<textarea type="text" disabled class="form-control" name="input" value='+MultiArray1[0][k]+' disabled>'+MultiArray1[0][k]+'</textarea>';
											}else{
												exer +=			'<textarea type="text" disabled class="form-control" name="input" value='+MultiArray2[0][k]+' disabled>'+MultiArray2[0][k]+'</textarea>';
											}
											
											
											
										}else{
											//MultiArray1[0][k] = MultiArray1[0][k].replace(/#/g, ",");
											//MultiArray2[0][k] = MultiArray2[0][k].replace(/#/g, ",");
										if(j==0){
											exer +=			'<textarea type="text" disabled class="form-control" name="input" value='+MultiArray1[0][k]+' disabled>'+MultiArray1[0][k]+'</textarea>';
										}else{
											exer +=			'<textarea type="text" disabled class="form-control" name="input" value='+MultiArray2[0][k]+' disabled>'+MultiArray2[0][k]+'</textarea>';
										}
										
										}
										exer +=	'</div>';
										
										}
											
										
									exer += '</div><div class="clearfix"></div>';
										
									}
										
										
										
										if(sectionId == activeSectionId) {
											
											exer +=	'<div class="col-md-8">' +
														'<span id="err' + j + '" class="hidden">Please fill atleast 5 activities</span>' +
														'<div class="form-group">' + 
															'<button id="download" class="btn btn-warning" onclick = "download()">Download</button>'+
														'</div>' + 
													'</div><div class="clearfix"></div>';
										}else{
											exer +=	'<div class="col-md-8">' +
											'<span id="err' + j + '" class="hidden">Please fill atleast 5 activities</span>' +
											'<div class="form-group">' + 
												'<button id="download" class="btn btn-warning" onclick = "download()">Download</button>'+
											'</div>' + 
										'</div><div class="clearfix"></div>';
										
											}
										
										
										exer += '</div>';
									

									
									$('#exercise').html(exer);
									
				    				$('#next').removeClass("hidden");
							  		$('#skip').addClass("hidden");	
							  		
							  		
									if(sectionId != activeSectionId)
										$('#next').removeClass("hidden");
											
										}
								//end of if db_data is not null for section 3.4
								

					
					else { //if db_data is null
						
						 	exer = '';
							arr = data1;
							out = '';
							
							for (k = 0; k < arr['exerciseDesc'].length; k++) {
								out +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
							}
							
							$("#exercise-desc").html(out);
					    	
							for (j = 0; j < arr['questions'].length; j++) {
								
							if(j == 0)
								exer += '<div id="div' + j + '">';
								else {
									
									if(activeSectionId == sectionId){
										
										exer += '<div id="div' + j + '" class="hidden">'; 
									}else if(sectionId < 3){
										exer += '<div id="div' + j + '" class="hidden">'; 
											
										}
									 else
										 
										exer += '<div id="div' + j + '">'; 
								}
									
								
								exer +=	'<hr>' +
										'<h5>' + arr['questions'][j].ques + '</h5>' +
										'<div id="lt'+j+'" class="col-md-8 form-horizontal">';
									
								for (var k = 1; k <= arr['questions'][j]['blanks'].length; k++) {
									exer +=  	'<div class="form-group input-group">' + 
														'<span class="input-group-addon">' + k + '.</span>';
									if(sectionId == activeSectionId)					
										exer +=			'<input id="f' + k + '_' + j + '" autocomplete="off" type="text" class="form-control" name="input" />';
									else
										exer +=			'<input id="f' + k + '_' + j + '" autocomplete="off" type="text" class="form-control" name="input" />';
										//exer +=			'<input type="text" disabled class="form-control" name="input">';
									
									exer +=	'</div>';
									
								}
								
								exer += '</div><div class="clearfix"></div>';
								
								 if(sectionId == activeSectionId) {
									 
									exer +=	'<div class="col-md-8">' +
												'<span id="err' + j + '" class="hidden">Please fill atleast 5 activities</span>' +
												'<div class="form-group" id="new_div'+j+'">' + 
													'<button type="button" id="addInputs' + j + '" onclick="add(`' + k + '_' + j + '`)" class="btn btn-primary">Add More ...</button>' +
													'<button id="download' + j + '" class="btn btn-warning hidden" onclick = "download()">Download</button>'+ 
													'<button type="button" id="submit' + j + '" onclick="checkForEmptyFields(' + j + ')" class="btn btn-success pull-right">Submit</button>' +
												'</div>' + 
											'</div><div class="clearfix"></div>';
								}else if(sectionId < 3){
									
									exer +=	'<div class="col-md-8">' +
									'<span id="err' + j + '" class="hidden">Please fill atleast 5 activities</span>' +
									'<div class="form-group" id="new_div'+j+'">' + 
										'<button type="button" id="addInputs' + j + '" onclick="add(`' + k + '_' + j + '`)" class="btn btn-primary">Add More ...</button>' +
										'<button id="download' + j + '" class="btn btn-warning hidden" onclick = "download()">Download</button>'+ 
										'<button type="button" id="submit' + j + '" onclick="checkForEmptyFields(' + j + ')" class="btn btn-success pull-right">Submit</button>' +
									'</div>' + 
								'</div><div class="clearfix"></div>';
									
								}
								exer += '</div>';
							}

							
							$('#exercise').html(exer);
				
							if(sectionId != activeSectionId)
								$('#next').removeClass("hidden");
							
					} //end of db_data is null
					
								
				  	}, //end of success function for db_data
				  	
				  	
				  	error: function() {
				  		alert("Error: server encountered an internal error. Please try again after some time ");
						
					  } 
				  	
				  	}); //end of ajax call to get the data from the database
						
						
				  	} //end function to retrieve data for 3.4 from database
					
					
	          },
			  error: function() {
				  alert("Error: server encountered an internal error. Please try again after some time ");
				 
			  } 
		});
	}
	
	var max = 1;
	
	function add(c){
		
		var arr = c.split('_');
		$('#err'+arr[1]).addClass('hidden');
		
		var flag = true;
		
		for(l=1; l<=max; l++) {
			
			if($('#f'+l).val() == "") {
				
				$("#err"+arr[1]).css('color','red');
				$('#err'+arr[1]).removeClass('hidden');
				flag = false;
			}	
		}
		
		if(flag == true) {
			
			var field = '<div class="form-group input-group">' + 
							'<span class="input-group-addon">' + arr[0] + '.</span>' + 
							'<input id="f' + arr[0] + '_' + arr[1] + '" autocomplete="off" type="text" class="form-control" name="input" />' +
						'</div>';
						
			$('#lt'+arr[1]).append(field);
			arr[0]++;
			$('#addInputs'+arr[1]).attr('onclick', 'add("' + arr[0] + '_' + arr[1] + '")');
			max = arr[0] - 1;
		}
	}
	
	var version = 0;
	
	function submit(c) {
		if(c==1){
		$('#download'+1).removeClass('hidden');
		}
		
		formData = '';
		var p= '';
		 for (k = 1; k <= max; k++) {
			 
			if($('#f'+k+'_'+c).val() != null) {
				if($('#f'+k+'_'+c).val().includes(",")){
					
					p = $('#f'+k+'_'+c).val().replace(/,/g, "#@@#");
				}
				else {
					p= $('#f'+k+'_'+c).val();
				}
				
				
				formData +=  k+'_'+(c+1)+'_' + p + ',';
				temp_array.push($('#f'+k+'_'+c).val());
				
			}
			
			$('#f'+k+'_'+c).prop("disabled", "disabled");
			
		} 
		
		if(c == 0)
			str = "/new";
		else
			str = "/continue/" + version;
		
		
	if((sectionId==3 && subsectionId==4) || (activeSectionId==3 && activeSubSectionId==4)){
    	    
			
			var sec_idfy='';
			
			if((c+1) == 1){
				sec_idfy='2a';
				
			}else{
				sec_idfy='2b';
			}
			
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData)
			
			
			
			
			var Indata = {
					userId : userId,
					section_id : 3,
					sub_section_id : 4,
					version_id : 1,
					response : table3arr1,
					category_id : sec_idfy
				};
			
			var myJSON = JSON.stringify(Indata);
			
			if(sec_idfy == '2a'){
				
				sessionStorage.setItem("2a34Data", myJSON);
			}
			var myjson2a = sessionStorage.getItem("2a34Data");
			//rest call storeing 3.4 data type
			
			
			if(sec_idfy == '2a'){
				
				
				$('#addInputs'+c).addClass("hidden");
				$('#submit'+c).addClass("hidden");
				c++;
				$('#div'+c).removeClass("hidden");
				max = 1;
				if(c == 2)
				$('#next').removeClass("hidden");
				
			}else{
				
						//newMyJson=sessionStorage.getItem("2a34Data");
						
						$.ajax({
							type : "POST",
							url : serverURL + "users/" + userId + "/sections/" + 3
									+ "/subsections/" + 4 + "/" + "3rdSecdata/1",
							data : myjson2a,
							contentType : "application/json",
							dataType : "json",
							
							success : function(data) {
								
								$.ajax({
									type : "POST",
									url : serverURL + "users/" + userId + "/sections/" + 3
											+ "/subsections/" + 4 + "/" + "3rdSecdata/1",
									data : myJSON,
									contentType : "application/json",
									dataType : "json",
									
									success : function(data) {
										 
										$('#addInputs'+c).addClass("hidden");
										$('#submit'+c).addClass("hidden");
										c++;
										$('#div'+c).removeClass("hidden");
										max = 1;
										if(c == 2)
										$('#next').removeClass("hidden");
									},
									
									error : function() {
										alert("Error: server encountered an internal error. Please try again after some time ");
										
									}
								});
								
							},
							
							error : function() {
								alert("Error: server encountered an internal error. Please try again after some time ");
								
							}
						});
						
						
						
					
			
			} //end else
			
			
	    	
		}
		
	
		
	}
	
	var x1,x2,x3,x4,x5,x6,x7,x8,x9,x10;
	function download(){
	 	var tab_text = '<table id="table245">';
	    var textRange; 
	    var j = 0;
	    
	    if(typeof($('#f'+1+'_'+0).val())==="undefined")
			 x1 = " ";
			else 
				 x1 =$('#f'+1+'_'+0).val();
		
		if(typeof($('#f'+2+'_'+0).val())==="undefined")
			 x2 = " ";
			else 
				 x2 =$('#f'+2+'_'+0).val();
		
		if(typeof($('#f'+3+'_'+0).val())==="undefined")
		 x3 = " ";
			else 
				 x3 =$('#f'+3+'_'+0).val();
		
		if(typeof($('#f'+4+'_'+0).val())==="undefined")
		 x4 = " ";
		else 
			 x4 =$('#f'+4+'_'+0).val();
		
		if(typeof($('#f'+5+'_'+0).val())==="undefined")
			 x5 = " ";
			else 
				 x5 =$('#f'+5+'_'+0).val();
		

		if(typeof($('#f'+1+'_'+1).val())==="undefined")
			 x6 = " ";
			else 
				 x6 =$('#f'+1+'_'+1).val();
		
		if(typeof($('#f'+2+'_'+1).val())==="undefined")
			x7 = " ";
			else 
				 x7 =$('#f'+2+'_'+1).val();
		
		if(typeof($('#f'+3+'_'+1).val())==="undefined")
			 x8 = " ";
			else 
				 x8 =$('#f'+3+'_'+1).val();
		
		if(typeof($('#f'+4+'_'+1).val())==="undefined")
		 x9 = " ";
		else 
			 x9 =$('#f'+4+'_'+1).val();
		
		if(typeof($('#f'+5+'_'+1).val())==="undefined")
			 x10 = " ";
			else 
				 x10 =$('#f'+5+'_'+1).val();
		
		 if(arr_splitted_data1== null){
        		
	        	if(temp_array.length==0){
		
		 tab_text = tab_text + "<tr><td>" +"Are you likely to face some difficulties in implementing this plan? List some out."+"</td><td>"+"Now list out strategies that you can use to manage these difficulties"+"</td></tr>"+
	        "<tr><td></td><td></td></tr>"+
	        "<tr><td></td><td></td></tr>"+
	        "<tr><td></td><td></td></tr>"+
	        "<tr><td></td><td></td></tr>"+
	        "<tr><td></td><td></td></tr>";
	        	}else{
	        		 tab_text = tab_text + "<tr><td>" +"Are you likely to face some difficulties in implementing this plan? List some out."+"</td><td>"+"Now list out strategies that you can use to manage these difficulties"+"</td></tr>"+
	 		        "<tr><td>"+x1+"</td><td>"+x6+"</td></tr>"+
	 		        "<tr><td>"+x2+"</td><td>"+x7+"</td></tr>"+
	 		        "<tr><td>"+x3+"</td><td>"+x8+"</td></tr>"+
	 		        "<tr><td>"+x4+"</td><td>"+x9+"</td></tr>"+
	 		        "<tr><td>"+x5+"</td><td>"+x10+"</td></tr>";
	        		
	        	}
		 }else {
			 if(splitted_data1_new[0].length==1)
        		x1= splitted_data1_new[0][0];
        		 else if(splitted_data1_new[0].length==2){
        			x1= splitted_data1_new[0][0];
        			x2=splitted_data1_new[0][1];
        		 }else if(splitted_data1_new[0].length==3){
        			x1= splitted_data1_new[0][0];
        			x2= splitted_data1_new[0][1];
        			x3= splitted_data1_new[0][2];
        			 
        		 }else if(splitted_data1_new[0].length==4){
        			x1= splitted_data1_new[0][0];
        			x2= splitted_data1_new[0][1];
        			x3=splitted_data1_new[0][2];
        			x4= splitted_data1_new[0][3];
        			 
        		 } else if(splitted_data1_new[0].length==5){
        			x1= splitted_data1_new[0][0];
        			x2= splitted_data1_new[0][1];
        			x3= splitted_data1_new[0][2];
        			x4= splitted_data1_new[0][3];
        			x5= splitted_data1_new[0][4];
        			
        		 }
			 
			 if(splitted_data1_new1[0].length==1){
	        		 x6= splitted_data1_new1[0][0];
	        		 }else if(splitted_data1_new1[0].length==2){
	        		 x6= splitted_data1_new1[0][0];
	        		 x7= splitted_data1_new1[0][1];
	        		 }else if(splitted_data1_new1[0].length==3){
	        		 x6= splitted_data1_new1[0][0];
	        		 x7= splitted_data1_new1[0][1];
	        		 x8= splitted_data1_new1[0][2];
        			 
        		 }else if(splitted_data1_new1[0].length==4){
        			 x6= splitted_data1_new1[0][0];
        			 x7=splitted_data1_new1[0][1];
        			 x8= splitted_data1_new1[0][2];
        			 x9= splitted_data1_new1[0][3];
        			 
        		 } else if(splitted_data1_new1[0].length==5){
        			 x6= splitted_data1_new1[0][0];
        			 x7= splitted_data1_new1[0][1];
        			 x8= splitted_data1_new1[0][2];
        			 x9= splitted_data1_new1[0][3];
        			 x10= splitted_data1_new1[0][4];
        			
        		 }
			 tab_text = tab_text + "<tr><td>" +"Are you likely to face some difficulties in implementing this plan? List some out."+"</td><td>"+"Now list out strategies that you can use to manage these difficulties"+"</td></tr>"+
		        "<tr><td>"+x1+"</td><td>"+x6+"</td></tr>"+
		        "<tr><td>"+x2+"</td><td>"+x7+"</td></tr>"+
		        "<tr><td>"+x3+"</td><td>"+x8+"</td></tr>"+
		        "<tr><td>"+x4+"</td><td>"+x9+"</td></tr>"+
		        "<tr><td>"+x5+"</td><td>"+x10+"</td></tr>";
			 
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