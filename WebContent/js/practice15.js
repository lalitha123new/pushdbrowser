/**
 * 
 */

var form = '';
var rowCount15 = 0;
var practice15version = 0;
var sflag2=true;
function practice15Workbook(arr, url, sid, ssid) {

	url = url.replace("practice9", "knowledge");
	
	$.get(serverURL + "users/" + userId + "/" + url + "/workbook", function(ppoint){

		var pp = ppoint['practicePoints'];
		var tabs = '';
		var divTab = '';
		var exer = '';
		var tbody = '';
		
		
		for (j = 0; j < pp.length; j++) {
			
			exer = ''; 
			if(j == pp.length-1) {
				tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation" class="active">' +
							'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
								'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (pp.length+1) + ', ' + (j+1) + ')">' +
								'Version ' + (j+1) + '</a>' +
						'</li>';
				
				divTab +=	'<div id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">';
			}
			else if(j == pp.length) {
				tabs += '<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation">' +
							'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
								'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (pp.length+1) + ', ' + (j+1) + ')">' +
								'Add</a>' +
						'</li>';
				divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j+1) + '"><br>' +
								'<p><strong>Please enter your new response</strong></p>';
			}
			else {
				tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation">' +
							'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
								'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (pp.length+1) + ', ' + (j+1) + ')">' +
								'Version ' + (j+1) + '</a>' +
						'</li>';
		
				divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">';
			}
		
			exer +=	'<p id="exercise-title" class="text-justify"><strong>' + arr.exerciseTitle + '</strong></p>';
			
			for (k = 0; k < arr.exerciseDesc.length; k++) {
				exer += 	'<p class="text-justify">' + arr.exerciseDesc[k] + '</p>';
			}
			
			thead = arr['tables'][0]['thead'];
		
			exer += '<br><table class="table table-hover table-bordered">'+
							'<thead>' + 
								'<tr>';
			for (k = 0; k < thead.length; k++) {
				if(k == 1)
					exer += '<th width="12%" class="text-center">' + thead[k] + '</th>';
				else
					exer += '<th width="11%" class="text-center">' + thead[k] + '</th>';
			}
			
			exer += 			'</tr>'+
							'</thead>' +
							'<tbody>';
			
			len = pp.length;

			if(j != len) {
				data = pp[j]['data'];
				version15 = pp[j]['version'];
			}
			
			for (k = 0; k < data.length; k++) {
				
				str = data[k].split('_');
				
				exer += '<tr class="text-center">';
				
				v = str[0];
				
				if(str[1] == "Pleasurable")
					c = 1;
				else if(str[1] == "Meaningful")
					c = 2;
				else if(str[1] == "Mastery-Oriented")
					c = 3;
				
				rowCount = (k+1);
				
				//alert(v + " " + c);
				if(j == len-1) {
					if(str[3] == "1") {
						exer += 	'<td><input type="radio" disabled checked  value="1" name="r-3-7-' + rowCount + '"></td>' + 
									'<td><input type="radio" disabled value="2" name="r-3-7-' + rowCount + '">'+
									'<td><input type="radio" disabled value="3" name="r-3-7-' + rowCount + '"></td>';
						sflag2=false;
					}

					else if(str[3] == "2") {
						exer += 	'<td><input type="radio" disabled value="1" name="r-3-7-' + rowCount + '"></td>' + 
									'<td><input type="radio" disabled checked value="2" name="r-3-7-' + rowCount + '">'+
									'<td><input type="radio" disabled value="3" name="r-3-7-' + rowCount + '"></td>';	
						sflag2=false;
					}
					else if(str[3] == "3"){
						exer += 	'<td><input type="radio" disabled value="1" name="r-3-7-' + rowCount + '"></td>' + 
									'<td><input type="radio" disabled value="2" name="r-3-7-' + rowCount + '">'+
									'<td><input type="radio" disabled checked  value="3" name="r-3-7-' + rowCount + '"></td>';
						sflag2=false;
					}
					else if(str[3]=="dummy"){
						if(sflag2==true){
						exer += 	'<td><input type="radio" value="1" name="r-3-7-' + rowCount + '"></td>' + 
									'<td><input type="radio" value="2" name="r-3-7-' + rowCount + '">'+
									'<td><input type="radio" value="3" name="r-3-7-' + rowCount + '"></td>';
						}
						else{
							exer += 	'<td><input type="radio" disabled value="1" name="r-3-7-' + rowCount + '"></td>' + 
										'<td><input type="radio" disabled value="2" name="r-3-7-' + rowCount + '">'+
										'<td><input type="radio" disabled value="3" name="r-3-7-' + rowCount + '"></td>';
						}
					}
						else{
							sflag2=false;
							exer += 	'<td><input type="radio" disabled value="1" name="r-3-7-' + rowCount + '"></td>' + 
							'<td><input type="radio" disabled value="2" name="r-3-7-' + rowCount + '">'+
							'<td><input type="radio" disabled value="3" name="r-3-7-' + rowCount + '"></td>';
							
						}
		
				}
				else {
					if(str[3] == "1") {
						exer += 	'<td><input checked disabled type="radio"></td>' + 
									'<td><input disabled type="radio">'+
									'<td><input disabled type="radio"></td>';
					}
					else if(str[3] == "2") {
						exer += 	'<td><input disabled type="radio"></td>' + 
									'<td><input checked disabled type="radio">'+
									'<td><input disabled type="radio"></td>';
					}
					else if(str[3] == "3"){
						exer += 	'<td><input disabled type="radio"></td>' + 
									'<td><input disabled type="radio">'+
									'<td><input checked disabled type="radio"></td>';
					}
					else{
						exer += 	'<td><input disabled type="radio"></td>' + 
									'<td><input disabled type="radio">'+
									'<td><input disabled type="radio"></td>';
					}
				}
					
				if(j == len-1)
					exer +=					'<input type="hidden" id="v-3-7-'+rowCount+'" value="'+v+'_'+str[1]+'_'+str[2]+'">';
				
				exer +=				'</td>';
				
				switch(str[2]) {
					case "Monday" :			
								if(c == 1)
									exer += 	'<td class="success">' + v + '</td>'; 
								else if(c == 2)
									exer += 	'<td class="warning">' + v + '</td>';
								else if(c == 3)
									exer += 	'<td class="danger">' + v + '</td>'; 
										
								exer +=	'<td></td>' +
											'<td></td>' +
											'<td></td>' +
											'<td></td>' +
											'<td></td>' +
											'<td></td>';
								break;
					case "Tuesday" :	exer += 	'<td></td>';
								if(c == 1)
									exer += 	'<td class="success">' + v + '</td>'; 
								else if(c == 2)
									exer += 	'<td class="warning">' + v + '</td>';
								else if(c == 3)
									exer += 	'<td class="danger">' + v + '</td>'; 
										
								exer +=	'<td></td>' +
											'<td></td>' +
											'<td></td>' +
											'<td></td>' +
											'<td></td>';
								break;
					case "Wednesday" :	exer += 	'<td></td>' +
											'<td></td>';
								if(c == 1)
									exer += 	'<td class="success">' + v + '</td>'; 
								else if(c == 2)
									exer += 	'<td class="warning">' + v + '</td>';
								else if(c == 3)
									exer += 	'<td class="danger">' + v + '</td>'; 
										
								exer +=	'<td></td>' +
											'<td></td>' +
											'<td></td>' +
											'<td></td>';
								break;
					case "Thursday" :	exer += 	'<td></td>' +
											'<td></td>' +
											'<td></td>';
								if(c == 1)
									exer += 	'<td class="success">' + v + '</td>'; 
								else if(c == 2)
									exer += 	'<td class="warning">' + v + '</td>';
								else if(c == 3)
									exer += 	'<td class="danger">' + v + '</td>'; 
										
								exer +=	'<td></td>' +
											'<td></td>' +
											'<td></td>';
								break;
					case "Friday" :	exer += 	'<td></td>' +
											'<td></td>' +
											'<td></td>' +
											'<td></td>';
								if(c == 1)
									exer += 	'<td class="success">' + v + '</td>'; 
								else if(c == 2)
									exer += 	'<td class="warning">' + v + '</td>';
								else if(c == 3)
									exer += 	'<td class="danger">' + v + '</td>'; 
										
								exer +=	'<td></td>' +
											'<td></td>';
								break;
					case "Saturday" :	exer += 	'<td></td>' +
											'<td></td>' +
											'<td></td>' +
											'<td></td>' +
											'<td></td>';
								if(c == 1)
									exer += 	'<td class="success">' + v + '</td>'; 
								else if(c == 2)
									exer += 	'<td class="warning">' + v + '</td>';
								else if(c == 3)
									exer += 	'<td class="danger">' + v + '</td>'; 
							
								exer +=	'<td></td>';
								break;
					case "Sunday" :	exer += 	'<td></td>' +
											'<td></td>' +
											'<td></td>' +
											'<td></td>' +
											'<td></td>' +
											'<td></td>';
								if(c == 1)
									exer += 	'<td class="success">' + v + '</td>'; 
								else if(c == 2)
									exer += 	'<td class="warning">' + v + '</td>';
								else if(c == 3)
									exer += 	'<td class="danger">' + v + '</td>'; 
								
								break;
				}
		
				exer += '</tr>';
			}
			
			rowCount15 = k;
			
			exer += 	'</tbody>' +
					'</table>' +			
					'<div class="clearfix"></div>';
			
			if(j == len-1 && sflag2==true) {
				exer += '<button type="button" id="weeklyMonitor" onclick="submitWeeklyMonitor('+sid+', ' +ssid+')"' + 
							'class="btn btn-success col-md-2">Submit</button>';
			}
			
			exer += '<div class="clearfix"></div>';
			divTab += exer + '</div>';
	   	}
		
		$('#tabs-'+sid+'-'+ssid).html(tabs);
		
		$('#ss-'+sid+'-'+ssid).html(divTab);
		
	});
}

function submitWeeklyMonitor(sid, ssid) {

	for (k = 1; k <= rowCount15; k++) {
		formData += 'data='+$('#v-3-7-'+k).val()+'_'+$('input[name="r-3-7-'+k+'"]:checked').val()+'&';
	}
	
	$.ajax({
		  type: "POST",
		  url: serverURL + "users/" + userId + "/sections/" + sid + "/subsections/" + ssid + "/practice4/new",
		  data: formData,
		  success: function(data){
				window.location.reload();
		  },
		  error: function() {
			  alert(serverURL + "users/" + userId + "/sections/3/subsections/7/practice4/new");
		  } 
	});
}