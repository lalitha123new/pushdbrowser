/**
 * 
 */
var userId = $.cookie('userId');


//old code
var count = 1;
var max = 3;
var form = '';
var tbody = '';
var t = 0;
var value = 0;
var table4RowCount = 0;
var rowCount = 0;
var pArray = new Array(7);

//declaring variable -new code 
var retrieved_data ;
var paresed_data1_table1;
var parsed_data2_table2;
var parsed_data3_table3;
var parsed_data2_table2_array = [];
var table3arr = []
var data_length = 0;
var final_sorted_arr_data = [];
var table2arr1;

var download3_data = [];
var new_array1 = [];
var new_array2 = [];




//begin rest call  to display the data for 3 tables from database  in section 3.2
$(document)
		.ready(
				function() {
					

					$
							.ajax({
								type : "GET",
								url : serverURL + "users/" + userId
										+ "/sections/" + 3 + "/subsections/"
										+ 2 + "/" + "3rdSecdata/1",
								contentType : "application/json",
								dataType : "json",
								success : function(data) {
                               
							
								if(data != null){
									
									 retrieved_data = data;
									 data_length = retrieved_data.length;
									 
									
									var arr_new = [];
									for (var i = 0; i < retrieved_data.length; i++) {	
									arr_new.push(retrieved_data[i].category_id);
										
									}

									for (var i = 0; i < retrieved_data.length; i++) {
										
										//display first two tables data from database before filling data in the third table
										if(data_length == 2){
											
											//begin code for extracting first table values
										for ( var v in retrieved_data[i]) {

											if (retrieved_data[i][v] == "2a") {
												
												var arr_tablenew1 = [];
												arr_tablenew1.push(retrieved_data[i].response);
												datanew1 = arr_tablenew1[0];
										
												parsed_data1  = JSON.parse("[" + datanew1 + "]");
												paresed_data1_table1 = parsed_data1[0];								
																	 
											}
											//end of code for extracting first table values
											
											
											
											//extracting second table values
											
											else if (retrieved_data[i][v] == "2b") {
												

												var arr_tablenew2 = [];
												arr_tablenew2.push(retrieved_data[i].response);
												
												datanew2 = arr_tablenew2[0];
												
												
												parsed_data2  = JSON.parse("[" + datanew2 + "]");
												parsed_data2_table2 = parsed_data2[0];	
												
											}
										}
										
										
										
										}
										
											//end of code for extracting second table values
										
										
										//befin code for displaying 3 tables data from the database after filling details in the third table
										else {
											
											
											
											for ( var v in retrieved_data[i]) {

												if (retrieved_data[i][v] == "2a") {
													
													var arr_tablenew1 = [];
													arr_tablenew1.push(retrieved_data[i].response);
													datanew1 = arr_tablenew1[0];
											
													parsed_data1  = JSON.parse("[" + datanew1 + "]");
													paresed_data1_table1 = parsed_data1[0];								
																		 
												}
												//end of code for extracting first table values
												
												
												
												//extracting second table values
												
												else if (retrieved_data[i][v] == "2b") {
													

													var arr_tablenew2 = [];
													arr_tablenew2.push(retrieved_data[i].response);
													datanew2 = arr_tablenew2[0];
													
													
													parsed_data2  = JSON.parse("[" + datanew2 + "]");
													parsed_data2_table2 = parsed_data2[0];	
													
												}
											
												//begin code for extracting third table values
											else if (retrieved_data[i][v] == "2c") {

												var arr_tablenew3 = [];
												arr_tablenew3.push(retrieved_data[i].response);		
												datanew3 = arr_tablenew3;
												
												
												parsed_data3  = JSON.parse("[" + datanew3 + "]");
												parsed_data3_table3 = parsed_data3[0];
												
											}
										}
											//end of code for extracting third table values

											
											
										}

									}
									
									
								}
									
								},
								error : function() {
									alert("Error: server encountered an internal error. Please try again after some time ");

								}
								
							});
					
					
					
				});

//end of rest call to to display the data for 3 tables from database  in section 3.2


//begin old and new  code for getting the data from json file  and continue in  section 3.2 for first time users
function practice11(arr) {

	//old code
	for (p = 0; p < 7; p++) {
		pArray[p] = new Array(6);
	}
	//end of old code

	//old code
	var out = '';
	var out1 = '<ul  class="hidden pagination">' + '<li>'
			+ '<a href="#" aria-label="Previous">'
			+ '<span aria-hidden="true">&laquo;</span>' + '</a>' + '</li>';
	//end of old code

	
	//old code
	i = 0;
	j = i + 1;
	c = i + 1;
	//end of old code

	//begin code to display the text data from json file
	for (k = 0; k < arr[i].exerciseDesc.length; k++) {
		out += '<p class="text-justify">' + arr[i].exerciseDesc[k] + '</p>';
	}
	//end of code to display the text daya from json file

	
	//old code
	out += '<div class="clearfix"></div><hr>';
	x = j;
	//end of old code

	
	//display the first table header data from the json file
	k = 0;

	// begin code to display the first table div if the data from the database is null
	
	if(retrieved_data == null){

	out += '<div id="tables1" class="form-group input-group">'
			+

			// '<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
			'<table id="table" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
			+ '<thead id="thead" class="text-center">'
			+

			'<tr>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">S. No.</th>'
			+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[0]
			+ '</th>'
			+ '<th class="col-md-3" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[1]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[2]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[3] + '</th>';
	'</tr>';

	'</thead>';

	for (k = 1; k <= 3; k++) {

		out += '<tbody id="tbody1">' +

		'<tr>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<span class="input-group-addon">'
				+ k
				+ '.</span>'
				+ '</td>'
				+

				'<td style="border:1px solid #FFB74D;" id ="tabletd1">'
				+ '<input id="f'
				+ k
				+ '" autocomplete="off" type="text" class="form-control"'
				+ 'name="input">'
				+ '</td>'
				+

				// dropdown1
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select id="scale1'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ k
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1">Pleasurable</option>'
				+ '<option value="2">Meaningful</option>'
				+ '<option value="3">Mastery-oriented</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown2
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select id="scale2'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ k
				+ ')">'
				+

				'<option value="-1">Select</option>'
				+ '<option value="1">A few times a week</option>'
				+ '<option value="2">Once a week</option>'
				+ '<option value="3">Less than once a week</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown3
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select id="scale3'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ k
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1">Easy</option>'
				+ '<option value="2">Slightly difficult</option>'
				+ '<option value="3">Somewhat difficult</option>'
				+ '<option value="4">Very difficult</option>';
		'</select>';

		'</td>';

		'</tr>';

		'</tbody>';

	}

	out += '</table>';

	// begin buttons to add more rows and submit

	out += '<div class="form-group">';
	out += '<button type="button" id="addInputs1" onclick="add(`' + k
			+ '`)" class="btn btn-primary">Add More ...</button>';
	out += '<button id="skip1" class="  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip1()">Skip</button>';
	out += '<button type="button" id="submit" onclick="submit()" class="btn btn-success pull-right">Submit</button>';
	out += '<button type="button" id="download1" onclick="download1()" class="btn btn-warning pull-right hidden">Download</button>';
	out += '</div>';

	// end of add and submit buttons

	out += '<div class="clearfix"></div><hr>';

	out += '</div>';
	
	}
	// end of  code to display the first table div if the data from the database is null
	
	//begin code if data length is 1
	
else if(data_length == 1){
	
		//the user completed first table and loggout out and again comes to section 3.2
		//begin first table data details display
		
		out += '<div id="tables1" class="form-group input-group">'
			+

			// '<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
			'<table id="table" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
			+ '<thead id="thead" class="text-center">'
			+

			'<tr>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">S. No.</th>'
			+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[0]
			+ '</th>'
			+ '<th class="col-md-3" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[1]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[2]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[3] + '</th>';
	'</tr>';

	'</thead>';

	for (var j = 0; j < paresed_data1_table1.length; j++) {
		
		
		out += '<tbody id="tbody1">' +

		'<tr>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<span class="input-group-addon">'
				+ (j+1)
				+ '.</span>'
				+ '</td>'
				+

				'<td style="border:1px solid #FFB74D;" id ="tabletd1">'
				+ '<input id="f'
				+ j
				+ '" autocomplete="off" type="text" class="form-control"'
				+ 'name="input" value ="'+paresed_data1_table1[j].inputVal+'" disabled>'
				+ '</td>'
				+

				// dropdown1
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale1'
				+ j
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].natureVal == "Pleasurable") {
					out += ' selected'
				}
				out += '>Pleasurable</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].natureVal == "Meaningful") {
					out += ' selected'
				}
				out += '>Meaningful</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].natureVal == "Mastery-oriented") {
					out += ' selected'
				}
				out += '>Mastery-oriented</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown2
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale2'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+

				'<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].freVal == "1") {
					out += ' selected'
				}
				out += '>A few times a week</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].freVal == "2") {
					out += ' selected'
				}
				out += '>Once a week</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].freVal == "3") {
					out += ' selected'
				}
				out += '>Less than once a week</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown3
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale3'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].easyVal == "1") {
					out += ' selected'
				}
				out += '>Easy</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].easyVal == "2") {
					out += ' selected'
				}
				out += '>Slightly difficult</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].easyVal == "3") {
					out += ' selected'
				}
				out += '>Somewhat difficult</option>'
					out += '<option value="4"';
				if (paresed_data1_table1[j].easyVal == "4") {
					out += ' selected'
				}
				out += '>Very difficult</option>'
				+ '</select>'
				+

		'</td>';

		'</tr>';

		'</tbody>';

	}

	out += '</table>';
	out += '<button type="button" id="download1" onclick="download1()" class="btn btn-warning pull-right">Download</button>';
	

	

	out += '<div class="clearfix"></div><hr>';

	

	out += '</div>';
	//end of  first table data details display
	

	//begin second table data details display when user logs out after first table and again comes to section 3.2
	out += '<div class="form-group " id="tables2_data_dbvalues">'
		+
		'<h3>'+"3.3 Potential List and Weekly Planner"+'</h3>'+
		'<p>'
		+ "Here is a table with a list of activities based on how easy it is for you to do them and how often you are currently doing them!<br>The coloured ones are those we suggest to you, as good starting points.<br><br>Please select the various days in the next one week when you want to do them. You can choose to do an activity on multiple days ."
		+ '</p>'
		+ '<br>'
		+ '<br>'
		+ '<p class="text-center">'
		+ '<strong>'
		+ "YOUR POTENTIAL LIST"
		+ '</strong>'
		+ '</</p>'
		+

		'<table id="table2_data_dbvalues" class="table table-hover table-bordered myTable" style="border:1px solid #FFB74D;background: #FFE0B2;">'
		+

		'<thead id="thead">'
		+

		'<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Activity"
		+ '</th>'+
		'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Nature"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Monday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Tuesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Wednesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Thursday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Friday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Saturday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Sunday" + '</th>' +

		'</thead>' ;
	
	var sorted_arr_data = custom_sort(arr, arr.length);
	

	
	var sorted_arr_data = custom_sort(paresed_data1_table1,paresed_data1_table1.length);
	var number = paresed_data1_table1.length;
	
	
	
var top_pleasurable = top_meaningful = top_mastery = 0;

	
	for (k = 0; k < number; k++) {
		if (sorted_arr_data[k].natureVal == "Pleasurable" && top_pleasurable == 0) {
			top_pleasurable = sorted_arr_data[k];
		} else if (sorted_arr_data[k].natureVal == "Meaningful"
				&& top_meaningful == 0) {
			top_meaningful = sorted_arr_data[k];
		} else if (sorted_arr_data[k].natureVal == "Mastery-oriented"
				&& top_mastery == 0) {
			top_mastery = sorted_arr_data[k];
		}
	}
	
	
	//new array to store the sorted data(P,M,M-O on top) and highlight in second table
	//new arrays created to store the first P,M and M-O row data from the sorted_arr and highlight in second table if length of arr is <6
	var top_pleasurable = top_meaningful = top_mastery = 0;

	
	for (k = 0; k < number; k++) {
		if (sorted_arr_data[k].natureVal == "Pleasurable" && top_pleasurable == 0) {
			top_pleasurable = sorted_arr_data[k];
		} else if (sorted_arr_data[k].natureVal == "Meaningful"
				&& top_meaningful == 0) {
			top_meaningful = sorted_arr_data[k];
		} else if (sorted_arr_data[k].natureVal == "Mastery-oriented"
				&& top_mastery == 0) {
			top_mastery = sorted_arr_data[k];
		}
	}
	final_sorted_arr_data.push(top_pleasurable);
	final_sorted_arr_data.push(top_meaningful);
	final_sorted_arr_data.push(top_mastery);
	
	//new arrays created to store the first P,M and M-O row data from the sorted_arr and highlight in second table if length of arr is >6
	var second_pleasurable = second_meaningful = second_mastery = null
	for (k = 0; k < number; k++) {
		var value = sorted_arr_data[k]
		
		if (value != top_pleasurable && value != top_meaningful
				&& value != top_mastery) {
			if (value.natureVal == "Pleasurable" && second_pleasurable == null) {
				second_pleasurable = value;
				
			} else if (value.natureVal == "Meaningful"
					&& second_meaningful == null) {
				second_meaningful = value;
				
			} else if (value.natureVal == "Mastery-oriented"
					&& second_mastery == null) {
				second_mastery = value;
				
			}
		}
	}
	
	//new array to store the sorted data(P,M,M-O on top) and highlight in second table
	if (second_pleasurable != null) {
		final_sorted_arr_data.push(second_pleasurable);		
	}
	if (second_meaningful != null) {		
		final_sorted_arr_data.push(second_meaningful);
	}
	if (second_mastery != null) {
		final_sorted_arr_data.push(second_mastery);		
	}


for (k = 0; k < number; k++) {
	var value = sorted_arr_data[k]
	if (value != top_pleasurable && value != top_meaningful
			&& value != top_mastery && value != second_pleasurable
			&& value != second_meaningful && value != second_mastery) {
		final_sorted_arr_data.push(sorted_arr_data[k]);
		console.log(typeof final_sorted_arr_data);
	}
}



var no_of_entries = final_sorted_arr_data.length

