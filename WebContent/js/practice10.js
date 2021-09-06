/**
 * 
 */


var count = 1;
var max = 3;
var form = '';
var table4RowCount = 0;
var rowCount = 0;
var practice10version = 0;
var num1,num2,num3;
var sno=0;
function practice10(arr, ans) {
		
	
	if(sectionId != activeSectionId) {
        $('#next').removeClass("hidden");
    }
}

function practice10Workbook(arr, url, sid, ssid) {

	$.get( serverURL + "users/" + userId + "/sections/3/subsections/2/potentialList", function(data1){

		$.get( serverURL + "users/" + userId + "/sections/3/subsections/2/practice3/workbook", function(ppoint){
			
		var pp = data1['practicePoints'];
		var pp1 = ppoint['practicePoints'];
		var tabs = '';
		var divTab = '';
		var exer = '';
		var tbody = '';
		var sflag=true;
		
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
								'Edit/Update</a>' +
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
	    	
			len = pp.length;

			if(j != len) {
				tb = pp[j]['activities'];
				planner = pp1[j]['planner'];
				practice10version = pp[j]['version'];
			}
			
			
			tbody4 = '';
			tbody5 = '';
			c = 1;
			string = '';
			for(l=0;l<tb.length;l++)
				{
				if(tb[l]['type'] == "P") {
					num1=l;
					break;
				} 
				}
			for(l=0;l<tb.length;l++)
			{
			if(tb[l]['type'] == "M") {
				num2=l;
				break;
			} 
			}
			
			for(l=0;l<tb.length;l++)
			{
			if(tb[l]['type'] == "MO") {
				num3=l;
				break;
			} 
			}
			
			
				sno=0;
				l=num1;
				tbody4 += 	'<tr>';	
				tbody5 += 	'<tr>';
				if(tb[l]['type'] == "P") {
				
					cs = "Pleasurable";
				} 
				else if(tb[l]['type'] == "M") {
				
					cs = "Meaningful";
				}
				else if(tb[l]['type'] == "MO") { 
				
					cs = "Mastery-Oriented";
				}
				sno++;
				tbody4 += 		'<td class="col-md-1 text-center">' + (sno) +  '</td>' +
				'<td class="col-md-6" style="padding-left: 20px;">' + tb[l]['activity'] + '</td>' +
				'<td class="text-center">' + tb[l]['type'] + '</td><td>';

var flag1 = false;
var flag2=true;
for (a = 0; a < planner.length; a++) {
	if(planner[a]['activity'] == tb[l]['activity']) {
		flag1 = true;
		//alert("HElLo");
		if(j == len) {
			
			if (flag2==true)
				{
				flag2=false;
			
			tbody4 +=		'<div class="day'+l+'">'+
							
		  					
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Monday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 1,this)">'+'Monday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Tuesday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 2,this)">'+'Tuesday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Wednesday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 3,this)">'+'Wednesday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Thursday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 4,this)">'+'Thursday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Friday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 5,this)">'+'Friday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Saturday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 6,this)">'+'Saturday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Sunday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 7,this)">'+'Sunday</label></div>'+
							
						
							'</div>';
			 			
				}
	  		       
		}	//	if j == len
		else {
			tbody4 +=	
							'<div class="checkbox">' + 
								'<label>' + 
									'<input type="checkbox" checked disabled>' +
									planner[a]['day'] +
								'</label>' +
								
		  					'</div>';
			setWeeklyPlannerWorkbook(planner[a]['activity'], planner[a]['day'], planner[a]['type'], j, 0);
			if(j== len-1)
				sflag=false;
		}	//	else
	}	//	if planner act
}	//	for a
if(flag1 == false) {
	
	if(j == len-1 && sflag==true) {
		
		if (flag2==true)
			{
			flag2=false;
		 tbody4 +=	'<div class="day'+l+'">'+
						
	  					
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Monday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 1,this)">'+'Monday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Tuesday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 2,this)">'+'Tuesday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Wednesday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 3,this)">'+'Wednesday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Thursday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 4,this)">'+'Thursday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Friday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 5,this)">'+'Friday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Saturday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 6,this)">'+'Saturday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Sunday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 7,this)">'+'Sunday</label></div>'+
			
						
						'</div>' ;
						}
  		       
	}	//	if j == len
	else {
		tbody4 +=	
						'<div class="checkbox">' + 
							'<label>' + 
								'<input type="checkbox" disabled>' +
								'None' +
							'</label>' + 
	  					'</div>' ;
					
						
					
	}	//	else
}
tbody4 += '</td></tr>';
				
				
			
				l=num2;
				tbody4 += 	'<tr>';	
				tbody5 += 	'<tr>';
				if(tb[l]['type'] == "P") {
					
					cs = "Pleasurable";
				} 
				else if(tb[l]['type'] == "M") {
					
					cs = "Meaningful";
				}
				else if(tb[l]['type'] == "MO") { 
					
					cs = "Mastery-Oriented";
				}
				sno++;
				tbody4 += 		'<td class="col-md-1 text-center">' + (sno) +  '</td>' +
				'<td class="col-md-6" style="padding-left: 20px;">' + tb[l]['activity'] + '</td>' +
				'<td class="text-center">' + tb[l]['type'] + '</td><td>';

