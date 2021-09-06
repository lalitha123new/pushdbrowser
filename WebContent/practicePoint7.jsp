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
					<div class="hidden" id="section7"><h3><b>Strengthen Self-Soothing skills</b></h3></div>
					
						<h3><b id="subsection-name"></b></h3>
						
						<div class="clearfix"></div>
						
						<p id="exercise-title" class="text-justify" style="font-size:16px;">
						</p>
										
						<hr style="border-bottom: 1px solid black;">
						
						<div id="paragraph" class="text-justify">
						</div>
						
						<div id="images">
						</div>
						
						<div id = "table_div">
						
						<table id="table" class="table text-center table-hover table-bordered" style="background-color:#FFE0B2;border: 2px solid #FFB74D;">
							
							<thead id="thead1">
							</thead>
							
							<tbody id="tbody1">
							</tbody>
							
						</table>
						
						</div>
						<iframe id="txtArea1" style="display:none"></iframe>
						<div class="clearfix"></div>
						
						<p style="text-align:center;font-weight:bold;">This table is available in workbook to edit.</p>
						
						<button id="submit" class="hidden btn btn-success" onclick="checkForEmptyFields()">Submit</button>
						<button id="btnExport" class="btn btn-warning hidden" onclick = "download()">Download</button>	
						<button id="skip" class="hidden btn btn-primary" onclick="skip()">Skip</button>	
						
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
	
	<div class="clearfix"></div>
	
	<br>
	<br>
	<br>
	
	
	
	<script type="text/javascript">
		
		var i=0;
		var rows = 0, cols = 0;
		var minfields=0;
		
		var parsed_data46 = {};
		var parsed_data58 = {};
		var splitted_data =null;
		var splitted_data1 = null;
		var splitted_data2 = null;
		var splitted_data3 = null;
		var splitted_data4 = null;
		var splitted_data5 = null;
		var splitted_data6 = null;
		
		var arr_splitted_data1 = [];
		var arr_splitted_data1_new = [];
		var arr_splitted_data2 = [];
		var arr_splitted_data2_new = [];
		var arr_splitted_data3 = [];
		var arr_splitted_data3_new = [];
		var arr_splitted_data4 = [];
		var arr_splitted_data4_new = [];
		var arr_splitted_data5 = [];
		var arr_splitted_data5_new = [];
		var arr_splitted_data6 = [];
		var arr_splitted_data6_new = [];
		
		
		function skip() {
			
			for (j = 1; j <= rows; j++) 
			{
				for (k = 1; k <= cols; k++) 
				{
					
					formData +=j + '_' + k + '_' + ',';
					
					$('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).prop("disabled", "disabled");
				}
			}
			
			submitPractice7();
			$('#next').removeClass("hidden");
		}
		
		
		
		
		var formData1 = {};
		var temp_array = [];
		var multi_temp_array = new Array(3);
		function checkForEmptyFields()
		{
			
			
			var flag = true; //remains true if cols are empty
			var	flag1 = true ;//remains true if rows are empty
			
			var filledrow=0;
			for (j = 1; j <= rows; j++) 
			{	
				
				var filledcol=0;
				
				for (k = 1; k <= cols; k++) 
				{
					
					if($('#td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k+'>select').hasClass('td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k))  //checking if the drop down is selected or not
					{
						
						if($('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val() == 0)
						{
							
							
							filledcol++;
							continue;
						}
						else
						{	
							filledcol++;
							
							continue;
						}
					}
					else
					{
						if($('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val()) 
						{
							filledcol++;
							if(filledcol>=cols)
								{flag=false;filledrow++;}
						}	
						
					}
				}	//	for k
				
				
			}
			if(flag==false && filledrow >= minfields)
				flag1=false;
			
			if(flag1 == true)
			{	
				if(minfields==1)
				alert("Please fill at least one row");
				else
				alert("please fill atleast "+minfields+" rows");
			}
			else
			{
				$("#btnExport").removeClass("hidden");
				formData = '';
				
				r = 1;
				for (j = 1; j <= rows; j++) {
					
					flag = false;
					
					for (k = 1; k <= cols; k++) {
						var p='';
						if($('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val() != null ) {
							
							if($('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().includes(",")){
								p = ($('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().replace(/,/g, "#@@#"));
							}
							else {
								p= $('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val();
							}
							
							
							
							formData +=r + '_' + k + '_' + p + ',';
							temp_array.push($('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val());
							
							
							flag = true;
							
						}
						
						$('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).prop("disabled", "disabled");
					}
					
					
					
					if(flag == true)
						r++;
				}
				submitPractice7();
			}
		}
		
		
		
		var arr_thead = [];
		var sectionId;
		var subsectionId;
		var activeSectionId;
		var activeSubSectionId;
		
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
									
								 	
								
								  	
								  	var arr = data1['paragraphs'];
								  	var out = '';
								    
								  	//begin code to retrieve 4.6 data from database
								  	if((sectionId==4 && subsectionId==6) || (activeSectionId==4 && activeSubSectionId==6)) {
   		    	    
								  		$("#section4").removeClass("hidden");
								  		
									
									//ajax call to get the data from the database
			
								$.ajax({
									type : "GET",
									url : serverURL + "users/" + userId
											+ "/sections/" + 4 + "/subsections/"
											+ 6 + "/" + "3rdSecdata/1",
											
									contentType : "application/json",
									
									dataType : "json",
									
									success : function(data) {
										
										arr_splitted_data1 = data;
										
										if(data!= null){
											$("#btnExport").removeClass("hidden");
											var arr = data1['paragraphs'];
										  	var out = '';
										  	
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
													
												}else if(9<t && t<=14){
													
                                                    var str_12 = str1[t].split('_');
													MultiArray[2][t-10]=str_12[2];
													
												}else if(14<t && t<=19){
													
													var str_12 = str1[t].split('_');

													MultiArray[3][t-15]=str_12[2];
													
												}
											
												
												
											}
											
											
											arr_splitted_data1_new = MultiArray;
											
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
									    			
									    			MultiArray[i][j] = MultiArray[i][j].replace(/#@@#/g, ",");
									    			
									    			if(activeSectionId == sectionId)
									    				out += '<td id="td-'+activeSectionId+'-'+activeSubSectionId+'-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;"><textarea type="text" class=" form-control" value="'+ MultiArray[i][j] +' " disabled>'+ MultiArray[i][j] +'</textarea>'+
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
														out += '<td id="td-'+activeSectionId+'-'+activeSubSectionId+'-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;"><textarea type="text" class=" form-control" value="'+ MultiArray[i][j] +' " disabled>'+ MultiArray[i][j] +'</textarea>'+'</td>';
													}
										    	}
												out += "</tr>"
								    		}	
								    	    $('#tbody1').html(out);
								    	    $('#table').prepend('<tr><td style="border:1px solid #FFB74D;">e.g.Someone did not reply to my mail</td><td style="border:1px solid #FFB74D;">nervous (90% strong)</td><td style="border:1px solid #FFB74D;">Oh  it means he  is going to reject my proposal</td><td style="border:1px solid #FFB74D;">jumping to conclusion</td><td style="border:1px solid #FFB74D;">may be he is travelling and not seen it or he is thinking  how the proposal  can be improved  there could be many reasons- felt less nervous (50%)</td></tr>');
								    	   
										  	arr = data1['images'];
										  	out = '';
								    	    for(i = 0; i < arr.length; i++) {
									        	out += '<img class="img-responsive" src="' + arr[i] + '">';
									    	}	
								    	    $('#images').html(out);
								    	    
								    	   
										
								    	    rows = data1['table']['rows'];
										  	cols = data1['table']['cols'];
										  	minfields=data1['minfields'];
										  	if(rows == 0)
										  		rows = 1;
										  	if(cols == 0)
										  		cols = 1;
										  	
										  	
										  	if(activeSectionId == sectionId) {
										  		$('#submit').removeClass("hidden");
										  		$('#skip').removeClass("hidden");
										  	}
										  	else
										  		$('#next').removeClass("hidden");
										
						    				$('#submit').addClass("hidden");
						    				$('#next').removeClass("hidden");
									  		$('#skip').addClass("hidden");
						    				
						    				
						    				
						    				
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
									    				out += '<td id="td-'+activeSectionId+'-'+activeSubSectionId+'-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">' + tr[j] + '</td>';
								    				else {
								    					h = tr[j].indexOf("<input");
														
														if(h != -1) {
															h = h + 6;
															tr[j] = tr[j].replace(tr[j].slice(h, h+1), "  ");
														}
														else {
															h = tr[j].indexOf("<select");
															if(h != -1)	{
																h = h + 7;
																tr[j] = tr[j].replace(tr[j].slice(h, h+1), "  ");
															}
														}
														out += '<td id="td-'+activeSectionId+'-'+activeSubSectionId+'-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">' + tr[j] + '</td>';
													}
										    	}
												out += "</tr>"
								    		}	
								    	    $('#tbody1').html(out);
								    	    $('#table').prepend('<tr><td style="border:1px solid #FFB74D;">e.g.Someone did not reply to my mail</td><td style="border:1px solid #FFB74D;">nervous (90% strong)</td><td style="border:1px solid #FFB74D;">Oh  it means he  is going to reject my proposal</td><td style="border:1px solid #FFB74D;">jumping to conclusion</td><td style="border:1px solid #FFB74D;">may be he is travelling and not seen it or he is thinking  how the proposal  can be improved  there could be many reasons- felt less nervous (50%)</td></tr>');
								    	   
										  	arr = data1['images'];
										  	out = '';
								    	    for(i = 0; i < arr.length; i++) {
									        	out += '<img class="img-responsive" src="' + arr[i] + '">';
									    	}	
								    	    $('#images').html(out);
								    	    
								    	    /*******************************/
										
								    	    rows = data1['table']['rows'];
										  	cols = data1['table']['cols'];
										  	minfields=data1['minfields'];
										  	if(rows == 0)
										  		rows = 1;
										  	if(cols == 0)
										  		cols = 1;
										 
										  	
										  	if(activeSectionId == sectionId) {
										  		$('#submit').removeClass("hidden");
										  		$('#skip').removeClass("hidden");
										  	}
										  	else{
										  		$('#submit').removeClass("hidden");
										  		$('#skip').removeClass("hidden");
										  		
										  		
										  	}
										  	$('#next').removeClass("hidden");
										
										}
									},
									 error: function() {
										 
										 alert("Error: server encountered an internal error. Please try again after some time ");
										  
									  } 
									
									});
									
									
								  	}//end of if for section 4.6
								  	
								  	else if((sectionId==5 && subsectionId==8) || (activeSectionId==5 && activeSubSectionId==8)) {
					   		    	    
										
										
								  		$("#section5").removeClass("hidden");
								  		
									$.ajax({
										type : "GET",
										url : serverURL + "users/" + userId
												+ "/sections/" + 5 + "/subsections/"
												+ 8 + "/" + "3rdSecdata/1",
												
										contentType : "application/json",
										
										dataType : "json",
										
										success : function(data) {
											arr_splitted_data1=data;
											
											
											if(data!= null){
												$("#btnExport").removeClass("hidden");
												
												var arr = data1;
										        exer = '';
												
												var data_new = data[0].response;
												
												var str1 = data_new.split(',');
												
												var MultiArray = new Array(3);
												
												 for(var t=0;t<=str1.length;t++){
													
													MultiArray[t]=new Array(3);
													
													if(t<=2){
														
														var str_12 = str1[t].split('_');
														MultiArray[0][t]=str_12[2];
														
														
													}else if(2<t && t<=5){
														
														var str_12 = str1[t].split('_');
														MultiArray[1][t-3]=str_12[2];
														
													}else if(5<t && t<=8){
														
	                                                    var str_12 = str1[t].split('_');
														MultiArray[2][t-6]=str_12[2];
														
													} else if(8<t && t<=11){
														
	                                                    var str_12 = str1[t].split('_');
														MultiArray[3][t-9]=str_12[2];
														
													}  
													
												
													
													
												}
												
												arr_splitted_data1_new =MultiArray; 
												
												
												
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
											    			MultiArray[i][j] = MultiArray[i][j].replace(/#@@#/g, ",");
											    			if(activeSectionId == sectionId)
											    				out += '<td id="td-'+activeSectionId+'-'+activeSubSectionId+'-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;"><textarea type="text" class=" form-control" value="'+ MultiArray[i][j] +' " disabled>'+ MultiArray[i][j] +'</textarea>'+'</td>';
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
																out += '<td id="td-'+activeSectionId+'-'+activeSubSectionId+'-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;"><textarea type="text" class=" form-control" value="'+ MultiArray[i][j] +' " disabled>'+ MultiArray[i][j] +'</textarea>'+'</td>';
															}
												    	}
														out += "</tr>"
										    		}	
										    	    $('#tbody1').html(out);
										    	   
												  	arr = data1['images'];
												  	out = '';
										    	    for(i = 0; i < arr.length; i++) {
											        	out += '<img class="img-responsive" src="' + arr[i] + '">';
											    	}	
										    	    $('#images').html(out);
										    	    
										    	    /*******************************/
												
										    	    rows = data1['table']['rows'];
												  	cols = data1['table']['cols'];
												  	minfields=data1['minfields'];
												  	if(rows == 0)
												  		rows = 1;
												  	if(cols == 0)
												  		cols = 1;
												  	
												  	
												  	if(activeSectionId == sectionId) {
												  		$('#submit').removeClass("hidden");
												  		$('#skip').removeClass("hidden");
												  	}
												  	else
												  		$('#next').removeClass("hidden");
												
												
							    				$('#submit').addClass("hidden");
							    				$('#next').removeClass("hidden");
										  		$('#skip').addClass("hidden");
										  		
							    				
							    				
											}
											//end of if db_data is not null for section 4.6
											
											else {//if db_data is null
												var arr = data1;
										        exer = '';
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
										    				out += '<td id="td-'+activeSectionId+'-'+activeSubSectionId+'-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">' + tr[j] + '</td>';
									    				else {
									    					h = tr[j].indexOf("<input");
															
															if(h != -1) {
																h = h + 6;
																tr[j] = tr[j].replace(tr[j].slice(h, h+1), "  ");
																$('#submit').removeClass("hidden");
															}
															else {
																h = tr[j].indexOf("<select");
																if(h != -1)	{
																	h = h + 7;
																	tr[j] = tr[j].replace(tr[j].slice(h, h+1), "  ");
																}
															}
															out += '<td id="td-'+activeSectionId+'-'+activeSubSectionId+'-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">' + tr[j] + '</td>';
														}
											    	}
													out += "</tr>"
									    		}	
									    	    $('#tbody1').html(out);
									    	   
									    	    
											  	arr = data1['images'];
											  	out = '';
									    	    for(i = 0; i < arr.length; i++) {
										        	out += '<img class="img-responsive" src="' + arr[i] + '">';
										    	}	
									    	    $('#images').html(out);
									    	    
									    	    
											
									    	    rows = data1['table']['rows'];
											  	cols = data1['table']['cols'];
											  	minfields=data1['minfields'];
											  	if(rows == 0)
											  		rows = 1;
											  	if(cols == 0)
											  		cols = 1;
											  
											  	
											  	if(activeSectionId == sectionId) {
											  		$('#submit').removeClass("hidden");
											  		$('#skip').removeClass("hidden");
											  	}
											  	else
											  		$('#next').removeClass("hidden");
											
											}
										},
										 error: function() {
											 
											 alert("Error: server encountered an internal error. Please try again after some time ");
											  
										  } 
										
										});
										
										
									  	}
								  	//end of if for 5.8
								  	
								  	
								  	else if((sectionId==7 && subsectionId==5) || (activeSectionId==7 && activeSubSectionId==5)) {
					   		    	    
								  		$("#section7").removeClass("hidden");
										
										//ajax call to get the data from the database
				
									$.ajax({
										type : "GET",
										url : serverURL + "users/" + userId
												+ "/sections/" + 7 + "/subsections/"
												+ 5 + "/" + "3rdSecdata/1",
												
										contentType : "application/json",
										
										dataType : "json",
										
										success : function(data) {
											
											arr_splitted_data1=data;
											
											if(data!= null){
												$("#btnExport").removeClass("hidden");
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
														
													}else if(9<t && t<=14){
														
	                                                    var str_12 = str1[t].split('_');
														MultiArray[2][t-10]=str_12[2];
														
													}else if(14<t && t<=19){
														
														var str_12 = str1[t].split('_');

														MultiArray[3][t-15]=str_12[2];
														
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
										    	    out += '<tr>';
										    		for(j = 0; j < tr.length; j++) {
										    			MultiArray[i][j] = MultiArray[i][j].replace(/#@@#/g, ",");
										    			if(activeSectionId == sectionId)
										    				out += '<td id="td-'+activeSectionId+'-'+activeSubSectionId+'-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;"><textarea type="text" class=" form-control" value="'+ MultiArray[i][j] +' " disabled>'+ MultiArray[i][j] +'</textarea></td>';
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
															out += '<td id="td-'+activeSectionId+'-'+activeSubSectionId+'-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;"><textarea type="text" class=" form-control" value="'+ MultiArray[i][j] +' " disabled>'+ MultiArray[i][j] +'</textarea></td>';
														}
											    	}
													out += "</tr>"
									    		}	
									    	    $('#tbody1').html(out);
									    	   
									    	    
											  	arr = data1['images'];
											  	out = '';
									    	    for(i = 0; i < arr.length; i++) {
										        	out += '<img class="img-responsive" src="' + arr[i] + '">';
										    	}	
									    	    $('#images').html(out);
									    	    
											
									    	    rows = data1['table']['rows'];
											  	cols = data1['table']['cols'];
											  	minfields=data1['minfields'];
											  	if(rows == 0)
											  		rows = 1;
											  	if(cols == 0)
											  		cols = 1;
											  	
											  	
											  	if(activeSectionId == sectionId) {
											  		$('#submit').removeClass("hidden");
											  		$('#skip').removeClass("hidden");
											  	}
											  	else
											  		$('#next').removeClass("hidden");
											
												
							    				$('#submit').addClass("hidden");
							    				$('#next').removeClass("hidden");
										  		$('#skip').addClass("hidden");
										  		
							    				
							    				
							    				
							    				
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
										    				out += '<td id="td-'+activeSectionId+'-'+activeSubSectionId+'-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">' + tr[j] + '</td>';
									    				else {
									    					h = tr[j].indexOf("<input");
															
															if(h != -1) {
																h = h + 6;
																tr[j] = tr[j].replace(tr[j].slice(h, h+1), "  ");
																$('#submit').removeClass("hidden");
														  		$('#skip').removeClass("hidden");
															}
															else {
																h = tr[j].indexOf("<select");
																if(h != -1)	{
																	h = h + 7;
																	tr[j] = tr[j].replace(tr[j].slice(h, h+1), "  ");
																	$('#submit').removeClass("hidden");
															  		$('#skip').removeClass("hidden");
																}
															}
															out += '<td id="td-'+activeSectionId+'-'+activeSubSectionId+'-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">' + tr[j] + '</td>';
														}
											    	}
													out += "</tr>"
									    		}	
									    	    $('#tbody1').html(out);
									    	   
									    	    
											  	arr = data1['images'];
											  	out = '';
									    	    for(i = 0; i < arr.length; i++) {
										        	out += '<img class="img-responsive" src="' + arr[i] + '">';
										    	}	
									    	    $('#images').html(out);
									    	    
									    	   
											
									    	    rows = data1['table']['rows'];
											  	cols = data1['table']['cols'];
											  	minfields=data1['minfields'];
											  	if(rows == 0)
											  		rows = 1;
											  	if(cols == 0)
											  		cols = 1;
											  
											  	
											  	if(activeSectionId == sectionId) {
											  		$('#submit').removeClass("hidden");
											  		$('#skip').removeClass("hidden");
											  	}
											  	else
											  		$('#next').removeClass("hidden");
											
											}
										},
										 error: function() {
											  
											 alert("Error: server encountered an internal error. Please try again after some time ");
											  
										  } 
										
										});
										
										
									  	}
								  	
								  	//end of 7.5
								  	
						 	
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
		
		
		//begin function to store the table values in database
		function submitPractice7() {
			
			
			
			if((sectionId==4 && subsectionId==6) || (activeSectionId==4 && activeSubSectionId==6)){
	    	    
			
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData);
		
			var Indata = {
					userId : userId,
					section_id : 4,
					sub_section_id : 6,
					version_id : 1,
					response : table3arr1,
					category_id : 'null'
				};
			var myJSON = JSON.stringify(Indata);
		
			
			$.ajax({
				type : "POST",
				url : serverURL + "users/" + userId + "/sections/" + 4
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
                
				}
			});
	    	    }
			else if((sectionId==5 && subsectionId==8) || (activeSectionId==5 && activeSubSectionId==8)){
	    	    
				
				var section_id;
				var sub_section_id;
				var version_id;
				var response;
				var category_id;
				var table3arr1 = JSON.stringify(formData)
				
				var Indata = {
						userId : userId,
						section_id : 5,
						sub_section_id : 8,
						version_id : 1,
						response : table3arr1,
						category_id : 'null'
					};
				var myJSON = JSON.stringify(Indata);
				//rest call storeing 4.6 data type
				
				$.ajax({
					type : "POST",
					url : serverURL + "users/" + userId + "/sections/" + 5
							+ "/subsections/" + 8 + "/" + "3rdSecdata/1",
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
			
			
		else if((sectionId==7 && subsectionId==5) || (activeSectionId==7 && activeSubSectionId==5)){
	    	    
				
				var section_id;
				var sub_section_id;
				var version_id;
				var response;
				var category_id;
				var table3arr1 = JSON.stringify(formData)
				
				var Indata = {
						userId : userId,
						section_id : 7,
						sub_section_id : 5,
						version_id : 1,
						response : table3arr1,
						category_id : 'null'
					};
				var myJSON = JSON.stringify(Indata);
				//rest call storeing 4.6 data type
				
				$.ajax({
					type : "POST",
					url : serverURL + "users/" + userId + "/sections/" + 7
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
			
			
			
			
		}
		
		
		//begin function to download the table data in excel format
		
		function download1()
		{
		    var tab_text="<table border='2px'><tr bgcolor='#87AFC6'>";
		    var textRange; var j=0;
		    tab = document.getElementById('table'); // id of table

		    for(j = 0 ; j < tab.rows.length ; j++) 
		    {     
		        tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
		       
		    }

		    tab_text=tab_text+"</table>";
		    tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
		    tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
		    tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

		    var ua = window.navigator.userAgent;
		    var msie = ua.indexOf("MSIE "); 

		    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
		    {
		        txtArea1.document.open("txt/html","replace");
		        txtArea1.document.write(tab_text);
		        txtArea1.document.close();
		        txtArea1.focus(); 
		        sa=txtArea1.document.execCommand("SaveAs",true,"Say Thanks to Sumit.xls");
		    }  
		    else                 //other browser not tested on IE 11
		        sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));  

		    return (sa);
		}
		
		//end function to download the table data in excel format
		
		//begin function to download the table data in excel format
		function download(){
			if(activeSectionId==4 && activeSubSectionId==6){
			
			    var tab_text = '<table id="table245">';
			    var textRange; 
			    var j = 0;
			    var tab = document.getElementById('table'); // id of table
			    var lines = tab.rows.length;

			    // the first headline of the table
			    if (lines > 0) {
			        tab_text = tab_text + '<tr bgcolor="#DFDFDF">' + tab.rows[0].innerHTML + '</tr>';
			    }

			    if(arr_splitted_data1==null){
			    	
			        
			    	if(temp_array.length==0)
			    		tab_text =  tab_text;
			    	else 
			    		tab_text = tab_text + "<tr><td>"+temp_array[0]+"</td><td>"+temp_array[1]+"</td><td>" +temp_array[2] +"</td> <td>" +temp_array[3] +"</td><td>" +temp_array[4] +"</td></tr>"+
			    		 "<tr><td>"+temp_array[5]+"</td><td>"+temp_array[6]+"</td><td>" +temp_array[7]+ "</td><td>" +temp_array[8]+ "</td><td>" +temp_array[9]+ "</td></tr>"+
			    		 "<tr><td>"+temp_array[10]+"</td><td>"+temp_array[11]+"</td><td>" +temp_array[12]+ "</td><td>" +temp_array[13]+ "</td>><td>" +temp_array[14]+ "</td></tr>"+
			    		 "<tr><td>"+temp_array[15]+"</td><td>"+temp_array[16]+"</td><td>" +temp_array[17]+ "</td><td>" +temp_array[18]+ "</td><td>" +temp_array[19]+ "</td></tr>";
			    		
			    }
			    	
			    		   
			    	else
			    		 tab_text = tab_text + "<tr><td>"+"e.g.someone"+"</td><td>"+"nervous (90% strong)"+"</td><td>" +"Oh  it means he"+ "</td><td>"+"jumping to "+"</td><td>"+"may be he is travelling"+"</td></tr>"+
			    		 "<tr><td>"+arr_splitted_data1_new[0][0]+"</td><td>"+arr_splitted_data1_new[0][1]+"</td><td>" +arr_splitted_data1_new[0][2]+ "</td><td>"+arr_splitted_data1_new[0][3]+"</td><td>"+arr_splitted_data1_new[0][4]+"</td></tr>"+
			    		 "<tr><td>"+arr_splitted_data1_new[1][0]+"</td><td>"+arr_splitted_data1_new[1][1]+"</td><td>" +arr_splitted_data1_new[1][2]+ "</td><td>"+arr_splitted_data1_new[1][3]+"</td><td>"+arr_splitted_data1_new[1][4]+"</td></tr>"+
			    		 "<tr><td>"+arr_splitted_data1_new[2][0]+"</td><td>"+arr_splitted_data1_new[2][1]+"</td><td>" +arr_splitted_data1_new[2][2]+ "</td><td>"+arr_splitted_data1_new[2][3]+"</td><td>"+arr_splitted_data1_new[2][4]+"</td></tr>"+
			    		 "<tr><td>"+arr_splitted_data1_new[3][0]+"</td><td>"+arr_splitted_data1_new[3][1]+"</td><td>" +arr_splitted_data1_new[3][2]+ "</td><td>"+arr_splitted_data1_new[3][3]+"</td><td>"+arr_splitted_data1_new[3][4]+"</td></tr>";
		        			
			    		
			   

			    tab_text = tab_text + "</table>";
			    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
			    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
			    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params
			    
			    downlodExcel(tab_text);

			   
			}else if(activeSectionId==5 && activeSubSectionId==8){
			
			    var tab_text = '<table id="table245">';
			    var textRange; 
			    var j = 0;
			    var tab = document.getElementById('table'); // id of table
			    
			  
			    var lines = tab.rows.length;
			    
			    
			    if (lines > 0) {
			        tab_text = tab_text + '<tr>' + tab.rows[0].innerHTML + '</tr>';
			    }

			    if(arr_splitted_data1==null){
			    	
			        
			    	if(temp_array.length==0){
			    		tab_text =  tab_text;
			    	}else{ 
			    		tab_text = tab_text + "<tr><td>"+temp_array[0]+"</td><td>"+temp_array[1]+"</td><td>" +temp_array[2] +"</td></tr>"+
			    		 "<tr><td>"+temp_array[3]+"</td><td>"+temp_array[4]+"</td><td>" +temp_array[5]+ "</td></tr>"+
			    		 "<tr><td>"+temp_array[6]+"</td><td>"+temp_array[7]+"</td><td>" +temp_array[8]+ "</td></tr>"+
			    		 "<tr><td>"+temp_array[9]+"</td><td>"+temp_array[10]+"</td><td>" +temp_array[11]+ "</td></tr>";
			    	}
			    		
			    }else{
			    		 tab_text = tab_text + "<tr><td>"+arr_splitted_data1_new[0][0]+"</td><td>"+arr_splitted_data1_new[0][1]+"</td><td>" +arr_splitted_data1_new[0][2] +"</td></tr>";
			    		 tab_text = tab_text + "<tr><td>"+arr_splitted_data1_new[1][0]+"</td><td>"+arr_splitted_data1_new[1][1]+"</td><td>" +arr_splitted_data1_new[1][2]+ "</td></tr>";
			    		 tab_text = tab_text + "<tr><td>"+arr_splitted_data1_new[2][0]+"</td><td>"+arr_splitted_data1_new[2][1]+"</td><td>" +arr_splitted_data1_new[2][2]+ "</td></tr>";
			    		 tab_text = tab_text +"<tr><td>"+arr_splitted_data1_new[3][0]+"</td><td>"+arr_splitted_data1_new[3][1]+"</td><td>" +arr_splitted_data1_new[3][2]+ "</td></tr>";
			    }		
			    		
			   

			    tab_text = tab_text + "</table>";
			    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
			    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
			    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params
			   
			    
			    downlodExcel(tab_text);
			    	  
			    	
			}else if(activeSectionId==7 && activeSubSectionId==5){
				
			    var tab_text = '<table id="table245">';
			    var textRange; 
			    var j = 0;
			    var tab = document.getElementById('table'); // id of table
			    var lines = tab.rows.length;

			   
			    if (lines > 0) {
			        tab_text = tab_text + '<tr bgcolor="#DFDFDF">' + tab.rows[0].innerHTML + '</tr>';
			    }

			    if(arr_splitted_data1==null){
			    	if(temp_array.length==0)
			    		tab_text =  tab_text;
			    	else 
			    		tab_text = tab_text + "<tr><td>"+temp_array[0]+"</td><td>"+temp_array[1]+"</td><td>" +temp_array[2] +"</td> <td>" +temp_array[3] +"</td><td>" +temp_array[4] +"</td></tr>"+
			    		 "<tr><td>"+temp_array[5]+"</td><td>"+temp_array[6]+"</td><td>" +temp_array[7]+ "</td><td>" +temp_array[8]+ "</td><td>" +temp_array[9]+ "</td></tr>"+
			    		 "<tr><td>"+temp_array[10]+"</td><td>"+temp_array[11]+"</td><td>" +temp_array[12]+ "</td><td>" +temp_array[13]+ "</td>><td>" +temp_array[14]+ "</td></tr>"+
			    		 "<tr><td>"+temp_array[15]+"</td><td>"+temp_array[16]+"</td><td>" +temp_array[17]+ "</td><td>" +temp_array[18]+ "</td><td>" +temp_array[19]+ "</td></tr>";
			    		
			    }
			    	
			        
		        		
			    
			    	else
			    		 tab_text = tab_text + "<tr><td>"+arr_splitted_data1_new[0][0]+"</td><td>"+arr_splitted_data1_new[0][1]+"</td><td>" +arr_splitted_data1_new[0][2] +"</td> <td>" +arr_splitted_data1_new[0][3] +"</td><td>" +arr_splitted_data1_new[0][4] +"</td></tr>"+
			    		 "<tr><td>"+arr_splitted_data1_new[1][0]+"</td><td>"+arr_splitted_data1_new[1][1]+"</td><td>" +arr_splitted_data1_new[1][2]+ "</td><td>" +arr_splitted_data1_new[1][3]+ "</td><td>" +arr_splitted_data1_new[1][4]+ "</td></tr>"+
			    		 "<tr><td>"+arr_splitted_data1_new[2][0]+"</td><td>"+arr_splitted_data1_new[2][1]+"</td><td>" +arr_splitted_data1_new[2][2]+ "</td><td>" +arr_splitted_data1_new[2][3]+ "</td>><td>" +arr_splitted_data1_new[2][4]+ "</td></tr>"+
			    		 "<tr><td>"+arr_splitted_data1_new[3][0]+"</td><td>"+arr_splitted_data1_new[3][1]+"</td><td>" +arr_splitted_data1_new[3][2]+ "</td><td>" +arr_splitted_data1_new[3][3]+ "</td><td>" +arr_splitted_data1_new[3][4]+ "</td></tr>";
		        			
			    		
			   

			    tab_text = tab_text + "</table>";
			    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
			    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
			    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params
			   

			    downlodExcel(tab_text);
			}
			
		}
		
		//end function to download the table data in excel format
		
		
		
	</script>
</body>
</html>