for (k = 0; k < no_of_entries; k++) {
	

	// begin second table

	out += '<tbody id="tbody2_data">' +'<tr>' + '<td style="border:1px solid #FFB74D;">'
			+ final_sorted_arr_data[k].inputVal + '</td>';

	if (final_sorted_arr_data[k] == top_pleasurable) {
		 out+= '<td class="nature'
				+ k
				+ '" style="border:1px solid #FFB74D; background-color:#23ba34;">'
				+ final_sorted_arr_data[k].natureVal;
	} else if (final_sorted_arr_data[k] == top_meaningful) {
		  out+='<td class="nature'
				+ k
				+ '" style="border:1px solid #FFB74D; background-color:#f7c02a;">'
				+ final_sorted_arr_data[k].natureVal;
	} else if (final_sorted_arr_data[k] == top_mastery) {
		 out+= '<td class="nature'
				+ k
				+ '" style="border:1px solid #FFB74D; background-color:#4ba2e5;">'
				+ final_sorted_arr_data[k].natureVal;

	} else if (no_of_entries > 6) {
		if (final_sorted_arr_data[k] == second_pleasurable) {
			out += '<td class="nature'
					+ k
					+ '" style="border:1px solid #FFB74D; background-color:#23ba34;">'
					+ final_sorted_arr_data[k].natureVal;
		} else if (final_sorted_arr_data[k] == second_meaningful) {
			out += '<td class="nature'
					+ k
					+ '" style="border:1px solid #FFB74D; background-color:#f7c02a;">'
					+ final_sorted_arr_data[k].natureVal;
		} else if (final_sorted_arr_data[k] == second_mastery) {
			out += '<td class="nature'
					+ k
					+ '" style="border:1px solid #FFB74D; background-color:#4ba2e5;">'
					+ final_sorted_arr_data[k].natureVal;

		} else {
			out += '<td class="nature' + k
					+ '" style="border:1px solid #FFB74D;">'
					+ final_sorted_arr_data[k].natureVal;
		}
	} else {
		out += '<td class="nature' + k
				+ '" style="border:1px solid #FFB74D;">'
				+ final_sorted_arr_data[k].natureVal;
	}

	out += '</td>' ;

	out +='<td class="text-center" style="border:1px solid #FFB74D;" id="check1">'
			+ '<input class="check" type="checkbox" name="day'
			+ k
			+ '"  value="1" id="day1'
			+ k
			+ '" onclick="setWeeklyPlanner(this)">'
			+ '</td>'
			+

			'<td class="text-center" style="border:1px solid #FFB74D;">'
			+ '<input class="check" type="checkbox" name="day'
			+ k
			+ '"  value="2" id="day2'
			+ k
			+ '"  onclick="setWeeklyPlanner(this)">'
			+ '</td>'
			+

			'<td class="text-center" style="border:1px solid #FFB74D;">'
			+ '<input class="check" type="checkbox" name="day'
			+ k
			+ '"  value="3" id="day3'
			+ k
			+ '"  onclick="setWeeklyPlanner(this)">'
			+ '</td>'
			+

			'<td class="text-center" style="border:1px solid #FFB74D;">'
			+ '<input class="check" type="checkbox" name="day'
			+ k
			+ '"  value="4" id="day4'
			+ k
			+ '"  onclick="setWeeklyPlanner(this)">'
			+ '</td>'
			+

			'<td class="text-center" style="border:1px solid #FFB74D;">'
			+ '<input class="check" type="checkbox" name="day'
			+ k
			+ '"  value="5" id="day5'
			+ k
			+ '"  onclick="setWeeklyPlanner(this)">'
			+ '</td>'
			+

			'<td class="text-center" style="border:1px solid #FFB74D;">'
			+ '<input class="check" type="checkbox" name="day'
			+ k
			+ '"  value="6" id="day6'
			+ k
			+ '"  onclick="setWeeklyPlanner(this)">'
			+ '</td>'
			+

			'<td class="text-center" style="border:1px solid #FFB74D;">'
			+ '<input type="checkbox" name="day'
			+ k
			+ '"  value="7" id="day7'
			+ k
			+ '" onclick="setWeeklyPlanner(this)">' + '</td>';

	'</tr>';
	out+='</tbody>';
	
}
out += '</table>';


//submit button for second table
out += '<button id="skip2_data" class="  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2_data()">Skip</button>';
out += '<div class="form-group">' +

'<button type="button" id="submit2_data" onclick="submit2(' + k
		+ ')" class="btn btn-success pull-right check_data">Submit</button>'
		+
		'<button id="skip2" class="hidden  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
		'<button type="button" id="download2" onclick="download2()" class="btn btn-warning pull-right hidden">Download</button>'
		+
		'<br>'+
		'</div>';


'</div>';




//end  second table data details display when user logs out after first table and again comes to section 3.2
//begin third table divwhen the user logged out after first table and then entering details in second table for the first time

out += '<div class="form-group hidden" id="tables3">'
		
		+ '<p class="text-center">'
		+ '<strong>'
		+ "YOUR WEEKLY MONITOR"
		+ '</strong>'
		+ '</p>'
		+

		'<table id="table3" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
		+

		'<thead id="thead">'
		+

		'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Activity"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Monday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Tuesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Wednesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Thursday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Friday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Saturday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Sunday" + '</th>' +

		'</thead>' +

		'<tbody id="tbody3">' +

		'</tbody>';

out += '</table>';
out+=

'<p>'
+"This weekly monitor is available in your workbook. "
+ "Check your planner every morning regarding activities you have planned to do and fill the day's column in the evening. Use this for the coming week.You can generate a new monitor template for a new week in the workbook, by clicking on the 'Add' button.<br>You will   receive  a version of this  ( blank)  form as  well as  a  few  forms   from other sections as  word  files over mail. Please check  your  mail  for  the same."
+ '</p>'
+ '<br>'
//begin third submit button

out += '<div class="form-group">' +
'<button id="skip3" class="hidden  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
'<button id="download3" class="  btn btn-warning  pull-right hidden"  onclick="download3()">Download</button>';



'</div>';
//end  third table divwhen the user logged out after first table and then entering details in second table for the first time



}

//end of code if length is 1
	
//begin code to display the first 2 tables if the data from the database is not null(length is 2) before filling the 3rd table
	else if(data_length == 2){
		
		
		//begin first table data details display
		
		out += '<div id="tables1" class="form-group input-group">'
			+

			// '<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
			'<table id="table" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
			+ '<thead id="thead" class="text-center">'
			+

			'<tr>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">S. No.</th>'
			+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[0]
			+ '</th>'
			+ '<th class="col-md-3" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[1]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[2]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[3] + '</th>';
	'</tr>';

	'</thead>';

	for (var j = 0; j < paresed_data1_table1.length; j++) {
		
		
		out += '<tbody id="tbody1">' +

		'<tr>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<span class="input-group-addon">'
				+ (j+1)
				+ '.</span>'
				+ '</td>'
				+

				'<td style="border:1px solid #FFB74D;" id ="tabletd1">'
				+ '<input id="f'
				+ j
				+ '" autocomplete="off" type="text" class="form-control"'
				+ 'name="input" value ="'+paresed_data1_table1[j].inputVal+'" disabled>'
				+ '</td>'
				+

				// dropdown1
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale1'
				+ j
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].natureVal == "Pleasurable") {
					out += ' selected'
				}
				out += '>Pleasurable</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].natureVal == "Meaningful") {
					out += ' selected'
				}
				out += '>Meaningful</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].natureVal == "Mastery-oriented") {
					out += ' selected'
				}
				out += '>Mastery-oriented</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown2
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale2'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+

				'<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].freVal == "1") {
					out += ' selected'
				}
				out += '>A few times a week</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].freVal == "2") {
					out += ' selected'
				}
				out += '>Once a week</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].freVal == "3") {
					out += ' selected'
				}
				out += '>Less than once a week</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown3
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale3'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].easyVal == "1") {
					out += ' selected'
				}
				out += '>Easy</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].easyVal == "2") {
					out += ' selected'
				}
				out += '>Slightly difficult</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].easyVal == "3") {
					out += ' selected'
				}
				out += '>Somewhat difficult</option>'
					out += '<option value="4"';
				if (paresed_data1_table1[j].easyVal == "4") {
					out += ' selected'
				}
				out += '>Very difficult</option>'
				+ '</select>'
				+

		'</td>';

		'</tr>';

		'</tbody>';

	}

	out += '</table>';
	out += '<button type="button" id="download1" onclick="download1()" class="btn btn-warning pull-right">Download</button>';

	

	out += '<div class="clearfix"></div><hr>';

	out += '</div>';
	//end of  first table data details display
	
	
	
	
	//begin second table data details display
	out += '<div class="form-group " id="tables2_dbvalues">'
		+
		'<h3>'+"3.3 Potential List and Weekly Planner"+'</h3>'+
		'<p>'
		+ "Here is a table with a list of activities based on how easy it is for you to do them and how often you are currently doing them!<br>The coloured ones are those we suggest to you, as good starting points.<br>Please select the various days in the next one week when you want to do them. You can choose to do an activity on multiple days ."
		+ '</p>'
		+ '<br>'
		+ '<br>'
		+ '<p class="text-center">'
		+ '<strong>'
		+ "YOUR POTENTIAL LIST"
		+ '</strong>'
		+ '</</p>'
		+

		'<table id="table2_dbvalues" class="table table-hover table-bordered myTable" style="border:1px solid #FFB74D;background: #FFE0B2;">'
		+

		'<thead id="thead">'
		+

		'<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Activity"
		+ '</th>'+
		'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Nature"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Monday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Tuesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Wednesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Thursday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Friday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Saturday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Sunday" + '</th>' +

		'</thead>' ;

	
	for (var m = 0; m < parsed_data2_table2.length; m++) {
		var data_row = parsed_data2_table2[m];
		out += '<tbody id="tbody1">' +'<tr>' + '<td style="border:1px solid #FFB74D;">'
		+ data_row.actName1 +  '</td>'+
		'<td style="border:1px solid #FFB74D;">'
		+ data_row.natureName1 +  '</td>'+
		



       

'<td class="text-center" style="border:1px solid #FFB74D;" id="check1">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="1" id="day1'
		+ m
		+ '" onclick="setWeeklyPlanner(this)"';

		if (data_row.checkboxes[0] == 1) {
			out += ' checked';
			
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check"  disabled type="checkbox" name="day'
		+ m
		+ '"  value="2" id="day2'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[1] == 1) {
			out += ' checked ';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="3" id="day3'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[2] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="4" id="day4'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[3] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="5" id="day5'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[4] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="6" id="day6'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[5] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input type="checkbox" disabled name="day'
		+ m
		+ '"  value="7" id="day7'
		+ m
		+ '" onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[6] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>';

'</tr>';

		'</tbody>';
	}

out += '</table>';
out += '<button type="button" id="download2" onclick="download2()" class="btn btn-warning pull-right">Download</button>';

'</div>';

//end of second table data details display



/*modified table3*/

//begin third table (AFTER 1 WEEK TO ENTER DETAILS IN THE third TABLE)
out += '<div class="form-group " id="tables3_dbvalues">'
	+'<br>'
	
	+ '<p class="text-center">'
	+ '<strong>'
	+ "YOUR WEEKLY MONITOR"
	+ '</strong>'
	+ '</p>'
	+

	'<table id="table3" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
	+

	'<thead id="thead">'
	+

	'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Activity"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Monday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Tuesday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Wednesday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Thursday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Friday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Saturday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Sunday" + '</th>' +

	'</thead>' ;


for (var m = 0; m < parsed_data2_table2.length; m++) {
	 activity_name = parsed_data2_table2[m].actName1;
	
	

	 // Initialize the values for third table
	 
	 var obj_table3 = {};
	 obj_table3.actName2 = activity_name;
	 obj_table3.buttons = [[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]];
	 table3arr.push(obj_table3);
	 

	var data_row = parsed_data2_table2[m];
	
	out += '<tbody id="tbody3">';
	if(data_row.checkboxes.indexOf(1) != -1){
		new_array2=data_row;
		
		download3_data.push(data_row);
		
		out += '<tr>' ;
		out += '<td style="border:1px solid #FFB74D;">';
		out += data_row.actName1 ;
		out +='</td>';	
	
	out += '<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[0] == 1) {
		
		out += '<button class="button button1_' + m
				+ ' button-activity " id = "buttongreen1_' + m
				+ '" onclick="changeColorGreen(\'buttongreen1_' + m
				+ '\', \'button1_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button1_' + m
				+ ' button-activity" id = "buttonyellow1_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow1_' + m
				+ '\', \'button1_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td>'  +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[1] == 1) {
		
		out += '<button class="button button2_' + m
				+ ' button-activity" id = "buttongreen2_' + m
				+ '" onclick="changeColorGreen(\'buttongreen2_' + m
				+ '\', \'button2_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button2_' + m
				+ ' button-activity" id = "buttonyellow2_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow2_' + m
				+ '\', \'button2_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[2] == 1) {
		
		out += '<button class="button button3_' + m
				+ ' button-activity" id = "buttongreen3_' + m
				+ '" onclick="changeColorGreen(\'buttongreen3_' + m
				+ '\', \'button3_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button3_' + m
				+ ' button-activity" id = "buttonyellow3_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow3_' + m
				+ '\', \'button3_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[3] == 1) {
		
		out += '<button class="button button4_' + m
				+ ' button-activity" id = "buttongreen4_' + m
				+ '" onclick="changeColorGreen(\'buttongreen4_' + m
				+ '\', \'button4_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button4_' + m
				+ ' button-activity" id = "buttonyellow4_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow4_' + m
				+ '\', \'button4_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[4] == 1) {
		
		out += '<button class="button button5_' + m
				+ ' button-activity" id = "buttongreen5_' + m
				+ '" onclick="changeColorGreen(\'buttongreen5_' + m
				+ '\', \'button5_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button5_' + m
				+ ' button-activity" id = "buttonyellow5_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow5_' + m
				+ '\', \'button5_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[5] == 1) {
		
		out += '<button class="button button6_' + m
				+ ' button-activity" id = "buttongreen6_' + m
				+ '" onclick="changeColorGreen(\'buttongreen6_' + m
				+ '\', \'button6_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button6_' + m
				+ ' button-activity" id = "buttonyellow6_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow6_' + m
				+ '\', \'button6_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[6] == 1) {
		
		out += '<button class="button button7_' + m
				+ ' button-activity" id = "buttongreen7_' + m
				+ '" onclick="changeColorGreen(\'buttongreen7_' + m
				+ '\', \'button7_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button7_' + m
				+ ' button-activity" id = "buttonyellow7_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow7_' + m
				+ '\', \'button7_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td></tr>';
	
	
	}
	out += '</tbody>';
}

	

out += '</table>';
out+=

'<p>'
+"This weekly monitor is available in your workbook. "
+ "Check your planner every morning regarding activities you have planned to do and fill the day's column in the evening. Use this for the coming week.You can generate a new monitor template for a new week in the workbook, by clicking on the 'Add' button.<br>You will   receive  a version of this  ( blank)  form as  well as  a  few  forms   from other sections as  word  files over mail. Please check  your  mail  for  the same."
+ '</p>'
+ '<br>'

'</div>';


out += '<div class="form-group">' +
'<button id="skip3" class="  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
'<button type="button" id="submit3" onclick="submit3(' + j + ','
+ activeSectionId + ',' + activeSubSectionId
+ ')" class="btn btn-success pull-right " disabled=true>Submit</button>'
+
'<button type="button" id="download3" onclick="download3()" class="btn btn-warning pull-right hidden">Download</button>';
'</div>';

//end of  third table (AFTER 1 WEEK TO ENTER DETAILS IN THE third TABLE)


		
	}
	

	///end of code to display the first 2 tables if the data from the database is not null(length is 2) before filling the 3rd table
	
	
	//begin code to display the 3 tables data from the database after filling details in the second table 