var flag1 = false;
var flag2=true;
for (a = 0; a < planner.length; a++) {
	if(planner[a]['activity'] == tb[l]['activity']) {
		flag1 = true;
		
		if(j == len) {
			
			if (flag2==true)
				{
				flag2=false;
			
			tbody4 +=		'<div class="day'+l+'">'+
							
							
		  					
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Monday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 1,this)">'+'Monday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Tuesday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 2,this)">'+'Tuesday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Wednesday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 3,this)">'+'Wednesday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Thursday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 4,this)">'+'Thursday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Friday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 5,this)">'+'Friday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Saturday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 6,this)">'+'Saturday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Sunday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 7,this)">'+'Sunday</label></div>'+
							
						
							'</div>';
			 			
				}
	  		       
		}	//	if j == len
		else {
			tbody4 +=	
							'<div class="checkbox">' + 
								'<label>' + 
									'<input type="checkbox" checked disabled>' +
									planner[a]['day'] +
								'</label>' +
								
		  					'</div>';
			setWeeklyPlannerWorkbook(planner[a]['activity'], planner[a]['day'], planner[a]['type'], j, 0);
			if(j== len-1)
				sflag=false;
		}	//	else
	}	//	if planner act
}	//	for a
if(flag1 == false) {
	
	if(j == len-1 && sflag==true) {
		
		if (flag2==true)
			{
			flag2=false;
		 tbody4 +=	'<div class="day'+l+'">'+
						
	  					
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Monday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 1,this)">'+'Monday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Tuesday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 2,this)">'+'Tuesday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Wednesday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 3,this)">'+'Wednesday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Thursday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 4,this)">'+'Thursday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Friday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 5,this)">'+'Friday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Saturday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 6,this)">'+'Saturday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Sunday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 7,this)">'+'Sunday</label></div>'+
			
						
						'</div>' ;
						}
  		       
	}	//	if j == len
	else {
		tbody4 +=	
						'<div class="checkbox">' + 
							'<label>' + 
								'<input type="checkbox" disabled>' +
								'None' +
							'</label>' + 
	  					'</div>' ;
					
						
					
	}	//	else
}
tbody4 += '</td></tr>';
			
			
			
				l=num3;
				tbody4 += 	'<tr>';	
				tbody5 += 	'<tr>';
				if(tb[l]['type'] == "P") {
					cs = "Pleasurable";
					
				} 
				else if(tb[l]['type'] == "M") {
					cs = "Meaningful";
					
				}
				else if(tb[l]['type'] == "MO") { 
					cs = "Mastery-Oriented";
					
				}
				sno++;
				tbody4 += 		'<td class="col-md-1 text-center">' + (sno) +  '</td>' +
				'<td class="col-md-6" style="padding-left: 20px;">' + tb[l]['activity'] + '</td>' +
				'<td class="text-center">' + tb[l]['type'] + '</td><td>';

