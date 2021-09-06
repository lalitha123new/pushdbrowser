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
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="js/values.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
  
   
  	<!--     <script src="js/inc.js"></script>-->
  
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
					<div class="hidden" id="section3"><h3><b>Activate: Baby steps to move ahead</b></h3></div>
					<div class="hidden" id="section6"><h3><b>Learn Self-Compassion</b></h3></div>
					
						<h3><b id="subsection-name"></b></h3>
						
						<div class="clearfix"></div>
						
						<p id="exercise-title" class="text-justify">
						</p>	
									
						<hr style="border-bottom: 1px solid black;">
						
						<div id="paragraph" class="text-justify">
						</div>
						
						<div id="images">
						</div>
						
						<table id="table" class="table text-center table-hover table-bordered" style="background-color:#FFE0B2;border:2px solid #FFB74D;">
							
							<thead id="thead1">
							</thead>
							
							<tbody id="tbody1">
							</tbody>
							
						</table>
						
						<div class="clearfix"></div>
						
						<p style="text-align:center;font-weight:bold;">This table is available in workbook to edit.</p>
						
						<button id="submit" class="hidden btn btn-success" onclick="checkForEmptyFields()">Submit</button>
						<button id="download" class="btn btn-warning hidden" onclick = "download()">Download</button>
						
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
	
		var parsed_data36 ;
		var splitted_data =null;
		var splitted_data1 = null;
		var splitted_data2 = null;
		var splitted_data3 = null;
		var splitted_data4 = null;
		var splitted_data5 = null;
		var splitted_data6 = null;
		
		var arr_splitted_data1 = [];
		var arr_splitted_data2 = [];
		var arr_splitted_data3 = [];
		var arr_splitted_data4 = [];
		var arr_splitted_data5 = [];
		var arr_splitted_data6 = [];
		var i=0;
		var rows = 0, cols = 0;
		var minfields=0;
		var filled=0;
		
		

		var temp_array = [];
		
		function checkForEmptyFields()
		
		{
			
			$("#download").removeClass("hidden");
			
			formData = '';
			var flag = false; //set it to true if empty blanks present
			
			for (j = 1; j <= rows; j++) 
			{
				for (k = 1; k <= cols; k++) 
				{
					
			
					    	
				
						var p ='';
				if($('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val())						
				{
							
					
						filled++;
						
						if(filled>=minfields)
						{
							
						flag=true;

						}
						if($('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().includes(",")){
							
							p = $('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().replace(/,/g, "#@@#");
						}
						else {
							p= $('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val();
						}
						
						
						
						formData += 'data=' + j + '_' + k + '_' + p + '&';
						temp_array.push($('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val());
						$('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).prop("disabled", "disabled");		
						
						}
						
						
					
				
				}
				
				
			}
			
			
			
						if(flag == false)
						{
							
							alert("Please fill in atleast "+ minfields+" blanks to continue");
						}
						
						else
						{
							
							submitPractice4(11);
						}
			
			
					}
		
	
				 var arr_data = [];
				 var array_check = [];
				 var array_text1 = [];
				 var array_text2 = [];
				 var parsed_data36_new;
				 
				var sectionId;
				var subsectionId;
				var activeSectionId;
				var activeSubSectionId;
				var db_data;
				 
				 
				$(document).ready(function() {
					
					//ajax call to get the user section info
   					$.ajax({
	   					 
   						type: "GET",
   						  url: serverURL + "users/" + userId + "/currSubSection",
   						  
   						  success: function(data){
   							  
   						
   						sectionId = data['currentSection'];
   						
   						subsectionId = data['currentSubSection'];
   						activeSectionId = data['activeSection'];
   						activeSubSectionId = data['activeSubSection'];
   						
   						
   						
   						//ajax call to get the table header data from file
   						$.ajax({
   							
   							  type: "GET",
   							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/knowledge",
   							 
   						 success: function(data1){
   						 
   					
   						$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
   						
   					  	
   					  	minfields=data1["minfields"];
   					    
   					  	var arr = data1['paragraphs'];
   					  	var out = '';
   					 if((sectionId==3 && subsectionId==6) || (activeSectionId==3 && activeSubSectionId==6)){
   		    	    
   						$("#section3").removeClass("hidden");
				 db_data=null;
				//ajax call to get the data from the database
			
			$.ajax({
				type : "GET",
				url : serverURL + "users/" + userId
						+ "/sections/" + 3 + "/subsections/"
						+ 6 + "/" + "3rdSecdata/1",
						
				contentType : "application/json",
				
				dataType : "json",
				
				success : function(data) {
					
					
					splitted_data = data;
					
					if(data!= null){
						$("#download").removeClass("hidden");
						
						
					
					
					var data_new = data[0].response;
					data_new = data_new.replace(/\\n/g, '');
					
					var str1 = data_new.split(',');
					
					
					var MultiArray = new Array(3);
					var MultiArray2=[];
					for(var t=0;t<(str1.length-1);t++){
						
						MultiArray[t]=new Array(3);
						
						if(t<(str1.length-1)){
							
							var str_12 = str1[t].split('_');
							
							MultiArray[0][t]=str_12[2];
							
							
							
							MultiArray2.push(str_12[3]);
							
						}
						}
					
					
					splitted_data1 = MultiArray;
					arr_splitted_data1=MultiArray2;
					
					
						
						
						
   			    	    for(i = 0; i < arr.length; i++) {
   					    	    	
   			    	    	out += '<p>' + arr[i] + '</p>';
   						}	
   			    	    
   			    	    $('#paragraph').html(out);
   					  	out = '<tr>';
   				    	arr = data1['table']['thead'];
   						for(i = 0; i < arr.length; i++) {
   							if(i == 0)
			    	    		out += '<th class="col1-md-5 text-center" style="vertical-align: middle;border:1px solid #FFB74D;"><strong>' + arr[i] + '</strong></th>';
		   	    			else	
		   	    				out += '<th class="col-md-7 text-center" style="vertical-align: middle;border:1px solid #FFB74D;"><strong>' + arr[i] + '</strong></th>';
		   	    		}	
			    	    out += '</tr>';
			    	    $('#thead1').html(out);
			    	   
			    	    
			    	    out = '';
			    	    MultiArray[0][1] =MultiArray[0][1].replace(/#@@#/g, ",");
			    	    MultiArray[0][3] =MultiArray[0][3].replace(/#@@#/g, ",");
			    	    MultiArray[0][5] =MultiArray[0][5].replace(/#@@#/g, ",");
			    	    MultiArray[0][7] =MultiArray[0][7].replace(/#@@#/g, ",");
			    	    MultiArray[0][8] =MultiArray[0][8].replace(/#@@#/g, ",");
			    	    MultiArray[0][10] =MultiArray[0][10].replace(/#@@#/g, ",");
			    	    MultiArray[0][11] =MultiArray[0][11].replace(/#@@#/g, ",");
			    	    MultiArray[0][13] =MultiArray[0][13].replace(/#@@#/g, ",");
			    	    MultiArray[0][14] =MultiArray[0][14].replace(/#@@#/g, ",");
			    	    
			    	    out += '<tr>'+	
			    	     '<td class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">';
		    				 out +='<input type="checkbox" ';
		    				 if (MultiArray2[1] == 1) {
							out += ' checked';
		    				 }
							out += '>'+
							'</td>'+
		    				
		    				'<td  class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+
		    				
		    				"Marking my efforts on a simple graph/chart and putting it up prominently on a table/on a wall/cupboard"+
		    				'</td>'+
		    				
		    				'<td  class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+
		    				'<textarea type="text" value="'+MultiArray[0][1]+'" name="input" class="form-control" style="height:50px;width:400px;" disabled>'+MultiArray[0][1]+'</textarea>'+'</td>';
		    				out+='</tr>';
		    				
		    				
		    				
		    				out += '<tr>'+	
		    				'<td class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">';
		    				 out +='<input type="checkbox" ';
		    				 if (MultiArray2[3] == 1) {
							out += ' checked';
		    				 }
							out += '>'+
							'</td>'+
		    				
		    				'<td  class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+
		    				
		    				"Writing a  happy note to myself in a diary"+
		    				'</td>'+
		    				
		    				'<td  class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+
		    				'<textarea type="textarea" value="'+MultiArray[0][3]+'" name="input"  class="form-control" style="height:50px;width:400px;" disabled>'+MultiArray[0][3]+'</textarea>'+'</td>';
		    				out+='</tr>';
		    				
		    				
		    				out += '<tr>'+	
		    				'<td class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">';
		    				 out +='<input type="checkbox" ';
		    				 if (MultiArray2[5] == 1) {
							out += ' checked';
		    				 }
							out += '>'+
							'</td>'+
		    				
		    				'<td  class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+
		    				
		    				"Giving myself a treat/something nice to eat"+
		    				'</td>'+
		    				
		    				'<td  class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+
		    				'<textarea type="text" value="'+MultiArray[0][5]+'" name="input"  class="form-control" style="height:50px;width:400px;" disabled>'+MultiArray[0][5]+'</textarea>'+'</td>';
		    				
		    				out+='</tr>';
				    				
		    				out += '<tr>'+	
		    				'<td class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">';
		    				 out +='<input type="checkbox" ';
		    				 if (MultiArray2[6] == 1) {
							out += ' checked';
		    				 }
							out += '>'+
							'</td>'+
		    				
		    				'<td  class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+
		    				
		    				"Spending some time doing something I like/want"+
		    				'<textarea type="text" value="'+MultiArray[0][7]+'" name="input" class="form-control" style="height:50px;width:400px;" disabled>'+MultiArray[0][7]+'</textarea>'+
		    				'</td>'+
		    				
		    				'<td  class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+
		    				'<textarea type="text" value="'+MultiArray[0][8]+'" name="input" class="form-control" style="height:50px;width:400px;" disabled>'+MultiArray[0][8]+'</textarea>'+'</td>';
		    				
		    				out+='</tr>';
		    				
		    				out += '<tr>'+		
		    				'<td class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">';
		    				 out +='<input type="checkbox" ';
		    				 if (MultiArray2[9] == 1) {
							out += ' checked';
		    				 }
							out += '>'+
							'</td>'+
		    				
		    				'<td  class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+
		    				
		    				"Buying something for myself"+'<br>'+
		    				'<textarea type="text" value="'+MultiArray[0][10]+'" name = "input" class="form-control" style="height:50px;width:400px;"disabled >'+MultiArray[0][10]+'</textarea>'+
		    				'</td>'+
		    				
		    				'<td  class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+
		    				'<textarea type="text" value="'+MultiArray[0][11]+'" name="input"  class="form-control" style="height:50px;width:400px;" disabled>'+MultiArray[0][11]+'</textarea>'+'</td>';
		    			
		    				out+='</tr>';
		    				
		    				out += '<tr>'+		
		    				'<td class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">';
		    				 out +='<input type="checkbox" ';
		    				 if (MultiArray2[12] == 1) {
							out += ' checked';
		    				 }
							out += '>'+
							'</td>'+
		    				
		    				'<td  class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+
		    				
		    				"Any other way of rewarding myself."+'<br>'+
		    				'<textarea type="text" value="'+MultiArray[0][13]+'" class="form-control" name ="input" style="height:50px;width:400px;" disabled>'+MultiArray[0][13]+'</textarea>'+
		    				'</td>'+
		    				
		    				'<td  class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+
		    				'<textarea type="text" value="'+MultiArray[0][14]+'" name="input" class="form-control" style="height:50px;width:400px;" disabled>'+MultiArray[0][14]+'</textarea>'+'</td>';
		    	
		    				out+='</tr>';
   						    	 $('#tbody1').html(out);
   						    	   // $('#submit').addClass("hidden");
   						    	 $('#next').removeClass("hidden");
   						    	    
   						    	    
   						    	    
   						    	    arr = data1['images'];
   						    	    out = '';
   						    	    for(i = 0; i < arr.length; i++) {
   							        	out += '<img class="img-responsive" src="' + arr[i] + '">';
   							    	}	
   						    	    $('#images').html(out);
   						    	    
   						    	    /**************************************/
   								  	
   						    	    rows = data1['table']['rows'];
   								  	cols = data1['table']['cols'];
   								  	
   								  	if(rows == 0)
   								  		rows = 1;
   								  	if(cols == 0)
   								  		cols = 1;
   								  //	console.log(rows + " " + cols);
   								  	
   								 if(activeSectionId == sectionId) {
   									 if(data == null){
								  		$('#submit').removeClass("hidden");
   									 }else{
   										$('#submit').addClass("hidden");
   									 }
								  	}
								  	else
								  		$('#next').removeClass("hidden");
   								  	
   					          
				
				 			}//end of if data_data
				 			
				 			else {//if db_data is null
		   				  		
			   				  	
			   						    	   	
			   			    	    for(i = 0; i < arr.length; i++) {
			   					    	    	
			   			    	    	out += '<p>' + arr[i] + '</p>';
			   						}	
			   			    	    
			   			    	    $('#paragraph').html(out);
			   					  	out = '<tr>';
			   				    	arr = data1['table']['thead'];
			   						for(i = 0; i < arr.length; i++) {
			   							if(i == 0)
						    	    		out += '<th class="col1-md-5 text-center" style="vertical-align: middle;border:1px solid #FFB74D;"><strong>' + arr[i] + '</strong></th>';
					   	    			else	
					   	    				out += '<th class="col-md-7 text-center" style="vertical-align: middle;border:1px solid #FFB74D;"><strong>' + arr[i] + '</strong></th>';
					   	    		}	
						    	    out += '</tr>';
						    	    $('#thead1').html(out);
						    	   
						    	    
						    	    out = '';
							    	arr = data1['table']['tbody'];
							    	for(i = 0; i < arr.length; i++) {
							    		
						    		var tr = arr[i].item;
						    	    out += '<tr>';
			   					    
			   			    		for(j = 0; j < tr.length; j++) {
			   								
			   		    			if(activeSectionId == sectionId){
			   		    			
			   		    			out += '<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">' + tr[j] + '</textarea></td>';
			   		    				
			   						}
			   								
			   			    		else {
			   								
			   		  					
			   		  					var h = tr[j].indexOf("<textarea");
			   						
			   						
			   						if(h != -1) {
			   						
			   							h = h + 9;
			   							
			   							
			   							if(j==1)
			   							
			   								{
			   								
			   								tr[j] = tr[j].replace(tr[j].slice(h, h+1), " disabled ");
			   								
			   								}
			   									
			   								else
			   								{
			   								
			   								tr[j] = tr[j].replace(tr[j].slice(h, h+1), " ");
			   								
			   								}
			   							
			   									
			   									
			   								}
			   										
			   									out += '<td class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">' + tr[j] + '</textarea></td>';
			   									
			   								}//end of else 
			   									
			   									
			   				    			}//end of second for loop
			   								out += "</tr>";
			   								
			   				    			}//end of first for loop
			   						    		
			   						    				
			   									
			   						    	 $('#tbody1').html(out);
			   						    	    $('#submit').removeClass("hidden");
			   						    	 $('#next').addClass("hidden");
			   						    	    
			   					
			   						    	    
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
											  		$('#next').removeClass("hidden");
			   								  	
			   					          
			   							  
			   							 	}//end of else
			   							 
			   							
			   							
			   						 
				},//end of success for db data
				});//end of ajax call for db data
				
   		    	 }	////end of section is 3 and subsection is 6
   		    	 
   		    	 else if((sectionId==6 && subsectionId==4) || (activeSectionId==6 && activeSubSectionId==4)){
   		    		$("#section6").removeClass("hidden");
   					
   					var db_data=null;
   					//ajax call to get the data from the database
   				
   				$.ajax({
   					type : "GET",
   					url : serverURL + "users/" + userId
   							+ "/sections/" + 6 + "/subsections/"
   							+ 4 + "/" + "3rdSecdata/1",
   							
   					contentType : "application/json",
   					
   					dataType : "json",
   					
   					success : function(data) {
   						
   						
   						arr_splitted_data1 = data;
   						if(data!= null){
   							$("#download").removeClass("hidden");
   							
   							var arr = data1['paragraphs'];
						  	var out = '';
						  	
							var data_new = data[0].response;
							var str1 = data_new.split(',');
							
							
							var MultiArray = new Array(3);
							
							for(var t=0;t<=str1.length;t++){
								
								MultiArray[t]=new Array(3);
								
								if(t<4){
									
									var str_12 = str1[t].split('_');
									MultiArray[0][t]=str_12[2];
									
									
								}
							}
							
							arr_splitted_data1_new = MultiArray;
   	   					
   	   						    	   	

						    	   	
		   			    	    for(i = 0; i < arr.length; i++) {
		   					    	    	
		   			    	    	out += '<p>' + arr[i] + '</p>';
		   						}	
		   			    	    
		   			    	    $('#paragraph').html(out);
		   					  	out = '<tr>';
		   				    	arr = data1['table']['thead'];
		   						for(i = 0; i < arr.length; i++) {
		   							if(i == 0)
					    	    		out += '<th class="col1-md-5 text-center" style="vertical-align: middle;border:1px solid #FFB74D;"><strong>' + arr[i] + '</strong></th>';
				   	    			else	
				   	    				out += '<th class="col-md-7 text-center" style="vertical-align: middle;border:1px solid #FFB74D;"><strong>' + arr[i] + '</strong></th>';
				   	    		}	
					    	    out += '</tr>';
					    	    $('#thead1').html(out);
					    	   
					    	    
					    	    out = '';
					    	    MultiArray[0][0] =MultiArray[0][0].replace(/#@@#/g, ",");
					    	    MultiArray[0][1] =MultiArray[0][1].replace(/#@@#/g, ",");
					    	    MultiArray[0][2] =MultiArray[0][2].replace(/#@@#/g, ",");
					    	    MultiArray[0][3] =MultiArray[0][3].replace(/#@@#/g, ",");
						    	arr = data1['table']['tbody'];
						    	
						    	
						    	 out += '<tr>'+
						    	 
						    	'<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+"I could not talk properly to my boss. I am a weak and an  incapable person."+'</td>'+
			   		    		'<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;"><textarea rows="2"  class="td-'+(i+1)+'-'+(j+1)+' form-control" disabled>'+MultiArray[0][0]+'</textarea></td>';
			   		    		out += "</tr>";
			   		    		
			   		    		 out += '<tr>'+
		   		    			'<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+"I did not live up to his expectations in the party.  I am not worthy of his affection. I hate myself."+'</td>'+
		   		    			'<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;"><textarea rows="2"  class="td-'+(i+1)+'-'+(j+1)+' form-control" disabled>'+MultiArray[0][1]+'</textarea></td>';
		   		    			out += "</tr>";
		   		    			
		   		    		 out += '<tr>'+
		   		    			'<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">'+"Write you own self-critical thought here."+'<textarea class="td-'+(i+1)+'-'+(j+1)+' form-control" disabled>'+MultiArray[0][2]+'</textarea></td>'+
		   		    			'<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;"><textarea rows="2"  class="td-'+(i+1)+'-'+(j+1)+' form-control" disabled>'+MultiArray[0][3]+'</textarea></td>';
		   		    			out += "</tr>";
		   		    				
		   						    	 $('#tbody1').html(out);
		   						    	  
		   						    	    
		   						    	    arr = data1['images'];
		   						    	    out = '';
		   						    	    for(i = 0; i < arr.length; i++) {
		   							        	out += '<img class="img-responsive" src="' + arr[i] + '">';
		   							    	}	
		   						    	    $('#images').html(out);
		   						    	    
		   						    	    /**************************************/
		   								  	
		   						    	    rows = data1['table']['rows'];
		   								  	cols = data1['table']['cols'];
		   								  	
		   								  	if(rows == 0)
		   								  		rows = 1;
		   								  	if(cols == 0)
		   								  		cols = 1;
		   								 
		   								  	
		   								  	if(activeSectionId == sectionId) {
		   								  		
		   								  		
		   								  		
		   								  		$('#next').removeClass("hidden");
		   								  	}
		   								  	
		   								  	
		   					          
   					
   					 			}//end of if data_data
   					 			
   					 			else {//if db_data is null
   			   				  		
   					 			var arr = data1['paragraphs'];
   							  	var out = '';
   				   						    	   	
   				   			    	    for(i = 0; i < arr.length; i++) {
   				   					    	    	
   				   			    	    	out += '<p>' + arr[i] + '</p>';
   				   						}	
   				   			    	    
   				   			    	    $('#paragraph').html(out);
   				   					  	out = '<tr>';
   				   				    	arr = data1['table']['thead'];
   				   						for(i = 0; i < arr.length; i++) {
   				   							if(i == 0)
   							    	    		out += '<th class="col1-md-5 text-center" style="vertical-align: middle;border:1px solid #FFB74D;"><strong>' + arr[i] + '</strong></th>';
   						   	    			else	
   						   	    				out += '<th class="col-md-7 text-center" style="vertical-align: middle;border:1px solid #FFB74D;"><strong>' + arr[i] + '</strong></th>';
   						   	    		}	
   							    	    out += '</tr>';
   							    	    $('#thead1').html(out);
   							    	   
   							    	    
   							    	    out = '';
   								    	arr = data1['table']['tbody'];
   								    	for(i = 0; i < arr.length; i++) {
   								    		
   							    		var tr = arr[i].item;
   							    	    out += '<tr>';
   				   					    
   				   			    		for(j = 0; j < tr.length; j++) {
   				   								
   				   		    			if(activeSectionId == sectionId){
   				   		    			
   				   		    			out += '<td id="td-'+(i+1)+'-'+(j+1)+'" class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">' + tr[j] + '</textarea></td>';
   				   		    				
   				   						}
   				   								
   				   			    		else {
   				   								
   				   		  					
   				   		  					h = tr[j].indexOf("<textarea");
   				   						
   				   						
   				   						if(h != -1) {
   				   						
   				   							h = h + 9;
   				   							
   				   							
   				   							if(j==1)
   				   							
   				   								{
   				   								
   				   								tr[j] = tr[j].replace(tr[j].slice(h, h+1), "  ");
   				   								
   				   								}
   				   									
   				   								else
   				   								{
   				   								
   				   								tr[j] = tr[j].replace(tr[j].slice(h, h+1), " ");
   				   								
   				   								}
   				   							
   				   									
   				   									
   				   								}
   				   										
   				   									out += '<td class="text-left" style="padding: 10px 20px;border:1px solid #FFB74D;">' + tr[j] + '</textarea></td>';
   				   									
   				   								}//end of else 
   				   									
   				   									
   				   				    			}//end of second for loop
   				   								out += "</tr>";
   				   								
   				   				    			}//end of first for loop
   				   						    		
   				   						    				
   				   									
   				   						    	 $('#tbody1').html(out);
   				   						    	    $('#submit').removeClass("hidden");
   				   						    	    
   				   						    	   
   				   						    	    
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
   				   								  		$('#next').addClass("hidden");
   				   								  	}
   				   								  	
   				   								  	else
   				   								  		$('#next').removeClass("hidden");
   				   					          
   				   							  
   				   							 	}//end of else db_data is null
   				   							 	
   					},//end of success for db data
   					
   					});//end of ajax call for db data
   					
   					
   	   		    	 }	////end of section is 3 and subsection is 6
   		    	 //end of 6.4 section
   		    	
				    		
				    		$('#next').removeClass("hidden");	    		 
   						
			
						},//end of second success function
						
						
   						});//ajax call to get the table header  info
   						
   						  
   						 },//end of first success function
   					});//end of ajax call to get the user section info
				    		
				});	  
				
				
		
		//function to get the checkbox value
		
	var check_value = [0,0,0,0,0,0];
		
		
		function checkbox_label(i) {
			
			
			var check_id = $(i).val();
			
			
			if($(i).prop("checked") == true){
				
			check_value[check_id-1]=1;
				
            }else if($(i).prop("checked") == false){
            	
            check_value[check_id-1]=0;
            	
            }
			
			
			}
		
		//begin function to download the table data in excel format
		 	
   		   	    
		function download(){
			
		
			
			if(activeSectionId==3 && activeSubSectionId==6){
				
				
				
			    var tab_text = '<table id="table245">';
			    var textRange; 
			    var j = 0;
			    var tab = document.getElementById('table'); // id of table
			    var lines = tab.rows.length;

			    // the first headline of the table
			    if (lines > 0) {
			        tab_text = tab_text + '<tr bgcolor="#DFDFDF">' + tab.rows[0].innerHTML + '</tr>';
			    }

			   
			    	
			    	if(splitted_data==null)
			    	{	
			    		
			    		var x1 = tab.rows[(1)].cells[0].getElementsByTagName('input')[0];
			    		if(x1.checked) 
			    			x1 = 1;
			    		else 
			    			x1=0;
			    	    var x2 = tab.rows[(1)].cells[2].getElementsByTagName('textarea')[0].value;
			    	    
			    	    var x3 = tab.rows[(2)].cells[0].getElementsByTagName('input')[0];
			    	    if(x3.checked) 
			    			x3 = 1;
			    		else 
			    			x3=0;
			    	    var x4 = tab.rows[(2)].cells[2].getElementsByTagName('textarea')[0].value;
			    	    
			    	    var x5 = tab.rows[(3)].cells[0].getElementsByTagName('input')[0];
			    	    if(x5.checked) 
			    			x5 = 1;
			    		else 
			    			x5=0;
			    	    var x6 = tab.rows[(3)].cells[2].getElementsByTagName('textarea')[0].value;
			    	    
			    	    var x7 = tab.rows[(4)].cells[0].getElementsByTagName('input')[0];
			    	    if(x7.checked) 
			    			x7 = 1;
			    		else 
			    			x7=0;
			    	    var x8 = tab.rows[(4)].cells[1].getElementsByTagName('textarea')[0].value;
			    	    var x9 = tab.rows[(4)].cells[2].getElementsByTagName('textarea')[0].value;
			    	    
			    	    var x10 = tab.rows[(5)].cells[0].getElementsByTagName('input')[0];
			    	    if(x10.checked) 
			    			x10 = 1;
			    		else 
			    			x10=0;
			    	    var x11 = tab.rows[(5)].cells[1].getElementsByTagName('textarea')[0].value;
			    	    var x12 = tab.rows[(5)].cells[2].getElementsByTagName('textarea')[0].value;
			    	    
			    	    var x13 = tab.rows[(6)].cells[0].getElementsByTagName('input')[0];
			    	    if(x13.checked) 
			    			x13 = 1;
			    		else 
			    			x13=0;
			    	    var x14 = tab.rows[(6)].cells[1].getElementsByTagName('textarea')[0].value;
			    	    var x15 = tab.rows[(6)].cells[2].getElementsByTagName('textarea')[0].value;
			    	    
			        tab_text = tab_text + "<tr><td>"+x1+"</td><td>" +"Marking my efforts on a simple graph/chart and putting it up prominently on a table/on a wall/cupboard"+"</td><td>"+x2+"</td></tr>"+
			        			"<tr><td>"+x3+"</td><td>"+"Writing a happy note to myself in a diary"+"</td><td>"+x4+"</td></tr>"+
			        			"<tr><td>"+x5+"</td><td>" + "Giving myself a treat/something nice to eat" + "</td><td>"+x6+"</td></tr>"+
			        			"<tr><td>"+x7+"</td><td>" +"Spending some time doing something I like/want" +"<br>"+x8+"</td><td>"+x9+"</td></tr>"+
			        			"<tr><td>"+x10+"</td><td>" +"Buying something for myself" +x11+"</td><td>"+x12+"</td></tr>"+
			        			"<tr><td>"+x13+"</td><td>" +"Any other way of rewarding myself." +x14+"</td>"+"<td>"+x15+"</td></tr>";
			    	
			    	}		   
			    	else
			    		 tab_text = tab_text + "<tr><td>" + arr_splitted_data1[0] + "</td>"+"<td>" +"Marking my efforts on a simple graph/chart and putting it up prominently on a table/on a wall/cupboard"+"</td>"+"<td>" + splitted_data1[0][1] + "</td></tr>"+
		        			"<tr><td>" + arr_splitted_data1[2] + "</td>"+"<td>"+"Writing a happy note to myself in a diary"+"</td>"+"<td>" + splitted_data1[0][3] + "</td></tr>"+
		        			"<tr><td>" + arr_splitted_data1[4] + "</td>"+"<td>" + "Giving myself a treat/something nice to eat" + "</td>"+"<td>" + splitted_data1[0][5] + "</td></tr>"+
		        			"<tr><td>" + arr_splitted_data1[6] + "</td>"+"<td>" +"Spending some time doing something I like/want" +"<br>"+ splitted_data1[0][7] + "</td>"+"<td>" + splitted_data1[0][8] + "</td></tr>"+
		        			"<tr><td>" + arr_splitted_data1[8] + "</td>"+"<td>" +"Buying something for myself" + splitted_data1[0][10] + "</td>"+"<td>" + splitted_data1[0][11] + "</td></tr>"+
		        			"<tr><td>" + arr_splitted_data1[10] + "</td>"+"<td>" +"Any other way of rewarding myself." + splitted_data1[0][13] + "</td>"+"<td>" + splitted_data1[0][14] + "</td>"+"</tr>";
		    	
			    		
			   
			    	

			    tab_text = tab_text + "</table>";
			    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
			    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
			    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params
			    downlodExcel(tab_text);
				}
			    
			    
			    else if(activeSectionId==6 && activeSubSectionId==4){
				
				var tab_text = '<table id="table245">';
			    var textRange; 
			    var j = 0;
			    var tab = document.getElementById('table'); // id of table
			    var lines = tab.rows.length;

			    
			    var x1 = tab.rows[(1)].cells[1].getElementsByTagName('textarea')[0].value;
			    var x2 = tab.rows[(2)].cells[1].getElementsByTagName('textarea')[0].value;
			    var x3 = tab.rows[(3)].cells[0].getElementsByTagName('textarea')[0].value;
			    var x4 = tab.rows[(3)].cells[1].getElementsByTagName('textarea')[0].value;
			   
			    

			        
        tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
        
        if(arr_splitted_data1==null){
    	if(temp_array.length==0){
        tab_text = tab_text + "<tr><td>"+"I could not talk properly to my boss. I am a weak and an  incapable person"+"</td><td></td></tr>"+
        			"<tr><td>"+"I did not live up to his expectations in the party.  I am not worthy of his affection. I hate myself."+"</td><td></td></tr>"+
        			"<tr><td>" + "Write you own self-critical thought here" + "</td><td></td></tr>";
    	}else{
        				tab_text = tab_text + "<tr><td>"+"I could not talk properly to my boss. I am a weak and an  incapable person"+"</td><td>"+x1+"</td></tr>"+
            			"<tr><td>"+"I did not live up to his expectations in the party.  I am not worthy of his affection. I hate myself."+"</td><td>"+x2+"</td></tr>"+
            			"<tr><td>" + "Write you own self-critical thought here" +x3+"</td><td>"+x4+"</td></tr>";
    	
    	}
    	}		   
    	else
    		 tab_text = tab_text + "<tr><td>"+"I could not talk properly to my boss. I am a weak and an  incapable person"+"</td><td>" + arr_splitted_data1_new[0][0] + "</td></tr>"+
    			"<tr><td>"+"I did not live up to his expectations in the party.  I am not worthy of his affection. I hate myself."+"</td>"+"<td>" + arr_splitted_data1_new[0][1] + "</td></tr>"+
    			"<tr><td>" + "Write you own self-critical thought here" + "<br>"+ arr_splitted_data1_new[0][2] + "</td>"+"<td>" + arr_splitted_data1_new[0][3] + "</td></tr>";
    		
        

			    tab_text = tab_text + "</table>";
			    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
			    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
			    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params
			    downlodExcel(tab_text);
			}
				
			
		}
		
		
		
		//end function to download the table data in excel format
		
		
			var text_data_array = [];
			var val_all = {};
			
			function submitPractice4(e) {
				
			
			formData = '';
			var formData1 = {};
			

			for (j = 1; j <= rows; j++) {
				
			for (k = 1; k <= cols; k++) {
				
			if($('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val() != null) {
						
			
			var p='';
			if((sectionId==6 && subsectionId==4) || (activeSectionId==6 && activeSubSectionId==4)){
					
			
				if($('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().includes(",")){
					p = $('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().replace(/,/g, "#@@#");
				}
				else {
					p= $('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val();
				}
				
				
				formData += j + '_' + k + '_' + p + ',';
				$('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).prop("disabled", "disabled");
			
						
					}	
			else {
				
				if($('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().includes(",")){
					p = $('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val().replace(/,/g, "#@@#");
				}
				else {
					p= $('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).val();
				}
				
				
				
				formData += j + '_' + k + '_' +p+'_'+check_value[j-1]+',';
				$('.td-'+activeSectionId+'-'+activeSubSectionId+'-'+j+'-'+k).prop("disabled", "disabled");
				
			}
			
					}
					
				}
				
			}
			
			
			
			if((sectionId==3 && subsectionId==6) || (activeSectionId==3 && activeSubSectionId==6)){
			
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData);

			var Indata = {
				userId : userId,
				section_id : 3,
				sub_section_id : 6,
				version_id : 1,
				response : table3arr1,
				category_id : 'null'
			};
			
			
			
			var myJSON = JSON.stringify(Indata);
			//rest call storeing 3.6 data type
			
			$.ajax({
				type : "POST",
				url : serverURL + "users/" + userId + "/sections/" + 3
						+ "/subsections/" + 6 + "/" + "3rdSecdata/1",
				data : myJSON,
				contentType : "application/json",
				dataType : "json",
				success : function(data) {
					$('#submit').addClass("hidden");
					$('#next').removeClass("hidden");
                 
				},
				error : function() {
                  
					alert("Error: server encountered an internal error. Please try again after some time ");
				}
			});
			}
			
			else if((sectionId==6 && subsectionId==4) || (activeSectionId==6 && activeSubSectionId==4)){
				
				var section_id;
				var sub_section_id;
				var version_id;
				var response;
				var category_id;
				var table3arr1 = JSON.stringify(formData);

				var Indata = {
					userId : userId,
					section_id : 6,
					sub_section_id : 4,
					version_id : 1,
					response : table3arr1,
					category_id : 'null'
				};
				
				//console.log(Indata);
				
				var myJSON = JSON.stringify(Indata);
				//rest call storeing 6.4 data type
				
				$.ajax({
					type : "POST",
					url : serverURL + "users/" + userId + "/sections/" + 6
							+ "/subsections/" + 4 + "/" + "3rdSecdata/1",
					data : myJSON,
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						$('#submit').addClass("hidden");
						$('#next').removeClass("hidden");
					
	                
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