else if(data_length == 3){
		
		//begin first table data details display
		
		out += '<div id="tables1" class="form-group input-group">'
			+

			// '<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
			'<table id="table" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
			+ '<thead id="thead" class="text-center">'
			+

			'<tr>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">S. No.</th>'
			+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[0]
			+ '</th>'
			+ '<th class="col-md-3" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[1]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[2]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[3] + '</th>';
	'</tr>';

	'</thead>';

	for (var j = 0; j < paresed_data1_table1.length; j++) {
		
		
		out += '<tbody id="tbody1">' +

		'<tr>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<span class="input-group-addon">'
				+ (j+1)
				+ '.</span>'
				+ '</td>'
				+

				'<td style="border:1px solid #FFB74D;" id ="tabletd1">'
				+ '<input disabled id="f'
				+ j
				+ '" autocomplete="off" type="text" class="form-control"'
				+ 'name="input" value ="'+paresed_data1_table1[j].inputVal+'" >'
				+ '</td>'
				+

				// dropdown1
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale1'
				+ j
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')" >'
				+ '<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].natureVal == "Pleasurable") {
					out += ' selected'
				}
				out += '>Pleasurable</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].natureVal == "Meaningful") {
					out += ' selected'
				}
				out += '>Meaningful</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].natureVal == "Mastery-oriented") {
					out += ' selected'
				}
				out += '>Mastery-oriented</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown2
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale2'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+

				'<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].freVal == "1") {
					out += ' selected'
				}
				out += '>A few times a week</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].freVal == "2") {
					out += ' selected'
				}
				out += '>Once a week</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].freVal == "3") {
					out += ' selected'
				}
				out += '>Less than once a week</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown3
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale3'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].easyVal == "1") {
					out += ' selected'
				}
				out += '>Easy</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].easyVal == "2") {
					out += ' selected'
				}
				out += '>Slightly difficult</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].easyVal == "3") {
					out += ' selected'
				}
				out += '>Somewhat difficult</option>'
					out += '<option value="4"';
				if (paresed_data1_table1[j].easyVal == "4") {
					out += ' selected'
				}
				out += '>Very difficult</option>'
				+ '</select>'
				+

		'</td>';

		'</tr>';

		'</tbody>';

	}

	out += '</table>';
	out += '<button type="button" id="download1" onclick="download1()" class="btn btn-warning pull-right">Download</button>';

	

	out += '<div class="clearfix"></div><hr>';

	out += '</div>';
	//end of  first table data details display
	
	
	//begin second table data details display
	out += '<div class="form-group " id="tables2_dbvalues">'
		+
		'<h3>'+"3.3 Potential List and Weekly Planner"+'</h3>'+
		'<p>'
		+ "Here is a table with a list of activities based on how easy it is for you to do them and how often you are currently doing them!<br>The coloured ones are those we suggest to you, as good starting points.<br>Please select the various days in the next one week when you want to do them. You can choose to do an activity on multiple days ."
		+ '</p>'
		+ '<br>'
		+ '<br>'
		+ '<p class="text-center">'
		+ '<strong>'
		+ "YOUR POTENTIAL LIST"
		+ '</strong>'
		+ '</</p>'
		+

		'<table id="table2_dbvalues" class="table table-hover table-bordered myTable" style="border:1px solid #FFB74D;background: #FFE0B2;">'
		+

		'<thead id="thead">'
		+

		'<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Activity"
		+ '</th>'+
		'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Nature"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Monday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Tuesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Wednesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Thursday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Friday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Saturday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Sunday" + '</th>' +

		'</thead>' ;

	
	for (var m = 0; m < parsed_data2_table2.length; m++) {
		var data_row = parsed_data2_table2[m];
		out += '<tbody id="tbody1">' +'<tr>' + '<td style="border:1px solid #FFB74D;">'
		+ data_row.actName1 +  '</td>'+
		'<td style="border:1px solid #FFB74D;">'
		+ data_row.natureName1 +  '</td>'+
		



       

'<td class="text-center" style="border:1px solid #FFB74D;" id="check1">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="1" id="day1'
		+ m
		+ '" onclick="setWeeklyPlanner(this)"';

		if (data_row.checkboxes[0] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="2" id="day2'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[1] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="3" id="day3'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[2] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="4" id="day4'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[3] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="5" id="day5'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[4] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="6" id="day6'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[5] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class ="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="7" id="day7'
		+ m
		+ '" onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[6] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>';

'</tr>';

		'</tbody>';
	}

out += '</table>';
out += '<button type="button" id="download2" onclick="download2()" class="btn btn-warning pull-right">Download</button>';

'</div>';
//end of second table data details display

//begin third table data details display(AFTER 1 WEEK TO ENTER DETAILS IN THE third TABLE)
out += '<div class="form-group " id="tables3_dbvalues">'
	+'<br>'
	
	+ '<p class="text-center">'
	+ '<strong>'
	+ "YOUR WEEKLY MONITOR"
	+ '</strong>'
	+ '</p>'
	+

	'<table id="table3" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
	+

	'<thead id="thead">'
	+

	'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Activity"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Monday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Tuesday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Wednesday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Thursday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Friday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Saturday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Sunday" + '</th>' +

	'</thead>' ;

for(var n = 0 ;n < parsed_data3_table3.length ;n++){
	var act_name = parsed_data3_table3[n].actName2
	var buttons = parsed_data3_table3[n].buttons
	var checkboxes = parsed_data2_table2[n].checkboxes
	out +='<tbody id = "tbody3">' ;
	if(checkboxes.indexOf(1) != -1){
		new_array1 = parsed_data3_table3;
	 out += '<tr>' ;

	out += '<td style="border:1px solid #FFB74D;">'+ act_name +'</td>';

	out += '<td class="text-center" style="border:1px solid #FFB74D;">';
	
	if (checkboxes[0] == 1) {	
		
		out +='<button class="button button1_' + n
				+ ' button-activity " id = "buttongreen1_' + n
				+ '"';
		if (buttons[0][0] == 1) {
			out += 'style="background-color:green;"';
		}
		out +='>' + "Did" + '</button>'+
		 '<button class="button button1_' + n
				+ ' button-activity" id = "buttonyellow1_' + n
				+ '"';
				if (buttons[0][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';	
	}
	out += '</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	
	
	if (checkboxes[1] == 1) {	
	
		
		out += '<button class="button button2_' + n
				+ ' button-activity" id = "buttongreen2_' + n
				+ '"';
				if (buttons[1][0] == 1) {
					out += 'style="background-color:green;"';
				}
				out +='>' + "Did" + '</button>'+
		 '<button class="button button2_' + n
				+ ' button-activity" id = "buttonyellow2_' + n
				+ '"';
				if (buttons[1][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';
		}
	
	out += '</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	
	if (checkboxes[2] == 1) {	
	
		
		out += '<button class="button button3_' + n
				+ ' button-activity" id = "buttongreen3_' + n
				+ '"';
				if (buttons[2][0] == 1) {
					out += 'style="background-color:green;"';
				}
				out +='>' + "Did" + '</button>'+
		'<button class="button button3_' + n
				+ ' button-activity" id = "buttonyellow3_' + n
				+ '"';
				if (buttons[2][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';

	}
	
	out += '</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	
	if (checkboxes[3] == 1) {	

		
		out += '<button class="button button4_' + n
				+ ' button-activity" id = "buttongreen4_' + n
				+ '"';
				if (buttons[3][0] == 1) {
					out += 'style="background-color:green;"';
				}
				out +='>' + "Did" + '</button>'+
		 '<button class="button button4_' + n
				+ ' button-activity" id = "buttonyellow4_' + n
				+ '"';
				if (buttons[3][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';

	}
	
	out += '</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	
	if (checkboxes[4] == 1) {	
		
	 out += '<button class="button button5_' + n
				+ ' button-activity" id = "buttongreen5_' + n
				+ '"';
				if (buttons[4][0] == 1) {
					out += 'style="background-color:green;"';
				}
				out +='>' + "Did" + '</button>'+
		'<button class="button button5_' + n
				+ ' button-activity" id = "buttonyellow5_' + n
				+ '"';
				if (buttons[4][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';

	}
	
	out += '</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (checkboxes[5] == 1) {	
		
		out +='<button class="button button6_' + n
				+ ' button-activity" id = "buttongreen6_' + n
				+ '"';
				if (buttons[5][0] == 1) {
					out += 'style="background-color:green;"';
				}
				out +='>' + "Did" + '</button>'+
		 '<button class="button button6_' + n
				+ ' button-activity" id = "buttonyellow6_' + n
				+ '"';
				if (buttons[5][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';

	}
	
	
	out += '</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (checkboxes[6] == 1) {	

		
		 out += '<button class="button button7_' + n
				+ ' button-activity" id = "buttongreen7_' + n
				+ '"';
				if (buttons[6][0] == 1) {
					out += 'style="background-color:green;"';
				}
				out +='>' + "Did" + '</button>'+
		'<button class="button button7_' + n
				+ ' button-activity" id = "buttonyellow7_' + n
				+ '"';
				if (buttons[6][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';
	}
	
	out +='</td>';

	'</tr>';
	}

	'</tbody>';
}

	

out += '</table>';
out+=

'<p>'
+"This weekly monitor is available in your workbook. "
+ "Check your planner every morning regarding activities you have planned to do and fill the day's column in the evening. Use this for the coming week.You can generate a new monitor template for a new week in the workbook, by clicking on the 'Add' button.<br>You will   receive  a version of this  ( blank)  form as  well as  a  few  forms   from other sections as  word  files over mail. Please check  your  mail  for  the same."
+ '</p>'
+ '<br>'

'</div>';


out += '<div class="form-group">' +
'<button id="skip3" class="  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
'<button id="download3" class="  btn btn-warning  pull-right"  onclick="download3()">Download</button>';

/*'<button type="button" id="submit3" onclick="submit3(' + j + ','
+ activeSectionId + ',' + activeSubSectionId
+ ')" class="btn btn-success pull-right ">Submit</button>'*/
+ '</div>';


//end of third table data details display
	
		
	}
	
	//end of code to display the 3 tables data from the database after filling details in the second table 
	
	

	
	

	// begin second table div after entering details in first table for the first time 

	out += '<div class="form-group hidden" id="tables2">'
			+
			
			'<h3>'+"3.3 Potential List and Weekly Planner"+'</h3>'+

			'<p>'
			+ "Here is a table with a list of activities based on how easy it is for you to do them and how often you are currently doing them!<br>The coloured ones are those we suggest to you, as good starting points.<br>Please select the various days in the next one week when you want to do them. You can choose to do an activity on multiple days ."
			+ '</p>'
			+ '<br>'
			+ '<br>'
			+ '<p class="text-center">'
			+ '<strong>'
			+ "YOUR POTENTIAL LIST"
			+ '</strong>'
			+ '</</p>'
			+

			'<table id="table2" class="table table-hover table-bordered myTable" style="border:1px solid #FFB74D;background: #FFE0B2;">'
			+

			'<thead id="thead">'
			+

			'<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Activity"
			+ '</th>'
			+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Nature"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Monday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Tuesday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Wednesday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Thursday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Friday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Saturday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Sunday" + '</th>' +

			'</thead>' +

			'<tbody id="tbody2">' +

			'</tbody>';

	out += '</table>';

	// begin second submit button

	out += '<div class="form-group">' +

	'<button type="button" id="submit2" onclick="submit2(' + k
			+ ')" class="btn btn-success pull-right">Submit</button>'
			+
			'<button id="skip2" class="hidden  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
			
			'<button type="button" id="download2" onclick="download2()" class="btn btn-warning pull-right hidden">Download</button>'
			+'</div>';

	// end of second submit button

	'</div>';

	// end of  begin second table div after entering details in first table for the first time 
	

	// begin third table div after entering details in second table for the first time

	out += '<div class="form-group hidden" id="tables3">'
			
			+ '<p class="text-center">'
			+ '<strong>'
			+ "YOUR WEEKLY MONITOR"
			+ '</strong>'
			+ '</p>'
			+

			'<table id="table3" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
			+

			'<thead id="thead">'
			+

			'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Activity"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Monday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Tuesday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Wednesday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Thursday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Friday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Saturday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Sunday" + '</th>' +

			'</thead>' +

			'<tbody id="tbody3">' +

			'</tbody>';

	out += '</table>';
	out+=

	'<p>'
	+"This weekly monitor is available in your workbook. "
	+ "Check your planner every morning regarding activities you have planned to do and fill the day's column in the evening. Use this for the coming week.You can generate a new monitor template for a new week in the workbook, by clicking on the 'Add' button.<br>You will   receive  a version of this  ( blank)  form as  well as  a  few  forms   from other sections as  word  files over mail. Please check  your  mail  for  the same."
	+ '</p>'
	+ '<br>'

	// begin third submit button

	out += '<div class="form-group">' +
	'<button id="skip3" class="hidden  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
	'<button id="download3" class="  btn btn-warning  pull-right hidden"  onclick="download3()">Download</button>';

	// end of third submit buttons

	'</div>';
	// end of third table div  after entering details in second table for the first time

	
	//old code
	if (j == 1) {
		out1 += '<li id="l' + j + '" class="active">' + '<a href="#panel' + j
				+ '" onclick="show(' + k + ')">' + j + '</a>' + '</li>';
	} else {
		out1 += '<li id="l' + j + '">' + '<a href="#panel' + j
				+ '" onclick="show(' + k + ')">' + j + '</a>' + '</li>';
	}

	out += '</div>';
	

	out1 += '<li>' + '<a href="#" aria-label="Next">'
			+ '<span aria-hidden="true">&raquo;</span>' + '</a>' + '</li>'
			+ '</ul>';
	//end of old code
	

	// code to display the page
	$('#pages').html(out);
	

	//old code
	if (sectionId != activeSectionId) {
		$('#pagination').removeClass("hidden");
		$('#next').removeClass("hidden");
	}
	//end of old code
}
//end of  old and new  code for getting the data from json file  and continue in  section 3.2 for first time users


// function to add more rows
function add(c) {

	var arr = c.split('_');
	f = false;
	for (k = 1; k <= max; k++) {

		
		if (!($('#f' + k).val())) {
			f = true;
			
		} else if (($('#scale1' + k).val() === "-1")) {
			f = true;
			
		} else if (($('#scale2' + k).val() === "-1")) {
			f = true;
			
		} else if (($('#scale3' + k).val() === "-1")) {
			f = true;
			
		}

	}
	if (f == true)
		alert("You cannot add more fields without filling above empty fields");

	else {

		// maximum nomber of rows that the user can enter is <15
		if (max < 15) {


			var field = '<tr>' +

			'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<span class="input-group-addon">'
					+ arr[0]
					+ '.</span>'
					+ '</td>'
					+

					'<td style="border:1px solid #FFB74D;">'
					+ '<input id="f'
					+ arr[0]
					+ '" autocomplete="off" type="text" class="form-control"'
					+ 'name="input">'
					+ '</td>'
					+

					// dropdown1
					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<select id="scale1'
					+ arr[0]
					+ '" class="form-control text-center" onchange="setDropDown('
					+ arr[0]
					+ ')">'
					+ '<option value="-1">Select</option>'
					+ '<option value="1">Pleasurable</option>'
					+ '<option value="2">Meaningful</option>'
					+ '<option value="3">Mastery-oriented</option>'
					+ '</select>'
					+ '</td>'
					+

					// dropdown2
					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<select id="scale2'
					+ arr[0]
					+ '" class="form-control text-center" onchange="setDropDown('
					+ arr[0]
					+ ')">'
					+ '<option value="-1">Select</option>'
					+ '<option value="1">A few times a week</option>'
					+ '<option value="2">Once a week</option>'
					+ '<option value="3">Less than once a week</option>'
					+ '</select>'
					+ '</td>'
					+

					// dropdown3
					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<select id="scale3'
					+ arr[0]
					+ '" class="form-control text-center" onchange="setDropDown('
					+ arr[0]
					+ ')">'
					+ '<option value="-1">Select</option>'
					+ '<option value="1">Easy</option>'
					+ '<option value="2">Slightly difficult</option>'
					+ '<option value="3">Somewhat difficult</option>'
					+ '<option value="4">Very difficult</option>';
			'</select>';
			'</td>';

			'</tr>';

			// jquery to add the new row after the previous row
			$('#tbody1:last-child').append(field);
			arr[0]++;

			$('#addInputs1').attr('onclick', 'add("' + arr[0] + '")');
			max = arr[0] - 1;

		}

		else {
			$('#addInputs1').prop('disabled', 'disabled');
		}
	}
}
// end of function to add more rows



//begin new code for comparing the third column and fourth columns values in the first table in sectioan 3.2
function compare(obj1, obj2) {
	var freVal1 = obj1.freVal;
	var freVal2 = obj2.freVal;

	// have to sort according to descending order of frequency
	if (freVal1 < freVal2) {
		return true;
	} else if (freVal1 == freVal2) {
		var easyVal1 = obj1.easyVal;
		var easyVal2 = obj2.easyVal;
		// have to sort according to ascending order of easy value
		if (easyVal1 > easyVal2) {
			return true;
		}
		return false;
	}
	return false;
}
////end of new code for comparing the third column and fourth columns values in the first table in sectioan 3.2

//begin new code for sorting the array of objects of first table data based on 3rd and 4th columns values
function custom_sort(arr, no_elements) {
	var i = j = v = 0;
	for (i = 1; i < no_elements; i++) {
		v = arr[i];
		j = i;
		while (j > 0 && compare(arr[j - 1], v)) {
			arr[j] = arr[j - 1];
			j--;
		}
		;
		arr[j] = v;

	}
	return arr
}
//end of new code for sorting the array of objects of first table data based on 3rd and 4th columns values

//declaring arrays for first table data
var table1res = [];
var table1nature = [];
var table1input = [];
var array1table1 = [];
var final_sorted_arr = [];

var count1 = 0;
var count2 = 0;
var count3 = 0;
var count4 = 0;
var count5 = 0;
var count6 = 0;
var count7 = 0;
// function to submit after entering details in the first table
function submit() {
	
	
	
	var tbody = '';
	f = false;
	
	for (k = 1; k <= max; k++) {
		if (!($('#f' + k).val())) {
			f = true;
			
		} else if (($('#scale1' + k).val() === "-1")) {
			f = true;
			
		} else if (($('#scale2' + k).val() === "-1")) {
			
			f = true;
			
			
		} else if (($('#scale3' + k).val() === "-1")) {
			
			
			f = true;
			
		}
	}
	var arr = [];
    
	//begin new code storing the first table entered values in array arr
	for (k = 1; k <= max; k++) {

		var obj = {};
		
		// dropdown 1 values
		
		if($('#scale1' + k).find('option:selected').text()=="select"){
			obj.natureVal = "";
			
		}else{
			obj.natureVal = $('#scale1' + k).find('option:selected').text();
		}
	
		
		

		// dropdown2 values
		obj.freVal = $('#scale2' + k).val();

		obj.easyVal = $('#scale3' + k).val();

		// serial number values
		obj.inputVal = $('#f' + k).val();
		// console.log(obj);

		// for sorting in array arr
		arr.push(obj);

		// for storing the entered and selected values in table1 and send to db
		array1table1.push(obj);

				
	}
	//end of new code storing the first table entered values in array arr
	
	//new array created to store all the first table data after sorting
	var sorted_arr = custom_sort(arr, arr.length);

	//new arrays created to store the first P,M and M-O row data from the sorted_arr and highlight in second table if length of arr is <6
	var top_pleasurable = top_meaningful = top_mastery = 0;

	
	for (k = 0; k < max; k++) {
		if (sorted_arr[k].natureVal == "Pleasurable" && top_pleasurable == 0) {
			top_pleasurable = sorted_arr[k];
		} else if (sorted_arr[k].natureVal == "Meaningful"
				&& top_meaningful == 0) {
			top_meaningful = sorted_arr[k];
		} else if (sorted_arr[k].natureVal == "Mastery-oriented"
				&& top_mastery == 0) {
			top_mastery = sorted_arr[k];
		}
	}
	
	//new array to store the sorted data(P,M,M-O on top) and highlight in second table
	final_sorted_arr.push(top_pleasurable);
	final_sorted_arr.push(top_meaningful);
	final_sorted_arr.push(top_mastery);

	//new arrays created to store the first P,M and M-O row data from the sorted_arr and highlight in second table if length of arr is >6
	var second_pleasurable = second_meaningful = second_mastery = null
	for (k = 0; k < max; k++) {
		var value = sorted_arr[k]
		if (value != top_pleasurable && value != top_meaningful
				&& value != top_mastery) {
			if (value.natureVal == "Pleasurable" && second_pleasurable == null) {
				second_pleasurable = value;
			} else if (value.natureVal == "Meaningful"
					&& second_meaningful == null) {
				second_meaningful = value;
			} else if (value.natureVal == "Mastery-oriented"
					&& second_mastery == null) {
				second_mastery = value;
			}
		}
	}
	//new array to store the sorted data(P,M,M-O on top) and highlight in second table
	if (second_pleasurable != null) {
		final_sorted_arr.push(second_pleasurable);		
	}
	if (second_meaningful != null) {		
		final_sorted_arr.push(second_meaningful);
	}
	if (second_mastery != null) {
		final_sorted_arr.push(second_mastery);		
	}

	for (k = 0; k < max; k++) {
		var value = sorted_arr[k]
		if (value != top_pleasurable && value != top_meaningful
				&& value != top_mastery && value != second_pleasurable
				&& value != second_meaningful && value != second_mastery) {
			final_sorted_arr.push(sorted_arr[k]);
			
		}
	}
	
	
	
	//begin new code to count the number of Nature column -nature type selection
	for (k = 1; k <= max; k++) {
		if(!($('#f' + k).val())){
			  
			  count7 = 1;
			 
		  }
			
		if ($('#scale1' + k).val() === "1") {
			count1 = count1 + 1;
			
		}else if ($('#scale1' + k).val() === "2") {
			count2 = count2 + 1;
			
		} else if ($('#scale1' + k).val() === "3") {
			count3 = count3 + 1;
			
		}else if($('#scale1' + k).val() === "-1"){
			
			
			count4 = 1;
		} 
			
	  if($('#scale2' + k).val() === "-1"){
			
			
			count5 = 1;
		}
	  
	 if($('#scale3' + k).val() === "-1"){
			
			
			count6 = 1;
		}
	 
	 
	  
	}
	//end of new code to count the number of Nature column -nature type selection

	// begin code to display warning message if the count of each category is less than 1
	for (k = 1; k <= max; k++) {
		if (count1 < 1) {
			f = true;

		} else if (count2 < 1) {
			f = true;

		} else if (count3 < 1) {
			f = true;

		}else if (count4 == 1) {
			
			f = true;

		}else if (count5  == 1) {
			
			f = true;

		}else if (count6 == 1) {
			
			f = true;

		}else if (count7 == 1) {
			
			f = true;

		} else {
			f = false;
		}
	}
	
	
	
	

	if (f == true) {

		if (count1 == 0 && count2 == 0) {
			
			final_sorted_arr = [];
			array1table1 = [];
			count4=0;
			
			alert("please select atleast one activity under the  categories 'Pleasurable' "
					+ "and 'Meaningful'.");
		} else if (count1 == 0 && count3 == 0) {
			final_sorted_arr = [];
			
			array1table1 = [];
			count4=0;
			
			alert("please select atleast one activity under the  categories 'Pleasurable' and 'Master-oriented'.");
		} else if (count2 == 0 && count3 == 0) {
			final_sorted_arr = [];
			//console.log(final_sorted_arr);
			array1table1 = [];
			count4=0;
			//console.log(final_sorted_arr);
			alert("please select atleast one activity under the  categories 'Meaningful' and 'Master-oriented'.");
		} else if (count1 == 0) {
			final_sorted_arr = [];
			
			array1table1 = [];
			count4=0;
			
			alert("please select atleast one activity under the  category 'Pleasurable'.");
		} else if (count2 == 0) {
			final_sorted_arr = [];
			
			array1table1 = [];
			count4=0;
			
			alert("please select atleast one activity under the  category 'Meaningful'.");
		} else if (count3 == 0) {
			final_sorted_arr = [];
			
			array1table1 = [];
			count4=0;
			
			alert("please select atleast one activity under the  category 'Mastery-oriented'.");
		}else if(count4 == 1){
			
			final_sorted_arr = [];
			
			array1table1 = [];
		
			
			count4=0;
			alert("please fill in all fields");	
		}else if((count5 == 1) ||(count6 == 1)){
			
			final_sorted_arr = [];
			
			array1table1 = [];
			
			count4=0;
			count5=0;
			count6=0;
			alert("please fill in all fields");	
		}else if(count7 == 1){
			final_sorted_arr = [];
			
			array1table1 = [];
			
			count7=0;
			alert("please enter all activity");	
		}
		// end of code to display warning message if the count of each category is less than 1

		else{
			final_sorted_arr = [];
			array1table1 = [];
			alert("Atleast 3 fields must be filled with atleast 1  activity under  categories Pleasurable,Meaningful, Mastery-oriented.");
			
		}
			
		return false;
		
//begin new code to display sorted data from first table in the second table
	}else {
		var no_of_entries = final_sorted_arr.length
		for (k = 0; k < no_of_entries; k++) {

			// begin second table

			tbody += '<tr>' + '<td style="border:1px solid #FFB74D;">'
					+ final_sorted_arr[k].inputVal + '</td>';

			if (final_sorted_arr[k] == top_pleasurable) {
				tbody += '<td class="nature'
						+ k
						+ '" style="border:1px solid #FFB74D; background-color:#23ba34;">'
						+ final_sorted_arr[k].natureVal;
			} else if (final_sorted_arr[k] == top_meaningful) {
				tbody += '<td class="nature'
						+ k
						+ '" style="border:1px solid #FFB74D; background-color:#f7c02a;">'
						+ final_sorted_arr[k].natureVal;
			} else if (final_sorted_arr[k] == top_mastery) {
				tbody += '<td class="nature'
						+ k
						+ '" style="border:1px solid #FFB74D; background-color:#4ba2e5;">'
						+ final_sorted_arr[k].natureVal;

			} else if (no_of_entries > 6) {
				if (final_sorted_arr[k] == second_pleasurable) {
					tbody += '<td class="nature'
							+ k
							+ '" style="border:1px solid #FFB74D; background-color:#23ba34;">'
							+ final_sorted_arr[k].natureVal;
				} else if (final_sorted_arr[k] == second_meaningful) {
					tbody += '<td class="nature'
							+ k
							+ '" style="border:1px solid #FFB74D; background-color:#f7c02a;">'
							+ final_sorted_arr[k].natureVal;
				} else if (final_sorted_arr[k] == second_mastery) {
					tbody += '<td class="nature'
							+ k
							+ '" style="border:1px solid #FFB74D; background-color:#4ba2e5;">'
							+ final_sorted_arr[k].natureVal;

				} else {
					tbody += '<td class="nature' + k
							+ '" style="border:1px solid #FFB74D;">'
							+ final_sorted_arr[k].natureVal;
				}
			} else {
				tbody += '<td class="nature' + k
						+ '" style="border:1px solid #FFB74D;">'
						+ final_sorted_arr[k].natureVal;
			}

			tbody += '</td>' +

			'<td class="text-center" style="border:1px solid #FFB74D;" id="check1">'
					+ '<input class="check" type="checkbox" name="day'
					+ k
					+ '"  value="1" id="day1'
					+ k
					+ '" onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="check" type="checkbox" name="day'
					+ k
					+ '"  value="2" id="day2'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="check" type="checkbox" name="day'
					+ k
					+ '"  value="3" id="day3'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="check" type="checkbox" name="day'
					+ k
					+ '"  value="4" id="day4'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="check" type="checkbox" name="day'
					+ k
					+ '"  value="5" id="day5'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="check" type="checkbox" name="day'
					+ k
					+ '"  value="6" id="day6'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input type="checkbox" name="day'
					+ k
					+ '"  value="7" id="day7'
					+ k
					+ '" onclick="setWeeklyPlanner(this)">' + '</td>';

			'</tr>';

		}

		$('#addInputs1').addClass('hidden');
		$('#submit').addClass('hidden');
		$('#download1').removeClass('hidden');
		$('#tables2').removeClass('hidden');
		$('#tbody2').append(tbody);
		$('#next').addClass('hidden');
		$('#skip1').addClass("hidden");
		$('#skip2').removeClass("hidden");


		// disable all dropdowns in the first table after clicking the first submit button
		$('select').prop('disabled', true);

		// disable all input text area in the first table after clicking the first submit button
		var inputs = document.querySelectorAll("[type=text]");
		for (var i = 0; i < inputs.length; i++) {
			inputs[i].disabled = true;
		}


	}
	//end of  code to display sorted data from first table in the second table

	// jquery to disable the second submit button before alteast one of the checkboxes is checked
	var $submit = $('#submit2');
	$checkbox = $('input[type=checkbox]');

	$submit.prop('disabled', true);

	$checkbox.on('click', function() {
		if ($("input:checkbox:checked").length > 0) {
			$submit.removeAttr('disabled');
		} else {
			$submit.prop('disabled', true);
		}
	});
	
	// end of jquery


	// begin new code for rest call to send data as array  to db
	
	var section_id;
	var sub_section_id;
	var version_id;
	var response;
	var category_id;
    var unsorted_arr1 = JSON.stringify(array1table1);
	var Indata = {
		userId : userId,
		section_id : 3,
		sub_section_id : 2,
		version_id : 1,
		response : unsorted_arr1,
		category_id : '2a'
	};

	var myJSON = JSON.stringify(Indata);
	
	$.ajax({
		type : "POST",
		url : serverURL + "users/" + userId + "/sections/" + 3
				+ "/subsections/" + 2 + "/" + "3rdSecdata/1",
		data : myJSON,
		contentType : "application/json",
		dataType : "json",
		success : function(data) {

		},
		error : function() {

		}
	});

}
// end of function submit to submit the data from first table


// This 2D array stores the information about whether a day is checked or not in the second table?
var table2arr = [];
var uniqueNames = [];
var activity_name = [];
var table2arr_newarray = [];


function submit2(k) {
	
	
	if ($("input:checkbox:checked").length < 1) {
		alert("Please select atleast one option");
		return false;
	}else{
	if(final_sorted_arr.length!=0){
		
	// jquery to store the first column content in array for the checked check boxes
	$('#tbody2 tr td :checkbox:checked').map(function() {
		
		
		var $this = $(this);
		
		checked_day = $(this).val();
		
		$this.closest('tr').each(function() {
			
			 activity_name = $(this).find("td:first").text();
			 
			 
			if (table2arr[activity_name] == undefined) {
				table2arr[activity_name] = [ 0, 0, 0, 0, 0, 0, 0 ];
			}
			
			table2arr[activity_name][checked_day - 1] = 1;
			
			// push unique values of activity to the array uniqueNames
			if ($.inArray(activity_name, uniqueNames) === -1) {
				uniqueNames.push(activity_name);
				
				 
			}
			
		});

	});
	}
	else if(final_sorted_arr_data.length!=0) {
		
	$('#table2_data_dbvalues tr td :checkbox:checked').map(function() {
		
		
		var $this = $(this);
		
		checked_day = $(this).val();
		
		$this.closest('tr').each(function() {
			
			 activity_name = $(this).find("td:first").text();
			
			 
			if (table2arr[activity_name] == undefined) {
				table2arr[activity_name] = [ 0, 0, 0, 0, 0, 0, 0 ];
			}
			
			table2arr[activity_name][checked_day - 1] = 1;
			
			// push unique values of activity to the array uniqueNames
			if ($.inArray(activity_name, uniqueNames) === -1) {
				uniqueNames.push(activity_name);
				
				 
			}
			
		});

	});
	}
	//end of jquery
	}//for checkng second time check box options are selected or not
	
	
	
	//begin new code for storing the selected activity and check boxes values for the second table
	if(final_sorted_arr.length!=0){
		
		
	for(k = 0; k <final_sorted_arr.length ; k++){
		
		var obj_table2 = {};
		var inputVal = final_sorted_arr[k].inputVal;
		var natureVal = final_sorted_arr[k].natureVal;
		obj_table2.actName1 = inputVal;
		
		obj_table2.natureName1 = natureVal;
		
		
		//store the values of selected and un-selected values for the second table
		if (table2arr[inputVal] != undefined) {
			obj_table2.checkboxes = table2arr[inputVal];			
		}
		else {
			obj_table2.checkboxes = [0,0,0,0,0,0,0];
		}
		table2arr_newarray.push(obj_table2);
		
	}
	}else if(final_sorted_arr_data.length!=0) {
		
		
	//end of code for storing the selected activity and check boxes values for the second table
for(k = 0; k <final_sorted_arr_data.length ; k++){
	
		
		var obj_table2 = {};
		var inputVal = final_sorted_arr_data[k].inputVal;
		var natureVal = final_sorted_arr_data[k].natureVal;
		obj_table2.actName1 = inputVal;
		
		obj_table2.natureName1 = natureVal;
		
		
		//store the values of selected and un-selected values for the second table
		if (table2arr[inputVal] != undefined) {
			obj_table2.checkboxes = table2arr[inputVal];			
		}
		else {
			obj_table2.checkboxes = [0,0,0,0,0,0,0];
		}
		table2arr_newarray.push(obj_table2);
		
	}

	}
	

	var tbody = '';
	
	//begin code to display columns and values in third table
	for (k = 0; k < uniqueNames.length; k++) {
		
		activity_name = uniqueNames[k];
		

		 // Initialize the values for third table
		 
		 var obj_table3 = {};
		 obj_table3.actName2 = activity_name;
		 obj_table3.buttons = [[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]];
		 table3arr.push(obj_table3);
		
		
		// begin third table

		tbody += '<tr>' +

		'<td style="border:1px solid #FFB74D;">' + activity_name + '</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][0] == 1) {
			
			
			tbody += '<button class="button button1_' + k
			+ ' button-activity " id = "buttongreen1_' + k
			+ '">' + "Did" + '</button>';
	tbody += '<button class="button button1_' + k
			+ ' button-activity" id = "buttonyellow1_' + k
			+ '">' + "Tried" + '</button>';
			
		}
		tbody +=
		
		'</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][1] == 1) {
			
			tbody += '<button class="button button2_' + k
					+ ' button-activity" id = "buttongreen2_' + k
					+ '">' + "Did" + '</button>';
			tbody += '<button class="button button2_' + k
					+ ' button-activity" id = "buttonyellow2_' + k
					+ '">' + "Tried" + '</button>';
		}
		tbody +=
		
		'</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][2] == 1) {
			
			tbody += '<button class="button button3_' + k
					+ ' button-activity" id = "buttongreen3_' + k
					+ '">' + "Did" + '</button>';
			tbody += '<button class="button button3_' + k
					+ ' button-activity" id = "buttonyellow3_' + k
					+ '">' + "Tried" + '</button>';
		}
		tbody +=
		
		'</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][3] == 1) {
			
			tbody += '<button class="button button4_' + k
					+ ' button-activity" id = "buttongreen4_' + k
					+ '">' + "Did" + '</button>';
			tbody += '<button class="button button4_' + k
					+ ' button-activity" id = "buttonyellow4_' + k
					+ '">' + "Tried" + '</button>';
		}
		tbody +=
		
		'</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][4] == 1) {
			
			tbody += '<button class="button button5_' + k
					+ ' button-activity" id = "buttongreen5_' + k
					+ '">' + "Did" + '</button>';
			tbody += '<button class="button button5_' + k
					+ ' button-activity" id = "buttonyellow5_' + k
					+ '">' + "Tried" + '</button>';
		}
		tbody +=
		
		'</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][5] == 1) {
			
			tbody += '<button class="button button6_' + k
					+ ' button-activity" id = "buttongreen6_' + k
					+ '">' + "Did" + '</button>';
			tbody += '<button class="button button6_' + k
					+ ' button-activity" id = "buttonyellow6_' + k
					+ '">' + "Tried" + '</button>';
		}
		tbody +=
		
		'</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][6] == 1) {
			
			tbody += '<button class="button button7_' + k
					+ ' button-activity" id = "buttongreen7_' + k
					+ '">' + "Did" + '</button>';
			tbody += '<button class="button button7_' + k
					+ ' button-activity" id = "buttonyellow7_' + k
					+ '">' + "Tried" + '</button>';
		}
		tbody +=
		
		'</td>';

		'</tr>';

	}
	//end of code  to display columns and values in third table

	
	$('#submit2').addClass('hidden');
	$('#submit2_data').addClass('hidden');
	$('#tables3').removeClass('hidden');
	$('#table3').removeClass('hidden');
	$('#tbody3').append(tbody);
	$('#next').addClass('hidden');
	$('#skip2').addClass("hidden");
	$('#skip3').removeClass("hidden");
	$('#skip2_data').addClass("hidden");
	$('#download2').removeClass("hidden")
	
	var inputs = document.querySelectorAll("[type=checkbox]");
	for (var i = 0; i < inputs.length; i++) {
		inputs[i].disabled = true;

	}
	

	// rest call to send  data as array to  to db

	var section_id;
	var sub_section_id;
	var version_id;
	var response;
	var category_id;
	table2arr1 = table2arr_newarray;
	var check_value = table2arr;
	

	var Indata = {
		userId : userId,
		section_id : 3,
		sub_section_id : 2,
		version_id : 1,
		response : JSON.stringify(table2arr1),
		category_id : '2b'
	};

	
	
	var myJSON = JSON.stringify(Indata);

	$.ajax({
		type : "POST",
		url : serverURL + "users/" + userId + "/sections/" + 3
				+ "/subsections/" + 2 + "/" + "3rdSecdata/1",
		data : myJSON,
		contentType : "application/json",
		dataType : "json",
		success : function(data) {

		},
		error : function() {

		}
	});
	
	//end of rest call

}
// end of function submit2


//begin function skip after completing second table for the first time
function skip1(){
	
	$('#skip1').addClass('hidden');
	$('#submit').addClass('hidden');
	$('#addInputs1').addClass("hidden");
	$('#next').removeClass('hidden');
	
	
}
function skip2(){
	
	$('#skip2').addClass('hidden');
	$('#next').removeClass('hidden');
	$('#submit3').addClass("hidden");
	
}
function skip3(){
	
	$('#skip3').addClass('hidden');
	$('#next').removeClass('hidden');
	$('#download').removeClass('hidden');
	
}
function skip2_data(){
	
	$('#next').removeClass('hidden');
	$('#submit2_data').addClass('hidden');
	$('#skip2_data').addClass('hidden');
	var inputs = document.querySelectorAll("[type=checkbox]");
	for (var i = 0; i < inputs.length; i++) {
		inputs[i].disabled = true;
	}
}

//end of skip function

// begin new code for  function submit3
function submit3(sid, ssid) {
	
	$('#skip2').addClass("hidden");
	$('#submit3').addClass("hidden");
	$('#next').removeClass("hidden");
	$('#download3').removeClass("hidden");
	
	//begin new code for rest call to send data to db
	
	var section_id;
	var sub_section_id;
	var version_id;
	var response;
	var category_id;
	var table3arr1 = JSON.stringify(table3arr);

	var Indata = {
		userId : userId,
		section_id : 3,
		sub_section_id : 2,
		version_id : 1,
		response : table3arr1,
		category_id : '2c'
	};

	var myJSON = JSON.stringify(Indata);

	
	$.ajax({
		type : "POST",
		url : serverURL + "users/" + userId + "/sections/" + sid
				+ "/subsections/" + ssid + "/" + "3rdSecdata/1",
		data : myJSON,
		contentType : "application/json",
		dataType : "json",
		success : function(data) {
			location.reload();

		},
		error : function() {

		}
	});
	//end of new code for rest call to send data to db

}
//end of new code for  function submit3

// begin new code for function to change the background color of button in third table to green
function changeColorGreen(eleid, eleclass, act_name) {
	$('#submit3').prop('disabled',false);
	$(document.getElementsByClassName(eleclass))
			.css('backgroundColor', 'white')
	document.getElementById(eleid).style.backgroundColor = "green";

	var act_index = -1;
	for(var i = 0; i < table3arr.length; i++) {
	    var obj = table3arr[i];
	    if(obj.actName2 == act_name) {
	    	act_index = i;
	    	break;
	    }
	}
	if(act_index != -1) {
		var day_index = eleid.substr(eleid.length - 3)[0];
		// Put value 1 for green
		table3arr[act_index].buttons[day_index -1][0] = 1;
		// Put value 0 for yellow
		table3arr[act_index].buttons[day_index -1][1] = 0;
	}
}
//end of  new code for function to change the background color of button in third table to green

//begin new code for function to change the background color of button in third table to yellow
function changeColorYellow(eleid, eleclass, act_name) {
	$('#submit3').prop('disabled',false);
	$(document.getElementsByClassName(eleclass))
			.css('backgroundColor', 'white')
	document.getElementById(eleid).style.backgroundColor = "yellow";
	var act_index = -1;
	for(var i = 0; i < table3arr.length; i++) {
	    var obj = table3arr[i];
	    if(obj.actName2 == act_name) {
	    	act_index = i;
	    	break;
	    }
	}
	if(act_index != -1) {
		var day_index = eleid.substr(eleid.length - 3)[0];
		// Put value 0 for green
		table3arr[act_index].buttons[day_index -1][0] = 0;
		// Put value 1 for yellow
		table3arr[act_index].buttons[day_index -1][1] = 1;
	}
}
//end of  new code for function to change the background color of button in third table to yellow


// old code for function to select the dropdown option
function setDropDown(t) {
	
	validate(t);
}
// end of old code for function to select dropdown option

//begin  function to check whether dropdown option is selected is valid or not
function validate(t) {
	
	nextFlag = false;

	if (nextFlag == false) {

		if (($('#scale1' + t).val() == -1)) {

			alert("You must select a value from dropdown");
			nextFlag = true;
			f=true;
			

		}

	}

}
//end of function to check whether dropdown option is selected is valid or not




//old code
var version = 0;

function submitWeeklyPlanner(x) {

	
	count = 1;
	formData = '';
	$('#table' + x + ' td').each(function() {
		if (count == 9)
			count = 1;
		if ($(this).hasClass("success"))
			formData += "arr=" + $(this).text() + "_p_" + count + "&";
		else if ($(this).hasClass("info"))
			formData += "arr=" + $(this).text() + "_m_" + count + "&";
		else if ($(this).hasClass("danger"))
			formData += "arr=" + $(this).text() + "_mo_" + count + "&";
		
		count++;
	});

	
	$.ajax({
		type : "POST",
		url : serverURL + "users/" + userId + "/sections/" + sectionId
				+ "/subsections/" + subsectionId + "/planner/" + version,
		data : formData,
		success : function(data) {
			$('#weeklyPlanner').addClass("hidden");
			$('#next').removeClass("hidden");

		},
		error : function() {
			alert(serverURL + "users/" + userId + "/sections/" + sectionId
					+ "/subsections/" + subsectionId + "/planner/" + version);
			
		}
	});

	
}
//end of old code


//begin function to download the table data in excel format
	   
var table1_data = array1table1;
var table2_data = final_sorted_arr;


function download1(){
	
	
	    var tab_text = '<table id="table245">';
	    var textRange; 
	    var j = 0;
	    var tab = document.getElementById('table'); // id of table
	    var lines = tab.rows.length;

	    // the first headline of the table
	    if (lines > 0) {
	        tab_text = tab_text + '<tr>' + 
	        '<th>'+"Sl.No"+'</th>'+
	        '<th>'+"Activity"+'</th>'+
	        '<th>'+"Nature"+'</th>'+
	        '<th>'+"How frequently I am currently doing this"+'</th>'+
	        '<th>'+"How easy it is to add it to my day/increase its frequency"+'</th>'+
	        '</tr>';
	    }
	    if(retrieved_data == null){
if(table1_data.length == 0){
	    
	   for (j = 1 ; j < lines; j++) { 
	    	
		   tab_text = tab_text+ '<tr><td>'+j+'</td>'+
		   '<td></td><td></td><td></td><td></td></tr>';
	        			
	        				    
	    	}
}else{
	var frequency="";
	var easy_val="";
	 for (j = 0 ; j < table1_data.length; j++) { 
		 
		 if(table1_data[j].freVal == 1){
 			
			 frequency="A few times a week";
		}else if(table1_data[j].freVal == 2){
			
			 frequency="Once a week";
		}else if(table1_data[j].freVal == 3){
			
			
			 frequency="Less than once  a week";
		}
		
		if(table1_data[j].easyVal == 1){
			
			easy_val="Easy";
		}else if(table1_data[j].easyVal == 2){
			
			easy_val="Slightly difficult";
		}else if(table1_data[j].easyVal == 3){
			
			
			easy_val="Somewhat difficult";
		}else if(table1_data[j].easyVal == 4){
			
			
			easy_val="Very difficult";
		}
	    	
	        tab_text = tab_text+ '<tr><td>'+j+'</td>'+
	        '<td>'+table1_data[j].inputVal+'</td>'+
	        '<td>'+table1_data[j].natureVal+'</td>'+
	        '<td>'+frequency+'</td>'+
	        '<td>'+easy_val+'</td>';
	        '</tr>';
	        			
	        				    
	    	}
}
	    }
	    else if(data_length >=1){
	    	var frequency="";
	    	var easy_val="";
	    	for (j = 0 ; j < paresed_data1_table1.length; j++) { 
		    	
	    		if(paresed_data1_table1[j].freVal == 1){
	    			
	    			 frequency="A few times a week";
	    		}else if(paresed_data1_table1[j].freVal == 2){
	    			
	    			 frequency="Once a week";
	    		}else if(paresed_data1_table1[j].freVal == 3){
	    			
	    			
	    			 frequency="Less than once  a week";
	    		}
	    		
	    		if(paresed_data1_table1[j].easyVal == 1){
	    			
	    			easy_val="Easy";
	    		}else if(paresed_data1_table1[j].easyVal == 2){
	    			
	    			easy_val="Slightly difficult";
	    		}else if(paresed_data1_table1[j].easyVal == 3){
	    			
	    			
	    			easy_val="Somewhat difficult";
	    		}else if(paresed_data1_table1[j].easyVal == 4){
	    			
	    			
	    			easy_val="Vary difficult";
	    		}
	    		
		        tab_text = tab_text+ '<tr><td>'+j+'</td>'+
		        '<td>'+paresed_data1_table1[j].inputVal+'</td>'+
		        '<td>'+paresed_data1_table1[j].natureVal+'</td>'+
		        '<td>'+frequency+'</td>'+
		        '<td>'+easy_val+'</td>';
		        '</tr>';
		        			
		        				  
		    	}
	    }
	  
	

	    tab_text = tab_text + "</table>";
	    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
	    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
	    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params
	    downlodExcel(tab_text);

	   
	
		
	
}



var download2_data = table2arr_newarray;


function download2(){
	console.log(table2arr_newarray);
	
    var tab_text = '<table id="table245">';
    var textRange; 
    var j = 0;
    var tab = document.getElementById('table2'); // id of table
    var lines = tab.rows.length;

    // the first headline of the table
    if (lines > 0) {
       
    	tab_text = tab_text + '<tr>' + 
        
        '<th>'+"Activity"+'</th>'+
        '<th>'+"Nature"+'</th>'+
        '<th>'+"Monday"+'</th>'+
        '<th>'+"Tuesday"+'</th>'+
        '<th>'+"Wednesday"+'</th>'+
        '<th>'+"Thursday"+'</th>'+
        '<th>'+"Friday"+'</th>'+
        '<th>'+"Saturday"+'</th>'+
        '<th>'+"Sunday"+'</th>';
        '</tr>';
        if(data_length ==0){

        	for (j = 0 ; j < table2_data.length; j++) { 
        		if(table2arr_newarray[j].checkboxes[j] == 1){
        			
            		table2arr_newarray[j].checkboxes[j]="Selected";
        		}
        tab_text = tab_text+ '<tr><td>'+final_sorted_arr[j].inputVal+'</td>'+
        '<td>'+final_sorted_arr[j].natureVal+'</td>'+
        '<td>'+table2arr_newarray[j].checkboxes[0]+'</td>'+
        '<td>'+table2arr_newarray[j].checkboxes[1]+'</td>'+
        '<td>'+table2arr_newarray[j].checkboxes[2]+'</td>'+
        '<td>'+table2arr_newarray[j].checkboxes[3]+'</td>'+
        '<td>'+table2arr_newarray[j].checkboxes[4]+'</td>'+
        '<td>'+table2arr_newarray[j].checkboxes[5]+'</td>'+
        '<td>'+table2arr_newarray[j].checkboxes[6]+'</td>';
        '</tr>';
        	}
        }if(data_length ==1){
        	
        	for (j = 0 ; j < table2arr_newarray.length; j++) { 
        		if(table2arr_newarray[j].checkboxes[j] == 1){
        			
            		table2arr_newarray[j].checkboxes[j]="Selected";
        		}
                tab_text = tab_text+ '<tr><td>'+final_sorted_arr_data[j].inputVal+'</td>'+
                '<td>'+final_sorted_arr_data[j].natureVal+'</td>'+
                '<td>'+table2arr_newarray[j].checkboxes[0]+'</td>'+
                '<td>'+table2arr_newarray[j].checkboxes[1]+'</td>'+
                '<td>'+table2arr_newarray[j].checkboxes[2]+'</td>'+
                '<td>'+table2arr_newarray[j].checkboxes[3]+'</td>'+
                '<td>'+table2arr_newarray[j].checkboxes[4]+'</td>'+
                '<td>'+table2arr_newarray[j].checkboxes[5]+'</td>'+
                '<td>'+table2arr_newarray[j].checkboxes[6]+'</td>';
                '</tr>';
                	}
                }
        else if(data_length ==2){
        	
        	
        	for (j = 0 ; j < parsed_data2_table2.length; j++) { 
        		if(parsed_data2_table2[j].checkboxes[j] == 1){
        			
        			parsed_data2_table2[j].checkboxes[j]="Selected";
        		}
        		
        	 tab_text = tab_text+ '<tr><td>'+parsed_data2_table2[j].actName1+'</td>'+
		        '<td>'+parsed_data2_table2[j].natureName1+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[0]+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[1]+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[2]+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[3]+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[4]+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[5]+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[6]+'</td>';
		        '</tr>';
        	}
        	
        }else if(data_length ==3){
        	
        	
        	for (j = 0 ; j < parsed_data2_table2.length; j++) {
        		
        		if(parsed_data2_table2[j].checkboxes[j] == 1){
	    			
        			parsed_data2_table2[j].checkboxes[j]="Selected";
	    		}
        		
        	 tab_text = tab_text+ '<tr><td>'+parsed_data2_table2[j].actName1+'</td>'+
		        '<td>'+parsed_data2_table2[j].natureName1+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[0]+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[1]+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[2]+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[3]+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[4]+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[5]+'</td>'+
		        '<td>'+parsed_data2_table2[j].checkboxes[6]+'</td>';
		        '</tr>';
        	}
        	
        }
        
    }

    
    tab_text = tab_text + "</table>";
    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params
    downlodExcel(tab_text);

	

}

function download3(){
	
	
    var tab_text = '<table id="table245">';
    var textRange; 
    var j = 0;
    var tab = document.getElementById('table3'); // id of table
    var lines = tab.rows.length;

    if (lines > 0) {
       
     	tab_text = tab_text + '<tr>' + 
         
         '<th>'+"Activity"+'</th>'+
         '<th>'+"Monday"+'</th>'+
         '<th>'+"Tuesday"+'</th>'+
         '<th>'+"Wednesday"+'</th>'+
         '<th>'+"Thursday"+'</th>'+
         '<th>'+"Friday"+'</th>'+
         '<th>'+"Saturday"+'</th>'+
         '<th>'+"Sunday"+'</th>';
         '</tr>';
         
         // table data lines, loop starting from 1
         if(parsed_data2_table2.length!=0){
         	   
         	for (j = 0 ; j < download3_data.length; j++) { 
     	    	
     	     tab_text = tab_text+ '<tr><td>'+download3_data[j].actName1+'</td>'+
     	        '<td>'+table3arr[j].buttons[0]+'</td>'+
     	        '<td>'+table3arr[j].buttons[1]+'</td>'+
     	        '<td>'+table3arr[j].buttons[2]+'</td>'+
     	        '<td>'+table3arr[j].buttons[3]+'</td>'+
     	        '<td>'+table3arr[j].buttons[4]+'</td>'+
     	        '<td>'+table3arr[j].buttons[5]+'</td>'+
     	        '<td>'+table3arr[j].buttons[6]+'</td>';
     	       
     	        '</tr>';
     	        			
     	        				  
     	    	}
         }
         if(parsed_data3_table3.length!=0){
     	
     	
     	for (j = 0 ; j < new_array1.length; j++) { 
     		
         	
     	     tab_text = tab_text+ '<tr><td>'+new_array1[j].actName2+'</td>';
     	     
     	     for(var j1 = 0 ; j1 <7; j1++){
     	    	 
     	    	 var str1 = parsed_data3_table3[j].buttons[j1].toString();
     	    	var arrSelect = str1.split(",");
     	    	
     	    	if((arrSelect[0] == 1) && (arrSelect[1] == 0)){
     	    		
     	    		parsed_data3_table3[j].buttons[j1]="Did";
     	    		
     	    	}else if((arrSelect[0] == 0) && (arrSelect[1] == 1)){
     	    		
     	    		parsed_data3_table3[j].buttons[j1]="Tried";
     	    		
     	    	} else {
     	    		
     	    		parsed_data3_table3[j].buttons[j1]="Nil";
     	    	}
     	    	
     	    	 
     	    	 
     	    	 tab_text =  tab_text+'<td>'+parsed_data3_table3[j].buttons[j1]+'</td>';
     	        
     	     }

     	        
     	      tab_text = tab_text+'</tr>';
     	        			
     	        				  
     	    	}
     	
     	
     }
     }

   

    tab_text = tab_text + "</table>";
    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params
    downlodExcel(tab_text);

	

}



//end function to download the table data in excel format


//FUNCTION FOR WORKBOOK

function practice11Workbook(arr, url, sid, ssid) {
	
 
 
 var out = '';

//old code
	for (p = 0; p < 7; p++) {
		pArray[p] = new Array(6);
	}
	//end of old code

	
	//old code
	i = 0;
	j = i + 1;
	c = i + 1;
	//end of old code

	//begin code to display the text data from json file
	for (k = 0; k < arr[i].exerciseDesc.length; k++) {
		out += '<p class="text-justify">' + arr[i].exerciseDesc[k] + '</p>';
	}
	//end of code to display the text daya from json file

	
	//old code
	out += '<div class="clearfix"></div><hr>';
	x = j;
	//end of old code

	
	//display the first table header data from the json file
	k = 0;
	

	//old code
	for (p = 0; p < 7; p++) {
		pArray[p] = new Array(6);
	}
	//end of old code

	//old code
	var out = '';
	var out1 = '<ul  class="hidden pagination">' + '<li>'
			+ '<a href="#" aria-label="Previous">'
			+ '<span aria-hidden="true">&laquo;</span>' + '</a>' + '</li>';
	//end of old code

	
	//old code
	i = 0;
	j=0;
	c = i + 1;
	len=0;
	//end of old code

	
	//tabs for versions for 3.2 in workbook
	out +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation" class="active">' +
	'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
		'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (len+1) + ', ' + (j+1) + ')">' +
		'Version ' + (j+1) + '</a>' +
		'</li>';	//	tablist

	out +=	'<div id="tab-' + sid + '-' + ssid +'-' + (j+1) + '"><br>';
	
	
	//begin code to display the text data from json file
	for (k = 0; k < arr[i].exerciseDesc.length; k++) {
		out += '<p class="text-justify">' + arr[i].exerciseDesc[k] + '</p>';
	}
	//end of code to display the text daya from json file

	
	//old code
	out += '<div class="clearfix"></div><hr>';
	x = j;
	//end of old code

	
	//display the first table header data from the json file
	k = 0;

	// begin code to display the first table div if the data from the database is null
	
	if(retrieved_data == null){

	out += '<div id="tables1" class="form-group input-group">'
			+

			// '<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
			'<table id="table" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
			+ '<thead id="thead" class="text-center">'
			+

			'<tr>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">S. No.</th>'
			+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[0]
			+ '</th>'
			+ '<th class="col-md-3" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[1]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[2]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[3] + '</th>';
	'</tr>';

	'</thead>';

	for (k = 1; k <= 3; k++) {

		out += '<tbody id="tbody1">' +

		'<tr>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<span class="input-group-addon">'
				+ k
				+ '.</span>'
				+ '</td>'
				+

				'<td style="border:1px solid #FFB74D;" id ="tabletd1">'
				+ '<input id="f'
				+ k
				+ '" autocomplete="off" type="text" class="form-control"'
				+ 'name="input">'
				+ '</td>'
				+

				// dropdown1
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select id="scale1'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ k
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1">Pleasurable</option>'
				+ '<option value="2">Meaningful</option>'
				+ '<option value="3">Mastery-oriented</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown2
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select id="scale2'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ k
				+ ')">'
				+

				'<option value="-1">Select</option>'
				+ '<option value="1">A few times a week</option>'
				+ '<option value="2">Once a week</option>'
				+ '<option value="3">Less than once a week</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown3
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select id="scale3'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ k
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1">Easy</option>'
				+ '<option value="2">Slightly difficult</option>'
				+ '<option value="3">Somewhat difficult</option>'
				+ '<option value="4">Very difficult</option>';
		'</select>';

		'</td>';

		'</tr>';

		'</tbody>';

	}

	out += '</table>';

	// begin buttons to add more rows and submit

	out += '<div class="form-group">';
	out += '<button type="button" id="addInputs1" onclick="add(`' + k
			+ '`)" class="btn btn-primary">Add More ...</button>';
	out += '<button id="skip1" class="  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip1()">Skip</button>';
	out += '<button type="button" id="submit" onclick="submit()" class="btn btn-success pull-right">Submit</button>';
	out += '<button type="button" id="download1" onclick="download1()" class="btn btn-warning pull-right">Download</button>';
	out += '</div>';

	// end of add and submit buttons

	out += '<div class="clearfix"></div><hr>';

	out += '</div>';
	
	}
	// end of  code to display the first table div if the data from the database is null
	
	//begin code if data length is 1
	
else if(data_length == 1){
	
		//the user completed first table and loggout out and again comes to section 3.2
		//begin first table data details display
		
		out += '<div id="tables1" class="form-group input-group">'
			+

			// '<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
			'<table id="table" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
			+ '<thead id="thead" class="text-center">'
			+

			'<tr>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">S. No.</th>'
			+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[0]
			+ '</th>'
			+ '<th class="col-md-3" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[1]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[2]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[3] + '</th>';
	'</tr>';

	'</thead>';

	for (var j = 0; j < paresed_data1_table1.length; j++) {
		
		
		out += '<tbody id="tbody1">' +

		'<tr>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<span class="input-group-addon">'
				+ (j+1)
				+ '.</span>'
				+ '</td>'
				+

				'<td style="border:1px solid #FFB74D;" id ="tabletd1">'
				+ '<input id="f'
				+ j
				+ '" autocomplete="off" type="text" class="form-control"'
				+ 'name="input" value ="'+paresed_data1_table1[j].inputVal+'" disabled>'
				+ '</td>'
				+

				// dropdown1
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale1'
				+ j
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].natureVal == "Pleasurable") {
					out += ' selected'
				}
				out += '>Pleasurable</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].natureVal == "Meaningful") {
					out += ' selected'
				}
				out += '>Meaningful</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].natureVal == "Mastery-oriented") {
					out += ' selected'
				}
				out += '>Mastery-oriented</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown2
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale2'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+

				'<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].freVal == "1") {
					out += ' selected'
				}
				out += '>A few times a week</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].freVal == "2") {
					out += ' selected'
				}
				out += '>Once a week</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].freVal == "3") {
					out += ' selected'
				}
				out += '>Less than once a week</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown3
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale3'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].easyVal == "1") {
					out += ' selected'
				}
				out += '>Easy</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].easyVal == "2") {
					out += ' selected'
				}
				out += '>Slightly difficult</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].easyVal == "3") {
					out += ' selected'
				}
				out += '>Somewhat difficult</option>'
					out += '<option value="4"';
				if (paresed_data1_table1[j].easyVal == "4") {
					out += ' selected'
				}
				out += '>Very difficult</option>'
				+ '</select>'
				+

		'</td>';

		'</tr>';

		'</tbody>';

	}

	out += '</table>';
	

	

	out += '<div class="clearfix"></div><hr>';

	

	out += '</div>';
	//end of  first table data details display
	

	//begin second table data details display when user logs out after first table and again comes to section 3.2
	out += '<div class="form-group " id="tables2_data_dbvalues">'
		+
		'<h3>'+"3.3 Potential List and Weekly Planner"+'</h3>'+
		'<p>'
		+ "Here is a table with a list of activities based on how easy it is for you to do them and how often you are currently doing them!<br>The coloured ones are those we suggest to you, as good starting points.<br>Please select the various days in the next one week when you want to do them. You can choose to do an activity on multiple days ."
		+ '</p>'
		+ '<br>'
		+ '<br>'
		+ '<p class="text-center">'
		+ '<strong>'
		+ "YOUR POTENTIAL LIST"
		+ '</strong>'
		+ '</</p>'
		+

		'<table id="table2_data_dbvalues" class="table table-hover table-bordered myTable" style="border:1px solid #FFB74D;background: #FFE0B2;">'
		+

		'<thead id="thead">'
		+

		'<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Activity"
		+ '</th>'+
		'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Nature"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Monday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Tuesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Wednesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Thursday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Friday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Saturday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Sunday" + '</th>' +

		'</thead>' ;
	
	var sorted_arr_data = custom_sort(arr, arr.length);
	

	
	var sorted_arr_data = custom_sort(paresed_data1_table1,paresed_data1_table1.length);
	var number = paresed_data1_table1.length;
	
	
	
