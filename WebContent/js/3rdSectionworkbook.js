
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
var table3arr = [];
var data_length = 0;
var final_sorted_arr_data = [];
var table2arr1;
var download3_data = [];

//for updating version in submit2 function
var ver_id = 0 ;


//function to add more rows
function add(c,e) {
	
	
	
	var j=e;
	
	var arr = [];
	arr[0] = c;
	
	f = false;
	
	
	
	for (k = 1; k <= max; k++) {
		
		
		
		if (!($('#f' + k+j).val())) {
			f = true;
			
		} else if (($('#scale1' + k+j).val() === "-1")) {
			f = true;
			
		} else if (($('#scale2' + k+j).val() === "-1")) {
			f = true;
			
		} else if (($('#scale3' + k+j).val() === "-1")) {
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
					+ '<input id="f'+ arr[0]+ j+ '" autocomplete="off" type="text" class="form-control"'
					+ 'name="input">'
					+ '</td>'
					+

					// dropdown1
					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<select id="scale1'+ arr[0]+j+ '" class="form-control text-center" onchange="setDropDown('
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
					+ arr[0]+j+ '" class="form-control text-center" onchange="setDropDown('
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
					+ '<select id="scale3'+ arr[0]+j+ '" class="form-control text-center" onchange="setDropDown('
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
			$('#tbody1_add:last-child').append(field);
			arr[0]++;

			$('#addInputs1').attr('onclick', 'add("' + arr[0] +'","'+j+ '")');
			max = arr[0] - 1;

		}

		else {
			$('#addInputs1').prop('disabled', 'disabled');
		}
	}
}
// end of function to add more rows




//old code for function to select the dropdown option
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



var table1res = [];
var table1nature = [];
var table1input = [];
var array1table1 = [];
var final_sorted_arr = [];

var count1 = 0;
var count2  = 0;
var count3  = 0;
var count4  = 0;
var count5  = 0;
var count6  = 0;
var count7  = 0;

var download_new_array = [];


