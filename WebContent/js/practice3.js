/**
 * 
 */

var count = 1;
var max = 3;
var form = '';
var table4RowCount = 0;
var rowCount = 0;
var pArray = new Array(7);

function practice3(arr) {
    
	for (p = 0; p < 7; p++) {
		pArray[p] = new Array(6);
	}
	var out = '';
   	var out1 = '<ul class="pagination">' +
					'<li>' + 
						'<a href="#" aria-label="Previous">' + 
							'<span aria-hidden="true">&laquo;</span>' + 
						'</a>' +
					'</li>';

    for(i = 0; i < arr.length; i++) {
    	j = i+1;
    	
    	if(j == 1) {
    		out += 	'<div id="page' + j + '">';
    	}
    	else {
    		out += 	'<div id="page' + j + '" class="hidden">';
    	}
    	
		out +=			'<p id="exercise-title' + j + '" class="text-justify"><strong>' + arr[i].exerciseTitle + '</strong></p>';
    	
    	
    	for (k = 0; k < arr[i].exerciseDesc.length; k++) {
			out += 	'<p class="text-justify">' + arr[i].exerciseDesc[k] + '</p>';
		}
    	
    	if(arr[i].questions.length != 0) {
    	
    		out += 		'<hr>' +
	    				'<h5>' + arr[i].questions[0].ques + '</h5>' + 
	    				'<div id="lists' + j + '" class="col-md-6 form-horizontal">';

	    	for (var k = 1; k <= 3; k++) {
				out +=  	'<div class="form-group input-group">' + 
									'<span class="input-group-addon">' + k + '.</span>' + 
									'<input id="f' + k + '_' + j + '" autocomplete="off" type="text" class="form-control"' + 
										'name="input">' +
							'</div>';
			}
    	
	    	out += 		'</div><div class="clearfix"></div>' + 
						'<div class="col-md-6">' +
							'<span id="err' + j + '" class="hidden">Please fill atleast 3 activities</span>' +
		    				'<div class="form-group">' + 
		    					'<button type="button" id="addInputs' + j + '" onclick="add(`' + k + '_' + j + '`)" class="btn btn-primary">Add More ...</button>' +
		    					'<button type="button" id="submit' + j + '" onclick="submit(' + j + ')" class="btn btn-success pull-right">Submit</button>' +
	    					'</div>' + 
    					'</div><div class="clearfix"></div><hr>';
    	}		
    	
    	x = j;			
		for (k = 0; k < arr[i].tables.length; k++) {
			if(arr[i].tables[k].type == 2) {		//	table type 2 = contains radio buttons
				
				out += 		'<div id="tables' + j + '" class="hidden">' +
								'<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
	    						'<table id="table' + x + '" class="table table-hover table-bordered">' + 
	    							'<thead id="thead" class="text-center">' + 
	    								'<tr>' + 
		    								'<th class="col-md-1" rowspan="2" style="vertical-align: middle;">S. No.</th>' +
    					 					'<th class="col-md-5" rowspan="2" style="vertical-align: middle;">' + arr[i].tables[k].thead[0] + '</th>' +
											'<th class="col-md-4" colspan="4" style="vertical-align: middle;">' + arr[i].tables[k].thead[1] + '</th>' +
											'<th class="col-md-2" rowspan="2" style="vertical-align: middle;">' + arr[i].tables[k].thead[2] + '</th>' +
										'</tr>' +
										'<tr>' +
											'<th class="col-md-1" style="vertical-align: middle;">' + arr[i].tables[k].options[0] + '</th>' +
											'<th class="col-md-1" style="vertical-align: middle;">' + arr[i].tables[k].options[1] + '</th>' +
											'<th class="col-md-1" style="vertical-align: middle;">' + arr[i].tables[k].options[2] + '</th>' +
											'<th class="col-md-1" style="vertical-align: middle;">' + arr[i].tables[k].options[3] + '</th>' +
										'</tr>' +
									'</thead>' + 
									'<tbody id="tbody' + x + '">' +
									'</tbody>' + 
								'</table>' +
							'</div>' + 
							'<button type="button" id="nextPage" onclick="next(' + j + ')" class="btn btn-success col-md-2 pull-right">Next</button>' +
							'<div class="clearfix"></div>';

			}				
			else if (arr[i].tables[k].type == 3) {
				out += 		'<div id="tables' + j + '" class="">' +
								'<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
	    						'<table id="table' + x + '" class="table table-hover table-bordered">' + 
	    							'<thead id="thead" class="text-center">' + 
	    								'<tr><th class="col-md-1 text-center">Scale<br>(10 to 1)</th>';
	    									
    			for (l = 0; l < arr[i].tables[k].thead.length; l++) {
					if(l == 0)
						out += 				'<th class="col-md-6">' + arr[i].tables[k].thead[l] + '</th>';
					else
    					out += 				'<th>' + arr[i].tables[k].thead[l] + '</th>';
				}				
    			out +=					'</tr>' +
									'</thead>' + 
									'<tbody id="tbody' + x + '">' +
									'</tbody>' + 
								'</table>' +
							'</div>' + 
							'<div class="clearfix"></div>';
			}
			else {
				out += 		'<div id="tables' + j + '" class="">' +
								'<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
	    						'<table id="table' + x + '" class="table table-hover table-bordered">' + 
	    							'<thead id="thead" class="text-center">' + 
	    								'<tr><th width="9%">S. No.</th>';
				for (l = 0; l < arr[i].tables[k].thead.length; l++) {
						out += 				'<th width="13%">' + arr[i].tables[k].thead[l] + '</th>';
				}
		
				out +=					'</tr>' +
									'</thead>' + 
									'<tbody id="tbody' + x + '">' +
									'</tbody>' + 
								'</table>' +
							'</div>' + 
							'<button type="button" id="weeklyPlanner" onclick="submitWeeklyPlanner(' + x + ')" class="btn btn-success col-md-2 pull-right">Submit</button>' +
							'<div class="clearfix"></div>';

			}
			x++;
		}
		
		if(j == 1) {
    		out1 += '<li id="l' + j + '" class="active">' + 
    					'<a href="#panel' + j + '" onclick="show(' + j + ')">' + j + '</a>' + 
					'</li>';
    	}
    	else {
    		out1 += '<li id="l' + j + '">' + 
    					'<a href="#panel' + j + '" onclick="show(' + j + ')">' + j + '</a>' + 
					'</li>';
    	}
    	
    	out += '</div>';
	}	
    out1 += '<li>' + 
   				'<a href="#" aria-label="Next">' + 
   					'<span aria-hidden="true">&raquo;</span>' + 
					'</a>' + 
				'</li>' + 
		'</ul>';

    $('#pages').html(out);
    $('#page').html(out1);
}
		
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
						'<input id="f' + arr[0] + '_' + arr[1] + '" autocomplete="off" type="text" class="form-control" name="input">' +
					'</div>';
		$('#lists'+arr[1]).append(field);
		arr[0]++;
		$('#addInputs'+arr[1]).attr('onclick', 'add("' + arr[0] + '_' + arr[1] + '")');
		max = arr[0] - 1;
	}
}