var top_pleasurable = top_meaningful = top_mastery = 0;

	
	for (k = 0; k < number; k++) {
		if (sorted_arr_data[k].natureVal == "Pleasurable" && top_pleasurable == 0) {
			top_pleasurable = sorted_arr_data[k];
		} else if (sorted_arr_data[k].natureVal == "Meaningful"
				&& top_meaningful == 0) {
			top_meaningful = sorted_arr_data[k];
		} else if (sorted_arr_data[k].natureVal == "Mastery-oriented"
				&& top_mastery == 0) {
			top_mastery = sorted_arr_data[k];
		}
	}
	
	
	//new array to store the sorted data(P,M,M-O on top) and highlight in second table
	//new arrays created to store the first P,M and M-O row data from the sorted_arr and highlight in second table if length of arr is <6
	var top_pleasurable = top_meaningful = top_mastery = 0;

	
	for (k = 0; k < number; k++) {
		if (sorted_arr_data[k].natureVal == "Pleasurable" && top_pleasurable == 0) {
			top_pleasurable = sorted_arr_data[k];
		} else if (sorted_arr_data[k].natureVal == "Meaningful"
				&& top_meaningful == 0) {
			top_meaningful = sorted_arr_data[k];
		} else if (sorted_arr_data[k].natureVal == "Mastery-oriented"
				&& top_mastery == 0) {
			top_mastery = sorted_arr_data[k];
		}
	}
	final_sorted_arr_data.push(top_pleasurable);
	final_sorted_arr_data.push(top_meaningful);
	final_sorted_arr_data.push(top_mastery);
	
	//new arrays created to store the first P,M and M-O row data from the sorted_arr and highlight in second table if length of arr is >6
	var second_pleasurable = second_meaningful = second_mastery = null
	for (k = 0; k < number; k++) {
		var value = sorted_arr_data[k]
		
		if (value != top_pleasurable && value != top_meaningful
				&& value != top_mastery) {
			if (value.natureVal == "Pleasurable" && second_pleasurable == null) {
				second_pleasurable = value;
				
			} else if (value.natureVal == "Meaningful"
					&& second_meaningful == null) {
				second_meaningful = value;
				
			} else if (value.natureVal == "Mastery-oriented"
					&& second_mastery == null) {
				second_mastery = value;
				
			}
		}
	}
	
	//new array to store the sorted data(P,M,M-O on top) and highlight in second table
	if (second_pleasurable != null) {
		final_sorted_arr_data.push(second_pleasurable);		
	}
	if (second_meaningful != null) {		
		final_sorted_arr_data.push(second_meaningful);
	}
	if (second_mastery != null) {
		final_sorted_arr_data.push(second_mastery);		
	}

