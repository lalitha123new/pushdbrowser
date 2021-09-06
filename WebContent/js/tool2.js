/**
 * 
 */

var ans = [];
var count = 0;
var formData1 = {};


function tool2Workbook(arr, url, sid, ssid) {
	url = url.replace("practice1", "check3");
	
	$.get(serverURL + "users/" + userId + "/" + url + "/workbook", function(data1){
		
		
		len = 0;
		
		tabs = '';
		divTab = '';
		
		
		if(data1 != null) {
			cp = data1['checkPoints'];
			
			len = cp.length;
			
		}
		
		
		var arr1=arr;
		
		
		version = cp[cp.length-1]['version'];
		
		
		
		
		exer += '<ul class="list-group">';
		
		arr = arr1['questions'];
		
		
		for (j = 0; j <= len; j++) {
			
			
	
			exer = ''; 
			
			for (k = 0; k < arr1['exerciseDesc'].length; k++) {
				exer +=	'<p class="text-justify">' + arr1['exerciseDesc'][k] + '</p>';
			}
	    
			if(j == len-1) {
				   
					
				tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation" class="active">' +
							'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
								'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (len+1) + ', ' + (j+1) + ')">' +
								'Version ' + (j+1) + '</a>' +
						'</li>';	//	tablist
				
				divTab +=	'<div id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">';
				
				data = cp[j]['data'];
				data[0] = data[0].replace(/['"]+/g, '');
				data[0] =data[0].replace(/[\[\]']/g,'' );
				var str31 = data[0].split('_');
				data=str31;
				ds = 0;
				
				
			}else if(j == len) {
				tabs += '<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation">' +
							'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
								'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (len+1) + ', ' + (j+1) + ')">' +
								'Add</a>' +
						'</li>';	//	tablist
				divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">' +
								'<br><p><strong>Please enter your new response</strong></p>';
			}else {
				tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation">' +
							'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
								'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (len+1) + ', ' + (j+1) + ')">' +
								'Version ' + (j+1) + '</a>' +
						'</li>';	//tablist
		
				divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">';
				data = cp[j]['data'];
				data[0] = data[0].replace(/['"]+/g, '');
				data[0] =data[0].replace(/[\[\]']/g,'' );
				var str31 = data[0].split('_');
				data=str31;
				ds = 0;
				
				   
					
			}
			
			
			
			if(j == len) {
				
				//add version
				
				exer+='<form id="myForm">';
				for (l = 0; l < arr.length; l++) {
					
					
					exer +=  '<li class="list-group-item">' +
			 				'<div class="checkbox">' + 
			     				'<label>';
					exer 	+= 	'<input type="checkbox"  id="' + arr[l].quesNo +j+ '" name="check" onchange="showExp(' + arr[l].quesNo + ')" value="' + arr[l].quesNo + '">';
					exer += arr[l].ques + '</label>';
					
			 	    exer += 	'</li>';
			 	    
			 	   ans.push(arr[i].ans);
			 	    
			 	    
			 	
			 	
	    		}//for l
				
			 	  exer+='<button id="submit" type="button" onclick="checkCheckPointsSelected('+arr.length+','+j+')" class="btn btn-primary">'+"Submit"+'</button>';
			 	 exer+='</form>';
				
				
			}else{
				
				
				
				
				for (l = 0; l < arr.length; l++) {
					
					
				exer +=  '<li class="list-group-item">' +
			 				'<div class="checkbox">' + 
			     				'<label>';
				
				
				if(ds < data.length){
					str = data[ds];
					
				}
				
				
					
				
				if((str[0]-1) == l) {
					exer 	+= 	'<input type="checkbox" checked disabled id="' + arr[l].quesNo + '" name="check" onchange="showExp(' + arr[l].quesNo + ')" value="' + arr[l].quesNo + '">';
					ds++;
				}else {
					exer 	+= 	'<input type="checkbox" disabled id="' + arr[l].quesNo + '" name="check" onchange="showExp(' + arr[l].quesNo + ')" value="' + arr[l].quesNo + '">';
				}
				exer += arr[l].ques + '</label>' + '</div>';
			
				
			 	if(((str[0]-1) == l) && arr[l]['explanations'].length > 0) {
			 		
					
			 		exer += '<div id="exp' + arr[l].quesNo + '" class="thumbnail" style="background-color: lightblue; padding: 5px 15px;">'; 
					
					for (j2 = 0; j2 < arr[l]['explanations'].length; j2++) {
					
						str1 = arr[l]['explanations'][j2];
						
						
						h = str1.indexOf("value") + 7;
						
						if(str1.indexOf("<textarea") >= 0) {
							exer += str1.replace(str1.slice(h, h+2), "'>" + str[1] + "</textarea>");
						}
						else {
							exer +=	arr[l]['explanations'][j2];
						}	
					}
					exer += 	'</div>';

				}
			
			 	exer += 	'</li>';
			 	
			 	
			 	
	    		}//for l
				
				
			}
			
			exer += '</div><div class="clearfix"></div>';
				divTab += exer+'</div>';
				
				
				
				}//for j	
			
		
			
			
			$('#tabs-'+sid+'-'+ssid).html(tabs);
			
			$('#ss-'+sid+'-'+ssid).html(divTab);
			
		
		exer += '<br>';
		
	
	});
	
	
}


function showExp(id) {
	
	if($('#exp' + id).hasClass("hidden"))
		$('#exp' + id).removeClass("hidden");
	else
		$('#exp' + id).addClass("hidden");
}

function checkCheckPointsSelected(i,p)
{
	
	var n = p;
	var checked = false; //set it to true if none of the check boxes are filled
	var counter = 0;
		for ( j = 1; j <= i; j++) 
		{
			
			if($('#' + j+n).is(":checked")) 
			{
				
				counter++;
			} 
			else
			{
				//counter ++;
			}
		
	}
		if(counter > 0)
		{
			checkpoint(i,n);
		}
		else
		{
			
			alert("Please select atleast one checkbox");	
		}
}

function checkpoint(i,e) 
{
	
	var t = e;
	str = '';
	formData3 = '';
	
	flag = false;
	for ( j = 1; j <= i; j++) 
	{
		
		if($('#' + j+t).is(":checked")) 
		{
			
			if($('#' + j+t).val()) 
			{
				
				formData3 += j + '_';
					
				
				$('#bl' + j).prop("disabled", "disabled");
				
			}
			else {
				formData3 += j + '_';
				
			}
		} 
		$('#' + j).prop("disabled", "disabled");
		
	}
	$('#submit').addClass("hidden");
		$('#err').addClass("hidden");
		$('#myModal').modal('show');
 
			
			var section_id;
			var sub_section_id;
			var version_id;
			var response;
			var category_id;
			var table3arr1 = JSON.stringify(formData3)
			
			
			var Indata = {
					userId : userId,
					section_id : 9,
					sub_section_id : 3,
					version_id : t+1,
					response : table3arr1,
					category_id : 'null'
				};
			
			var myJSON = JSON.stringify(Indata);
			//rest call storeing 6.1 data type
			
			
			$.ajax({
				type : "POST",
				url : serverURL + "users/" + userId + "/sections/" + 9
						+ "/subsections/" + 3 + "/" + "3rdSecdata/"+(t+1),
				data : myJSON,
				contentType : "application/json",
				dataType : "json",
				
				success : function(data) {
					sessionStorage.setItem("currentSectionDisplay", "9.3");
					location.reload();
				},
				
				error : function() {
					
                  ////alert("not working");
				}
			});
	    	
		//}
		
		
		
		$("#next").removeClass('hidden');
}







//workbook for 10.2

function tool2Workbook1(arr, url, sid, ssid) {
	url = url.replace("practice1", "check3");
	
	$.get(serverURL + "users/" + userId + "/" + url + "/workbook", function(data1){
		
		
		
		len = 0;
		exer = '';
		tabs = '';
		divTab = '';
		
		if(data1 != null) {
			cp = data1['checkPoints'];
			
			len = cp.length;
		}
		
		for (k = 0; k < arr['exerciseDesc'].length; k++) {
			exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
		}
    
		
			
		data = cp[cp.length-1]['data'];
		
		
		data[0] = data[0].replace(/['"]+/g, '');
		
		var str31 = data[0].split('_');
		data=str31;
		
		version = cp[cp.length-1]['version'];
		
		ds = 0;
		
		exer += '<ul class="list-group">';
		
		arr = arr['questions'];
		
		
			
			for (j1 = 0; j1 <= len; j1++) {
				
				if(j1 == len-1) {
					tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j1+1) + '" role="presentation" class="active">' +
								'<a href="#tab-' + sid + '-' + ssid +'-' + (j1+1) + '" ' +
									'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (len+1) + ', ' + (j1+1) + ')">' +
									'Version ' + (j1+1) + '</a>' +
							'</li>';	//	tablist
					
					divTab +=	'<div id="tab-' + sid + '-' + ssid +'-' + (j1+1) + '">';
				}
				else if(j1 == len) {
					tabs += '<li id="tablist-' + sid + '-' + ssid +'-' + (j1+1) + '" role="presentation">' +
								'<a href="#tab-' + sid + '-' + ssid +'-' + (j1+1) + '" ' +
									'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (len+1) + ', ' + (j1+1) + ')">' +
									'Add</a>' +
							'</li>';	//	tablist
					divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j1+1) + '"><br>' +
									'<p><strong>Please enter your new response</strong></p>';
				}
				else {
					tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j1+1) + '" role="presentation">' +
								'<a href="#tab-' + sid + '-' + ssid +'-' + (j1+1) + '" ' +
									'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (len+1) + ', ' + (j1+1) + ')">' +
									'Version ' + (j1+1) + '</a>' +
							'</li>';	//	tablist
			
					divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j1+1) + '">';
				}
				
				
				exer += '<br>';
				
				}//for j1	
			
			
			
			for (l = 0; l < arr.length; l++) {
				
				
			exer +=  '<li class="list-group-item">' +
		 				'<div class="checkbox">' + 
		     				'<label>';
			if(ds < data.length)
				str = data[ds];
			
			
			if((str[0]-1) == l) {
				exer 	+= 	'<input type="checkbox" checked disabled id="' + arr[l].quesNo + '" name="check" onchange="showExp(' + arr[l].quesNo + ')" value="' + arr[l].quesNo + '">';
				ds++;
			}
			else {
				exer 	+= 	'<input type="checkbox" disabled id="' + arr[l].quesNo + '" name="check" onchange="showExp(' + arr[l].quesNo + ')" value="' + arr[l].quesNo + '">';
			}
			exer += 			arr[l].ques + 
							'</label>' + 
					  	'</div>';
		
			
		 	if(((str[0]-1) == l) && arr[l]['explanations'].length > 0) {
		 		
		 		
				
		 		exer += '<div id="exp' + arr[l].quesNo + '" class="thumbnail" style="background-color: lightblue; padding: 5px 15px;">'; 
				
				for (j2 = 0; j2 < arr[l]['explanations'].length; j2++) {
				
					str1 = arr[l]['explanations'][j2];
					
					
					h = str1.indexOf("value") + 7;
					
					if(str1.indexOf("<textarea") >= 0) {
						exer += str1.replace(str1.slice(h, h+2), "'>" + str[1] + "</textarea>");
					}
					else {
						exer +=	arr[l]['explanations'][j2];
					}	
				}
				exer += 	'</div>';

			}
		
		 	exer += 	'</li>';
		 	
		 	
		 	
    		}//for l
			
			
			$('#tabs-'+sid+'-'+ssid).html(tabs);
			$('#tab-'+sid+'-'+ssid).html(exer);
			
			$('#ss-'+sid+'-'+ssid).html(exer);
			
			
			
		
		exer += '<br>';
		
	
	});
	
	
}