function practice3Workbook(arr, url, sid, ssid) {

	$.get(serverURL + "users/" + userId + "/" + url + "/workbook", function(data1){
			
		var pp = data1['practicePoints'];
		var tabs = '';
		var divTab = '';
		var exer = '';
		var tbody = '';
		
		for (j = 0; j <= pp.length; j++) {
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
		
			
			
			plbody = '';	// Potential List
	    	
			for(i = 0; i < arr.length; i++) {

		    	l = i+1;
		    	
		    	if(j != pp.length) {
		    		exer += 	'<div>';
		    	}
		    	else {
		    		if(l == 1) {
		        		exer += 	'<div id="page' + l + '">';
		        	}
		        	else {
		        		exer += 	'<div id="page' + l + '" class="hidden">';
		        	}
		    	}
		    	
		    	exer +=	'<p id="exercise-title' + l + '" class="text-justify"><strong>' + arr[i].exerciseTitle + '</strong></p>';
		    	
		    	for (k = 0; k < arr[i].exerciseDesc.length; k++) {
					exer += 	'<p class="text-justify">' + arr[i].exerciseDesc[k] + '</p>';
				}
		    	exer += '<hr>';
		    	
		    	tbody = '';
		    	
		    	if(arr[i].questions.length != 0) {
			    	
		    		exer += '<h5>' + arr[i].questions[0].ques + '</h5>';
		    		
		    		if(j != pp.length) {
		    			acts = pp[j];
		    			version = acts['version'];
		    			exer += '<div class="col-md-6 form-horizontal">';
		    		}
		    		else {
		    			exer += '<div id="lists' + l + '" class="col-md-6 form-horizontal">';
		    		}
		    		
		    		if(l == 1) {
		    			act = acts['pleasurable'];
		    			planner = acts['planner'];
		    			
		    			for (k = 1; k <= act.length; k++) {
							if(j != pp.length) {
								exer +=  	'<div class="form-group input-group">' + 
												'<span class="input-group-addon">' + k + '.</span>' + 
												'<input disabled="disabled" type="text" class="form-control" name="input" value="' + act[(k-1)]['activity'] + '">' +
											'</div>';
								tbody += 	'<tr>' + 
												'<td class="text-center">' + k + '.</td>' +
												'<td>' + act[(k-1)]['activity'] + '</td>' +
												'<td class="text-center" colspan="4">' + act[(k-1)]['frequency'] + '</td>' +
												'<td class="text-center">' + act[(k-1)]['scale'] + '</td>' +
												'</tr>';
								plbody += 	'<tr>' +
												'<td class="text-center">' + act[(k-1)]['scale'] + '</td>' +
												'<td>' + act[(k-1)]['activity'] + '</td>' +
												'<td class="text-center">P</td>' +
												'<td class="text-center">' + 
													'<div class="checkbox">' + 
														'<label>'; 
								plflag = false;
								plday = '';
								for (m = 0; m < planner.length; m++) {
									if(planner[m]['type'] == "Pleasurable" && planner[m]['activity'] == act[(k-1)]['activity']) {
										plflag = true;
										plday = planner[m]['day'];
										break;
									}
								}
								if(plflag == true) 
									plbody += 				'<input type="checkbox" disabled checked>';
								else {
									plbody += 				'<input type="checkbox" disabled>';
									plday = "None";
								}					
								plbody += 				'</label>' + 
						  							'</div>' + 
					  							'</td>'+
					  							'<td class="text-center">' + plday + '</td>' +
											'</tr>';
							}
							else {
								exer +=  	'<div class="form-group input-group">' + 
												'<span class="input-group-addon">' + k + '.</span>' +
												'<input id="f' + k + '_' + l + '" autocomplete="off" type="text" class="form-control"' + 
														'name="input" value="' + act[(k-1)]['activity'] + '">' +
											'</div>';
							}
				    	}
		    		}
		    		else if(l == 2) {
	    				act = acts['meaningful'];
		    			for (k = 1; k <= act.length; k++) {
							if(j != pp.length) {
								exer +=  	'<div class="form-group input-group">' + 
												'<span class="input-group-addon">' + k + '.</span>' + 
												'<input disabled="disabled" type="text" class="form-control" name="input" value="' + act[(k-1)]['activity'] + '">' +
											'</div>';
								tbody += 	'<tr>' + 
												'<td class="text-center">' + k + '.</td>' +
												'<td>' + act[(k-1)]['activity'] + '</td>' +
												'<td class="text-center" colspan="4">' + act[(k-1)]['frequency'] + '</td>' +
												'<td class="text-center">' + act[(k-1)]['scale'] + '</td>' +
											'</tr>';
								plbody += 	'<tr>' +
												'<td class="text-center">' + act[(k-1)]['scale'] + '</td>' +
												'<td>' + act[(k-1)]['activity'] + '</td>' +
												'<td class="text-center">M</td>' +
												'<td class="text-center">' + 
													'<div class="checkbox">' + 
														'<label>'; 
								plflag = false;
								plday = '';
								for (m = 0; m < planner.length; m++) {
									if(planner[m]['type'] == "Meaningful" && planner[m]['activity'] == act[(k-1)]['activity']) {
										plflag = true;
										plday = planner[m]['day'];
										break;
									}
								}
								if(plflag == true) 
									plbody += 				'<input type="checkbox" disabled checked>';
								else {
									plbody += 				'<input type="checkbox" disabled>';
									plday = "None";
								}
								plbody += 				'</label>' + 
						  							'</div>' + 
					  							'</td>'+
					  							'<td class="text-center">' + plday + '</td>' +
											'</tr>';
							}
							else {
								exer +=  	'<div class="form-group input-group">' + 
												'<span class="input-group-addon">' + k + '.</span>' + 
												'<input id="f' + k + '_' + l + '" autocomplete="off" type="text" class="form-control"' + 
														'name="input" value="' + act[(k-1)]['activity'] + '">' +
											'</div>';
							}
				    	}
		    		}
		    		else if(l == 3) {
		    			act = acts['mastery_oriented'];
		    			for (k = 1; k <= act.length; k++) {
							if(j != pp.length) {
								exer +=  	'<div class="form-group input-group">' + 
												'<span class="input-group-addon">' + k + '.</span>' + 
												'<input disabled="disabled" type="text" class="form-control" name="input" value="' + act[(k-1)]['activity'] + '">' +
											'</div>';
								tbody += 	'<tr>' + 
												'<td class="text-center">' + k + '.</td>' +
												'<td>' + act[(k-1)]['activity'] + '</td>' +
												'<td class="text-center" colspan="4">' + act[(k-1)]['frequency'] + '</td>' +
												'<td class="text-center">' + act[(k-1)]['scale'] + '</td>' +
											'</tr>';
								plbody += 	'<tr>' +
												'<td class="text-center">' + act[(k-1)]['scale'] + '</td>' +
												'<td>' + act[(k-1)]['activity'] + '</td>' +
												'<td class="text-center">MO</td>' +
												'<td class="text-center">' + 
													'<div class="checkbox">' + 
														'<label>'; 
								plflag = false;
								plday = '';
								for (m = 0; m < planner.length; m++) {
									if(planner[m]['type'] == "Mastery-Oriented" && planner[m]['activity'] == act[(k-1)]['activity']) {
										plflag = true;
										plday = planner[m]['day'];
										break;
									}
								}
								if(plflag == true) 
									plbody += 				'<input type="checkbox" disabled checked>';
								else {
									plbody += 				'<input type="checkbox" disabled>';
									plday = "None";
								}					
								plbody += 				'</label>' + 
						  							'</div>' + 
					  							'</td>'+
					  							'<td class="text-center">' + plday + '</td>' +
											'</tr>';
							}
							else {
								exer +=  	'<div class="form-group input-group">' + 
												'<span class="input-group-addon">' + k + '.</span>' + 
												'<input id="f' + k + '_' + l + '" autocomplete="off" type="text" class="form-control"' + 
														'name="input" value="' + act[(k-1)]['activity'] + '">' +
											'</div>';
							}
				    	}
		    		}
		    		
		    		exer += '</div><div class="clearfix"></div>';
		    		
		    		if(j == pp.length) {
		    			exer +=	'<div class="col-md-6">' +
									'<span id="err' + j + '" class="hidden">Please fill atleast 5 activities</span>' +
				    				'<div class="form-group">' + 
				    					'<button type="button" id="addInputs' + l + '" onclick="add(`' + k + '_' + l + '`)" class="btn btn-primary">Add More ...</button>' +
				    					'<button type="button" id="submit' + l + '" onclick="submit(' + l + ')" class="btn btn-success pull-right">Submit</button>' +
			    					'</div>' + 
								'</div><div class="clearfix"></div><hr>';
		    		}
		    		
		    	}
		    	
	    		x = l;
		    	for (k = 0; k < arr[i].tables.length; k++) {
	    			
	    			if(arr[i].tables[k].type == 2) {		//	table type 2 = contains radio buttons
	    				thead = '<thead class="text-center">' + 
									'<tr>' + 
										'<th class="col-md-1" rowspan="2" style="vertical-align: middle;">S. No.</th>' +
					 					'<th class="col-md-5" rowspan="2" style="vertical-align: middle;">' + arr[i].tables[k].thead[0] + '</th>' +
										'<th class="col-md-4" colspan="4" style="vertical-align: middle;">' + arr[i].tables[k].thead[1] + '</th>' +
										'<th class="col-md-2" rowspan="2" style="vertical-align: middle;">' + arr[i].tables[k].thead[2] + '</th>' +
									'</tr>' +
									'<tr>' +
										'<th class="col-md-1" style="vertical-align: middle;">' + arr[i].tables[k].options[0] + '</th>' +
										'<th class="col-md-1" style="vertical-align: middle;">' + arr[i].tables[k].options[1] + '</th>' +
										'<th class="col-md-1" style="vertical-align: middle;">' + arr[i].tables[k].options[2] + '</th>' +
										'<th class="col-md-1" style="vertical-align: middle;">' + arr[i].tables[k].options[3] + '</th>' +
									'</tr>' +
								'</thead>'; 
	    			}
	    			else if (arr[i].tables[k].type == 3) {
	    				thead = '<thead id="thead" class="text-center">' + 
    								'<tr><th class="col-md-1 text-center">Scale<br>(10 to 1)</th>';
	    	    									
	        			for (a = 0; a < arr[i].tables[k].thead.length; a++) {
	    					if(a == 0)
	    						thead +=	'<th class="col-md-6">' + arr[i].tables[k].thead[a] + '</th>';
	    					else
	        					thead += 	'<th>' + arr[i].tables[k].thead[a] + '</th>';
	    				}				
	        			thead +=	'</tr>' +
								'</thead>';
	    			}
	    			else {
	    				thead ='<thead id="thead" class="text-center">' + 
    								'<tr><th width="9%">S. No.</th>';
	    				for (a = 0; a < arr[i].tables[k].thead.length; a++) {
	    					thead +=	'<th width="13%">' + arr[i].tables[k].thead[a] + '</th>';
	    				}
	    		
	    				thead +=	'</tr>' +
								'</thead>';

	    			}
	    			
	    			if(j != pp.length) {
							
		    			exer += 	'<div class="">' +
			    						'<h4 class="text-center">' + arr[i].tables[k].title + '</h4>';
										
		    			if(arr[i].tables[k].type == 3) {
		    				exer += 	'<table id="pltable'+j+'" class="table table-hover table-bordered">' + thead +
		    								'<tbody>' + plbody + '</tbody>';
		    			}
		    			else if(arr[i].tables[k].type == 2) {
		    				exer += 	'<table class="table table-hover table-bordered">' + thead +
		    								'<tbody>' + tbody + '</tbody>';
		    			}
	
		    			exer += 		'</table>' +
									'</div>';
	    			}
	    			else {
	    				exer += 	'<div id="tables' + l + '" class="hidden">' +
			    						'<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
										'<table id="table' + x + '" class="table table-hover table-bordered">' + thead +
											'<tbody id="tbody' + x + '">' + tbody +
											'</tbody>' + 
										'</table>' +
									'</div>' + 
									'<button type="button" id="nextPage" onclick="next(' + l + ')" class="btn btn-success col-md-2 pull-right">Next</button>' +
									'<div class="clearfix"></div>';
	    				
	    			}
	    			x ++;
		    	}
		    	exer += '</div>';
		    		
			}
			divTab += exer + '</div>';
			
	    	sortTable($('#pltable'+j), 'desc');
		}
		
		$('#tabs-'+sid+'-'+ssid).html(tabs);
		
		$('#ss-'+sid+'-'+ssid).html(divTab);
		
		
	});
}