for (k = 0; k < number; k++) {
	var value = sorted_arr_data[k]
	if (value != top_pleasurable && value != top_meaningful
			&& value != top_mastery && value != second_pleasurable
			&& value != second_meaningful && value != second_mastery) {
		final_sorted_arr_data.push(sorted_arr_data[k]);
		
	}
}



var no_of_entries = final_sorted_arr_data.length

for (k = 0; k < no_of_entries; k++) {
	

	// begin second table

	out += '<tbody id="tbody2_data">' +'<tr>' + '<td style="border:1px solid #FFB74D;">'
			+ final_sorted_arr_data[k].inputVal + '</td>';

	if (final_sorted_arr_data[k] == top_pleasurable) {
		 out+= '<td class="nature'
				+ k
				+ '" style="border:1px solid #FFB74D; background-color:#23ba34;">'
				+ final_sorted_arr_data[k].natureVal;
	} else if (final_sorted_arr_data[k] == top_meaningful) {
		  out+='<td class="nature'
				+ k
				+ '" style="border:1px solid #FFB74D; background-color:#f7c02a;">'
				+ final_sorted_arr_data[k].natureVal;
	} else if (final_sorted_arr_data[k] == top_mastery) {
		 out+= '<td class="nature'
				+ k
				+ '" style="border:1px solid #FFB74D; background-color:#4ba2e5;">'
				+ final_sorted_arr_data[k].natureVal;

	} else if (no_of_entries > 6) {
		if (final_sorted_arr_data[k] == second_pleasurable) {
			out += '<td class="nature'
					+ k
					+ '" style="border:1px solid #FFB74D; background-color:#23ba34;">'
					+ final_sorted_arr_data[k].natureVal;
		} else if (final_sorted_arr_data[k] == second_meaningful) {
			out += '<td class="nature'
					+ k
					+ '" style="border:1px solid #FFB74D; background-color:#f7c02a;">'
					+ final_sorted_arr_data[k].natureVal;
		} else if (final_sorted_arr_data[k] == second_mastery) {
			out += '<td class="nature'
					+ k
					+ '" style="border:1px solid #FFB74D; background-color:#4ba2e5;">'
					+ final_sorted_arr_data[k].natureVal;

		} else {
			out += '<td class="nature' + k
					+ '" style="border:1px solid #FFB74D;">'
					+ final_sorted_arr_data[k].natureVal;
		}
	} else {
		out += '<td class="nature' + k
				+ '" style="border:1px solid #FFB74D;">'
				+ final_sorted_arr_data[k].natureVal;
	}

	out += '</td>' ;

	out +='<td class="text-center" style="border:1px solid #FFB74D;" id="check1">'
			+ '<input class="check" type="checkbox" name="day'
			+ k
			+ '"  value="1" id="day1'
			+ k
			+ '" onclick="setWeeklyPlanner(this)">'
			+ '</td>'
			+

			'<td class="text-center" style="border:1px solid #FFB74D;">'
			+ '<input class="check" type="checkbox" name="day'
			+ k
			+ '"  value="2" id="day2'
			+ k
			+ '"  onclick="setWeeklyPlanner(this)">'
			+ '</td>'
			+

			'<td class="text-center" style="border:1px solid #FFB74D;">'
			+ '<input class="check" type="checkbox" name="day'
			+ k
			+ '"  value="3" id="day3'
			+ k
			+ '"  onclick="setWeeklyPlanner(this)">'
			+ '</td>'
			+

			'<td class="text-center" style="border:1px solid #FFB74D;">'
			+ '<input class="check" type="checkbox" name="day'
			+ k
			+ '"  value="4" id="day4'
			+ k
			+ '"  onclick="setWeeklyPlanner(this)">'
			+ '</td>'
			+

			'<td class="text-center" style="border:1px solid #FFB74D;">'
			+ '<input class="check" type="checkbox" name="day'
			+ k
			+ '"  value="5" id="day5'
			+ k
			+ '"  onclick="setWeeklyPlanner(this)">'
			+ '</td>'
			+

			'<td class="text-center" style="border:1px solid #FFB74D;">'
			+ '<input class="check" type="checkbox" name="day'
			+ k
			+ '"  value="6" id="day6'
			+ k
			+ '"  onclick="setWeeklyPlanner(this)">'
			+ '</td>'
			+

			'<td class="text-center" style="border:1px solid #FFB74D;">'
			+ '<input type="checkbox" name="day'
			+ k
			+ '"  value="7" id="day7'
			+ k
			+ '" onclick="setWeeklyPlanner(this)">' + '</td>';

	'</tr>';
	out+='</tbody>';
	
}
out += '</table>';


