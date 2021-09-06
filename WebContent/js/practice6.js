/**
 * 
 */

	
function practice6Workbook(arr, url, sid, ssid) {
	
	rows = 0;
	cols = 0;
	version = 0;
	
	
	$.get(serverURL + "users/" + userId + "/" + url + "/workbook", function(data1){
		
		cArr = new Array();
		cp = null;
		tbody = '';
		len = 0;
		tabs = '';
		divTab = '';
		exer = '';
		
		if(data1 != null) {
			cp = data1['checkPoints'];
			len = cp.length;
		}
		 {
			
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
				
				exer += '<br><strong>' + arr['exerciseTitle'] + '</strong>';
				
				for (k = 0; k < arr['exerciseDesc'].length; k++) {
					exer +=	'<p class="text-justify">' + arr['exerciseDesc'][k] + '</p>';
				}
		    
				count = arr['questions'].length;
				
				if(j != len) {
					data = cp[j]['data'];
					data[0] = data[0].replace(/['"]+/g, '');
					data[0] =data[0].replace(/[\[\]']/g,'' );
					var str31 = data[0].split(',');
					data=str31;
					version = cp[j]['version'];
				}
				
				ds = 0;
				
				for (l = 0; l < arr['questions'].length; l++) {
					
					exer += '<div id="div' + l + '-'+sid+'-'+ssid+'-'+version+'">' +
							'<hr>' +
							'<p>' + arr['questions'][l].ques + '</p>' +
							'<div id="lt'+l+'-'+sid+'-'+ssid+'-'+version+'" class="col-md-8 form-horizontal">';
						
					for (var k = 0; k < arr['questions'][l]['blanks'].length; k++) {
						
						exer +=  	'<div class="form-group" id="myDiv'+l+'-'+k+'-'+sid+'-'+ssid+'-'+version+'">'; 
						str = data[ds].split('_');
						str[2] = str[2].replace(/#@@#/g, ',');
						str[2] = str[2].replace(/\\n/g, '');
						
						if((str[0]-1) == l && (str[1]-1) == k) {
							str1 = arr['questions'][l]['blanks'][k];
							if (j == len) {
								h = str1.indexOf("value") + 7;
								
								if(str1.indexOf("<input") >= 0) {
									exer += str1.replace(str1.slice(h, h+2), str[2] + "'>");
								}
								else {
									exer += str1.replace(str1.slice(h, h+2), "'>" + str[2] + "</textarea>");
								}	
							}	// 	if		
							else {
								if(str1.indexOf("<input") >= 0) {
									exer += '<textarea class="form-control" disabled value="' + str[2] + '">' + str[2] + '</textarea>';
								}
								else {
									exer += '<textarea rows="2" class="form-control" disabled style="resize: none;">' + str[2] + '</textarea>';
								}
							}	//	else
							ds++;
						}	//	if	
				
						exer += 	'</div>';	//	form-group
					}	// 	for k
					
			
					if(j == 0)
						cArr.push(k);
					
					exer += '</div>' +			//	lt 
							'<div class="clearfix"></div>' +
							'</div>';			//	div
				}	// 	for l
				
	    	    if(j == len)
	    	    	exer += '<button id="submit-'+sid+'-'+ssid+'" class="btn btn-success" onclick="submitPractice6('+sid + ',' +ssid+ ',' +count+ ',`' +cArr+ '`)">Submit</button>';
				else 
	    	        exer += '<button id = "download47" class = "btn btn-warning" onclick="download4_7('+sid + ',' +ssid+','+version+')">Download</button>';
	    	    divTab += exer + '</div>';		//	divTab
			}	//	j	
		}	//	else
		 
		
		$('#tabs-'+sid+'-'+ssid).html(tabs);
		
		$('#ss-'+sid+'-'+ssid).html(divTab);
	});
}

function submitPractice6(sid, ssid, count, carr) {
	
	formData = '';
	var p1 = '';

	str = carr.split(",");
	
	
	for (j = 1; j <= count; j++)	{
		for (k = 1; k <= str[j-1]; k++) {
			if($('.bl-'+sid+'-'+ssid+'-'+j+'-'+k).val() != null) {
				
				if($('.bl-'+sid+'-'+ssid+'-'+j+'-'+k).val().includes(",")){
					p1 = $('.bl-'+sid+'-'+ssid+'-'+j+'-'+k).val().replace(/,/g, "#@@#");
				}
				else {
					p1= $('.bl-'+sid+'-'+ssid+'-'+j+'-'+k).val();
				}
				
				
				formData += 'data=' + j + '_' + k + '_' + p1 + '&';
				$('.bl-'+sid+'-'+ssid+'-'+j+'-'+k).prop("disabled", "disabled");	
			}	
		}				
	}
	
	$.ajax({
		  type: "POST",
		  url: serverURL + "users/" + userId + "/sections/" + sid + "/subsections/" + ssid + "/practice4/new",
		  data: formData,
		  success: function(data){
				$('#submit-'+sid+'-'+ssid).addClass('hidden');
				window.location.reload();
				
					sessionStorage.setItem("currentSectionDisplay", +sid+"."+ssid);
					
		  },
		  error: function() {
			 
		  } 
	});
}	


function download4_7(sid,ssid,version){
	var tab_text = '<table id="table245">';
    var textRange; 
    var j = 0;
    if(sid==4 && ssid==7){
		 var x1 = document.getElementById('myDiv'+0+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		 var x2 = document.getElementById('myDiv'+0+'-'+1+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		 var x3 = document.getElementById('myDiv'+0+'-'+2+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		 tab_text = tab_text + "<tr><td>" +"Write down at least one and three minimum/statements you have recently used to help you to substitute your depressing thoughts with alternative thoughts"+"</td></tr>"+
	        "<tr><td>"+x1+"</td></tr>"+
	        "<tr><td>"+x2+"</td></tr>"+
	        "<tr><td>"+x3+"</td></tr>";
    }else if(sid == 5 && ssid == 6) {
    	
    	var x1 = document.getElementById('myDiv'+0+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x2 = document.getElementById('myDiv'+1+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x3 = document.getElementById('myDiv'+2+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x4 = document.getElementById('myDiv'+3+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		
		tab_text = tab_text + "<tr><td>" +"Write one of your current worries here:"+"</td>"+
    	"<td>"+"Write down how you might respond to this worry when you are in emotional mind-state:"+"</td>"+
    	"<td>"+"Write down how you might respond to this worry when you are in rational mind-state:"+"</td>"+
    	"<td>"+"Write down how you might respond to this worry when you are in wise mind-state"+"</td></tr>"+
    	"<tr><td>"+x1+"</td><td>"+x2+"</td><td>"+x3+"</td><td>"+x4+"</td></tr>";
    	
    }
    else if(sid == 5 && ssid == 7) {
    
		
		var x = document.getElementById('myDiv'+0+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		 tab_text = tab_text + "<tr><td>" +"i commit to schedule worry time at"+"</td></tr>"+
	        "<tr><td>"+x+"</td></tr>";
    }else if(sid == 6 && ssid == 6) {
		
		 var x = document.getElementById('myDiv'+0+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		 tab_text = tab_text + "<tr><td>" +"Letter from your warm, compassionate and wise friend:"+"</td></tr>"+
	        "<tr><td>"+x+"</td></tr>";
    }else if(sid == 7 && ssid == 4) {
		
		var x1 = document.getElementById('myDiv'+0+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x2 = document.getElementById('myDiv'+0+'-'+1+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x3 = document.getElementById('myDiv'+0+'-'+2+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		tab_text = tab_text + "<tr><td>" +"self-soothing activities that I think I can try for the next ten days-"+"</td>"+
    	"<tr><td>"+x1+"</td></tr>"+
    	"<td>"+x2+"</td></tr>"+
    	"<td>"+x3+"</td></tr>";
		
    }else if(sid == 8 && ssid == 4) {
		
		var x1 = document.getElementById('myDiv'+0+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x2 = document.getElementById('myDiv'+0+'-'+1+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x3 = document.getElementById('myDiv'+0+'-'+2+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x4 = document.getElementById('myDiv'+0+'-'+3+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x5 = document.getElementById('myDiv'+0+'-'+4+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		
		var x6 = document.getElementById('myDiv'+1+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x7 = document.getElementById('myDiv'+1+'-'+1+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x8 = document.getElementById('myDiv'+1+'-'+2+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x9 = document.getElementById('myDiv'+1+'-'+3+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x10 = document.getElementById('myDiv'+1+'-'+4+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		tab_text = tab_text + "<tr><td>" +"Your list A :"+"</td>"+
    	"<td>" +"Your list B :"+"</td></tr>"+
    	"<tr><td>"+x1+"</td><td>"+x6+"</td></tr>"+
		"<tr><td>"+x2+"</td><td>"+x7+"</td></tr>"+
		"<tr><td>"+x3+"</td><td>"+x8+"</td></tr>"+
		"<tr><td>"+x4+"</td><td>"+x9+"</td></tr>"+
		"<tr><td>"+x5+"</td><td>"+x10+"</td></tr>";
		
    }else if(sid == 8 && ssid == 5) {
		
		var x1 = document.getElementById('myDiv'+0+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x2 = document.getElementById('myDiv'+0+'-'+1+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x3 = document.getElementById('myDiv'+0+'-'+2+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		
		var x4 = document.getElementById('myDiv'+1+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x5 = document.getElementById('myDiv'+1+'-'+1+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x6 = document.getElementById('myDiv'+1+'-'+2+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		
		var x7 = document.getElementById('myDiv'+2+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		tab_text = tab_text + "<tr><td>" +"From your list B, note down some of these things that you can start off within the next one-two weeks"+"</td>"+
    	"<td>" +"Also, note down a few of the other things (from your List B) that you can start doing in about a month's time"+"</td>"+
    	"<td>"+"Your planning notes here:"+"</td></tr>"+
    	"<tr><td>"+x1+"</td><td>"+x4+"</td><td>"+x7+"</td></tr>"+
    	"<tr><td>"+x2+"</td><td>"+x5+"</td></tr>"+
    	"<tr><td>"+x3+"</td><td>"+x6+"</td></tr>";
		
    }else if(sid == 9 && ssid == 4) {
		
		var x1 = document.getElementById('div'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x2 = document.getElementById('div'+1+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x3 = document.getElementById('div'+2+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x4 = document.getElementById('div'+3+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x5 = document.getElementById('div'+4+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x6 = document.getElementById('myDiv'+4+'-'+0+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x7 = document.getElementById('myDiv'+4+'-'+1+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		var x8 = document.getElementById('myDiv'+4+'-'+2+'-'+sid+'-'+ssid+'-'+version).getElementsByTagName('textarea')[0].value;
		
		tab_text =tab_text + "<tr><td>" +"One person with whom I can talk on a general topic when I am feeling low and need to distract myself"+"</td>"+
    	"<td>"+"One social activity that I can try to engage in, that may help me boost my mood."+"</td>"+
    	"<td>"+"One person with whom I can try to discuss my issues."+"</td>"+
    	"<td>"+"One person that I can connect to, when I am feeling very disturbed."+"</td>"+
    	"<td>"+"The social activities that I can try to engage in a little more often (refer tool box for ideas)"+"</td></tr>"+
    	"<tr><td>"+x1+"</td><td>"+x2+"</td><td>"+x3+"</td><td>"+x4+"</td><td>"+x6+"</td></tr>"+
    	"<tr><td></td><td></td><td></td><td></td><td>"+x7+"</td></tr>"+
    	"<tr><td></td><td></td><td></td><td></td><td>"+x8+"</td></tr>";
    	
		
    }
    tab_text = tab_text + "</table>";
    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params

    downlodExcel(tab_text);
}