var flag1 = false;
var flag2=true;
for (a = 0; a < planner.length; a++) {
	if(planner[a]['activity'] == tb[l]['activity']) {
		flag1 = true;
		
		if(j == len) {
			
			if (flag2==true)
				{
				flag2=false;
			
			tbody4 +=		'<div class="day'+l+'">'+
							
							
		  					
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Monday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 1,this)">'+'Monday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Tuesday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 2,this)">'+'Tuesday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Wednesday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 3,this)">'+'Wednesday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Thursday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 4,this)">'+'Thursday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Friday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 5,this)">'+'Friday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Saturday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 6,this)">'+'Saturday</label></div>'+
							'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Sunday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 7,this)">'+'Sunday</label></div>'+
							
						
							'</div>';
			 			
				}
	  		       
		}	//	if j == len
		else {
			tbody4 +=	
							'<div class="checkbox">' + 
								'<label>' + 
									'<input type="checkbox" checked disabled>' +
									planner[a]['day'] +
								'</label>' +
								
		  					'</div>';
			setWeeklyPlannerWorkbook(planner[a]['activity'], planner[a]['day'], planner[a]['type'], j, 0);
			if(j== len-1)
				sflag=false;
		}	//	else
	}	//	if planner act
}	//	for a
if(flag1 == false) {
	
	if(j == len-1 && sflag==true) {
		
		if (flag2==true)
			{
			flag2=false;
		 tbody4 +=	'<div class="day'+l+'">'+
						
	  					
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Monday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 1,this)">'+'Monday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Tuesday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 2,this)">'+'Tuesday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Wednesday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 3,this)">'+'Wednesday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Thursday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 4,this)">'+'Thursday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Friday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 5,this)">'+'Friday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Saturday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 6,this)">'+'Saturday</label></div>'+
		 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Sunday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 7,this)">'+'Sunday</label></div>'+
			
						
						'</div>' ;
						}
  		       
	}	//	if j == len
	else {
		tbody4 +=	
						'<div class="checkbox">' + 
							'<label>' + 
								'<input type="checkbox" disabled>' +
								'None' +
							'</label>' + 
	  					'</div>' ;
					
						
					
	}	//	else
}
tbody4 += '</td></tr>';
			for (l = 0; l < tb.length; l++) {
				if(l!=num1 && l!=num2 && l!=num3)
				{
				tbody4 += 	'<tr>';	
				tbody5 += 	'<tr>';
				
				if(tb[l]['type'] == "P") 
					cs = "Pleasurable";
				else if(tb[l]['type'] == "M") 
					cs = "Meaningful";
				else if(tb[l]['type'] == "MO") 
					cs = "Mastery-Oriented";
				sno++;
				tbody4 += 		'<td class="col-md-1 text-center">' + (sno) +  '</td>' +
								'<td class="col-md-6" style="padding-left: 20px;">' + tb[l]['activity'] + '</td>' +
								'<td class="text-center">' + tb[l]['type'] + '</td><td>';
				
				var flag1 = false;
				var flag2=true;
				for (a = 0; a < planner.length; a++) {
					if(planner[a]['activity'] == tb[l]['activity']) {
						flag1 = true;
						
						if(j == len) {
							
							if (flag2==true)
								{
								flag2=false;
							
							tbody4 +=		'<div class="day'+l+'">'+
											
						  					
											'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Monday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 1,this)">'+'Monday</label></div>'+
											'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Tuesday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 2,this)">'+'Tuesday</label></div>'+
											'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Wednesday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 3,this)">'+'Wednesday</label></div>'+
											'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Thursday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 4,this)">'+'Thursday</label></div>'+
											'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Friday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 5,this)">'+'Friday</label></div>'+
											'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Saturday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 6,this)">'+'Saturday</label></div>'+
											'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Sunday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 7,this)">'+'Sunday</label></div>'+
											
										
											'</div>';
							 			
								}
					  		       
						}	//	if j == len
						else {
							tbody4 +=	
											'<div class="checkbox">' + 
												'<label>' + 
													'<input type="checkbox" checked disabled>' +
													planner[a]['day'] +
												'</label>' +
												
						  					'</div>';
							setWeeklyPlannerWorkbook(planner[a]['activity'], planner[a]['day'], planner[a]['type'], j, 0);
							if(j== len-1)
								sflag=false;
						}	//	else
					}	//	if planner act
				}	//	for a
				if(flag1 == false) {
					
					if(j == len-1 && sflag==true) {
						
						if (flag2==true)
							{
							flag2=false;
						 tbody4 +=	'<div class="day'+l+'">'+
										
					  					
						 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Monday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 1,this)">'+'Monday</label></div>'+
						 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Tuesday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 2,this)">'+'Tuesday</label></div>'+
						 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Wednesday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 3,this)">'+'Wednesday</label></div>'+
						 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Thursday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 4,this)">'+'Thursday</label></div>'+
						 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Friday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 5,this)">'+'Friday</label></div>'+
						 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Saturday" id="day'+l+'" onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 6,this)">'+'Saturday</label></div>'+
						 				'<div class="checkbox"><label><input type="checkbox" name="day'+l+'" value="Sunday" id="day'+l+'"  onclick="setWeeklyPlannerWorkbook2(`' + tb[l]['activity'] + '`, ' + l + ', `' + cs + '`, ' + j + ', 7,this)">'+'Sunday</label></div>'+
							
										
										'</div>' ;
										}
				  		       
					}	//	if j == len
					else {
						tbody4 +=	
										'<div class="checkbox">' + 
											'<label>' + 
												'<input type="checkbox" disabled>' +
												'None' +
											'</label>' + 
					  					'</div>' ;
									
										
									
					}	//	else
				}
				tbody4 += '</td></tr>';
				}//if(num
				}	//	for l
			
			x = j;			
			for (k = 0; k < arr.tables.length; k++) {
				if(j == len-1) {
					exer +=	'<div id="tables' + j + '" class="">' +
								'<h4 class="text-center">' + arr.tables[k].title + '</h4>' +
								'<table id="table' + x + '" class="table table-hover table-bordered">'; 
				}
				else {
					exer +=	'<div class="">' +
								'<h4 class="text-center">' + arr.tables[k].title + '</h4>' +
								'<table class="table table-hover table-bordered">'; 
			
				}
				
				if (arr.tables[k].type == 3) {
					
					exer += 	'<thead id="thead' + x + '" class="text-center">' + 
								'<tr><th class="col-md-1 text-center">S. No.</th>';
					
					for (l = 0; l < arr.tables[k].thead.length; l++) {
						if(l == 0)
							exer += 				'<th class="col-md-6">' + arr.tables[k].thead[l] + '</th>';
						else
							exer += 				'<th>' + arr.tables[k].thead[l] + '</th>';
					}				
					exer +=					'</tr>' +
										'</thead>';
					if(j == len-1) {
						exer += 		'<tbody id="tbody' + x + '">';
					}
					else {
						exer += 		'<tbody>';
					}
					
					exer += 	tbody4 + '</tbody>' + 
									'</table>' +
								'</div>' + 
								'<div class="clearfix"></div>';
				}
				else {
					
					exer += 	'<thead id="thead">' + 
    								'<tr>';
					
					for (l = 0; l < arr.tables[k].thead.length; l++) {
							exer += 				'<th width="13%" class="text-center">' + arr.tables[k].thead[l] + '</th>';
					}
			
					exer +=					'</tr>' +
										'</thead>';
					
						exer += 		'<tbody id="tbody5-'+j+'">';
						
					exer += 			tbody5 + '</tbody>' + 
									'</table>' +
								'</div>'; 
					if(j == len-1 && sflag==true) {
						exer += 	'<button type="button" id="weeklyPlanner" onclick="submitWeeklyPlannerWorkbook(' + x + ')" class="btn btn-success col-md-2 pull-right">Submit</button>';
					}
	
					exer += '<div class="clearfix"></div>';
				}
				x++;
			}	//	for k
			divTab += exer + '</div>';
	   	}
		
		$('#tabs-'+sid+'-'+ssid).html(tabs);
		
		$('#ss-'+sid+'-'+ssid).html(divTab);
		
		});
	});
}
var version = 0;