//submit button for second table
out += '<button id="skip2_data" class="  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2_data()">Skip</button>';
out += '<div class="form-group">' +

'<button type="button" id="submit2_data" onclick="submit2(' + k
		+ ')" class="btn btn-success pull-right check_data">Submit</button>'
		+
		'<button id="skip2" class="hidden  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
		'<button type="button" id="download2" onclick="download2()" class="btn btn-warning pull-right">Download</button>'
		+
		'<br>'+
		'</div>';


'</div>';




//end  second table data details display when user logs out after first table and again comes to section 3.2
//begin third table divwhen the user logged out after first table and then entering details in second table for the first time

out += '<div class="form-group hidden" id="tables3">'
		
		+ '<p class="text-center">'
		+ '<strong>'
		+ "YOUR WEEKLY MONITOR"
		+ '</strong>'
		+ '</p>'
		+

		'<table id="table3" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
		+

		'<thead id="thead">'
		+

		'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Activity"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Monday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Tuesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Wednesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Thursday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Friday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Saturday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Sunday" + '</th>' +

		'</thead>' +

		'<tbody id="tbody3">' +

		'</tbody>';

out += '</table>';
out+=

'<p>'
+"This weekly monitor is available in your workbook. "
+ "Check your planner every morning regarding activities you have planned to do and fill the day's column in the evening. Use this for the coming week.You can generate a new monitor template for a new week in the workbook, by clicking on the 'Add' button.<br>You will   receive  a version of this  ( blank)  form as  well as  a  few  forms   from other sections as  word  files over mail. Please check  your  mail  for  the same."
+ '</p>'
+ '<br>'
//begin third submit button

