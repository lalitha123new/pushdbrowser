/**
 * 
 */

var check3sid = 0;
var check3ssid = 0;

function check3Workbook(arr, url, sid, ssid) {

	rows = 0;
	cols = 0;
	version = 0;
	check3sid = sid;
	check3ssid= ssid;
	
	
	$.get(serverURL + "users/" + userId + "/" + url + "/workbook", function(data1){
	
		var pp = data1['checkPoints'];
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
						'</li>';	//	tablist
				
				divTab +=	'<div id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">';
			}else if(j == pp.length) {
				tabs += '<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation">' +
							'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
								'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (pp.length+1) + ', ' + (j+1) + ')">' +
								'Add</a>' +
						'</li>';	//	tablist
				divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">' +
								'<br><p><strong>Please enter your new response</strong></p>';
			}else {
				tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation">' +
							'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
								'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (pp.length+1) + ', ' + (j+1) + ')">' +
								'Version ' + (j+1) + '</a>' +
						'</li>';	//	tablist
		
				divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">';
			}
			
			exer +=	'<p id="exercise-title' + j + '" class="text-justify"><br><strong>' + arr['exerciseTitle'] + '</strong></p>';
	    	
			for (k = 0; k < arr['exerciseDesc'].length; k++) {
				exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
			}
	    	
			if(j != pp.length) {
				data = pp[j]['data'];
				
				data[0] = data[0].replace('][',', ');
				data[0] = data[0].replace(/['"]+/g, '');
				data[0] = data[0].replace(/[\[\]']/g,'' );
				data[0] = data[0].replace('""',' ');
				var arr1 = data[0].split(',');
				data=arr1;
				
				version = pp[j]['version'];
				
			}
			else {
				data = pp[j-1]['data'];
				
				data[0] = data[0].replace(/['"]+/g, '');
				data[0] = data[0].replace(/[\[\]']/g,'' );
				data[0] = data[0].replace('""',' ');
	
			var str31 = data[0].split(',');
				data=str31;
				
			}
		
			ds = 0;
			ct = 1;
			
			for (l = 0; l < arr['questions'].length; l++) {
				
				
				if(j == pp.length) {
					if(l == 0) {
						exer += '<div id="div' + l + '">' +
								'<h5>' + arr['questions'][l].ques + '</h5>' +
								'<div id="lt'+l+'" class="col-md-8 form-horizontal">';
					}
					else {
						exer += '<div id="div' + l + '" class="hidden">' +
								'<h5>' + arr['questions'][l].ques + '</h5>' +
								'<div id="lt'+l+'" class="col-md-8 form-horizontal">';
					}
				}
				else {
					exer += '<div>' +
								'<h5>' + arr['questions'][l].ques + '</h5>' +
								'<div class="col-md-8 form-horizontal">';
				}	
				s = '';
				
				k = 1; 
				s = data[ds].split('_');
				
				
				while(k <= s[0]) {
					
					if(j == pp.length) {
						
							s[2] = s[2].replace(/#@@#/g, ',');
						
						
						exer +=  '<div class="form-group input-group">' + 
									'<span class="input-group-addon">' + k + '.</span>' + 
									'<input id="fc' + k + '_' + s[1] + '" autocomplete="off" type="text" class="form-control"' + 
										'name="input" value="'+s[2]+'">' +
										
								 '</div>';
						
					}else {
						if(s[2].includes('#@@#')){
							s[2] = s[2].replace(/#@@#/g, ',');
							
						}else{
							s[2]=s[2];
							
						}
						
						
						exer +=  '<div class="form-group input-group">' + 
									'<span class="input-group-addon">' + k + '.</span>' + 
									'<input disabled type="text" class="form-control" value="'+s[2]+'">' +
									
								'</div>';	
						
					}
					
					
					ds++;
					k ++;
					if(ct == data.length)
						break;
					
					ct++;
					s = data[ds].split('_');
				
				}	
				
				exer += '</div><div class="clearfix"></div>';
				
				if(j == pp.length) {
					
					exer += 	'<div class="col-md-8">' +
									'<span id="err' + l + '" class="hidden">Please fill atleast 5 activities</span>' +
									'<div class="form-group">' + 
										'<button type="button" id="addInputsCheck3' + l + '" onclick="addCheck3(`' + k + '_' + l + '`)" class="btn btn-primary">Add More ...</button>' +
										//'<button type="button" id="download' + l + '" onclick="download3_4('+sid+','+ssid+','+version+')" class="btn btn-warning">Download</button>' +
										
										'<button type="button" id="submitCheck3' + l + '" onclick="submitCheck3(' + l + ','+ds+')" class="btn btn-success pull-right">Submit</button>' +
									'</div>' + 
								'</div>' + 
								'<div class="clearfix"></div>';
				}
				else{
					if(l == 1){
					exer +='<button type="button" id="download' + l + '" onclick="download3_4('+sid+','+ssid+','+version+')" class="btn btn-warning">Download</button>' ;
				}
					
				}	
				exer += '</div>';
				
				
				
				
			}
			exer +='<button type="button" id="download' + 2 + '" onclick="download3_4('+sid+','+ssid+','+version+')" class="btn btn-warning hidden">Download</button>' ;
				
			divTab += exer + '</div>';
		}
		
		
		$('#tabs-'+sid+'-'+ssid).html(tabs);
		$('#ss-'+sid+'-'+ssid).html(divTab);
				
	});
	
	
	
	
}

function addCheck3(c){
	
	var arr = c.split('_');
	$('#err'+arr[1]).addClass('hidden');
	
	var flag = true;
	
	for(l=1; l<=max; l++) {
		if($('#fc'+l+'_'+(parseInt(arr[1])+1)).val() == "") {
			$("#err"+arr[1]).css('color','red');
			$('#err'+arr[1]).removeClass('hidden');
			flag = false;
		}	
	}
	
	if(flag == true) {
		
		var field = '<div class="form-group input-group">' + 
						'<span class="input-group-addon">' + arr[0] + '.</span>' + 
						'<input id="fc' + arr[0] + '_' + (parseInt(arr[1])+1) + '" autocomplete="off" type="text" class="form-control" name="input">' +
					'</div>';
		$('#lt'+arr[1]).append(field);
		arr[0]++;
		
		$('#addInputsCheck3'+arr[1]).attr('onclick', 'addCheck3("' + arr[0] + '_' + arr[1] + '")');
		max = arr[0] - 1;
		
	}
}

function submitCheck3(c,u) {
	
	$('#download'+2).removeClass('hidden');
	
	formData = '';
	max=u;
	var p_new='';
	for (k = 1; k <= max; k++) {
		if($('#fc'+k+'_'+(c+1)).val() != null) {
			
			if($('#fc'+k+'_'+(c+1)).val().includes(",")){
				p_new = $('#fc'+k+'_'+(c+1)).val().replace(/,/g, "#@@#");
			}
			else {
				p_new= $('#fc'+k+'_'+(c+1)).val();
			}
			
			formData +='data='+k+'_'+(c+1)+'_' + p_new + '&';
			
		}
		$('#fc'+k+'_'+(c+1)).prop("disabled", "disabled");
	}
	
	
	
	if(c == 0){
		str = "/new";
	}else{
		str = "/continue/" + version;
	}
	

	$.ajax({
		  type: "POST",
		  url: serverURL + "users/" + userId + "/sections/" + check3sid + "/subsections/" + check3ssid + "/practice4"+str,
		  data: formData,
		  
		  success: function(data){ 	
			  version = 2;
			  	$('#addInputsCheck3'+c).addClass("hidden");
				$('#submitCheck3'+c).addClass("hidden");
				c ++;
				if(c == 2)
					window.location.reload();
				$('#div'+c).removeClass("hidden");
				max = 5;
				sessionStorage.setItem("currentSectionDisplay", +check3sid+"."+check3ssid);
		  },
		  error: function() {
			 
			  ////alert(serverURL + "users/" + userId + "/sections/" + sectionId + "/subsections/" + subsectionId + "/check/new");
		  } 
	});
	
}

function download3_4(sid,ssid,version){
	var tab_text = '<table id="table245">';
    var textRange; 
    var j = 0;
    
    if(typeof($('#fc' + 1 +'_' + 1).val())==="undefined")
		var x1 = " ";
		else 
			 x1 =$('#fc' + 1 + '_' + 1).val();
	
	
	if(typeof($('#fc' + 2 + '_' + 1).val())==="undefined")
		var x2 = " ";
		else 
			 x2 =$('#fc' + 2 + '_' + 1).val();
	
	if(typeof($('#fc' + 3 + '_' + 1).val())==="undefined")
		var x3 = " ";
		else 
			 x3 =$('#fc' + 3 + '_' + 1).val();
	
	
	if(typeof($('#fc' + 4 + '_' + 1).val())==="undefined")
	var x4 = " ";
	else 
		 x4 =$('#fc' + 4 + '_' + 1).val();
	
	if(typeof($('#fc' + 5 + '_' + 1).val())==="undefined")
		var x5 = " ";
		else 
			 x5 =$('#fc' + 5 + '_' + 1).val();
	

	if(typeof($('#fc' + 1 + '_' + 2).val())==="undefined")
		var x6 = " ";
		else 
			 x6 =$('#fc' + 1 + '_' + 2).val();
	
	
	if(typeof($('#fc' + 2 + '_' + 2).val())==="undefined")
		var x7 = " ";
		else 
			 x7 =$('#fc' + 2 + '_' + 2).val();
	
	if(typeof($('#fc' + 3 + '_' + 2).val())==="undefined")
		var x8 = " ";
		else 
			 x8 =$('#fc' + 3 + '_' + 2).val();
	
	if(typeof($('#fc' + 4 + '_' + 2).val())==="undefined")
	var x9 = " ";
	else 
		 x9 =$('#fc' + 4 + '_' + 2).val();
	
	if(typeof($('#fc' + 5 + '_' + 2).val())==="undefined")
		var x10 = " ";
		else 
			 x10 =$('#fc' + 5 + '_' + 2).val();
	
	tab_text = tab_text + "<tr><td>" +"Are you likely to face some difficulties in implementing this plan? List some out."+"</td><td>"+"Now list out strategies that you can use to manage these difficulties"+"</td></tr>"+
    "<tr><td>"+x1+"</td><td>"+x6+"</td></tr>"+
    "<tr><td>"+x2+"</td><td>"+x7+"</td></tr>"+
    "<tr><td>"+x3+"</td><td>"+x8+"</td></tr>"+
    "<tr><td>"+x4+"</td><td>"+x9+"</td></tr>"+
    "<tr><td>"+x5+"</td><td>"+x10+"</td></tr>";
	tab_text = tab_text + "</table>";
    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params

    downlodExcel(tab_text);

}