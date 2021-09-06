/**
 * 
 */

function practice4Workbook(arr, url, sid, ssid) {

	rows = 0;
	cols = 0;
	version = 0;
	
	
	$.get(serverURL + "users/" + userId + "/" + url + "/workbook", function(data1){
	
		var pp = null;
		tabs = '';
		divTab = '';
		exer = '';
		var tbody = '';
		var len = 0;
		
		if(data1 != null) {
			pp = data1['practicePoints'];
			len = pp.length;
			
		}
		
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
				if(sid==3 && ssid == 6){
				if(k == 0)
    	    		thead += '<th class="col-md-1 text-center" style="vertical-align: middle;"><strong>' + table['thead'][k] + '</strong></th>';
    			else	
    				thead += '<th class="col-md-7 text-center" style="vertical-align: middle;"><strong>' + table['thead'][k] + '</strong></th>';
	    	
			}else {
				if(k == 0)
    	    		thead += '<th class="col-md-5 text-center" style="vertical-align: middle;"><strong>' + table['thead'][k] + '</strong></th>';
    			else	
    				thead += '<th class="col-md-7 text-center" style="vertical-align: middle;"><strong>' + table['thead'][k] + '</strong></th>';
	    	
			}
				
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
				
				tbody += '<tr>';
				
				for (l = 0; l < item.length; l++) {
					
					var checkStr = item[0].split('checkbox_label(this)');
					
					var checkStr1 = checkStr[0]+"checkbox_label(this)' checked >";
						
					str1 = data[ds].split('_');
					if(str1[3]==1){
						 item[0]=checkStr1;
						 
					}else{
						 item[0]= item[0];
						 
					}
					
					tbody += '<td>' + item[l];
					
					str = data[ds].split('_');
					str[2] = (str[2].replace("1",""));
					str[2] = (str[2].replace("2",""));
					str[2] = (str[2].replace("3",""));
					str[2] = (str[2].replace("4",""));
					str[2] = (str[2].replace("5",""));
					str[2] = (str[2].replace("6",""));
					
					str[2] = str[2].replace(/#@@#/g, ',');
					if((str[0]-1) == k) {
						if((str[1]-1) == l) {
							
							tbody += str[2] + '</textarea>';
							ds++;
							
							
						}
						
						
					}	
					
					tbody += '</td>';
				}
				tbody += '</tr>';
			}
			
    	    exer += '<table class="table table-bordered" id="table3_6'+sid+'-'+ssid+'-'+version+'">' +
    	    			'<thead>' + thead + '</thead>' + 
    	    			'<tbody>' + tbody + '</tbody>' +
	    			'</table>';
    	    
    	    if(j == len)
    	    	exer += '<button id="submit-'+sid+'-'+ssid+'" class="btn btn-success" onclick="submitPractice4(' + sid + ','+ ssid +',' + rows + ',' + cols + ')">Submit</button>';
    	    exer += '<button id = "download" class = "btn btn-warning" onclick="download3_6('+sid+','+ssid+','+version+')">Download</button>';
			divTab += exer + '</div>';
		}
		
		$('#tabs-'+sid+'-'+ssid).html(tabs);
		
		$('#ss-'+sid+'-'+ssid).html(divTab);
				
	});
}

var check_value = [0,0,0,0,0,0];


function checkbox_label(i) {
	
	var check_id = $(i).val();
	
	if($(i).prop("checked") == true){
		
	check_value[check_id-1]=1;
		
    }else if($(i).prop("checked") == false){
    	
    check_value[check_id-1]=0;
    	
    }
	
	}
var p3 ='';
function submitPractice4(sid, ssid, r, c) {
	
	formData = '';

	
	for (j = 1; j <= r; j++) {
		for (k = 1; k <= c; k++) {
			
			if($('.td-'+sid+'-'+ssid+'-'+j+'-'+k + ":last").val() != null) {
				
				if($('.td-'+sid+'-'+ssid+'-'+j+'-'+k + ":last").val().includes(",")){
					p3 = $('.td-'+sid+'-'+ssid+'-'+j+'-'+k + ":last").val().replace(/,/g, "#@@#");
				}
				else {
					p3= $('.td-'+sid+'-'+ssid+'-'+j+'-'+k + ":last").val();
				}
				
				
				if(sid==3 && ssid ==6)
				formData += 'data=' + j + '_' + k + '_' + p3 +'_'+check_value[j-1]+ '&';
				
				else
					formData += 'data=' + j + '_' + k + '_' + p3 + '&';
					$('.td-'+sid+'-'+ssid+'-'+j+'-'+k + ":last").prop("disabled", "disabled");	
			}
			
			
				
		}
	}
	
	
	$.ajax({
		  type: "POST",
		  url: serverURL + "users/" + userId + "/sections/" + sid + "/subsections/" + ssid + "/practice4/new",
		  data: formData,
		  success: function(data){
				$('#next').removeClass('hidden');
				$('#submit-'+sid+'-'+ssid).addClass('hidden');
				
				sessionStorage.setItem("currentSectionDisplay", +sid+"."+ssid);
				
				window.location.reload();
		  },
		  error: function() {
			  alert(serverURL + "users/" + userId + "/sections/" + sid + "/subsections/" + ssid + "/practice4/new");
		  } 
	});
	
	
}