out += '<div class="form-group">' +
'<button id="skip3" class="hidden  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
'<button id="download3" class="  btn btn-warning  pull-right hidden"  onclick="download3()">Download</button>';



'</div>';
//end  third table divwhen the user logged out after first table and then entering details in second table for the first time



}

//end of code if length is 1
	
//begin code to display the first 2 tables if the data from the database is not null(length is 2) before filling the 3rd table
	else if(data_length == 2){
		
		
		//begin first table data details display
		
		out += '<div id="tables1" class="form-group input-group">'
			+

			// '<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
			'<table id="table" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
			+ '<thead id="thead" class="text-center">'
			+

			'<tr>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">S. No.</th>'
			+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[0]
			+ '</th>'
			+ '<th class="col-md-3" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[1]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[2]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[3] + '</th>';
	'</tr>';

	'</thead>';

	for (var j = 0; j < paresed_data1_table1.length; j++) {
		
		
		out += '<tbody id="tbody1">' +

		'<tr>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<span class="input-group-addon">'
				+ (j+1)
				+ '.</span>'
				+ '</td>'
				+

				'<td style="border:1px solid #FFB74D;" id ="tabletd1">'
				+ '<input id="f'
				+ j
				+ '" autocomplete="off" type="text" class="form-control"'
				+ 'name="input" value ="'+paresed_data1_table1[j].inputVal+'" disabled>'
				+ '</td>'
				+

				// dropdown1
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale1'
				+ j
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].natureVal == "Pleasurable") {
					out += ' selected'
				}
				out += '>Pleasurable</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].natureVal == "Meaningful") {
					out += ' selected'
				}
				out += '>Meaningful</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].natureVal == "Mastery-oriented") {
					out += ' selected'
				}
				out += '>Mastery-oriented</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown2
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale2'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+

				'<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].freVal == "1") {
					out += ' selected'
				}
				out += '>A few times a week</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].freVal == "2") {
					out += ' selected'
				}
				out += '>Once a week</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].freVal == "3") {
					out += ' selected'
				}
				out += '>Less than once a week</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown3
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale3'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].easyVal == "1") {
					out += ' selected'
				}
				out += '>Easy</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].easyVal == "2") {
					out += ' selected'
				}
				out += '>Slightly difficult</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].easyVal == "3") {
					out += ' selected'
				}
				out += '>Somewhat difficult</option>'
					out += '<option value="4"';
				if (paresed_data1_table1[j].easyVal == "4") {
					out += ' selected'
				}
				out += '>Very difficult</option>'
				+ '</select>'
				+

		'</td>';

		'</tr>';

		'</tbody>';

	}

	out += '</table>';

	

	out += '<div class="clearfix"></div><hr>';

	out += '</div>';
	//end of  first table data details display
	
	
	
	
	//begin second table data details display
	out += '<div class="form-group " id="tables2_dbvalues">'
		+
		'<h3>'+"3.3 Potential List and Weekly Planner"+'</h3>'+
		'<p>'
		+ "Here is a table with a list of activities based on how easy it is for you to do them and how often you are currently doing them!<br>The coloured ones are those we suggest to you, as good starting points.<br>Please select the various days in the next one week when you want to do them. You can choose to do an activity on multiple days ."
		+ '</p>'
		+ '<br>'
		+ '<br>'
		+ '<p class="text-center">'
		+ '<strong>'
		+ "YOUR POTENTIAL LIST"
		+ '</strong>'
		+ '</</p>'
		+

		'<table id="table2_dbvalues" class="table table-hover table-bordered myTable" style="border:1px solid #FFB74D;background: #FFE0B2;">'
		+

		'<thead id="thead">'
		+

		'<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Activity"
		+ '</th>'+
		'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Nature"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Monday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Tuesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Wednesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Thursday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Friday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Saturday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Sunday" + '</th>' +

		'</thead>' ;

	
	for (var m = 0; m < parsed_data2_table2.length; m++) {
		var data_row = parsed_data2_table2[m];
		out += '<tbody id="tbody1">' +'<tr>' + '<td style="border:1px solid #FFB74D;">'
		+ data_row.actName1 +  '</td>'+
		'<td style="border:1px solid #FFB74D;">'
		+ data_row.natureName1 +  '</td>'+
		



       

'<td class="text-center" style="border:1px solid #FFB74D;" id="check1">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="1" id="day1'
		+ m
		+ '" onclick="setWeeklyPlanner(this)"';

		if (data_row.checkboxes[0] == 1) {
			out += ' checked';
			
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check"  disabled type="checkbox" name="day'
		+ m
		+ '"  value="2" id="day2'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[1] == 1) {
			out += ' checked ';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="3" id="day3'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[2] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="4" id="day4'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[3] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="5" id="day5'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[4] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="6" id="day6'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[5] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input type="checkbox" disabled name="day'
		+ m
		+ '"  value="7" id="day7'
		+ m
		+ '" onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[6] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>';

'</tr>';

		'</tbody>';
	}

out += '</table>';

'</div>';

//end of second table data details display



/*modified table3*/

//begin third table (AFTER 1 WEEK TO ENTER DETAILS IN THE third TABLE)
out += '<div class="form-group " id="tables3_dbvalues">'
	+'<br>'
	
	+ '<p class="text-center">'
	+ '<strong>'
	+ "YOUR WEEKLY MONITOR"
	+ '</strong>'
	+ '</p>'
	+

	'<table id="table3" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
	+

	'<thead id="thead">'
	+

	'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Activity"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Monday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Tuesday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Wednesday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Thursday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Friday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Saturday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Sunday" + '</th>' +

	'</thead>' ;


for (var m = 0; m < parsed_data2_table2.length; m++) {
	 activity_name = parsed_data2_table2[m].actName1;
	

	 // Initialize the values for third table
	 
	 var obj_table3 = {};
	 obj_table3.actName2 = activity_name;
	 obj_table3.buttons = [[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]];
	 table3arr.push(obj_table3);
	 

	var data_row = parsed_data2_table2[m];
	
	out += '<tbody id="tbody3">';
	if(data_row.checkboxes.indexOf(1) != -1){
		
		
		download3_data.push(data_row);
		
		out += '<tr>' ;
		out += '<td style="border:1px solid #FFB74D;">';
		out += data_row.actName1 ;
		out +='</td>';	
	
	out += '<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[0] == 1) {
		
		out += '<button class="button button1_' + m
				+ ' button-activity " id = "buttongreen1_' + m
				+ '" onclick="changeColorGreen(\'buttongreen1_' + m
				+ '\', \'button1_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button1_' + m
				+ ' button-activity" id = "buttonyellow1_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow1_' + m
				+ '\', \'button1_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td>'  +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[1] == 1) {
		
		out += '<button class="button button2_' + m
				+ ' button-activity" id = "buttongreen2_' + m
				+ '" onclick="changeColorGreen(\'buttongreen2_' + m
				+ '\', \'button2_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button2_' + m
				+ ' button-activity" id = "buttonyellow2_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow2_' + m
				+ '\', \'button2_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[2] == 1) {
		
		out += '<button class="button button3_' + m
				+ ' button-activity" id = "buttongreen3_' + m
				+ '" onclick="changeColorGreen(\'buttongreen3_' + m
				+ '\', \'button3_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button3_' + m
				+ ' button-activity" id = "buttonyellow3_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow3_' + m
				+ '\', \'button3_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[3] == 1) {
		
		out += '<button class="button button4_' + m
				+ ' button-activity" id = "buttongreen4_' + m
				+ '" onclick="changeColorGreen(\'buttongreen4_' + m
				+ '\', \'button4_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button4_' + m
				+ ' button-activity" id = "buttonyellow4_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow4_' + m
				+ '\', \'button4_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[4] == 1) {
		
		out += '<button class="button button5_' + m
				+ ' button-activity" id = "buttongreen5_' + m
				+ '" onclick="changeColorGreen(\'buttongreen5_' + m
				+ '\', \'button5_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button5_' + m
				+ ' button-activity" id = "buttonyellow5_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow5_' + m
				+ '\', \'button5_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[5] == 1) {
		
		out += '<button class="button button6_' + m
				+ ' button-activity" id = "buttongreen6_' + m
				+ '" onclick="changeColorGreen(\'buttongreen6_' + m
				+ '\', \'button6_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button6_' + m
				+ ' button-activity" id = "buttonyellow6_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow6_' + m
				+ '\', \'button6_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (data_row.checkboxes[6] == 1) {
		
		out += '<button class="button button7_' + m
				+ ' button-activity" id = "buttongreen7_' + m
				+ '" onclick="changeColorGreen(\'buttongreen7_' + m
				+ '\', \'button7_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
		out += '<button class="button button7_' + m
				+ ' button-activity" id = "buttonyellow7_' + m
				+ '" onclick="changeColorYellow(\'buttonyellow7_' + m
				+ '\', \'button7_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
	}
	out +=
	
	'</td></tr>';
	
	
	}
	out += '</tbody>';
}

	

out += '</table>';
out+=