function practice11Workbook(arr, url, sid, ssid) {
	
	
$.get(serverURL + "users/" + userId + "/sections/" + sid + "/subsections/"+ ssid + "/" + "3rdSecdataWB", function(data1){
	
	
	if(data1 != null){
		retrieved_data1 = data1;

		
		var lengthofArr1 = Math.ceil(retrieved_data1.length/3);
		var arrLen = retrieved_data1.length;
		var tempArray1 = [];	
		
		for(var i3 = 0;i3 <= (arrLen-1);i3++){
				 tempArray1.push(retrieved_data1[i3]);		
		}
			
		Object.defineProperty(Array.prototype, 'chunk', {
		    value: function(chunkSize){
		        var temporal = [];
		        
		        for (var i = 0; i < this.length; i+= chunkSize){
		            temporal.push(this.slice(i,i+chunkSize));
		        }
		                
		        return temporal;
		    }
		});
			
			// Split in group of 3 items
			var result = retrieved_data1.chunk(3);
			download_new_array = result;
			
		 
		}
		
		
	var pp = data1;
	var tabs = '';
	var divTab = '';
	var exer = '';
	var tbody = '';
	var lengthofArr = Math.ceil(pp.length/3);
	ver_id = lengthofArr;
	
	//begin iteration 
	for (j = 0; j <= lengthofArr; j++) {
		
		
		exer = ''; 	
		if(j == lengthofArr-1) {
			
			
			tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation" class="active">' +
						'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
							'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (lengthofArr+1) + ', ' + (j+1) + ')">' +
							'Version ' + (j+1) + '</a>' +
					'</li>';	//	tablist
			
			divTab +=	'<div id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">';
			
		}else if(j == lengthofArr) {
			
					tabs += '<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation">' +
					'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
						'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (lengthofArr+1) + ', ' + (j+1) + ')">' +
						'Add</a>' +
				    '</li>';	//	tablist
		           divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">' +
				                '<br><p><strong>Please enter your new response</strong></p>';
         }else {
        	
				tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation">' +
				'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
					'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (lengthofArr+1) + ', ' + (j+1) + ')">' +
					'Version ' + (j+1) + '</a>' +
			    '</li>';	//	tablist

	            divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">';
             }
		
		
		exer+='<br><p style="font-weight:bold;">'+"Please complete all 3 tables in a version before clicking Add button"+'</p>';
		exer+='<br>';
		
		//display text content in the beginning
		for (var k1 = 0; k1 < arr[0].exerciseDesc.length; k1++) {
			exer += '<p class="text-justify">' + arr[0].exerciseDesc[k1] + '</p>';
			
		}//end of text content
		
		k = 0;
		j2=0;
		c = i + 1;
		len=0;
		x = j2;
		
			
		//if add version data is empty
		if(result[j] == undefined){
		
				i=0;
				
				exer += '<div id="tables1" class="form-group input-group">'
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

					exer += '<tbody id="tbody1_add">' +

					'<tr>' +

					'<td class="text-center" style="border:1px solid #FFB74D;">'
							+ '<span class="input-group-addon">'
							+ k
							+ '.</span>'
							+ '</td>'
							+

							'<td style="border:1px solid #FFB74D;" id ="tabletd1">'
							+ '<input id="f'+ k +j+ '" autocomplete="off" type="text" class="form-control"'
							+ 'name="input">'
							+ '</td>'
							+

							// dropdown1
							'<td class="text-center" style="border:1px solid #FFB74D;">'
							+

							'<select id="scale1'+ k + j+ '" class="form-control text-center" onchange="setDropDown('
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

							'<select id="scale2'+ k + j + '" class="form-control text-center" onchange="setDropDown('
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

							'<select id="scale3'+ k + j+ '" class="form-control text-center" onchange="setDropDown('
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

				exer += '</table>';

				// begin buttons to add more rows and submit

				exer += '<div class="form-group">';
				exer += '<button type="button" id="addInputs1" onclick="add(' + k
						+"," +j+ ')" class="btn btn-primary">Add More ...</button>';
				exer += '<button id="skip1" class="  btn btn-primary  pull-right hidden" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip1()">Skip</button>';
				exer += '<button type="button" id="download1" class="btn btn-warning pull-right hidden" onclick="download1('+j+')" >Download</button>';
				exer += '<button type="button" id="submit" onclick="submit_add('+j+')" class="btn btn-success pull-right">Submit</button>';
				
				exer += '</div>';

				// end of add and submit buttons

				exer += '<div class="clearfix"></div><hr>';

				exer += '</div>';
				
				//}// end of  code to display the first table div if the data from the database is null
				
				// begin second table div after entering details in first table for the first time 
				

				exer += '<div class="form-group hidden" id="tables2">'
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

						'<tbody id="tbody2_add">' +

						'</tbody>';
				

				exer += '</table>';

				// begin second submit button

				exer += '<div class="form-group">' +

				'<button type="button" id="submit2" onclick="submit2(' + k+ ","+ j+ ')" class="btn btn-success pull-right">Submit</button>'
						+
						//'<button id="skip2" class="hidden  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
						
						'<button type="button" id="download2" class="btn btn-warning pull-right hidden" onclick="download2('+j+')">Download</button>'
						+'</div>';

				// end of second submit button

				exer += '</div>';
				
				// begin third table div after entering details in second table for the first time

				exer += '<div class="form-group hidden" id="tables3">'
						
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

						'<tbody id="tbody3_add">' +

						'</tbody>';
				//alert("check6");

				exer += '</table>';
				exer+=

				'<p>'
				+"This weekly monitor is available in your workbook. "
				+ "Check your planner every morning regarding activities you have planned to do and fill the day's column in the evening. Use this for the coming week.You can generate a new monitor template for a new week in the workbook, by clicking on the 'Add' button."
				+ '</p>'
				+ '<br>';

				// begin third submit button

				exer += '<div class="form-group">' +
				//'<button id="skip3" class="hidden  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
				'<button id="download3" class="  btn btn-warning  pull-right hidden"  onclick="download3()">Download</button>';

				'<button type="button" id="submit3" onclick="submit3_add(' + j + ','
						+ activeSectionId + ',' + activeSubSectionId
						+ ')" class="btn btn-success pull-right hidden">Submit</button>'
						+ '</div>';

				// end of third submit buttons

				exer+='</div>';
				// end of third table div  after entering details in second table for the first time


			exer += '<p class="text-justify"><center>ADDversion--' + j + '</center></p>';	
			
		}//end of add version data empty
		else{
			
			retrieved_data = result[j];
			 
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
			
			

			 if(data_length == 1){
				
				//the user completed first table and loggexer exer and again comes to section 3.2
				//begin first table data details display
				
				exer += '<div id="tables1" class="form-group input-group">'
					+

					// '<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
					'<table id="table" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
					+ '<thead id="thead" class="text-center">'
					+

					'<tr>'
					+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">S. No.</th>'
					+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
					+ arr[i-1].tables[k].thead[0]
					+ '</th>'
					+ '<th class="col-md-3" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
					+ arr[i-1].tables[k].thead[1]
					+ '</th>'
					+ '<th class="col-md-2" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
					+ arr[i-1].tables[k].thead[2]
					+ '</th>'
					+ '<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
					+ arr[i-1].tables[k].thead[3] + '</th>';
			'</tr>';

			'</thead>';

			for (var j2 = 0; j2 < paresed_data1_table1.length; j2++) {
				
				
				exer += '<tbody id="tbody1">' +

				'<tr>' +

				'<td class="text-center" style="border:1px solid #FFB74D;">'
						+ '<span class="input-group-addon">'
						+ (j2+1)
						+ '.</span>'
						+ '</td>'
						+

						'<td style="border:1px solid #FFB74D;" id ="tabletd1">'
						+ '<input id="f'
						+ j2
						+ '" autocomplete="off" type="text" class="form-control"'
						+ 'name="input" value ="'+paresed_data1_table1[j2].inputVal+'" disabled>'
						+ '</td>'
						+

						// dropdown1
						'<td class="text-center" style="border:1px solid #FFB74D;">'
						+

						'<select disabled id="scale1'
						+ j2
						+ '" class="form-control text-center" onchange="setDropDown('
						+ 
						+ ')">'
						+ '<option value="-1">Select</option>'
						+ '<option value="1"';
						if (paresed_data1_table1[j2].natureVal == "Pleasurable") {
							exer += ' selected'
						}
						exer += '>Pleasurable</option>';

						exer += '<option value="2"';
						
						if (paresed_data1_table1[j2].natureVal == "Meaningful") {
							exer += ' selected'
						}
						exer += '>Meaningful</option>';

						exer += '<option value="3"';
						if (paresed_data1_table1[j2].natureVal == "Mastery-oriented") {
							exer += ' selected'
						}
						exer += '>Mastery-oriented</option>'
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
						if (paresed_data1_table1[j2].freVal == "1") {
							exer += ' selected'
						}
						exer += '>A few times a week</option>';

						exer += '<option value="2"';
						
						if (paresed_data1_table1[j2].freVal == "2") {
							exer += ' selected'
						}
						exer += '>Once a week</option>';

						exer += '<option value="3"';
						if (paresed_data1_table1[j2].freVal == "3") {
							exer += ' selected'
						}
						exer += '>Less than once a week</option>'
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
						if (paresed_data1_table1[j2].easyVal == "1") {
							exer += ' selected'
						}
						exer += '>Easy</option>';

						exer += '<option value="2"';
						
						if (paresed_data1_table1[j2].easyVal == "2") {
							exer += ' selected'
						}
						exer += '>Slightly difficult</option>';

						exer += '<option value="3"';
						if (paresed_data1_table1[j2].easyVal == "3") {
							exer += ' selected'
						}
						exer += '>Somewhat difficult</option>'
							exer += '<option value="4"';
						if (paresed_data1_table1[j2].easyVal == "4") {
							exer += ' selected'
						}
						exer += '>Very difficult</option>'
						+ '</select>'
						+

				'</td>';

				'</tr>';

				'</tbody>';

			}

			exer += '</table>';
			exer+='<div class="form-group">';

			exer+='<button type="button" id="download1" onclick="download1('+j+')" class="btn btn-warning pull-right ">Download</button>';
			exer+='</div>';

			

			exer += '<div class="clearfix"></div><hr>';

			

			exer += '</div>';
			//end of  first table data details display
			

			//begin second table data details display when user logs exer after first table and again comes to section 3.2
			exer += '<div class="form-group " id="tables2_data_dbvalues">'
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

			exer += '<tbody id="tbody2_data">' +'<tr>' + '<td style="border:1px solid #FFB74D;">'
					+ final_sorted_arr_data[k].inputVal + '</td>';

			if (final_sorted_arr_data[k] == top_pleasurable) {
				 exer+= '<td class="nature'
						+ k
						+ '" style="border:1px solid #FFB74D; background-color:#23ba34;">'
						+ final_sorted_arr_data[k].natureVal;
			} else if (final_sorted_arr_data[k] == top_meaningful) {
				  exer+='<td class="nature'
						+ k
						+ '" style="border:1px solid #FFB74D; background-color:#f7c02a;">'
						+ final_sorted_arr_data[k].natureVal;
			} else if (final_sorted_arr_data[k] == top_mastery) {
				 exer+= '<td class="nature'
						+ k
						+ '" style="border:1px solid #FFB74D; background-color:#4ba2e5;">'
						+ final_sorted_arr_data[k].natureVal;

			} else if (no_of_entries > 6) {
				if (final_sorted_arr_data[k] == second_pleasurable) {
					exer += '<td class="nature'
							+ k
							+ '" style="border:1px solid #FFB74D; background-color:#23ba34;">'
							+ final_sorted_arr_data[k].natureVal;
				} else if (final_sorted_arr_data[k] == second_meaningful) {
					exer += '<td class="nature'
							+ k
							+ '" style="border:1px solid #FFB74D; background-color:#f7c02a;">'
							+ final_sorted_arr_data[k].natureVal;
				} else if (final_sorted_arr_data[k] == second_mastery) {
					exer += '<td class="nature'
							+ k
							+ '" style="border:1px solid #FFB74D; background-color:#4ba2e5;">'
							+ final_sorted_arr_data[k].natureVal;

				} else {
					exer += '<td class="nature' + k
							+ '" style="border:1px solid #FFB74D;">'
							+ final_sorted_arr_data[k].natureVal;
				}
			} else {
				exer += '<td class="nature' + k
						+ '" style="border:1px solid #FFB74D;">'
						+ final_sorted_arr_data[k].natureVal;
			}

			exer += '</td>' ;

			exer +='<td class="text-center" style="border:1px solid #FFB74D;" id="check1">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="1" id="day1'
					+ k
					+ '" onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="2" id="day2'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="3" id="day3'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="4" id="day4'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="5" id="day5'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="6" id="day6'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="7" id="day7'
					+ k
					+ '" onclick="setWeeklyPlanner(this)">' + '</td>';

			'</tr>';
			exer+='</tbody>';
			
		}
		exer += '</table>';


		//submit button for second table
		//exer += '<button id="skip2_data" class="  btn btn-primary  pull-right hidden" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2_data()">Skip</button>';
		exer += '<div class="form-group">' ;

		exer+='<button type="button" id="submit2_data" onclick="submit2(' + k+","+j+ ')" class="btn btn-success pull-right check_data">Submit</button>';
				
		//exer+='<button id="skip2" class="hidden  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>';
		exer+='<button type="button" id="download2" onclick="download2('+j+')" class="btn btn-warning pull-right hidden">Download</button>';
				
		exer+='<br>';
		exer+=	'</div>';


		exer+='</div>';




		//end  second table data details display when user logs exer after first table and again comes to section 3.2
		//begin third table divwhen the user logged exer after first table and then entering details in second table for the first time

		exer += '<div class="form-group hidden" id="tables3">'
				
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

				'<tbody id="tbody3_add">' +

				'</tbody>';

		exer += '</table>';
		exer+=

		'<p>'
		+"This weekly monitor is available in your workbook. "
		+ "Check your planner every morning regarding activities you have planned to do and fill the day's column in the evening. Use this for the coming week.You can generate a new monitor template for a new week in the workbook, by clicking on the 'Add' button."
		+ '</p>'
		+ '<br>'
		//begin third submit button

		exer += '<div class="form-group">' +
		//'<button id="skip3" class="hidden  btn btn-primary  pull-right" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
		'<button id="download3" class="  btn btn-warning  pull-right hidden"  onclick="download3('+j+')">Download</button>';



		'</div>';
		//end  third table divwhen the user logged exer after first table and then entering details in second table for the first time



		}
			
			else if(data_length == 2){
				
				//alert("data_length-2 "+i);
				//begin first table data details display
				
				exer += '<div id="tables1" class="form-group input-group">'
					+

					// '<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
					'<table id="table" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
					+ '<thead id="thead" class="text-center">'
					+

					'<tr>'
					+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">S. No.</th>'
					+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
					+ arr[i-1].tables[k].thead[0]
					+ '</th>'
					+ '<th class="col-md-3" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
					+ arr[i-1].tables[k].thead[1]
					+ '</th>'
					+ '<th class="col-md-2" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
					+ arr[i-1].tables[k].thead[2]
					+ '</th>'
					+ '<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
					+ arr[i-1].tables[k].thead[3] + '</th>';
			'</tr>';

			'</thead>';

			for (var j2 = 0; j2 < paresed_data1_table1.length; j2++) {
				
				
				exer += '<tbody id="tbody1">' +

				'<tr>' +

				'<td class="text-center" style="border:1px solid #FFB74D;">'
						+ '<span class="input-group-addon">'
						+ (j2+1)
						+ '.</span>'
						+ '</td>'
						+

						'<td style="border:1px solid #FFB74D;" id ="tabletd1">'
						+ '<input id="f'
						+ j2
						+ '" autocomplete="off" type="text" class="form-control"'
						+ 'name="input" value ="'+paresed_data1_table1[j2].inputVal+'" disabled>'
						+ '</td>'
						+

						// dropdown1
						'<td class="text-center" style="border:1px solid #FFB74D;">'
						+

						'<select disabled id="scale1'
						+ j2
						+ '" class="form-control text-center" onchange="setDropDown('
						+ 
						+ ')">'
						+ '<option value="-1">Select</option>'
						+ '<option value="1"';
						if (paresed_data1_table1[j2].natureVal == "Pleasurable") {
							exer += ' selected'
						}
						exer += '>Pleasurable</option>';

						exer += '<option value="2"';
						
						if (paresed_data1_table1[j2].natureVal == "Meaningful") {
							exer += ' selected'
						}
						exer += '>Meaningful</option>';

						exer += '<option value="3"';
						if (paresed_data1_table1[j2].natureVal == "Mastery-oriented") {
							exer += ' selected'
						}
						exer += '>Mastery-oriented</option>'
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
						if (paresed_data1_table1[j2].freVal == "1") {
							exer += ' selected'
						}
						exer += '>A few times a week</option>';

						exer += '<option value="2"';
						
						if (paresed_data1_table1[j2].freVal == "2") {
							exer += ' selected'
						}
						exer += '>Once a week</option>';

						exer += '<option value="3"';
						if (paresed_data1_table1[j2].freVal == "3") {
							exer += ' selected'
						}
						exer += '>Less than once a week</option>'
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
						if (paresed_data1_table1[j2].easyVal == "1") {
							exer += ' selected'
						}
						exer += '>Easy</option>';

						exer += '<option value="2"';
						
						if (paresed_data1_table1[j2].easyVal == "2") {
							exer += ' selected'
						}
						exer += '>Slightly difficult</option>';

						exer += '<option value="3"';
						if (paresed_data1_table1[j2].easyVal == "3") {
							exer += ' selected'
						}
						exer += '>Somewhat difficult</option>'
							exer += '<option value="4"';
						if (paresed_data1_table1[j2].easyVal == "4") {
							exer += ' selected'
						}
						exer += '>Very difficult</option>'
						+ '</select>'
						+

				'</td>';

				'</tr>';

				'</tbody>';

			}

			exer += '</table>';
			exer+='<div class="form-group">'+

			'<button type="button" id="download1" onclick="download1('+j+')" class="btn btn-warning pull-right ">Download</button>';
			exer+='</div>';

			

			exer += '<div class="clearfix"></div><hr>';

			exer += '</div>';
			//end of  first table data details display
			
			
			
			
			//begin second table data details display
			exer += '<div class="form-group " id="tables2_dbvalues">'
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
				exer += '<tbody id="tbody1">' +'<tr>' + '<td style="border:1px solid #FFB74D;">'
				+ data_row.actName1 +  '</td>'+
				'<td style="border:1px solid #FFB74D;">'
				+ data_row.natureName1 +  '</td>'+
				



		       

		'<td class="text-center" style="border:1px solid #FFB74D;" id="check1">'
				+ '<input class="checkbox_table2" disabled type="checkbox" name="day'
				+ m
				+ '"  value="1" id="day1'
				+ m
				+ '" onclick="setWeeklyPlanner(this)"';

				if (data_row.checkboxes[0] == 1) {
					exer += ' checked';
					
				}
				exer += '>'
				+ '</td>'
				+

				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<input class="checkbox_table2"  disabled type="checkbox" name="day'
				+ m
				+ '"  value="2" id="day2'
				+ m
				+ '"  onclick="setWeeklyPlanner(this)"';
				if (data_row.checkboxes[1] == 1) {
					exer += ' checked ';
				}
				exer += '>'
				+ '</td>'
				+

				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<input class="checkbox_table2" disabled type="checkbox" name="day'
				+ m
				+ '"  value="3" id="day3'
				+ m
				+ '"  onclick="setWeeklyPlanner(this)"';
				if (data_row.checkboxes[2] == 1) {
					exer += ' checked';
				}
				exer += '>'
				+ '</td>'
				+

				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<input class="checkbox_table2" disabled type="checkbox" name="day'
				+ m
				+ '"  value="4" id="day4'
				+ m
				+ '"  onclick="setWeeklyPlanner(this)"';
				if (data_row.checkboxes[3] == 1) {
					exer += ' checked';
				}
				exer += '>'
				+ '</td>'
				+

				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<input class="checkbox_table2" disabled type="checkbox" name="day'
				+ m
				+ '"  value="5" id="day5'
				+ m
				+ '"  onclick="setWeeklyPlanner(this)"';
				if (data_row.checkboxes[4] == 1) {
					exer += ' checked';
				}
				exer += '>'
				+ '</td>'
				+

				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<input class="checkbox_table2" disabled type="checkbox" name="day'
				+ m
				+ '"  value="6" id="day6'
				+ m
				+ '"  onclick="setWeeklyPlanner(this)"';
				if (data_row.checkboxes[5] == 1) {
					exer += ' checked';
				}
				exer += '>'
				+ '</td>'
				+

				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<input class="checkbox_table2" type="checkbox" disabled name="day'
				+ m
				+ '"  value="7" id="day7'
				+ m
				+ '" onclick="setWeeklyPlanner(this)"';
				if (data_row.checkboxes[6] == 1) {
					exer += ' checked';
				}
				exer += '>'
				+ '</td>';

		'</tr>';

				'</tbody>';
			}

		exer += '</table>';
		exer+='<div class="form-group">'+
		'<button type="button" id="download2" onclick="download2('+j+')" class="btn btn-warning pull-right">Download</button>';
		exer+='</div>';

		'</div>';

		//end of second table data details display



		/*modified table3*/

		//begin third table (AFTER 1 WEEK TO ENTER DETAILS IN THE third TABLE)
		exer += '<div class="form-group " id="tables3_dbvalues">'
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
			
			exer += '<tbody id="tbody3">';
			if(data_row.checkboxes.indexOf(1) != -1){
				
				
				
				download3_data.push(data_row);
				
				exer += '<tr>' ;
				exer += '<td style="border:1px solid #FFB74D;">';
				exer += data_row.actName1 ;
				exer +='</td>';	
			
			exer += '<td class="text-center" style="border:1px solid #FFB74D;">';
			if (data_row.checkboxes[0] == 1) {
				
				exer += '<button class="button button1_' + m
						+ ' button-activity " id = "buttongreen1_' + m+j+ '" onclick="changeColorGreen(\'buttongreen1_' + m
						+j+ '\', \'button1_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
				exer += '<button class="button button1_' + m
						+ ' button-activity" id = "buttonyellow1_' + m + j+ '" onclick="changeColorYellow(\'buttonyellow1_' + m
						+j+ '\', \'button1_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
			}
			exer +=
			
			'</td>'  +

			'<td class="text-center" style="border:1px solid #FFB74D;">';
			if (data_row.checkboxes[1] == 1) {
				
				exer += '<button class="button button2_' + m
						+j+ ' button-activity" id = "buttongreen2_' + m + j+ '" onclick="changeColorGreen(\'buttongreen2_' + m
						+j+ '\', \'button2_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
				exer += '<button class="button button2_' + m
						+ ' button-activity" id = "buttonyellow2_' + m + j+ '" onclick="changeColorYellow(\'buttonyellow2_' + m
						+j+ '\', \'button2_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
			}
			exer +=
			
			'</td>' +

			'<td class="text-center" style="border:1px solid #FFB74D;">';
			if (data_row.checkboxes[2] == 1) {
				
				exer += '<button class="button button3_' + m
						+ ' button-activity" id = "buttongreen3_' + m + j+ '" onclick="changeColorGreen(\'buttongreen3_' + m
						+j+ '\', \'button3_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
				exer += '<button class="button button3_' + m
						+ ' button-activity" id = "buttonyellow3_' + m + j+ '" onclick="changeColorYellow(\'buttonyellow3_' + m
						+j+ '\', \'button3_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
			}
			exer +=
			
			'</td>' +

			'<td class="text-center" style="border:1px solid #FFB74D;">';
			if (data_row.checkboxes[3] == 1) {
				
				exer += '<button class="button button4_' + m
						+ ' button-activity" id = "buttongreen4_' + m + j+ '" onclick="changeColorGreen(\'buttongreen4_' + m
						+j+ '\', \'button4_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
				exer += '<button class="button button4_' + m
						+ ' button-activity" id = "buttonyellow4_' + m + j+ '" onclick="changeColorYellow(\'buttonyellow4_' + m
						+j+ '\', \'button4_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
			}
			exer +=
			
			'</td>' +

			'<td class="text-center" style="border:1px solid #FFB74D;">';
			if (data_row.checkboxes[4] == 1) {
				
				exer += '<button class="button button5_' + m
						+ ' button-activity" id = "buttongreen5_' + m + j + '" onclick="changeColorGreen(\'buttongreen5_' + m
						+j+ '\', \'button5_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
				exer += '<button class="button button5_' + m
						+ ' button-activity" id = "buttonyellow5_' + m + j+ '" onclick="changeColorYellow(\'buttonyellow5_' + m
						+j+ '\', \'button5_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
			}
			exer +=
			
			'</td>' +

			'<td class="text-center" style="border:1px solid #FFB74D;">';
			if (data_row.checkboxes[5] == 1) {
				
				exer += '<button class="button button6_' + m
						+ ' button-activity" id = "buttongreen6_' + m + j+ '" onclick="changeColorGreen(\'buttongreen6_' + m
						+j+ '\', \'button6_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
				exer += '<button class="button button6_' + m
						+ ' button-activity" id = "buttonyellow6_' + m + j+ '" onclick="changeColorYellow(\'buttonyellow6_' + m
						+j+ '\', \'button6_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
			}
			exer +=
			
			'</td>' +

			'<td class="text-center" style="border:1px solid #FFB74D;">';
			if (data_row.checkboxes[6] == 1) {
				
				exer += '<button class="button button7_' + m
						+ ' button-activity" id = "buttongreen7_' + m + j+ '" onclick="changeColorGreen(\'buttongreen7_' + m
						+j+ '\', \'button7_' + m + '\', \'' + activity_name +'\')">' + "Did" + '</button>';
				exer += '<button class="button button7_' + m
						+ ' button-activity" id = "buttonyellow7_' + m + j+ '" onclick="changeColorYellow(\'buttonyellow7_' + m
						+j+ '\', \'button7_' + m + '\', \'' + activity_name +'\')">' + "Tried" + '</button>';
			}
			exer +=
			
			'</td></tr>';
			
			
			}
			exer += '</tbody>';
		}

			

		exer += '</table>';
		exer+=

		'<p>'
		+"This weekly monitor is available in your workbook. "
		+ "Check your planner every morning regarding activities you have planned to do and fill the day's column in the evening. Use this for the coming week.You can generate a new monitor template for a new week in the workbook, by clicking on the 'Add' button."
		+ '</p>'
		+ '<br>'

		'</div>';


		exer += '<div class="form-group">' +
		//'<button id="skip3" class="  btn btn-primary  pull-right hidden" data-toggle="tooltip" data-placement="bottom" title="Please answer all the questions" onclick="skip2()">Skip</button>'+
		'<button type="button" id="submit3" onclick="submit3(' + j + ','
		+ activeSectionId + ',' + activeSubSectionId
		+ ')" class="btn btn-success pull-right " disabled=true>Submit</button>'
		+
		'<button type="button" id="download3" onclick="download3('+j+')" class="btn btn-warning pull-right hidden ">Download</button>';
		'</div>';

		//end of  third table (AFTER 1 WEEK TO ENTER DETAILS IN THE third TABLE)

		
				
			}
			else if(data_length == 3){
				
				//begin first table data details display
				
				exer += '<div id="tables1" class="form-group input-group">'
					+

					// '<h4 class="text-center">' + arr[i].tables[k].title + '</h4>' +
					'<table id="table" class="table table-hover table-bordered" style="border:1px solid #FFB74D;background: #FFE0B2;">'
					+ '<thead id="thead" class="text-center">'
					+

					'<tr>'
					+ '<th class="col-md-1" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">S. No.</th>'
					+ '<th class="col-md-4" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
					+ arr[i-1].tables[k].thead[0]
					+ '</th>'
					+ '<th class="col-md-3" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
					+ arr[i-1].tables[k].thead[1]
					+ '</th>'
					+ '<th class="col-md-2" rowspan="3" style="vertical-align: middle;border:1px solid #FFB74D;">'
					+ arr[i-1].tables[k].thead[2]
					+ '</th>'
					+ '<th class="col-md-2" rowspan="2" style="vertical-align: middle;border:1px solid #FFB74D;">'
					+ arr[i-1].tables[k].thead[3] + '</th>';
			'</tr>';

			'</thead>';

			for (var j2 = 0; j2 < paresed_data1_table1.length; j2++) {
				
				
				exer += '<tbody id="tbody1">' +

				'<tr>' +

				'<td class="text-center" style="border:1px solid #FFB74D;">'
						+ '<span class="input-group-addon">'
						+ (j2+1)
						+ '.</span>'
						+ '</td>'
						+

						'<td style="border:1px solid #FFB74D;" id ="tabletd1">'
						+ '<input disabled id="f'
						+ j2
						+ '" autocomplete="off" type="text" class="form-control"'
						+ 'name="input" value ="'+paresed_data1_table1[j2].inputVal+'" >'
						+ '</td>'
						+

						// dropdown1
						'<td class="text-center" style="border:1px solid #FFB74D;">'
						+

						'<select disabled id="scale1'
						+ j2
						+ '" class="form-control text-center" onchange="setDropDown('
						+ 
						+ ')" >'
						+ '<option value="-1">Select</option>'
						+ '<option value="1"';
						if (paresed_data1_table1[j2].natureVal == "Pleasurable") {
							exer += ' selected'
						}
						exer += '>Pleasurable</option>';

						exer += '<option value="2"';
						
						if (paresed_data1_table1[j2].natureVal == "Meaningful") {
							exer += ' selected'
						}
						exer += '>Meaningful</option>';

						exer += '<option value="3"';
						if (paresed_data1_table1[j2].natureVal == "Mastery-oriented") {
							exer += ' selected'
						}
						exer += '>Mastery-oriented</option>'
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
						if (paresed_data1_table1[j2].freVal == "1") {
							exer += ' selected'
						}
						exer += '>A few times a week</option>';

						exer += '<option value="2"';
						
						if (paresed_data1_table1[j2].freVal == "2") {
							exer += ' selected'
						}
						exer += '>Once a week</option>';

						exer += '<option value="3"';
						if (paresed_data1_table1[j2].freVal == "3") {
							exer += ' selected'
						}
						exer += '>Less than once a week</option>'
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
						if (paresed_data1_table1[j2].easyVal == "1") {
							exer += ' selected'
						}
						exer += '>Easy</option>';

						exer += '<option value="2"';
						
						if (paresed_data1_table1[j2].easyVal == "2") {
							exer += ' selected'
						}
						exer += '>Slightly difficult</option>';

						exer += '<option value="3"';
						if (paresed_data1_table1[j2].easyVal == "3") {
							exer += ' selected'
						}
						exer += '>Somewhat difficult</option>'
							exer += '<option value="4"';
						if (paresed_data1_table1[j2].easyVal == "4") {
							exer += ' selected'
						}
						exer += '>Very difficult</option>'
						+ '</select>'
						+

				'</td>';

				'</tr>';

				'</tbody>';

			}

			exer += '</table>';
			exer+='<div class="form-group">'+

			'<button type="button" id="download1" onclick="download1('+j+')" class="btn btn-warning pull-right ">Download</button>';
			exer+='</div>';

			

			exer += '<div class="clearfix"></div><hr>';

			exer += '</div>';
			//end of  first table data details display
			
				
			//begin second table data details display
			exer += '<div class="form-group " id="tables2_dbvalues">'
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
				
				
				exer += '<tbody id="tbodj">' +'<tr>' + '<td style="border:1px solid #FFB74D;">'
				+ data_row.actName1 +  '</td>'+
				'<td style="border:1px solid #FFB74D;">'
				+ data_row.natureName1 +  '</td>'+
				



		       

		'<td class="text-center" style="border:1px solid #FFB74D;" id="check1">'
				+ '<input class="check" disabled type="checkbox" name="day'
				+ m
				+ '"  value="1" id="daj'
				+ m
				+ '" onclick="setWeeklyPlanner(this)"';

				if (data_row.checkboxes[0] == 1) {
					
					exer += ' checked';
				}
				exer += '>'
				+ '</td>'
				+

				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<input class="check" disabled type="checkbox" name="day'
				+ m
				+ '"  value="2" id="day2'
				+ m
				+ '"  onclick="setWeeklyPlanner(this)"';
				if (data_row.checkboxes[1] == 1) {
					exer += ' checked';
				}
				exer += '>'
				+ '</td>'
				+

				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<input class="check" disabled type="checkbox" name="day'
				+ m
				+ '"  value="3" id="day3'
				+ m
				+ '"  onclick="setWeeklyPlanner(this)"';
				if (data_row.checkboxes[2] == 1) {
					exer += ' checked';
				}
				exer += '>'
				+ '</td>'
				+

				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<input class="check" disabled type="checkbox" name="day'
				+ m
				+ '"  value="4" id="day4'
				+ m
				+ '"  onclick="setWeeklyPlanner(this)"';
				if (data_row.checkboxes[3] == 1) {
					exer += ' checked';
				}
				exer += '>'
				+ '</td>'
				+

				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<input class="check" disabled type="checkbox" name="day'
				+ m
				+ '"  value="5" id="day5'
				+ m
				+ '"  onclick="setWeeklyPlanner(this)"';
				if (data_row.checkboxes[4] == 1) {
					exer += ' checked';
				}
				exer += '>'
				+ '</td>'
				+

				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<input class="check" disabled type="checkbox" name="day'
				+ m
				+ '"  value="6" id="day6'
				+ m
				+ '"  onclick="setWeeklyPlanner(this)"';
				if (data_row.checkboxes[5] == 1) {
					exer += ' checked';
				}
				exer += '>'
				+ '</td>'
				+

				'<td class="text-center" style="border:1px solid #FFB74D;">'
				+ '<input class ="check" disabled type="checkbox" name="day'
				+ m
				+ '"  value="7" id="day7'
				+ m
				+ '" onclick="setWeeklyPlanner(this)"';
				if (data_row.checkboxes[6] == 1) {
					exer += ' checked';
				}
				exer += '>'
				+ '</td>';

				exer+='</tr>';

				exer+='</tbody>';
			}

		exer += '</table>';
		exer+='<div class="form-group">'+
		'<button type="button" id="download2" onclick="download2('+j+')" class="btn btn-warning pull-right">Download</button>';
		exer+='</div>';

		exer+='</div>';
		//end of second table data details display
		//begin third table data details display(AFTER 1 WEEK TO ENTER DETAILS IN THE third TABLE)
		exer += '<div class="form-group " id="tables3_dbvalues">'
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
			var act_name = parsed_data3_table3[n].actName2;
			var buttons = parsed_data3_table3[n].buttons;
			var checkboxes = parsed_data2_table2[n].checkboxes;
			exer +='<tbody id = "tbody3">' ;
			if(checkboxes.indexOf(1) != -1){
				new_array1 = parsed_data3_table3;
			 exer += '<tr>' ;

			exer += '<td style="border:1px solid #FFB74D;">'+ act_name +'</td>';

			exer += '<td class="text-center" style="border:1px solid #FFB74D;">';
			
			if (checkboxes[0] == 1) {	
				
				exer +='<button class="button button1_' + n
						+ ' button-activity " id = "buttongreen1_' + n
						+j+ '"';
				if (buttons[0][0] == 1) {
					exer += 'style="background-color:green;"';
				}
				exer +='>' + "Did" + '</button>'+
				 '<button class="button button1_' + n
						+ ' button-activity" id = "buttonyellow1_' + n
						+j+ '"';
						if (buttons[0][1] == 1) {
							exer += 'style="background-color:yellow;"';
						}
						exer +='>' + "Tried" + '</button>';	
			}
			exer += '</td>' +

			'<td class="text-center" style="border:1px solid #FFB74D;">';
			
			
			if (checkboxes[1] == 1) {	
			
				
				exer += '<button class="button button2_' + n
						+ ' button-activity" id = "buttongreen2_' + n
						+j+ '"';
						if (buttons[1][0] == 1) {
							exer += 'style="background-color:green;"';
						}
						exer +='>' + "Did" + '</button>'+
				 '<button class="button button2_' + n
						+ ' button-activity" id = "buttonyellow2_' + n
						+j+ '"';
						if (buttons[1][1] == 1) {
							exer += 'style="background-color:yellow;"';
						}
						exer +='>' + "Tried" + '</button>';
				}
			
			exer += '</td>' +

			'<td class="text-center" style="border:1px solid #FFB74D;">';
			
			if (checkboxes[2] == 1) {	
			
				
				exer += '<button class="button button3_' + n
						+ ' button-activity" id = "buttongreen3_' + n
						+j+ '"';
						if (buttons[2][0] == 1) {
							exer += 'style="background-color:green;"';
						}
						exer +='>' + "Did" + '</button>'+
				'<button class="button button3_' + n
						+ ' button-activity" id = "buttonyellow3_' + n
						+j+ '"';
						if (buttons[2][1] == 1) {
							exer += 'style="background-color:yellow;"';
						}
						exer +='>' + "Tried" + '</button>';

			}
			
			exer += '</td>' +

			'<td class="text-center" style="border:1px solid #FFB74D;">';
			
			if (checkboxes[3] == 1) {	

				
				exer += '<button class="button button4_' + n
						+ ' button-activity" id = "buttongreen4_' + n
						+j+ '"';
						if (buttons[3][0] == 1) {
							exer += 'style="background-color:green;"';
						}
						exer +='>' + "Did" + '</button>'+
				 '<button class="button button4_' + n
						+ ' button-activity" id = "buttonyellow4_' + n
						+j+ '"';
						if (buttons[3][1] == 1) {
							exer += 'style="background-color:yellow;"';
						}
						exer +='>' + "Tried" + '</button>';

			}
			
			exer += '</td>' +

			'<td class="text-center" style="border:1px solid #FFB74D;">';
			
			if (checkboxes[4] == 1) {	
				
			 exer += '<button class="button button5_' + n
						+ ' button-activity" id = "buttongreen5_' + n
						+j+ '"';
						if (buttons[4][0] == 1) {
							exer += 'style="background-color:green;"';
						}
						exer +='>' + "Did" + '</button>'+
				'<button class="button button5_' + n
						+j+ ' button-activity" id = "buttonyellow5_' + n
						+ '"';
						if (buttons[4][1] == 1) {
							exer += 'style="background-color:yellow;"';
						}
						exer +='>' + "Tried" + '</button>';

			}
			
			exer += '</td>' +

			'<td class="text-center" style="border:1px solid #FFB74D;">';
			if (checkboxes[5] == 1) {	
				
				exer +='<button class="button button6_' + n
						+ ' button-activity" id = "buttongreen6_' + n
						+j+ '"';
						if (buttons[5][0] == 1) {
							exer += 'style="background-color:green;"';
						}
						exer +='>' + "Did" + '</button>'+
				 '<button class="button button6_' + n
						+ ' button-activity" id = "buttonyellow6_' + n
						+j+ '"';
						if (buttons[5][1] == 1) {
							exer += 'style="background-color:yellow;"';
						}
						exer +='>' + "Tried" + '</button>';

			}
			
			
			exer += '</td>' +

			'<td class="text-center" style="border:1px solid #FFB74D;">';
			if (checkboxes[6] == 1) {	

				
				 exer += '<button class="button button7_' + n
						+ ' button-activity" id = "buttongreen7_' + n
						+j+ '"';
						if (buttons[6][0] == 1) {
							exer += 'style="background-color:green;"';
						}
						exer +='>' + "Did" + '</button>'+
				'<button class="button button7_' + n
						+ ' button-activity" id = "buttonyellow7_' + n
						+j+ '"';
						if (buttons[6][1] == 1) {
							exer += 'style="background-color:yellow;"';
						}
						exer +='>' + "Tried" + '</button>';
			}
			
			exer +='</td>';

			exer+='</tr>';
			}

			exer+='</tbody>';
		}
		exer+='</table>';
		exer+='<div class="form-group">'+
		'<button type="button" id="download3" onclick="download3('+j+')" class="btn btn-warning pull-right">Download</button>';
		exer+='</div>';
		exer+='</div>';
		
		
				
			}
			
			
			
			
				
		}//end of previous version data display
		
		
		
		//console.log("checjing this 3nd");
		
		
				
		//code of end 	
		
		//exer +='<button type="button" id="download' + l + '" onclick="download3_4('+sid+','+ssid+','+version+')" class="btn btn-warning">Download</button>' ;
		divTab += exer + '</div>';	
		
		
	}//end of iteraton
	
	
	
	
	$('#tabs-'+sid+'-'+ssid).html(tabs);
	$('#ss-'+sid+'-'+ssid).html(divTab);
	
	
	
	
	
});//end of GET METHOD



}//end of Practice11workbook function