function check(j) {
	
	if ($('#check'+j).is(":checked")) {
		$('.day'+j).prop('disabled', false);
    }
    else {
    	for(i=0;i<7;i++)
    		{
    		$('#'+i).prop('disabled', 'disabled');
    		}
    	
    	
    }
}
/* Not Used */
function setWeeklyPlanner(v, j, c,val,node) {
	var tbody5 = '<tr class="text-center">';
	
	node.onclick = '';
    node.disabled = true;
	switch(val) {
		case 1 :	
					tbody5 += 	'';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="warning" style="border:1px solid black;">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info" style="border:1px solid black;">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger" style="border:1px solid black;">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case 2 :	tbody5 += 	'' +
								'<td></td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="warning" style="border:1px solid black;">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info" style="border:1px solid black;">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger" style="border:1px solid black;">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case 3 :	tbody5 += 	'' +
								'<td></td>' +
								'<td></td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="warning" style="border:1px solid black;">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info" style="border:1px solid black;">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger" style="border:1px solid black;">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case 4 :	tbody5 += 	'' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="warning">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case 5 :	tbody5 += 	'' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="warning">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>';
					break;
		case 6 :	tbody5 += 	'' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="warning">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger">' + v + '</td>'; 
				
					tbody5 +=	'<td></td>';
					break;
		case 7 :	tbody5 += 	'' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == 1)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="warning">' + v + '</td>'; 
					else if(c == 2)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="info">' + v + '</td>';
					else if(c == 3)
						tbody5 += 	'<td id="c' + rowCount + '-' + c + '" class="danger">' + v + '</td>'; 
					
					break;
	}
	//}
	tbody5 += '</tr>';
	$('#tbody5').append(tbody5);
}