function fillData(arr) {
	var out= '';
	
	for (j = 0; j < arr.length; j++) {
		tbody = '';
		arr1 = arr[j]['activityList'];
		for (l = 0; l < arr1.length; l++) {
			arr2 = arr1[k];
			
			
			k = l+1;


			tbody += 	'<tr>' + 
							'<td class="text-center">' + k + '.</td>' +
							'<td>' + arr2['activity'] + '</td>' +
							'<td class="text-center" colspan="4">' + arr2['frequency'] + '</td>' +
							'<td class="text-center">' + arr2['scale'] + '</td>' +
						'</tr>';
			/*-----------------------*/
			
		}
		$('#tbody'+(j+1)).html(tbody);
	}
}

function removeBtn(c){
	$('#field'+c).remove();
	$('#err'+c).remove();
	count--;
}
	
function show(c) {

	if( c == 4) {
		sortTable($('#table4'),'desc');
	}
	for (k = 1; k <= i+1; k++) {
		$('#page'+k).addClass('hidden');
		$('#l'+k).removeClass('active');
	}
	$('#page'+c).removeClass('hidden');
	$('#l'+c).addClass('active');

}
		
function submit(c) {
	var tbody = '';
	
	for (k = 1; k <= max; k++) {
		tbody += 	'<tr>' + 
						'<td class="text-center">' + k + '.</td>' +
						'<td>' + $('#f'+k+'_'+c).val() + '</td>' +
						'<form id="myForm' + k + '">' +
						'<td class="text-center">' + 
							'<input type="radio" id="freq' + k+'_'+c + '" name="freq' + k+'_'+c + '" value="1" onclick="setRadio(`'+k+'_1`)">' + 
						'</td>' +
						'<td class="text-center">' + 
							'<input type="radio" id="freq' + k+'_'+c + '" name="freq' + k+'_'+c + '" value="2" onclick="setRadio(`'+k+'_2`)">' + 
						'</td>' +
						'<td class="text-center">' + 
							'<input type="radio" id="freq' + k+'_'+c + '" name="freq' + k+'_'+c + '" value="3" onclick="setRadio(`'+k+'_3`)">' + 
						'</td>' +
						'<td class="text-center">' + 
							'<input type="radio" id="freq' + k+'_'+c + '" name="freq' + k+'_'+c + '" value="4" onclick="setRadio(`'+k+'_4`)">' + 
						'</td>' +
						'</form>' +
						'<td class="text-center">' + 
							'<select id="scale' + k+'_'+c + '" class="form-control text-center">';
							
		for(l=1; l<=10; l++) {
			if(l != 10) {
				tbody +=		'<option value="0'+l+'">' + l + '</option>';
			}	
			else {
				tbody += 		'<option value="'+l+'">' + l + '</option>';
			}
		}
			tbody += 		'</select>' 
						'</td>' +
					'</tr>';	// class="col-md-6"			
			
	}
	
	$('#addInputs'+c).addClass('hidden');
	$('#submit'+c).addClass('hidden');
	$('#tables'+c).removeClass('hidden');
	$('#tbody'+c).append(tbody);
	$('#nextPage').removeClass('hidden');
}