//function to submit after entering details in the first table
function submit_add(t) {
var q =t;
	f = false;
	
	for (k = 1; k <= max; k++) {
		if (!($('#f' + k+q).val())) {
			f = true;
			
		} else if (($('#scale1' + k+q).val() === "-1")) {
			f = true;
			
		} else if (($('#scale2' + k+q).val() === "-1")) {
			
			f = true;
			
			
		} else if (($('#scale3' + k+q).val() === "-1")) {
			
			
			f = true;
			
		}
	}
	var arr = [];
    
	//begin new code storing the first table entered values in array arr
	for (k = 1; k <= max; k++) {

		var obj = {};
		
		// dropdown 1 values
		
		if($('#scale1' + k + q).find('option:selected').text()=="select"){
			obj.natureVal = "";
			
		}else{
			obj.natureVal = $('#scale1' + k +q).find('option:selected').text();
		}
	
		
		

		// dropdown2 values
		obj.freVal = $('#scale2' + k+q).val();

		obj.easyVal = $('#scale3' + k+q).val();

		// serial number values
		obj.inputVal = $('#f' + k+q).val();
		

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
		if(!($('#f' + k +q).val())){
			  
			  count7 = 1;
			 
		  }
			
		if ($('#scale1' + k+q).val() === "1") {
			count1 = count1 + 1;
			
		}else if ($('#scale1' + k+q).val() === "2") {
			count2 = count2 + 1;
			
		} else if ($('#scale1' + k+q).val() === "3") {
			count3 = count3 + 1;
			
		}else if($('#scale1' + k+q).val() === "-1"){
			
			
			count4 = 1;
		} 
			
	  if($('#scale2' + k+q).val() === "-1"){
			
			
			count5 = 1;
		}
	  
	 if($('#scale3' + k+q).val() === "-1"){
			
			
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
			
			alert("please select atleast one activity under the  categories 'Pleasurable' and 'Mastery-oriented'.");
		} else if (count2 == 0 && count3 == 0) {
			final_sorted_arr = [];
			
			array1table1 = [];
			count4=0;
			
			alert("please select atleast one activity under the  categories 'Meaningful' and 'Mastery-oriented'.");
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
			alert("please select an option under category...");	
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
		var tbody='';
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
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="1" id="day1'
					+ k
					+ '" onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="2" id="day2'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="3" id="day3'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="4" id="day4'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="5" id="day5'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="6" id="day6'
					+ k
					+ '"  onclick="setWeeklyPlanner(this)">'
					+ '</td>'
					+

					'<td class="text-center" style="border:1px solid #FFB74D;">'
					+ '<input class="checkbox_table2" type="checkbox" name="day'
					+ k
					+ '"  value="7" id="day7'
					+ k
					+ '" onclick="setWeeklyPlanner(this)">' + '</td>';

			'</tr>';

		}

		$('#download1').removeClass("hidden");
		$('#addInputs1').addClass('hidden');
		$('#submit').addClass('hidden');
		$('#tables2').removeClass('hidden');
		$('#table2').removeClass('hidden');
		$('#tbody2_add').append(tbody);
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
		version_id : j-1,
		response : unsorted_arr1,
		category_id : '2a'
	};

	var myJSON = JSON.stringify(Indata);
	
	$.ajax({
		type : "POST",
		url : serverURL + "users/" + userId + "/sections/" + 3
				+ "/subsections/" + 2 + "/" + "3rdSecdata/"+(j-1),
		data : myJSON,
		contentType : "application/json",
		dataType : "json",
		success : function(data) {
			sessionStorage.setItem("currentSectionDisplay", "3.2");
			location.reload();

		},
		error : function() {

		}
	});

}//end of submit_add function

