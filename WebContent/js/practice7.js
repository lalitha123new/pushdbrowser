/**
 * 
 */

function practice7Workbook(arr, url, sid, ssid) {
	
	rows = 0;
	cols = 0;
	version = 0;
	
	$.get(serverURL + "users/" + userId + "/" + url + "/workbook", function(data1){
	
		pp = null;
		tabs = '';
		divTab = '';
		exer = '';
		tbody = '';
		len = 0;
	
		if(data1 != null) {
			pp = data1['practicePoints'];
			
			len = pp.length;
		}
		if(sid=="6" && ssid=="1"){
			for (j = 0; j < len; j++) {

				for (j = 0; j <= len; j++) {
					exer = ''; 
					
					
					if(j == len-1) {
						tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation" class="active">' +
									'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
										'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (len+1) + ', ' + (j+1) + ')">' +
										'Version ' + (j+1) + '</a>' +
								'</li>';	//	tablist
						
						divTab +=	'<div id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">';
					}
					else if(j == len) {
						
						divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j+1) + '"><br>' +
										'<p><strong>Please enter your new response</strong></p>';
					}
					else {
						tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation">' +
									'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
										'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (len+1) + ', ' + (j+1) + ')">' +
										'Version ' + (j+1) + '</a>' +
								'</li>';	//	tablist
				
						divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">';
					}
					
					
					exer += '<br>';
					
					for(i = 0; i < arr['paragraphs'].length; i++) {
				    	exer += '<p class="text-justify">' + arr['paragraphs'][i] + '</p>';
					}

					table = arr['table'];
					rows = table['rows'];
					cols = table['cols'];
					
					thead = '<tr>';
					for (k = 0; k < table['thead'].length; k++) {
			    		thead += table['thead'][k];
			    	}
					thead += '</tr>';
					
					tbody = '';
					
					if(j != len) {
						data = pp[j]['data'];
						data[0] = data[0].replace(/['"]+/g, '');
						data[0] =data[0].replace(/[\[\]']/g,'' );
						var str1 = data[0].split(',');
						data=str1;
					version = pp[j]['version'];
					}
					
					ds = 0;
					
					for (k = 0; k < table['tbody'].length; k++) {
						item = table['tbody'][k]['item'];
						
						if(j != len && ds >= data.length)
							break;
						
						tbody += '<tr>';
						
						for (l = 0; l < item.length; l++) {
							
							tbody += '<td id="td-'+sid+'-'+ssid+'-'+(k+1)+'-'+(l+1)+'">';
							
							if(j == len && ds >= data.length) {
								str = [(k+1) , (l+1) , ""];
								}
							else {
								
								str = data[ds].split('_');
								
							}	
							
							if((item[l].indexOf("<select") >= 0) || (item[l].indexOf("<input") >= 0)) {
								if((str[0]-1) == k && (str[1]-1) == l) {
									if (j == len) {
										if(item[l].indexOf("<select") >= 0) {
											tbody += item[l];
										}
										else {
											h = item[l].indexOf("value") + 7;
											tbody += item[l].replace(item[l].slice(h, h+2), str[2]+"'>");
										}	
									}	
									else
										tbody += str[2];
									ds++;
								}
							} 
							else {
								tbody += item[l];
							}
							tbody += '</td>';
						}
						tbody += '</tr>';
					}
					
		    	    exer += '<table class="table table-bordered" id="table-'+sid+'-'+ssid+'-'+version+'">' +
		    	    			'<thead>' + thead + '</thead>' + 
		    	    			'<tbody>' + tbody + '</tbody>' +
			    			'</table>';
		    	    
		    	    if(j == len)
		    	    	exer += '<button id="submit-'+sid+'-'+ssid+'" class="btn btn-success" onclick="checkForEmptyFields('+sid + ','+ ssid  +',' + rows + ',' + cols + ')">Submit</button>';
					
		    	    divTab += exer + '</div>';
				}
			}	
			
		}else{
			
		
		for (j = 0; j <= len; j++) {
			exer = ''; 
			
			
			if(j == len-1) {
				tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation" class="active">' +
							'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
								'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (len+1) + ', ' + (j+1) + ')">' +
								'Version ' + (j+1) + '</a>' +
						'</li>';	//	tablist
				
				divTab +=	'<div id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">';
			}
			else if(j == len) {
				tabs += '<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation">' +
							'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
								'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (len+1) + ', ' + (j+1) + ')">' +
								'Add</a>' +
						'</li>';	//	tablist
				divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j+1) + '"><br>' +
								'<p><strong>Please enter your new response</strong></p>';
			}
			else {
				tabs +=	'<li id="tablist-' + sid + '-' + ssid +'-' + (j+1) + '" role="presentation">' +
							'<a href="#tab-' + sid + '-' + ssid +'-' + (j+1) + '" ' +
								'onclick="showTab(`' + sid + '-' + ssid +'`, ' + (len+1) + ', ' + (j+1) + ')">' +
								'Version ' + (j+1) + '</a>' +
						'</li>';	//	tablist
		
				divTab +=	'<div class="hidden" id="tab-' + sid + '-' + ssid +'-' + (j+1) + '">';
			}
			
			
			exer += '<br>';
			
			for(i = 0; i < arr['paragraphs'].length; i++) {
		    	exer += '<p class="text-justify">' + arr['paragraphs'][i] + '</p>';
			}

			table = arr['table'];
			rows = table['rows'];
			cols = table['cols'];
			
			thead = '<tr>';
			for (k = 0; k < table['thead'].length; k++) {
	    		thead += table['thead'][k];
	    	}
			thead += '</tr>';
			
			tbody = '';
			
			if(j != len) {
				data = pp[j]['data'];
				data[0] = data[0].replace(/['"]+/g, '');
				data[0] =data[0].replace(/[\[\]']/g,'' );
				var str1 = data[0].split(',');
				data=str1;
			version = pp[j]['version'];
			}
			
			ds = 0;
			
			for (k = 0; k < table['tbody'].length; k++) {
				item = table['tbody'][k]['item'];
				
				if(j != len && ds >= data.length)
					break;
				
				tbody += '<tr>';
				
				for (l = 0; l < item.length; l++) {
					
					tbody += '<td id="td-'+sid+'-'+ssid+'-'+(k+1)+'-'+(l+1)+'">';
					
					if(j == len && ds >= data.length) {
						str = [(k+1) , (l+1) , ""];
						}
					else {
						
						str = data[ds].split('_');
						
					}	
					
					str[2] = str[2].replace(/#@@#/g, ',');
					
					if((item[l].indexOf("<select") >= 0) || (item[l].indexOf("<input") >= 0)) {
						if((str[0]-1) == k && (str[1]-1) == l) {
							if (j == len) {
								if(item[l].indexOf("<select") >= 0) {
									tbody += item[l];
								}
								else {
									h = item[l].indexOf("value") + 7;
									tbody += item[l].replace(item[l].slice(h, h+2), str[2]+"'>");
								}	
							}	
							else
								tbody += str[2];
							ds++;
						}
					} 
					else {
						tbody += item[l];
					}
					tbody += '</td>';
				}
				tbody += '</tr>';
			}
			
    	    exer += '<table class="table table-bordered" id="table-'+sid+'-'+ssid+'-'+version+'">' +
    	    			'<thead>' + thead + '</thead>' + 
    	    			'<tbody>' + tbody + '</tbody>' +
	    			'</table>';
    	    
    	    if(j == len)
    	    	exer += '<button id="submit-'+sid+'-'+ssid+'" class="btn btn-success" onclick="checkForEmptyFields('+sid + ','+ ssid  +',' + rows + ',' + cols + ')">Submit</button>';
    	    else
    	    	exer += '<button id = "download" class = "btn btn-warning" onclick="download4_6('+sid+','+ssid+','+version+')">Download</button>';
    	    divTab += exer + '</div>';
		}
		}
		
		$('#tabs-'+sid+'-'+ssid).html(tabs);
		
		$('#ss-'+sid+'-'+ssid).html(divTab);
				
	});
}

function checkForEmptyFields(sid, ssid, r, c)
{
	var flag = false; //set it to true if blanks are empty
		flag1 = false;
	
	for (j = 1; j <= r; j++) 
	{
		flag = false;
		for (k = 1; k <= c; k++) 
		{
			if($('#td-'+sid+'-'+ssid+'-'+j+'-'+k+'>select').hasClass('td-'+sid+'-'+ssid+'-'+j+'-'+k))  //checking if the drop down is selected or not
			{
				
				if($('.td-'+sid+'-'+ssid+'-'+j+'-'+k).val() == 0)
				{
					
					//break;
				}
			}
			
			
			else{
				if($('.td-'+sid+'-'+ssid+'-'+j+'-'+k).val()) {
					/* FILLED */
				}else{
					/* UNFILLED */
					flag = true;
					break;
				}
			}
		}	//	for k
		
		if(flag == false) 
		{
			if(flag1 == false)
				flag1 = true;
			
			continue;
		}
	}	//	for j
	
	if(flag1 == false && flag == true)
	{
		alert("Please fill all the blanks");	
	}
	else
	{
		submitPractice7(sid, ssid, r, c);
	}
}

function submitPractice7(sid, ssid, r, c) {
	
	formData = '';
	x = 1;
	var p2 = '';
	for (j = 1; j <= r; j++) {
		flag = false;
		for (k = 1; k <= c; k++) {
			if($('.td-'+sid+'-'+ssid+'-'+j+'-'+k).val() != null ) {
				
				if($('.td-'+sid+'-'+ssid+'-'+j+'-'+k).val().includes(",")){
					p2 = $('.td-'+sid+'-'+ssid+'-'+j+'-'+k).val().replace(/,/g, "#@@#");
				}
				else {
					p2= $('.td-'+sid+'-'+ssid+'-'+j+'-'+k).val();
				}
				
				
				
				formData += 'data=' + x + '_' + k + '_' + p2 + '&';
				flag = true;
			}else if($('.td-'+j+'-'+k).val() != null ) {
				
				if($('.td-'+j+'-'+k).val().includes(",")){
					p2 = $('.td-'+j+'-'+k).val().replace(/,/g, "#@@#");
				}
				else {
					p_newp2= $('.td-'+j+'-'+k).val();
				}
				
				
				formData += 'data=' + x + '_' + k + '_' + p2 + '&';
				flag = true;
			}	
			$('.td-'+sid+'-'+ssid+'-'+j+'-'+k).prop("disabled", "disabled");
			$('.td-'+j+'-'+k).prop("disabled", "disabled");
		}
		if(flag == true)
			x++;
	}
	

 $.ajax({
		  type: "POST",
		  url: serverURL + "users/" + userId + "/sections/" + sid + "/subsections/" + ssid + "/practice4/new",
		  data: formData,
		  success: function(data){
			  	$('#next').removeClass('hidden');
				$('#submit-'+sid+'-'+ssid).addClass('hidden');
				
				
				sessionStorage.setItem("addVer", "5");
				
				sessionStorage.setItem("currentSectionDisplay", +sid+"."+ssid);
				
				window.location.reload();
		  },
		  error: function() {
			  alert(serverURL + "users/" + userId + "/sections/" + sid + "/subsections/" + ssid + "/practice4/new");
		  } 
	});
}	
function download4_6(sid,ssid,version)
{
	
    var tab_text="<table id='table245'><tr bgcolor='#87AFC6'>";
    var textRange; var j=0;
    tab = document.getElementById('table-'+sid+'-'+ssid+'-'+version); // id of table

    for(j = 0 ; j < tab.rows.length ; j++) 
    {     
        tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
       
    }

    tab_text=tab_text+"</table>";
    tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
    tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
    tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

    downlodExcel(tab_text);
	
}








