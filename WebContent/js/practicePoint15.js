/**
 * 
 */
var i = 0;
		var formData = "";
		
		var rowCount = 0;
		
		function setRadio(c, v) {
			
			$('#r'+c+'-1').prop("disabled", "disabled");	//	v=1 : Could do
			$('#r'+c+'-2').prop("disabled", "disabled");	//	v=2 : Tried to do it
			$('#r'+c+'-3').prop("disabled", "disabled");    //  v=3 : did not do
			
			formData += 'data='+$('#v'+c).val()+'_'+v+'&';
		}
		
		function skip() {
			
			for (k = 1; k <= rowCount; k++) {
				$('input[name="r'+k+'"]').prop("disabled", "disabled");
				formData += 'data='+$('#v'+k).val()+'_dummy&';
			}
			
			submitWeeklyMonitor();
		}
		
		function check() {
			
			flag = false;
			
			for (k = 1; k <= rowCount; k++) {
				
				if(! $('#r'+k+'-1').prop("disabled")){
					flag = true;
					break;
				}
			}
			if(flag == false)
				submitWeeklyMonitor();
			else
				alert("You must complete exercise before submiting");
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
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/practice9",
							  success: function(data1){
					
								 	$("#subsection-name").html(activeSectionId+"."+activeSubSectionId+"&emsp;"+data1['subSectionName']);
									
								 	var out = '';

								 	arr = data1;
									out +=	'<p id="exercise-title" class="text-justify"><strong>' + arr.exerciseTitle + '</strong></p>';
									
									for (k = 0; k < arr.exerciseDesc.length; k++) {
										out += 	'<p class="text-justify">' + arr.exerciseDesc[k] + '</p>';
									}
									
									$('#pages').html(out);
									
									thead = data1['tables'][0]['thead'];
								
									out = '<tr>';
									for (k = 0; k < thead.length; k++) {
										if(k == 1)
											out += '<th width="12%" class="text-center"  style="border:1px solid #FFB74D;">' + thead[k] + '</th>';
										else
											out += '<th width="11%" class="text-center"  style="border:1px solid #FFB74D;">' + thead[k] + '</th>';
									}
									out += '</tr>';
									$('#thead1').html(out);
									
									$.get( serverURL + "users/" + userId + "/sections/3/subsections/2/practice3/workbook", function(ppoint){
										ppoint = ppoint['practicePoints'];
										if(sectionId == activeSectionId) {
										ppoint = ppoint[ppoint.length-1]['planner'];
										}
										else
											{
											ppoint = ppoint[ppoint.length-1]['planner']; 
											//has to be changed to ppoint[0]['planner'] when reviewing 
											}
										
										test(ppoint);
										
								 	});
										
							  },
							  error: function() {
								  alert(serverURL + "sections/" + sectionId + "/subsections/" + subsectionId + "/practice9");
								 
							  } 
						});	

				  },
				  error: function() {
					  alert("Error Occured due to " + serverURL + "users/" + userId + "/currSection");
					  
				  } 
			});

			function test(arr) {
				var tbody5 = '';
				
				for (j = 0; j < arr.length; j++) {
					
					tbody5 += '<tr class="text-center"  style="border:1px solid #FFB74D;">';
					
					v = arr[j]['activity'];
					
					if(arr[j]['type'] == "Pleasurable")
						c = 1;
					else if(arr[j]['type'] == "Meaningful")
						c = 2;
					else if(arr[j]['type'] == "Mastery-Oriented")
						c = 3;
					rowCount = (j+1);
					
					
					$('#submit').addClass("hidden");
					$('#skip').addClass("hidden");
					$('#next').removeClass("hidden");
					
					switch(arr[j]['day']) {
						case "Monday" :			
									if(c == 1)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v +
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>'; 
									else if(c == 2)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v + 
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>';
									else if(c == 3)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v +
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>';
									tbody5 +=	'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>';
									break;
						case "Tuesday" :	tbody5 += 	'<td  style="border:1px solid #FFB74D;"></td>';
									if(c == 1)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v + 
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>'; 
									else if(c == 2)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v + 
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>';
									else if(c == 3)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v +
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>'; 
											
									tbody5 +=	'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>';
									break;
						case "Wednesday" :	tbody5 += 	'<td style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>';
									if(c == 1)
										tbody5 += 	'<td class="warning" style="border:1px solid #FFB74D;">' + v + 
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>'; 
									else if(c == 2)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v +
										
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>';
									else if(c == 3)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v +
										
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>'; 
											
									tbody5 +=	'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>';
									break;
						case "Thursday" :	tbody5 += 	'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td style="border:1px solid #FFB74D;"></td>';
									if(c == 1)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v + 
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>'; 
									else if(c == 2)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v +
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>';
									else if(c == 3)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v + 
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>'; 
											
									tbody5 +=	'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>';
									break;
						case "Friday" :	tbody5 += 	'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>';
									if(c == 1)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v + 
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>'; 
									else if(c == 2)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v +
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>';
									else if(c == 3)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v + 
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>'; 
											
									tbody5 +=	'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>';
									break;
						case "Saturday" :	tbody5 += 	'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>';
									if(c == 1)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v + 
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>'; 
									else if(c == 2)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v +
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>';
									else if(c == 3)
										tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v + 
										'<button class="button button5"></button>'+
										'<button class="button button6"></button>'+
										'</td>'; 
								
									tbody5 +=	'<td  style="border:1px solid #FFB74D;"></td>';
									break;
						case "Sunday" :	tbody5 += 	'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>' +
												'<td  style="border:1px solid #FFB74D;"></td>';
									
						if(c == 1)
							tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v +
							'<button class="button button5"></button>'+
							'<button class="button button6"></button>'+
							'</td>'; 
						else if(c == 2)
							tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v +
							'<button class="button button5"></button>'+
							'<button class="button button6"></button>'+
							'</td>';
						else if(c == 3)
							tbody5 += 	'<td class="" style="border:1px solid #FFB74D;">' + v +
							'<button class="button button5"></button>'+
							'<button class="button button6"></button>'+
							'</td>';
									
									break;
									
					}
					
					tbody5 += '</tr>';
					
				}
				
				
				$('#tbody1').append(tbody5);
			
			}
			
			
		});		
		
		
		function submitWeeklyMonitor() {
			$.ajax({
				  type: "POST",
				  url: serverURL + "users/" + userId + "/sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/practice4/new",
				  data: formData,
				  success: function(data){
						$('#next').removeClass('hidden');
						$('#skip').addClass("hidden");
						$('#submit').addClass('hidden');
				  },
				  error: function() {
					  alert(serverURL + "users/" + userId + "/sections/" + sectionId + "/subsections/" + subsectionId + "/practice4/new");
				  } 
			});
		}