//This 2D array stores the information about whether a day is checked or not in the second table?
var table2arr = [];
var uniqueNames = [];
var activity_name = [];
var table2arr_newarray = [];


function submit2(k,e) {
	var j = e;
	
	if ($('.checkbox_table2:checkbox:checked').length < 1) {
		alert("Please select atleast one option");
		return false;
	}else{
	if(final_sorted_arr.length!=0){
		
	// jquery to store the first column content in array for the checked check boxes
	$('#tbody2_add tr td :checkbox:checked').map(function() {
		//alert("pppp");
		console.log(final_sorted_arr_data);
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
	}//end of checkbox selection checking
	//end of jquery
	//console.log(table2arr[activity_name]);
	
	
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
			+ ' button-activity " id = "buttongreen1_' + k + j+ '">' + "Did" + '</button>';
	tbody += '<button class="button button1_' + k
			+ ' button-activity" id = "buttonyellow1_' + k + j+ '">' + "Tried" + '</button>';
			
		}
		tbody +=
		
		'</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][1] == 1) {
			
			tbody += '<button class="button button2_' + k
					+ ' button-activity" id = "buttongreen2_' + k + j+ '">' + "Did" + '</button>';
			tbody += '<button class="button button2_' + k
					+ ' button-activity" id = "buttonyellow2_' + k + j+ '">' + "Tried" + '</button>';
		}
		tbody +=
		
		'</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][2] == 1) {
			
			tbody += '<button class="button button3_' + k
					+ ' button-activity" id = "buttongreen3_' + k + j+ '">' + "Did" + '</button>';
			tbody += '<button class="button button3_' + k
					+ ' button-activity" id = "buttonyellow3_' + k + j+ '">' + "Tried" + '</button>';
		}
		tbody +=
		
		'</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][3] == 1) {
			
			tbody += '<button class="button button4_' + k
					+ ' button-activity" id = "buttongreen4_' + k + j+ '">' + "Did" + '</button>';
			tbody += '<button class="button button4_' + k
					+ ' button-activity" id = "buttonyellow4_' + k + j + '">' + "Tried" + '</button>';
		}
		tbody +=
		
		'</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][4] == 1) {
			
			tbody += '<button class="button button5_' + k
					+ ' button-activity" id = "buttongreen5_' + k + j+ '">' + "Did" + '</button>';
			tbody += '<button class="button button5_' + k
					+ ' button-activity" id = "buttonyellow5_' + k + j+ '">' + "Tried" + '</button>';
		}
		tbody +=
		
		'</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][5] == 1) {
			
			tbody += '<button class="button button6_' + k
					+ ' button-activity" id = "buttongreen6_' + k + j+ '">' + "Did" + '</button>';
			tbody += '<button class="button button6_' + k
					+ ' button-activity" id = "buttonyellow6_' + k + j+ '">' + "Tried" + '</button>';
		}
		tbody +=
		
		'</td>' +

		'<td class="text-center" style="border:1px solid #FFB74D;">';
		if (table2arr[activity_name][6] == 1) {
			
			tbody += '<button class="button button7_' + k
					+ ' button-activity" id = "buttongreen7_' + k + j+ '">' + "Did" + '</button>';
			tbody += '<button class="button button7_' + k
					+ ' button-activity" id = "buttonyellow7_' + k + j+ '">' + "Tried" + '</button>';
		}
		tbody +=
		
		'</td>';

		tbody +='</tr>';

	}
	//end of code  to display columns and values in third table

	
	$('#submit2').addClass('hidden');
	$('#submit2_data').addClass('hidden');
	$('#tables3').removeClass('hidden');
	$('#table3').removeClass('hidden');
	$('#tbody3_add').append(tbody);
	$('#next').addClass('hidden');
	$('#skip2').addClass("hidden");
	$('#skip3').removeClass("hidden");
	$('#skip2_data').addClass("hidden");
	$('#download2').removeClass("hidden");
	
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
		version_id : ver_id,
		response : JSON.stringify(table2arr1),
		category_id : '2b'
	};

	
	
	var myJSON = JSON.stringify(Indata);

	$.ajax({
		type : "POST",
		url : serverURL + "users/" + userId + "/sections/" + 3
				+ "/subsections/" + 2 + "/" + "3rdSecdata/"+ver_id,
		data : myJSON,
		contentType : "application/json",
		dataType : "json",
		success : function(data) {
			sessionStorage.setItem("currentSectionDisplay", "3.2");
			location.reload();

		},
		error : function() {

		}
	});
	
	//end of rest call

}
// end of function submit2