var tbody5 = '';

function setWeeklyPlannerWorkbook(v, j, c, vers, f) {
	tbody5 += '<tr class="text-center">';
	
	
	if(f == 1)
		j = $('#day'+j).val();
	
	
	switch(j) {
		case "Monday" :	
						if(c == "Pleasurable")
							tbody5 += 	'<td class="warning">' + v + '</td>'; 
						else if(c == "Meaningful")
							tbody5 += 	'<td class="info">' + v + '</td>';
						else if(c == "Mastery-Oriented")
							tbody5 += 	'<td class="danger">' + v + '</td>'; 
								
						tbody5 +=	'<td></td>' +
									'<td></td>' +
									'<td></td>' +
									'<td></td>' +
									'<td></td>' +
									'<td></td>';
						break;
		case "Tuesday" :	tbody5 += 	'<td></td>';
					if(c == "Pleasurable")
						tbody5 += 	'<td class="warning">' + v + '</td>'; 
					else if(c == "Meaningful")
						tbody5 += 	'<td class="info">' + v + '</td>';
					else if(c == "Mastery-Oriented")
						tbody5 += 	'<td class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case "Wednesday" :	tbody5 += 	'<td></td>' +
								'<td></td>';
					if(c == "Pleasurable")
						tbody5 += 	'<td class="warning">' + v + '</td>'; 
					else if(c == "Meaningful")
						tbody5 += 	'<td class="info">' + v + '</td>';
					else if(c == "Mastery-Oriented")
						tbody5 += 	'<td class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case "Thursday" :	tbody5 += 	'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == "Pleasurable")
						tbody5 += 	'<td class="warning">' + v + '</td>'; 
					else if(c == "Meaningful")
						tbody5 += 	'<td class="info">' + v + '</td>';
					else if(c == "Mastery-Oriented")
						tbody5 += 	'<td class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case "Friday" :	tbody5 += 	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == "Pleasurable")
						tbody5 += 	'<td class="warning">' + v + '</td>'; 
					else if(c == "Meaningful")
						tbody5 += 	'<td class="info">' + v + '</td>';
					else if(c == "Mastery-Oriented")
						tbody5 += 	'<td class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>';
					break;
		case "Saturday" :	tbody5 += '<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == "Pleasurable")
						tbody5 += 	'<td class="warning">' + v + '</td>'; 
					else if(c == "Meaningful")
						tbody5 += 	'<td class="info">' + v + '</td>';
					else if(c == "Mastery-Oriented")
						tbody5 += 	'<td class="danger">' + v + '</td>'; 
				
					tbody5 +=	'<td></td>';
					break;
		case "Sunday" :	tbody5 += 	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == "Pleasurable")
						tbody5 += 	'<td class="warning">' + v + '</td>'; 
					else if(c == "Meaningful")
						tbody5 += 	'<td class="info">' + v + '</td>';
					else if(c == "Mastery-Oriented")
						tbody5 += 	'<td class="danger">' + v + '</td>'; 
					
					break;
	}
	tbody5 += '</tr>';
	
	$('#tbody5-'+vers).append(tbody5);
}