function setRadio(c) {
	form += 'freq=' + c + '&';
}

function next(c){
	form += 'page='+c+'&';
	var tbody4 = '';
	
	if(c == 1) 
		str = "practice3/new";
	else 
		str = "practice3/continue/"+version;
	
	for (j = 1; j <= max; j++) {
		form += 'act=' + $('#f'+j+'_'+c).val() + '&';
		form += 'scale=' + $('#scale'+j+'_'+c).val() + '&';
		
		table4RowCount++;
		q = table4RowCount;
		
		tbody4 += 	'<tr>';	
			
		tbody4 += 		'<td class="col-md-1 text-center">' + $('#scale'+j+'_'+c).val() + '</td>' +
						'<td class="col-md-6" style="padding-left: 20px;">' + $('#f'+j+'_'+c).val() + '</td>';
		if(c == 1) 
			tbody4 +=	'<td class="text-center">P</td>';
		else if(c == 2) 
			tbody4 +=	'<td class="text-center">M</td>';
		else if(c == 3) 
			tbody4 +=	'<td class="text-center">MO</td>';
				
		tbody4 +=		'<td class="text-center">' + 
							'<div class="checkbox">' + 
								'<label>' + 
									'<input type="checkbox" id="check' + q + '" name="check' + q + '" value="' + q + '" onchange="check(' + q + ')">' +
								'</label>' + 
		  					'</div>' + 
	  					'</td>' +
						'<td>' + 
							'<select disabled="disabled" id="day'+q+'" name="day'+q+'" class="form-control" onchange="setWeeklyPlanner(`' + $('#f'+j+'_'+c).val() + '`, ' + q + ', ' + c + ')">' +
								'<option value="0">None</option>' +
								'<option value="1">Monday</option>' +
								'<option value="2">Tuesday</option>' +
								'<option value="3">Wednesday</option>' +
								'<option value="4">Thursday</option>' +
								'<option value="5">Friday</option>' +
								'<option value="6">Saturday</option>' +
								'<option value="7">Sunday</option>' +
		  		          	'</select>' +
		  		       	'</td>' +
					'</tr>';

	}

	$('#tbody4').append(tbody4);
	
	$.ajax({
		  type: "POST",
		  url: serverURL + "users/" + userId + "/sections/" + sectionId + "/subsections/" + subsectionId + "/" + str,
		  data: form,
		  success: function(data){
			  version = data['version'];
			  c++;
			  show(c);
			  max = 3
	      	  form = '';
		  },
		  error: function() {
			  alert(serverURL + "users/" + userId + "/sections/" + sectionId + "/subsections/" + subsectionId + "/" + str);
			  
		  } 
	}); 
}