//begin new code for  function submit3
function submit3(e,sid, ssid) {
	var j = e;
	
	$('#skip3').addClass("hidden");
	$('#submit3').addClass("hidden");
	$('#next').removeClass("hidden");
	$('#download').removeClass("hidden");
	
	//begin new code for rest call to send data to db
	
	var section_id;
	var sub_section_id;
	var version_id;
	var response;
	var category_id;
	var table3arr1 = JSON.stringify(table3arr);
console.log(table3arr1);
	var Indata = {
		userId : userId,
		section_id : 3,
		sub_section_id : 2,
		version_id : j+1,
		response : table3arr1,
		category_id : '2c'
	};

	var myJSON = JSON.stringify(Indata);

	
	$.ajax({
		type : "POST",
		url : serverURL + "users/" + userId + "/sections/" + sid
				+ "/subsections/" + ssid + "/" + "3rdSecdata/"+(j+1),
		data : myJSON,
		contentType : "application/json",
		dataType : "json",
		success : function(data) {
			sessionStorage.setItem("currentSectionDisplay", "3.2");
			location.reload();

		},
		error : function() {

		}
	});
	//end of new code for rest call to send data to db

}
//end of new code for  function submit3



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
	var i = j2 = v = 0;
	for (i = 1; i < no_elements; i++) {
		v = arr[i];
		j2 = i;
		while (j2 > 0 && compare(arr[j2 - 1], v)) {
			arr[j2] = arr[j2 - 1];
			j2--;
		}
		;
		arr[j2] = v;

	}
	return arr
}
//end of new code for sorting the array of objects of first table data based on 3rd and 4th columns values


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
		var day_index = eleid.substr(eleid.length - 4)[0];
		
		// Put value 1 for green
		
		table3arr[act_index].buttons[day_index -1][0] = 1;
		
		// Put value 0 for yellow
		table3arr[act_index].buttons[day_index -1][1] = 0;
	}
}


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
		var day_index = eleid.substr(eleid.length - 4)[0];
		// Put value 0 for green
		table3arr[act_index].buttons[day_index -1][0] = 0;
		// Put value 1 for yellow
		table3arr[act_index].buttons[day_index -1][1] = 1;
	}
}
//end of  new code for function to change the background color of button in third table to yellow