/*  Add Week */
function setWeeklyPlannerWorkbook2(v, j, c, vers, f,node) {
	tbody5 = '<tr class="text-center">';
	node.onclick = '';
    node.disabled = true;
	
	
	j1 = j;
	
	
	switch(f) {
		case 1 :	
						if(c == "Pleasurable")
							tbody5 += 	'<td class="warning">' + v + '</td>'; 
						else if(c == "Meaningful")
							tbody5 += 	'<td class="info">' + v + '</td>';
						else if(c == "Mastery-Oriented")
							tbody5 += 	'<td class="danger">' + v + '</td>'; 
								
						tbody5 +=	'<td></td>' +
									'<td></td>' +
									'<td></td>' +
									'<td></td>' +
									'<td></td>' +
									'<td></td>';
						break;
		case 2 :	tbody5 += 	'<td></td>';
					if(c == "Pleasurable")
						tbody5 += 	'<td class="warning">' + v + '</td>'; 
					else if(c == "Meaningful")
						tbody5 += 	'<td class="info">' + v + '</td>';
					else if(c == "Mastery-Oriented")
						tbody5 += 	'<td class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case 3 :	tbody5 += 	'<td></td>' +
								'<td></td>';
					if(c == "Pleasurable")
						tbody5 += 	'<td class="warning">' + v + '</td>'; 
					else if(c == "Meaningful")
						tbody5 += 	'<td class="info">' + v + '</td>';
					else if(c == "Mastery-Oriented")
						tbody5 += 	'<td class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case 4 :	tbody5 += 	'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == "Pleasurable")
						tbody5 += 	'<td class="warning">' + v + '</td>'; 
					else if(c == "Meaningful")
						tbody5 += 	'<td class="info">' + v + '</td>';
					else if(c == "Mastery-Oriented")
						tbody5 += 	'<td class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>' +
								'<td></td>';
					break;
		case 5 :	tbody5 += 	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == "Pleasurable")
						tbody5 += 	'<td class="warning">' + v + '</td>'; 
					else if(c == "Meaningful")
						tbody5 += 	'<td class="info">' + v + '</td>';
					else if(c == "Mastery-Oriented")
						tbody5 += 	'<td class="danger">' + v + '</td>'; 
							
					tbody5 +=	'<td></td>' +
								'<td></td>';
					break;
		case 6 :	tbody5 += '<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == "Pleasurable")
						tbody5 += 	'<td class="warning">' + v + '</td>'; 
					else if(c == "Meaningful")
						tbody5 += 	'<td class="info">' + v + '</td>';
					else if(c == "Mastery-Oriented")
						tbody5 += 	'<td class="danger">' + v + '</td>'; 
				
					tbody5 +=	'<td></td>';
					break;
		case 7 :	tbody5 += 	'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>' +
								'<td></td>';
					if(c == "Pleasurable")
						tbody5 += 	'<td class="warning">' + v + '</td>'; 
					else if(c == "Meaningful")
						tbody5 += 	'<td class="info">' + v + '</td>';
					else if(c == "Mastery-Oriented")
						tbody5 += 	'<td class="danger">' + v + '</td>'; 
					
					break;
	}
	tbody5 += '</tr>';
	//console.log(tbody5);
	$('#tbody5-'+vers).append(tbody5);
}

function submitWeeklyPlanner(x) {
	
	count = 1;
	formData = '';
	$('#table'+x+' td').each(function() {
		if(count == 8)
			count = 1;
		if( $(this).hasClass("warning") )
			formData += "arr=" + $(this).text()+"_p_"+count + "&";
		else if( $(this).hasClass("info") )
			formData += "arr=" + $(this).text()+"_m_"+count + "&";
		else if( $(this).hasClass("danger") )
			formData += "arr=" + $(this).text()+"_mo_"+count + "&";
		
		count++;
	});
	
	$.ajax({
		  type: "POST",
		  url: serverURL + "users/" + userId + "/sections/3/subsections/2/planner/" + practice10version,
		  data: formData,
		  success: function(data){
			  $('#weeklyPlanner').addClass("hidden");
			  $('#next').removeClass("hidden");
			
		  },
		  error: function() {
			  alert(serverURL + "users/" + userId + "/sections/" + sectionId + "/subsections/" + subsectionId + "/planner/" + practice10version);
			
		  } 
	}); 
	
	
}