function download3_6(sid,ssid,version){
	
	 var tab_text="<table id='table245'><tr bgcolor='#87AFC6'>";
	    var textRange; var j=0;
	    tab = document.getElementById('table3_6'+sid+'-'+ssid+'-'+version); // id of table
	    
	    if(sid == 3 && ssid == 6){
	    	
	    var x1 = tab.rows[(1)].cells[2].getElementsByTagName('textarea')[0].value;
	    var x2 = tab.rows[(2)].cells[2].getElementsByTagName('textarea')[0].value;
	    var x3 = tab.rows[(3)].cells[2].getElementsByTagName('textarea')[0].value;
	    var x4 = tab.rows[(4)].cells[1].getElementsByTagName('textarea')[0].value;
	    var x5 = tab.rows[(4)].cells[2].getElementsByTagName('textarea')[0].value;
	    var x6 = tab.rows[(5)].cells[1].getElementsByTagName('textarea')[0].value;
	    var x7 = tab.rows[(5)].cells[2].getElementsByTagName('textarea')[0].value;
	    var x8 = tab.rows[(6)].cells[1].getElementsByTagName('textarea')[0].value;
	    var x9 = tab.rows[(6)].cells[2].getElementsByTagName('textarea')[0].value;
	   
	    if( tab.rows[(1)].cells[0].getElementsByTagName('input')[0].checked)
	    	var x10=1;
	    else
	    	x10=0;
	    
	    if( tab.rows[(2)].cells[0].getElementsByTagName('input')[0].checked)
	    	var x11=1;
	    else
	    	x11=0;
	    
	    if( tab.rows[(3)].cells[0].getElementsByTagName('input')[0].checked)
	    	var x12=1;
	    else
	    	x12=0;
	    
	    if( tab.rows[(4)].cells[0].getElementsByTagName('input')[0].checked)
	    	var x13=1;
	    else
	    	x13=0;
	    
	    if( tab.rows[(5)].cells[0].getElementsByTagName('input')[0].checked)
	    	var x14=1;
	    else
	    	x14=0;
	    
	    if( tab.rows[(6)].cells[0].getElementsByTagName('input')[0].checked)
	    	var x15=1;
	    else
	    	x15=0;
	    
	   
	    	
	        tab_text=tab_text+tab.rows[j].innerHTML+"</tr>"+
	        "<tr><td>"+x10+"</td><td>"+"Marking my efforts on a simple graph/chart and putting it up prominently on a table/on a wall/cupboard."+"</td><td>"+x1+"</td></tr>"+
	        "<tr><td>"+x11+"</td><td>"+"Writing a happy note to myself in a diary."+"</td><td>"+x2+"</td></tr>"+
	        "<tr><td>"+x12+"</td><td>"+"Giving myself a treat/something nice to eat."+"</td><td>"+x3+"</td></tr>"+
	        "<tr><td>"+x13+"</td><td>"+"Spending some time doing something I like/want."+"<br>"+x4+"</td><td>"+x5+"</td></tr>"+
	        "<tr><td>"+x14+"</td><td>"+"Buying something for myself. "+"<br>"+x6+"</td><td>"+x7+"</td></tr>"+
	        "<tr><td>"+x15+"</td><td>"+"Any other way of rewarding myself."+"<br>"+x8+"</td><td>"+x9+"</td></tr>";
	    
	  
	    }else{
	    	
	    	var x1 = tab.rows[(1)].cells[1].getElementsByTagName('textarea')[0].value;
	 	    var x2 = tab.rows[(2)].cells[1].getElementsByTagName('textarea')[0].value;
	 	    var x3 = tab.rows[(3)].cells[0].getElementsByTagName('textarea')[0].value;
	 	    var x4 = tab.rows[(3)].cells[1].getElementsByTagName('textarea')[0].value;
	 	   
	 	    
	 	   tab_text=tab_text+tab.rows[j].innerHTML+"</tr>"+
	        "<tr><td>"+"I could not talk properly to my boss. I am a weak and an incapable person"+"</td><td>"+x1+"</td></tr>"+
	        "<tr><td>"+"I did not live up to his expectations in the party. I am not worthy of his affection. I hate myself."+"</td><td>"+x2+"</td></tr>"+
	        "<tr><td>"+"Write you own self-critical thought here"+"<br>"+x3+"</td><td>"+x4+"</td></tr>";
	        
	    	
	    }

	    tab_text=tab_text+"</table>";
	    tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
	    tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
	    tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

	    downlodExcel(tab_text);
}