var new_array1 = [];

function download1(p){
	var j = p;
	var jsonObj = $.parseJSON('[' + download_new_array[j][0]['response'] + ']');
	var len = jsonObj[0].length;
	
	
    var tab_text = '<table id="table245">';
    var textRange; 
    var j = 0;
    var tab = document.getElementById('table'); // id of table
    var lines = tab.rows.length;
    var frequency="";
	var easy_val="";

    // the first headline of the table
    if (lines > 0) {
        tab_text = tab_text + '<tr>' + 
        '<th>'+"Sl.No"+'</th>'+
        '<th>'+"Activity"+'</th>'+
        '<th>'+"Nature"+'</th>'+
        '<th>'+"How frequently I am currently doing this"+'</th>'+
        '<th>'+"How easy it is to add it to my day/increase its frequency"+'</th>'+
        '</tr>';
    
    
    for(var k=0;k<len;k++){
    	
    	if(jsonObj[0][k].freVal == 1){
 			
			 frequency="A few times a week";
		}else if(jsonObj[0][k].freVal == 2){
			
			 frequency="Once a week";
		}else if(jsonObj[0][k].freVal == 3){
			
			
			 frequency="Less than once  a week";
		}
		
		if(jsonObj[0][k].easyVal == 1){
			
			easy_val="Easy";
		}else if(table1_data[j].easyVal == 2){
			
			easy_val="Slightly difficult";
		}else if(jsonObj[0][k].easyVal == 3){
			
			
			easy_val="Somewhat difficult";
		}else if(jsonObj[0][k].easyVal == 4){
			
			
			easy_val="Vary difficult";
		}
	    	
	        tab_text = tab_text+ '<tr><td>'+(k+1)+'</td>'+
	        '<td>'+jsonObj[0][k].inputVal+'</td>'+
	        '<td>'+jsonObj[0][k].natureVal+'</td>'+
	        '<td>'+frequency+'</td>'+
	        '<td>'+easy_val+'</td>';
	        '</tr>';
    }
    }
	        			
	        				  
	    	
   // }
  


    tab_text = tab_text + "</table>";
    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params
    downlodExcel(tab_text);

	

}

