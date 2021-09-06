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
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="js/values.js"></script>
    <script src="js/inc.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
    <!-- <script src="js/xls.core.min.js"></script>
    <script src="js/externalFiles/xlsx.core.min.js"></script>
    <script src="js/FileSaver.js"></script>
    <script src="js/tableexport.js"></script> -->
    <script src="js/Blob.js"></script>
	
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
    <style>
   @media screen and (max-width: 800px) {
table {width:100%;}
thead {display: none;}
tr:nth-of-type(2n) {background-color: inherit;}
tr td:first-child {background: #FFF59D; font-weight:bold;font-size:1.3em;}
tbody td {display: block;  text-align:center;}
tbody td:before { 
    content: attr(data-th); 
    display: block;
    text-align:center;  
  }
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
					<div id="section6"><h3><b>Learn Self-Compassion</b></h3></div>
						<h3><b id="subsection-name"></b></h3>
						<div class="clearfix"></div>
						<p id="exercise-title" class="text-justify">
						</p>				
						<hr style="border-bottom: 1px solid black;">
						<div id="paragraph" class="text-justify">
						</div>
						<div id="images">
						</div>
						<table id="table" class="table text-center table-hover table-bordered" style="background-color:#FFE0B2;border: 2px solid #FFB74D;">
							<thead id="thead1">
							</thead>
							<tbody id="tbody1">
							</tbody>
						</table>
						<div class="clearfix"></div>
						<button id="submit" class="hidden btn btn-success" onclick="checkForEmptyFields()">Submit</button>	
						<!-- <button id="btnExport" class="btn btn-warning hidden" onclick = "download()">Download</button>-->		
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
				<!-- <div class="col-md-6">
			<button type="button" id="download"
					class="btn btn-warning pull-left " onclick = "download()">Download</button></div>-->
				<div id="next" class="col-md-2 hidden">
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
				<div class="modal-header modal-header-success">
					Feedback
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body text-justify">
					<p id="feedback1" class="hidden">Your pattern of responses indicates that you tend to be unwilling to experience compassion towards yourself. You are perhaps excessively critical and may be even harsh towards yourself. It would be good to practice self-compassion.</p>
					<p id="feedback2" class="hidden">Your pattern of responses suggests that you are around average in terms of being compassionate towards yourself. Fair enough... but there is scope to increase your self-compassion.</p>
					<p id="feedback3" class="hidden">Your pattern of responses indicates that you are above average on self-compassion. You treat yourself gently, without unnecessary self-criticisms. This can help to maintain your well-being.  Keep it Up!  Please remember that self-compassion does not mean ignoring your weakness or denying them... you may choose to work on them without putting yourself down as a whole.</p>
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
		
		var i=0;
		var rows = 0, cols = 0;
		
		var sectionId;
		var subsectionId;
		var activeSectionId;
		var activeSubSectionId;
		
		var parsed_data61 = {};
		
		var splitted_data1 =null;
		var splitted_data2 =null;
		var splitted_data3 =null;
		var splitted_data4 =null;
		var splitted_data5 =null;
		var splitted_data6 =null;
		var splitted_data7 =null;
		var splitted_data8 =null;
		var splitted_data9 =null;
		var splitted_data10 =null;
		var splitted_data11 =null;
		var splitted_data12 =null;
		
		var arr_splitted_data1 = [];
		var arr_splitted_data2 = [];
		var arr_splitted_data3 = [];
		var arr_splitted_data4 = [];
		var arr_splitted_data5 = [];
		var arr_splitted_data6 = [];
		var arr_splitted_data7 = [];
		var arr_splitted_data8 = [];
		var arr_splitted_data9 = [];
		var arr_splitted_data10 = [];
		var arr_splitted_data11 = [];
		var arr_splitted_data12 = [];
		
		var arr_splitted_data1_new = [];
		var arr_splitted_data2_new = [];
		var arr_splitted_data3_new = [];
		var arr_splitted_data4_new = [];
		var arr_splitted_data5_new = [];
		var arr_splitted_data6_new = [];
		var arr_splitted_data7_new = [];
		var arr_splitted_data8_new = [];
		var arr_splitted_data9_new = [];
		var arr_splitted_data10_new = [];
		var arr_splitted_data11_new = [];
		var arr_splitted_data12_new = [];
		var final_db_array = [];
		var first_td_array = [];
		var first_td_array_new = [];
		
		
		function checkForEmptyFields()
		{
			$("#btnExport").removeClass("hidden");
			var flag = false; //set it to true if blanks are empty
			for (j = 1; j <= rows; j++) 
			{
				for (k = 1; k <= cols; k++) 
				{
					if(k == 2)
					{
						if($('.td-'+j+'-'+k).val() == 0) 
						{
							console.log("Select j: " + j + " k: " + k);
							flag = true;
							break;
						}	
						else
						{
							continue;
						}
					}
					else
					{
					
					}					
				
				}
				if(flag == true)
				{
					break;	
				}
				else
				{
					continue;
				}
			}
			
			if(flag == true)
			{
				alert("Please fill all the blanks");	
			}
			else
			{
				submitPractice4();
			}
		}
		
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
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/knowledge",
							  success: function(data1){
					
								  	$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
									
								  	if(data1['exerciseType'] == "NM")
								  		$('#next').removeClass("hidden");
								  	
								  	
								  	var arr = data1['paragraphs'];
								  	var out = '';
								  //begin code to retrieve 4.6 data from database
								  	if((sectionId==6 && subsectionId==1) || (activeSectionId==6 && activeSubSectionId==1)) {
								  		
								  		
								  		
										//ajax call to get the data from the database
								  		$.ajax({
											type : "GET",
											url : serverURL + "users/" + userId
													+ "/sections/" + 6 + "/subsections/"
													+ 1 + "/" + "3rdSecdata/1",
													
											contentType : "application/json",
											
											dataType : "json",
											
											success : function(data) {
												
												arr_splitted_data1 = data;
												
												if(data!= null){
													$("#btnExport").removeClass("hidden");

													var data_new = data[0].response;
													
													var str1 = data_new.split(',');
													
													
													var MultiArray = new Array(3);
													
													for(var t=0;t<=str1.length;t++){
														
														MultiArray[t]=new Array(3);
														
														if(t<=12){
															
															 var str_12 = str1[t].split('_');
															MultiArray[0][t]=str_12[2]; 
														}
															
															
														
													}
													
													arr_splitted_data1_new=MultiArray;

													var arr = data1['paragraphs'];
												  	var out = '';
													  for(i = 0; i < arr.length; i++) {
											    	    	out += '<p>' + arr[i] + '</p>';
														}	
											    	    $('#paragraph').html(out);
											    	   
														arr = data1['table'];
													  	var out = '<tr>';
												    	arr = arr['thead'];
											    	    for(i = 0; i < arr.length; i++) {
										    	    		out += arr[i];
										   	    		}	
											    	    out += '</tr>';
											    	    $('#thead1').html(out);
											    	    
											    	    
													  	arr = data1['table'];
													  	out = '';
													  	arr = arr['tbody'];
													  	
												    	for(i = 0; i < arr.length; i++) {
												    		var tr = arr[i].item;
												    		first_td_array_new.push(arr[i].item[0]);
												    	    out += '<tr>';
												    	    for(j = 0; j <1; j++) {
												    	    	
												    	    	
												    			if(activeSectionId == sectionId)
												    				//out += '<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;"border: 2px solid #FFB74D;">' + tr[j] + '</td>';
											    				
												    				out += '<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border: 1px solid #FFB74D;">' + tr[j] + '</td>'+
																	'<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border: 1px solid #FFB74D;"><select class="td-3-2 form-control" value='+"hi"+' disabled><option value="0">'+MultiArray[0][i]+'</option></select>'+
																	'</td>';
																	
																	
																	
												    				else {
											    					 h = tr[j].indexOf("<input");
																	
																	if(h != -1) {
																		h = h + 6;
																		tr[j] = tr[j].replace(tr[j].slice(h, h+1), " disabled ");
																	}
																	else {
																		h = tr[j].indexOf("<select");
																		if(h != -1)	{
																			h = h + 7;
																			tr[j] = tr[j].replace(tr[j].slice(h, h+1), " disabled ");
																		}
																	} 
																	
																	
																	out += '<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border: 1px solid #FFB74D;">' + tr[j] + '</td>'+
																	'<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border: 1px solid #FFB74D;"><select class="td-3-2 form-control" value='+"hi"+' disabled><option value="0">'+MultiArray[0][i]+'</option></select>'+
																	'</td>';
																
																	
											    				
											    				}
												    			$('#next').removeClass("hidden");
												    			
												    			
													    	}
															
															out += "</tr>"
											    		}	
														total = i;
											    	    $('#tbody1').html(out);
											    	   
													  	arr = data1['images'];
													  	out = '';
											    	    for(i = 0; i < arr.length; i++) {
												        	out += '<img class="img-responsive" src="' + arr[i] + '">';
												    	}	
											    	    $('#images').html(out);
											    	    
											    	    
													
											    	    rows = data1['table']['rows'];
													  	cols = data1['table']['cols'];
													  	
													  	if(rows == 0)
													  		rows = 1;
													  	if(cols == 0)
													  		cols = 1;
													  	
													  	
													  	if(activeSectionId == sectionId) {
													  		if(data == null){
													  		$('#submit').removeClass("hidden");
													  		}else{
													  			$('#submit').addClass("hidden");
													  		}
													  	}
													  	else
													  		$('#next').removeClass("hidden");//end of db_data is null
													
												}
												//end of if db_data is not null for section 4.6
												
			
									
									else {//if db_data is null
												
										var arr = data1['paragraphs'];
									  	var out = '';	
									
										  for(i = 0; i < arr.length; i++) {
								    	    	out += '<p>' + arr[i] + '</p>';
											}	
								    	    $('#paragraph').html(out);
								    	   
											arr = data1['table'];
										  	var out = '<tr>';
									    	arr = arr['thead'];
								    	    for(i = 0; i < arr.length; i++) {
							    	    		out += arr[i];
							   	    		}	
								    	    out += '</tr>';
								    	    $('#thead1').html(out);
								    	    
								    	    
										  	arr = data1['table'];
										  	out = '';
									    	arr = arr['tbody'];
									    	for(i = 0; i < arr.length; i++) {
									    		var tr = arr[i].item;
									    	    out += '<tr>';
									    	    for(j = 0; j < tr.length; j++) {
									    			if(activeSectionId == sectionId)
									    				out += '<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;"border: 2px solid #FFB74D;">' + tr[j] + '</td>';
								    				else {
								    					h = tr[j].indexOf("<input");
														
														if(h != -1) {
															h = h + 6;
															tr[j] = tr[j].replace(tr[j].slice(h, h+1), " disabled ");
														}
														else {
															h = tr[j].indexOf("<select");
															if(h != -1)	{
																h = h + 7;
																tr[j] = tr[j].replace(tr[j].slice(h, h+1), "  ");
																$('#submit').removeClass("hidden");
															}
														}
														out += '<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border: 1px solid #FFB74D;">' + tr[j] + '</td>';
													}
										    	}
												
												out += "</tr>"
								    		}	
											total = i;
								    	    $('#tbody1').html(out);
								    	    
								    	    
										  	arr = data1['images'];
										  	out = '';
								    	    for(i = 0; i < arr.length; i++) {
									        	out += '<img class="img-responsive" src="' + arr[i] + '">';
									    	}	
								    	    $('#images').html(out);
								    	    
								    	    
										
								    	    rows = data1['table']['rows'];
										  	cols = data1['table']['cols'];
										  	
										  	if(rows == 0)
										  		rows = 1;
										  	if(cols == 0)
										  		cols = 1;
										  	
										  	
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
										
										
								  	} //end function to retrieve data for 5.7 from database
								  	<!--end-->
	    	   	
						    	  
							  
								  	
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
		
		var tc = 0;
		var total = 0;
		var formData1 = {};
		var temp_array = [];
		function submitPractice4() {
			
			formData = '';

			for (j = 1; j <= rows; j++) {
				for (k = 1; k <= cols; k++) {
					if($('.td-'+j+'-'+k).val() != null) {
						tc += parseInt($('.td-'+j+'-'+k).val());
						
						formData +=j + '_' + k + '_' + $('.td-'+j+'-'+k).val() + ',';
						
						temp_array.push($('.td-'+j+'-'+k).val());
						$('.td-'+j+'-'+k).prop("disabled", "disabled");
					}	
				}
			}
			
			v = parseFloat(tc)/parseFloat(total);
			
			if(v < 2.5) {
				$('#feedback1').removeClass("hidden");
			}
			else if(v >= 2.5 && v < 3.5) {
				$('#feedback2').removeClass("hidden");
			}
			else if(v >= 3.5 && v <= 5) {
				$('#feedback3').removeClass("hidden");
			}
			
			$('#myModal').modal("show");
			
			
			if((sectionId==6 && subsectionId==1) || (activeSectionId==6 && activeSubSectionId==1)){
	    	    
				
				var section_id;
				var sub_section_id;
				var version_id;
				var response;
				var category_id;
				var table3arr1 = JSON.stringify(formData)
				
				
				var Indata = {
						userId : userId,
						section_id : 6,
						sub_section_id : 1,
						version_id : 1,
						response : table3arr1,
						category_id : 'null'
					};
				
				var myJSON = JSON.stringify(Indata);
				//rest call storeing 6.1 data type
				
				$.ajax({
					type : "POST",
					url : serverURL + "users/" + userId + "/sections/" + 6
							+ "/subsections/" + 1 + "/" + "3rdSecdata/1",
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
		
		function download(){
			
			if(activeSectionId==6 && activeSubSectionId==1){
			
			    var tab_text = '<table border="1px" style="font-size:20px" ">';
			    var textRange; 
			    var j = 0;
			    var tab = document.getElementById('table'); // id of table
			    var lines = tab.rows.length;

			    // the first headline of the table
			    if (lines > 0) {
			        tab_text = tab_text + '<tr bgcolor="#DFDFDF">' + tab.rows[0].innerHTML + '</tr>';
			    }

			    if(arr_splitted_data1==null)
			    	{
			    	if(temp_array.length==0)
			        tab_text = tab_text+
			       				"<tr><td>"+"When I fail at something important to me I become consumed by feelings of inadequacy."+"</td><td></td></tr>"+
			        			"<tr><td>"+"I try to be understanding and patient towards those aspects of my personality I don't like."+"</td><td></td></tr>"+
			        			"<tr><td>"+"When something painful happens I try to take a balanced view of the situation."+"</td><td></td></tr>"+
			        			"<tr><td>"+"When I'm feeling down, I tend to feel like most other people are probably happier than I am."+"</td><td></td></tr>"+
			        			"<tr><td>"+"I try to see my failings as part of the human condition."+"</td><td></td></tr>"+
			        			"<tr><td>"+"When I am going through a very hard time, I give myself the caring and tenderness I need."+"</td><td></td></tr>"+
			        			"<tr><td>"+"When something upsets me I try to keep my emotions in balance."+"</td><td></td></tr>"+
			        			"<tr><td>"+"When I fail at something that's important to me, I tend to feel alone in my failure."+"</td><td></td></tr>"+
			        			"<tr><td>"+"When I am feeling down I tend to obsess and fixate on everything that's wrong."+"</td><td></td></tr>"+
			        			"<tr><td>"+"When I feel inadequate in some way, I try to remind myself that feelings of inadequacy are shared by most people."+"</td><td></td></tr>"+
			        			"<tr><td>"+"I'm disapproving and judgmental about my own flaws and inadequacies."+"</td><td></td></tr>"+
			        			"<tr><td>"+"I'm intolerant and impatient towards those aspects of my personality I don't like."+"</td><td></td></tr>";
			    	
			        			else 
			        				 tab_text = tab_text+
					       				"<tr><td>"+"When I fail at something important to me I become consumed by feelings of inadequacy."+"</td><td>"+temp_array[0]+"</td></tr>"+
					        			"<tr><td>"+"I try to be understanding and patient towards those aspects of my personality I don't like."+"</td><td>"+temp_array[1]+"</td></tr>"+
					        			"<tr><td>"+"When something painful happens I try to take a balanced view of the situation."+"</td><td>"+temp_array[2]+"</td></tr>"+
					        			"<tr><td>"+"When I'm feeling down, I tend to feel like most other people are probably happier than I am."+"</td><td>"+temp_array[3]+"</td></tr>"+
					        			"<tr><td>"+"I try to see my failings as part of the human condition."+"</td><td>"+temp_array[4]+"</td></tr>"+
					        			"<tr><td>"+"When I am going through a very hard time, I give myself the caring and tenderness I need."+"</td><td>"+temp_array[5]+"</td></tr>"+
					        			"<tr><td>"+"When something upsets me I try to keep my emotions in balance."+"</td><td>"+temp_array[6]+"</td></tr>"+
					        			"<tr><td>"+"When I fail at something that's important to me, I tend to feel alone in my failure."+"</td><td>"+temp_array[7]+"</td></tr>"+
					        			"<tr><td>"+"When I am feeling down I tend to obsess and fixate on everything that's wrong."+"</td><td>"+temp_array[8]+"</td></tr>"+
					        			"<tr><td>"+"When I feel inadequate in some way, I try to remind myself that feelings of inadequacy are shared by most people."+"</td><td>"+temp_array[9]+"</td></tr>"+
					        			"<tr><td>"+"I'm disapproving and judgmental about my own flaws and inadequacies."+"</td><td>"+temp_array[10]+"</td></tr>"+
					        			"<tr><td>"+"I'm intolerant and impatient towards those aspects of my personality I don't like."+"</td><td>"+temp_array[11]+"</td></tr>";
					    	
			        				
			    	}		   
			    	else
			    		 tab_text = tab_text +  "<tr><td>"+first_td_array_new[0]+"</td><td>"+arr_splitted_data1_new[0][0]+"</td></tr>"+
			    		 "<tr><td>"+first_td_array_new[1]+"</td><td>"+arr_splitted_data1_new[0][1]+"</td></tr>"+
			    		 "<tr><td>"+first_td_array_new[2]+"</td><td>"+arr_splitted_data1_new[0][2]+"</td></tr>"+
			    		 "<tr><td>"+first_td_array_new[3]+"</td><td>"+arr_splitted_data1_new[0][3]+"</td></tr>"+
			    		 "<tr><td>"+first_td_array_new[4]+"</td><td>"+arr_splitted_data1_new[0][4]+"</td></tr>"+
			    		 "<tr><td>"+first_td_array_new[5]+"</td><td>"+arr_splitted_data1_new[0][5]+"</td></tr>"+
			    		 "<tr><td>"+first_td_array_new[6]+"</td><td>"+arr_splitted_data1_new[0][6]+"</td></tr>"+
			    		 "<tr><td>"+first_td_array_new[7]+"</td><td>"+arr_splitted_data1_new[0][7]+"</td></tr>"+
			    		 "<tr><td>"+first_td_array_new[8]+"</td><td>"+arr_splitted_data1_new[0][8]+"</td></tr>"+
			    		 "<tr><td>"+first_td_array_new[9]+"</td><td>"+arr_splitted_data1_new[0][9]+"</td></tr>"+
			    		 "<tr><td>"+first_td_array_new[10]+"</td><td>"+arr_splitted_data1_new[0][10]+"</td></tr>"+
			    		 "<tr><td>"+first_td_array_new[11]+"</td><td>"+arr_splitted_data1_new[0][11]+"</td></tr>";
		        			
			    		
			   

			    tab_text = tab_text + "</table>";
			    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
			    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
			    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params
			   

			    var ua = window.navigator.userAgent;
			    var msie = ua.indexOf("MSIE "); 

			     // if Internet Explorer
			    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
			        txtArea1.document.open("txt/html","replace");
			        txtArea1.document.write(tab_text);
			        txtArea1.document.close();
			        txtArea1.focus(); 
			        sa = txtArea1.document.execCommand("SaveAs", true, "DataTableExport.xls");
			    }  
			     
			    else // other browser not tested on IE 11
			        sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));  

			    return (sa);
			}
				
		}
	</script>
</body>
</html>