var version = 0;

function check(j) {
	if ($('#check'+j).is(":checked")) {
		$('#day'+j).prop('disabled', false);
    }
    else {
    	$('#day'+j).prop('disabled', 'disabled');
    }
}


function sortTable(table, order) {
	var asc   = order === 'asc',
        tbody = table.find('tbody');
    
    tbody.find('tr').sort(function(a, b) {
        if (asc) {
            return $('td:first', a).text().localeCompare($('td:first', b).text());
        } else {
            return $('td:first', b).text().localeCompare($('td:first', a).text());
        }
    }).appendTo(tbody);
}

function setWeeklyPlanner(v, j, c) {
	var tbody5 = '<tr class="text-center">';
	
	switch($('#day'+j).val()) {
		case "1" :	tbody5 += 	'<td>' + (++rowCount) + '</td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="success">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case "2" :	tbody5 += 	'<td>' + (++rowCount) + '</td>' +
								'<td></td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="success">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case "3" :	tbody5 += 	'<td>' + (++rowCount) + '</td>' +
								'<td></td>' +
								'<td></td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="success">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case "4" :	tbody5 += 	'<td>' + (++rowCount) + '</td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="success">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case "5" :	tbody5 += 	'<td>' + (++rowCount) + '</td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="success">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>';
					break;
		case "6" :	tbody5 += 	'<td>' + (++rowCount) + '</td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="success">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger">' + v + '</td>'; 
				
					tbody5 +=	'<td></td>';
					break;
		case "7" :	tbody5 += 	'<td>' + (++rowCount) + '</td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="success">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger">' + v + '</td>'; 
					
					break;
	}
	tbody5 += '</tr>';
	$('#tbody5').append(tbody5);
}

function submitWeeklyPlanner(x) {
	
	count = 1;
	formData = '';
	$('#table'+x+' td').each(function() {
		if(count == 9)
			count = 1;
		if( $(this).hasClass("success") )
			formData += "arr=" + $(this).text()+"_p_"+count + "&";
		else if( $(this).hasClass("info") )
			formData += "arr=" + $(this).text()+"_m_"+count + "&";
		else if( $(this).hasClass("danger") )
			formData += "arr=" + $(this).text()+"_mo_"+count + "&";
		
		count++;
	});
	
	
	$.ajax({
		  type: "POST",
		  url: serverURL + "users/" + userId + "/sections/" + sectionId + "/subsections/" + subsectionId + "/planner/" + version,
		  data: formData,
		  success: function(data){
			  $('#weeklyPlanner').addClass("hidden");
			  $('#next').removeClass("hidden");
			
		  },
		  error: function() {
			  alert(serverURL + "users/" + userId + "/sections/" + sectionId + "/subsections/" + subsectionId + "/planner/" + version);
			 
		  } 
	}); 
	
	
}