'<p>'
+"This weekly monitor is available in your workbook. "
+ "Check your planner every morning regarding activities you have planned to do and fill the day's column in the evening. Use this for the coming week.You can generate a new monitor template for a new week in the workbook, by clicking on the 'Add' button.<br>You will   receive  a version of this  ( blank)  form as  well as  a  few  forms   from other sections as  word  files over mail. Please check  your  mail  for  the same."
+ '</p>'
+ '<br>'

'</div>';


out += '<div class="form-group">' +
'<button id="skip3" class="  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
'<button type="button" id="submit3" onclick="submit3(' + j + ','
+ activeSectionId + ',' + activeSubSectionId
+ ')" class="btn btn-success pull-right " disabled=true>Submit</button>'
+
'<button type="button" id="download3" onclick="download3()" class="btn btn-warning pull-right hidden">Download</button>';
'</div>';

//end of  third table (AFTER 1 WEEK TO ENTER DETAILS IN THE third TABLE)


		
	}
	

	///end of code to display the first 2 tables if the data from the database is not null(length is 2) before filling the 3rd table
	
	
	//begin code to display the 3 tables data from the database after filling details in the second table 
else if(data_length == 3){
		
		//begin first table data details display
		
		out += '<div id="tables1" class="form-group input-group">'
			+

			// '<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
			'<table id="table" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
			+ '<thead id="thead" class="text-center">'
			+

			'<tr>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">S. No.</th>'
			+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[0]
			+ '</th>'
			+ '<th class="col-md-3" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[1]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[2]
			+ '</th>'
			+ '<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ arr[i].tables[k].thead[3] + '</th>';
	'</tr>';

	'</thead>';

	for (var j = 0; j < paresed_data1_table1.length; j++) {
		
		
		out += '<tbody id="tbody1">' +

		'<tr>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<span class="input-group-addon">'
				+ (j+1)
				+ '.</span>'
				+ '</td>'
				+

				'<td style="border:1px solid #FFB74D;" id ="tabletd1">'
				+ '<input disabled id="f'
				+ j
				+ '" autocomplete="off" type="text" class="form-control"'
				+ 'name="input" value ="'+paresed_data1_table1[j].inputVal+'" >'
				+ '</td>'
				+

				// dropdown1
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale1'
				+ j
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')" >'
				+ '<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].natureVal == "Pleasurable") {
					out += ' selected'
				}
				out += '>Pleasurable</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].natureVal == "Meaningful") {
					out += ' selected'
				}
				out += '>Meaningful</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].natureVal == "Mastery-oriented") {
					out += ' selected'
				}
				out += '>Mastery-oriented</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown2
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale2'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+

				'<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].freVal == "1") {
					out += ' selected'
				}
				out += '>A few times a week</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].freVal == "2") {
					out += ' selected'
				}
				out += '>Once a week</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].freVal == "3") {
					out += ' selected'
				}
				out += '>Less than once a week</option>'
				+ '</select>'
				+

				'</td>'
				+

				// dropdown3
				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+

				'<select disabled id="scale3'
				+ k
				+ '" class="form-control text-center" onchange="setDropDown('
				+ 
				+ ')">'
				+ '<option value="-1">Select</option>'
				+ '<option value="1"';
				if (paresed_data1_table1[j].easyVal == "1") {
					out += ' selected'
				}
				out += '>Easy</option>';

				out += '<option value="2"';
				
				if (paresed_data1_table1[j].easyVal == "2") {
					out += ' selected'
				}
				out += '>Slightly difficult</option>';

				out += '<option value="3"';
				if (paresed_data1_table1[j].easyVal == "3") {
					out += ' selected'
				}
				out += '>Somewhat difficult</option>'
					out += '<option value="4"';
				if (paresed_data1_table1[j].easyVal == "4") {
					out += ' selected'
				}
				out += '>Very difficult</option>'
				+ '</select>'
				+

		'</td>';

		'</tr>';

		'</tbody>';

	}

	out += '</table>';

	

	out += '<div class="clearfix"></div><hr>';

	out += '</div>';
	//end of  first table data details display
	
	
	//begin second table data details display
	out += '<div class="form-group " id="tables2_dbvalues">'
		+
		'<h3>'+"3.3 Potential List and Weekly Planner"+'</h3>'+
		'<p>'
		+ "Here is a table with a list of activities based on how easy it is for you to do them and how often you are currently doing them!<br>The coloured ones are those we suggest to you, as good starting points.<br>Please select the various days in the next one week when you want to do them. You can choose to do an activity on multiple days ."
		+ '</p>'
		+ '<br>'
		+ '<br>'
		+ '<p class="text-center">'
		+ '<strong>'
		+ "YOUR POTENTIAL LIST"
		+ '</strong>'
		+ '</</p>'
		+

		'<table id="table2_dbvalues" class="table table-hover table-bordered myTable" style="border:1px solid #FFB74D;background: #FFE0B2;">'
		+

		'<thead id="thead">'
		+

		'<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Activity"
		+ '</th>'+
		'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Nature"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Monday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Tuesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Wednesday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Thursday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Friday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Saturday"
		+ '</th>'
		+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
		+ "Sunday" + '</th>' +

		'</thead>' ;

	
	for (var m = 0; m < parsed_data2_table2.length; m++) {
		var data_row = parsed_data2_table2[m];
		out += '<tbody id="tbody1">' +'<tr>' + '<td style="border:1px solid #FFB74D;">'
		+ data_row.actName1 +  '</td>'+
		'<td style="border:1px solid #FFB74D;">'
		+ data_row.natureName1 +  '</td>'+
		



       

'<td class="text-center" style="border:1px solid #FFB74D;" id="check1">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="1" id="day1'
		+ m
		+ '" onclick="setWeeklyPlanner(this)"';

		if (data_row.checkboxes[0] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="2" id="day2'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[1] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="3" id="day3'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[2] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="4" id="day4'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[3] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="5" id="day5'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[4] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="6" id="day6'
		+ m
		+ '"  onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[5] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>'
		+

		'<td class="text-center" style="border:1px solid #FFB74D;">'
		+ '<input class ="check" disabled type="checkbox" name="day'
		+ m
		+ '"  value="7" id="day7'
		+ m
		+ '" onclick="setWeeklyPlanner(this)"';
		if (data_row.checkboxes[6] == 1) {
			out += ' checked';
		}
		out += '>'
		+ '</td>';

'</tr>';

		'</tbody>';
	}

out += '</table>';

'</div>';
//end of second table data details display

//begin third table data details display(AFTER 1 WEEK TO ENTER DETAILS IN THE third TABLE)
out += '<div class="form-group " id="tables3_dbvalues">'
	+'<br>'
	
	+ '<p class="text-center">'
	+ '<strong>'
	+ "YOUR WEEKLY MONITOR"
	+ '</strong>'
	+ '</p>'
	+

	'<table id="table3" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
	+

	'<thead id="thead">'
	+

	'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Activity"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Monday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Tuesday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Wednesday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Thursday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Friday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Saturday"
	+ '</th>'
	+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
	+ "Sunday" + '</th>' +

	'</thead>' ;

for(var n = 0 ;n < parsed_data3_table3.length ;n++){
	var act_name = parsed_data3_table3[n].actName2
	var buttons = parsed_data3_table3[n].buttons
	var checkboxes = parsed_data2_table2[n].checkboxes
	out +='<tbody id = "tbody3">' ;
	if(checkboxes.indexOf(1) != -1){
	 out += '<tr>' ;

	out += '<td style="border:1px solid #FFB74D;">'+ act_name +'</td>';

	out += '<td class="text-center" style="border:1px solid #FFB74D;">';
	
	if (checkboxes[0] == 1) {	
		
		out +='<button class="button button1_' + n
				+ ' button-activity " id = "buttongreen1_' + n
				+ '"';
		if (buttons[0][0] == 1) {
			out += 'style="background-color:green;"';
		}
		out +='>' + "Did" + '</button>'+
		 '<button class="button button1_' + n
				+ ' button-activity" id = "buttonyellow1_' + n
				+ '"';
				if (buttons[0][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';	
	}
	out += '</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	
	
	if (checkboxes[1] == 1) {	
	
		
		out += '<button class="button button2_' + n
				+ ' button-activity" id = "buttongreen2_' + n
				+ '"';
				if (buttons[1][0] == 1) {
					out += 'style="background-color:green;"';
				}
				out +='>' + "Did" + '</button>'+
		 '<button class="button button2_' + n
				+ ' button-activity" id = "buttonyellow2_' + n
				+ '"';
				if (buttons[1][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';
		}
	
	out += '</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	
	if (checkboxes[2] == 1) {	
	
		
		out += '<button class="button button3_' + n
				+ ' button-activity" id = "buttongreen3_' + n
				+ '"';
				if (buttons[2][0] == 1) {
					out += 'style="background-color:green;"';
				}
				out +='>' + "Did" + '</button>'+
		'<button class="button button3_' + n
				+ ' button-activity" id = "buttonyellow3_' + n
				+ '"';
				if (buttons[2][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';

	}
	
	out += '</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	
	if (checkboxes[3] == 1) {	

		
		out += '<button class="button button4_' + n
				+ ' button-activity" id = "buttongreen4_' + n
				+ '"';
				if (buttons[3][0] == 1) {
					out += 'style="background-color:green;"';
				}
				out +='>' + "Did" + '</button>'+
		 '<button class="button button4_' + n
				+ ' button-activity" id = "buttonyellow4_' + n
				+ '"';
				if (buttons[3][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';

	}
	
	out += '</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	
	if (checkboxes[4] == 1) {	
		
	 out += '<button class="button button5_' + n
				+ ' button-activity" id = "buttongreen5_' + n
				+ '"';
				if (buttons[4][0] == 1) {
					out += 'style="background-color:green;"';
				}
				out +='>' + "Did" + '</button>'+
		'<button class="button button5_' + n
				+ ' button-activity" id = "buttonyellow5_' + n
				+ '"';
				if (buttons[4][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';

	}
	
	out += '</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (checkboxes[5] == 1) {	
		
		out +='<button class="button button6_' + n
				+ ' button-activity" id = "buttongreen6_' + n
				+ '"';
				if (buttons[5][0] == 1) {
					out += 'style="background-color:green;"';
				}
				out +='>' + "Did" + '</button>'+
		 '<button class="button button6_' + n
				+ ' button-activity" id = "buttonyellow6_' + n
				+ '"';
				if (buttons[5][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';

	}
	
	
	out += '</td>' +

	'<td class="text-center" style="border:1px solid #FFB74D;">';
	if (checkboxes[6] == 1) {	

		
		 out += '<button class="button button7_' + n
				+ ' button-activity" id = "buttongreen7_' + n
				+ '"';
				if (buttons[6][0] == 1) {
					out += 'style="background-color:green;"';
				}
				out +='>' + "Did" + '</button>'+
		'<button class="button button7_' + n
				+ ' button-activity" id = "buttonyellow7_' + n
				+ '"';
				if (buttons[6][1] == 1) {
					out += 'style="background-color:yellow;"';
				}
				out +='>' + "Tried" + '</button>';
	}
	
	out +='</td>';

	'</tr>';
	}

	'</tbody>';
}

	

out += '</table>';
out+=

'<p>'
+"This weekly monitor is available in your workbook. "
+ "Check your planner every morning regarding activities you have planned to do and fill the day's column in the evening. Use this for the coming week.You can generate a new monitor template for a new week in the workbook, by clicking on the 'Add' button.<br>You will   receive  a version of this  ( blank)  form as  well as  a  few  forms   from other sections as  word  files over mail. Please check  your  mail  for  the same."
+ '</p>'
+ '<br>'

'</div>';


out += '<div class="form-group">' +
'<button id="skip3" class="  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
'<button id="download3" class="  btn btn-warning  pull-right hidden"  onclick="download3()">Download</button>';


+ '</div>';


//end of third table data details display
	
		
	}
	
	//end of code to display the 3 tables data from the database after filling details in the second table 
	
	

	
	

	// begin second table div after entering details in first table for the first time 

	out += '<div class="form-group hidden" id="tables2">'
			+
			
			'<h3>'+"3.3 Potential List and Weekly Planner"+'</h3>'+

			'<p>'
			+ "Here is a table with a list of activities based on how easy it is for you to do them and how often you are currently doing them!<br>The coloured ones are those we suggest to you, as good starting points.<br>Please select the various days in the next one week when you want to do them. You can choose to do an activity on multiple days ."
			+ '</p>'
			+ '<br>'
			+ '<br>'
			+ '<p class="text-center">'
			+ '<strong>'
			+ "YOUR POTENTIAL LIST"
			+ '</strong>'
			+ '</</p>'
			+

			'<table id="table2" class="table table-hover table-bordered myTable" style="border:1px solid #FFB74D;background: #FFE0B2;">'
			+

			'<thead id="thead">'
			+

			'<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Activity"
			+ '</th>'
			+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Nature"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Monday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Tuesday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Wednesday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Thursday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Friday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Saturday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Sunday" + '</th>' +

			'</thead>' +

			'<tbody id="tbody2">' +

			'</tbody>';

	out += '</table>';

	// begin second submit button

	out += '<div class="form-group">' +

	'<button type="button" id="submit2" onclick="submit2(' + k
			+ ')" class="btn btn-success pull-right">Submit</button>'
			+
			'<button id="skip2" class="hidden  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
			
			'<button type="button" id="download2" onclick="download2()" class="btn btn-warning pull-right">Download</button>'
			+'</div>';

	// end of second submit button

	'</div>';

	// end of  begin second table div after entering details in first table for the first time 
	

	// begin third table div after entering details in second table for the first time

	out += '<div class="form-group hidden" id="tables3">'
			
			+ '<p class="text-center">'
			+ '<strong>'
			+ "YOUR WEEKLY MONITOR"
			+ '</strong>'
			+ '</p>'
			+

			'<table id="table3" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
			+

			'<thead id="thead">'
			+

			'<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Activity"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Monday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Tuesday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Wednesday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Thursday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Friday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Saturday"
			+ '</th>'
			+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
			+ "Sunday" + '</th>' +

			'</thead>' +

			'<tbody id="tbody3">' +

			'</tbody>';

	out += '</table>';
	out+=

	'<p>'
	+"This weekly monitor is available in your workbook. "
	+ "Check your planner every morning regarding activities you have planned to do and fill the day's column in the evening. Use this for the coming week.You can generate a new monitor template for a new week in the workbook, by clicking on the 'Add' button.<br>You will   receive  a version of this  ( blank)  form as  well as  a  few  forms   from other sections as  word  files over mail. Please check  your  mail  for  the same."
	+ '</p>'
	+ '<br>'

	// begin third submit button

	out += '<div class="form-group">' +
	'<button id="skip3" class="hidden  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
	'<button id="download3" class="  btn btn-warning  pull-right hidden"  onclick="download3()">Download</button>';

	

	// end of third submit buttons

	'</div>';
	// end of third table div  after entering details in second table for the first time

	
	//old code
	if (j == 1) {
		out1 += '<li id="l' + j + '" class="active">' + '<a href="#panel' + j
				+ '" onclick="show(' + k + ')">' + j + '</a>' + '</li>';
	} else {
		out1 += '<li id="l' + j + '">' + '<a href="#panel' + j
				+ '" onclick="show(' + k + ')">' + j + '</a>' + '</li>';
	}

	out += '</div>';
	

	out1 += '<li>' + '<a href="#" aria-label="Next">'
			+ '<span aria-hidden="true">&raquo;</span>' + '</a>' + '</li>'
			+ '</ul>';
	//end of old code
	

	// code to display the page
	$('#pages').html(out);
	

	//old code
	if (sectionId != activeSectionId) {
		$('#pagination').removeClass("hidden");
		$('#next').removeClass("hidden");
	}
	//end of old code


 $('#tabs-'+sid+'-'+ssid).html(out);
 
 
 
}