var download2_data = table2arr_newarray;


function download2(p){
	var j = p;
	
	var jsonObj = $.parseJSON('[' + download_new_array[j][1]['response'] + ']');
	
	
	var len = jsonObj[0].length;
	
    var tab_text = '<table id="table245">';
    var textRange; 
    var j = 0;
    var tab = document.getElementById('table2'); // id of table
    var lines = tab.rows.length;

    // the first headline of the table
    if (lines > 0) {
       // tab_text = tab_text + '<tr bgcolor="#DFDFDF">' + tab.rows[0].innerHTML + '</tr>';
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
        
        
        
        for(var k=0;k<len;k++){
	    	
	       
        	if(jsonObj[0][k].checkboxes[k] == 1){
    			
        		jsonObj[0][k].checkboxes[k]="Selected";
    		}
	        
	        tab_text = tab_text+ '<tr><td>'+jsonObj[0][k].actName1+'</td>'+
	        '<td>'+jsonObj[0][k].natureName1+'</td>'+
	        '<td>'+jsonObj[0][k].checkboxes[0]+'</td>'+
	        '<td>'+jsonObj[0][k].checkboxes[1]+'</td>'+
	        '<td>'+jsonObj[0][k].checkboxes[2]+'</td>'+
	        '<td>'+jsonObj[0][k].checkboxes[3]+'</td>'+
	        '<td>'+jsonObj[0][k].checkboxes[4]+'</td>'+
	        '<td>'+jsonObj[0][k].checkboxes[5]+'</td>'+
	        '<td>'+jsonObj[0][k].checkboxes[6]+'</td>';
	        '</tr>';
    }
       
       
        
    }

   		     
    
    tab_text = tab_text + "</table>";
    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params
    downlodExcel(tab_text);

	

}