function submitWeeklyPlannerWorkbook(x) {
	
	
	count = 1;
	formData = '';
	formData2='';
	$('#table'+x+' td').each(function() {
		if(count == 8)
			count = 1;
		if( $(this).hasClass("warning") ){
			formData += "arr=" + $(this).text()+"_p_"+count + "&";
			switch(count){
			case 1:formData2 +="data="+ $(this).text()+"_pleasurable_Monday_dummy&";
			break;
			case 2:formData2 +="data="+ $(this).text()+"_pleasurable_Tuesday_dummy&";
			break;
			case 3:formData2 +="data="+ $(this).text()+"_pleasurable_Wednesday_dummy&";
			break;
			case 4:formData2 +="data="+ $(this).text()+"_pleasurable_Thursday_dummy&";
			break;
			case 5:formData2 +="data="+ $(this).text()+"_pleasurable_Friday_dummy&";
			break;
			case 6:formData2 +="data="+ $(this).text()+"_pleasurable_Saturday_dummy&";
			break;
			case 7:formData2 +="data="+ $(this).text()+"_pleasurable_Sunday_dummy&";
			break;
			}
		}
		else if( $(this).hasClass("info") ){
			formData += "arr=" + $(this).text()+"_m_"+count + "&";
		switch(count){
		case 1:formData2 +="data="+ $(this).text()+"_Meaningful_Monday_dummy&";
		break;
		case 2:formData2 +="data="+ $(this).text()+"_Meaningful_Tuesday_dummy&";
		break;
		case 3:formData2 +="data="+ $(this).text()+"_Meaningful_Wednesday_dummy&";
		break;
		case 4:formData2 +="data="+ $(this).text()+"_Meaningful_Thursday_dummy&";
		break;
		case 5:formData2 +="data="+ $(this).text()+"_Meaningful_Friday_dummy&";
		break;
		case 6:formData2 +="data="+ $(this).text()+"_Meaningful_Saturday_dummy&";
		break;
		case 7:formData2 +="data="+ $(this).text()+"_Meaningful_Sunday_dummy&";
		break;
		}
	}
		else if( $(this).hasClass("danger") ){
			formData += "arr=" + $(this).text()+"_mo_"+count + "&";
		switch(count){
		case 1:formData2 +="data="+ $(this).text()+"_Mastery-Oriented_Monday_dummy&";
		break;
		case 2:formData2 +="data="+ $(this).text()+"_Mastery-Oriented_Tuesday_dummy&";
		break;
		case 3:formData2 +="data="+ $(this).text()+"_Mastery-Oriented_Wednesday_dummy&";
		break;
		case 4:formData2 +="data="+ $(this).text()+"_Mastery-Oriented_Thursday_dummy&";
		break;
		case 5:formData2 +="data="+ $(this).text()+"_Mastery-Oriented_Friday_dummy&";
		break;
		case 6:formData2 +="data="+ $(this).text()+"_Mastery-Oriented_Saturday_dummy&";
		break;
		case 7:formData2 +="data="+ $(this).text()+"_Mastery-Oriented_Sunday_dummy&";
		break;
		}
		}
		
		count++;
	});
	
	
	
	$.ajax({
		  type: "POST",
		  url: serverURL + "users/" + userId + "/sections/3/subsections/2/planner/" + practice10version,
		  data: formData,
		  success: function(data){
			  $('#weeklyPlanner').addClass("hidden");
			  $('#next').removeClass("hidden");
			  
		  },
		  error: function() {
			  alert(serverURL + "users/" + userId + "/sections/" + sectionId + "/subsections/" + subsectionId + "/planner/" + practice10version);
			 
		  } 
	}); 
	//for saving new version in section 3.7
	
	$.ajax({
		  type: "POST",
		  url: serverURL + "users/" + userId + "/sections/3/subsections/7/practice4/new",
		  data: formData2,
		  success: function(data){
			  window.location.reload();
		  },
		  error: function() {
			  alert(serverURL + "users/" + userId + "/sections/3/subsections/7/practice4/new");
		  } 
	});
	

}