function download3(p){
	var j = p;
	
	var jsonObj = $.parseJSON('[' + download_new_array[j][2]['response'] + ']');
	
	var len = jsonObj[0].length;
	
	
	
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
         
         for(var k=0;k<len;k++){
        	 
        	 tab_text = tab_text+ '<tr><td>'+jsonObj[0][k].actName2+'</td>';
        	 for(var j1 = 0 ; j1 <7; j1++){
     	    	 
     	    	 var str1 = jsonObj[0][k].buttons[j1].toString();
     	    	var arrSelect = str1.split(",");
     	    	
     	    	if((arrSelect[0] == 1) && (arrSelect[1] == 0)){
     	    		
     	    		jsonObj[0][k].buttons[j1]="Did";
     	    		
     	    	}else if((arrSelect[0] == 0) && (arrSelect[1] == 1)){
     	    		
     	    		jsonObj[0][k].buttons[j1]="Tried";
     	    		
     	    	} else {
     	    		
     	    		jsonObj[0][k].buttons[j1]="Nil";
     	    	}
     	    	
     	    	 
     	    	 
     	    	 tab_text =  tab_text+'<td>'+jsonObj[0][k].buttons[j1]+'</td>';
     	        
     	     }
  	        
        	 	
        	 
         }
        
       
     }

   

    tab_text = tab_text + "</table>";
    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params
    downlodExcel(tab_text);

	

}
