/**
 * 
 */

var tabs = '';
var divTab = '';
var exer = '';
var data_array=[];

function tableOfContent() {
	
	var s = 0;
	$.ajax({
		  type: "GET",
		  url: serverURL + "users/" + userId + "/stats",
		  success: function(data){
			  s = data['sectionsCompleted'];
	
		
			  for ( j = 1; j <= sectionId; j++) {
					if( j < sectionId ) {
						for ( k = 1; k <= $('#tbs'+j).val(); k++) {
							$('#th'+j).removeClass('hidden');
							$('#tb'+j).removeClass('hidden');
							$('#ts'+j+'-'+k).removeClass('hidden');
							$('#subsection-'+j+'-'+k).removeClass('hidden');
							$('#hr-'+j+'-'+k).removeClass('hidden');
						}
					}
					else if(j == sectionId) {
						if( j == 10 && s == 10 ) {
							
							for ( k = 1; k <= $('#tbs'+j).val(); k++) {
								$('#th'+j).removeClass('hidden');
								$('#tb'+j).removeClass('hidden');
								$('#ts'+j+'-'+k).removeClass('hidden');
								$('#subsection-'+j+'-'+k).removeClass('hidden');
								$('#hr-'+j+'-'+k).removeClass('hidden');
							}
						}
						else {
							for ( k = 1; k <= subsectionId; k++) {
								$('#th'+j).removeClass('hidden');
								$('#tb'+j).removeClass('hidden');
								$('#ts'+j+'-'+k).removeClass('hidden');
								$('#subsection-'+j+'-'+k).removeClass('hidden');
								$('#hr-'+j+'-'+k).removeClass('hidden');
							}
						}
					}
			  }
		  }
	});
}

function getContent(url) {
	
	if(url.indexOf("section2_2") > 0) {
		loadSection2_2();
		$.getJSON(serverURL + "users/feedback/"+userId+"/sections/2/subsections/2", function(data){
			if(data.fname){
				$("#feedback_2_2").html(data.fname);
			  }else{
				  $("#feedback_2_2").html("NoFirstName");
				 
			  }
		    
		});
	}	
	else {
		$.ajax({
			  type: "GET",
			  url: serverURL + "" + url,
			  success: function(data){
				  
				  var arr = url.split('/');
				
				  $.getJSON(serverURL + "users/feedback/"+userId+"/sections/"+arr[1]+"/subsections/"+arr[3], function(data){
					 
					  if(data.fname){
	    			    $("#feedback_"+arr[1]+"_"+arr[3]).html(data.fname);
					  }else{
						  
						  $("#feedback_"+arr[1]+"_"+arr[3]).html("NoFirstName"); 
					  }
				  });
			
				  if(arr[1] == "9" && arr[3] == "3") {
					  tool2Workbook(data, url, arr[1], arr[3]);
					  
				  }else if((arr[1] == "10" && arr[3] == "2")){
					  
					  tool2Workbook1(data, url, arr[1], arr[3]);
				  }
				  else  if(	(arr[1] == "3" && arr[3] == "7")) {
					  practice15Workbook(data, url, arr[1], arr[3]);
				  }
				  else if (url.indexOf("practice3") > 0) {
					  practice11Workbook(data, url, arr[1], arr[3]);
					  //3.2 workbook new function
					  
				  }
				  else if (url.indexOf("practice9") > 0) {
					  practice10Workbook(data, url, arr[1], arr[3]);
				  }
				  else if (url.indexOf("practice7") > 0) {
					  practice7Workbook(data, url, arr[1], arr[3]);
				  }
				  else if (url.indexOf("knowledge") > 0) {
				  	if(		arr[1] == "4" && arr[3] == "6"  ||
							(arr[1] == "5" && arr[3] == "8") || 
							(arr[1] == "6" && arr[3] == "1") || 
							(arr[1] == "7" && arr[3] == "5")){
						  practice7Workbook(data, url, arr[1], arr[3]);
				  	}else{
						 practice4Workbook(data, url, arr[1], arr[3]);
					  }
				  }
				
				  
				  else if (url.indexOf("check3") > 0) {
					  if(	(arr[1] == "4" && arr[3] == "7") || 
						  	(arr[1] == "5" && arr[3] == "6") || 
						  	(arr[1] == "5" && arr[3] == "7") || 
						  	(arr[1] == "6" && arr[3] == "6") || 
						  	(arr[1] == "7" && arr[3] == "4") || 
						  	(arr[1] == "8" && arr[3] == "4") || 
						  	(arr[1] == "8" && arr[3] == "5") || 
						  	(arr[1] == "9" && arr[3] == "4")) {
						  practice6Workbook(data, url, arr[1], arr[3]);
					  }
					  else
						  check3Workbook(data, url, arr[1], arr[3]);
				  }
	        },
			  error: function() {
				  alert("Error: server encountered an internal error. Please try again after some time ");
				  
			  } 
		});		
	}	
}

function showPage(p) {
	

	if(p <= sectionId || p==11 || p==12) {
		for (j = 0; j <= sectionId; j++) {
			
			$('#page-'+j).removeClass("active");
			$('#list'+j).removeClass("active");
			$('#list'+j+'>a').css("color", "#337AB7");
			$('#page-'+j).addClass("hidden");
		}
		$('#page-'+11).removeClass("active");
		$('#list'+11).removeClass("active");
		$('#list'+11+'>a').css("color", "#337AB7");
		$('#page-'+11).addClass("hidden");
		
		$('#page-'+12).removeClass("active");
		$('#list'+12).removeClass("active");
		$('#list'+12+'>a').css("color", "#337AB7");
		$('#page-'+12).addClass("hidden");
		
		$('#page-'+p).addClass("active");
		$('#list'+p).addClass("active");
		$('#list'+p+'>a').css("color", "white");
		$('#page-'+p).removeClass("hidden");
		if(p == 4){
			
			$.ajax({
				type : "GET",
				url : serverURL + "users/" + userId
						+ "/sections/" + 4 + "/subsections/"
						+ 5 + "/" + "3rdSecdata/1",
				contentType : "application/json",
				dataType : "json",
				success : function(data) {
					
					if(data[0].response){
					var parsed_data45  = JSON.parse("[" + data[0].response + "]");
					data_array.push(parsed_data45[0]);
					
					$.each(parsed_data45[0], function(i, val){

						   $("input[value='" + val + "']").prop('checked', 'checked');
						   var el = document.getElementById("drop_box");
						   
						   var height = el.offsetHeight;
						   var newHeight = height + 10;
						   el.style.height = newHeight + 'px';
						    
						   $( ".drop_div" ).append("<br />"+(i+1)+")" +val);
					
						});
					
					
					$("input[type=checkbox").prop('disabled','disabled');
					
				}else{
					
					$("input[type=checkbox").prop('disabled',false);
				}
				}
			
				});
			
			
		}
		if (p == 0)
			$('#prev').addClass('disabled');
		else
			$('#prev').removeClass('disabled');
		
		if(p == sectionId)
			$('#next').addClass('disabled');
		else
			$('#next').removeClass('disabled');
	}
	else
		alert("You have not completed this section");
}

function showSubSection(sid, ssid) {
	
	showPage(sid);
	$('#ss-'+sid+'-'+ssid).focus();
}

function showPrevious() {
	$('#next').removeClass('disabled');
	for (j = 0; j <= sectionId; j++) {
		if($('#page-'+j).hasClass("active")) {
			$('#page-'+j).removeClass("active");
			$('#list'+j).removeClass("active");
			$('#page-'+j).addClass("hidden");
			p = parseInt(j)-1;
			$('#page-'+p).addClass("active");
			$('#list'+p).addClass("active");
			$('#page-'+p).removeClass("hidden");
			if(p == 0)
				$('#prev').addClass('disabled');
			break;
		}
	}
}




function showNext() {
	$('#prev').removeClass('disabled');
	for (j = 0; j <= sectionId; j++) {
		if($('#page-'+j).hasClass("active")) {
			
			$('#page-'+j).removeClass("active");
			$('#list'+j).removeClass("active");
			$('#page-'+j).addClass("hidden");
			p = parseInt(j)+1;
			$('#page-'+p).addClass("active");
			$('#list'+p).addClass("active");
			$('#page-'+p).removeClass("hidden");
			if(p == sectionId)
				$('#next').addClass('disabled');
			break;
		}
	}
}

/**
 * @param c		-	subsection no
 * @param v		-	no of tabs
 * @param p		-	tab to be shown
 */
function showTab(c, v, p) {	
	
	for (j = 1; j <= v; j++) {
		$('#tab-'+c+'-'+j).addClass("hidden");
		$('#tablist-'+c+'-'+j).removeClass("active");
	}
	$('#tablist-'+c+'-'+p).addClass("active");
	$('#tab-'+c+'-'+p).removeClass("hidden");
	$('#tab-'+c+'-'+p).focus();
}

function loadSection2_2() {
	
	
	var cp = null;
	
	$.ajax({
		type : "GET",
		url : serverURL + "users/" + userId
				+ "/sections/" + 2 + "/subsections/"
				+ 2 + "/" + "3rdSecdata/1",
				
		contentType : "application/json",
		
		dataType : "json",
		
		success : function(data) {
			
			
		if(data.length > 1) {
			
			$('#submit1').addClass('hidden');
			
			
			cp1 = data[1].response;
			cp1 = cp1.replace(/\\n/g, '');
			cp = cp1.split(",");
			
			for (j = 0; j < (cp.length); j++) {
				
				
				
				str = cp[j].split("_");
				
				str[1] =str[1].replace(/#@@#/g, ",");
				
				
				if(str[0] == '"1'){
					
					$('#bl-1').html(str[1]);
					$('#bl-1').prop("disabled", true);
				}else{
					
					$('#bl-'+str[0]).html(str[1]);
					$('#bl-'+str[0]).prop("disabled", true);
				}
				
				
			}
		}
		}, //end of success function for db_data
	  	
	  	
	  	error: function() {
	  		alert("Error: server encountered an internal error. Please try again after some time ");
			  
		  } 
	
	});
}

var p2_2 = '';
function submitSection2_2() {
	
	
	
	formData = '';
	for (j = 1; j <= 12; j++) {
		
		
		if($('#bl-'+j).val() == ""){
			alert("Please fill in all fields");
			return false;
		}
	else {
		
			
			if($('#bl-'+j).val().includes(",")){
				p2_2 = $('#bl-'+j).val().replace(/,/g, "#@@#");
			}
			else {
				p2_2= $('#bl-'+j).val();
			}
		formData +=j+'_'+p2_2 + ',';
		$('#bl-'+j).prop("disabled", "disabled");	
		
		}
	}
	

	var section_id;
	var sub_section_id;
	var version_id;
	var response;
	var category_id;
	var table3arr1 = JSON.stringify(formData)
	
	
	var Indata = {
			userId : userId,
			section_id : 2,
			sub_section_id : 2,
			version_id : 1,
			response : table3arr1,
			category_id : 'null'
		};
	
	
	var myJSON = JSON.stringify(Indata);
	//rest call storeing 6.1 data type
	
	$.ajax({
		type : "POST",
		url : serverURL + "users/" + userId + "/sections/" + 2
				+ "/subsections/" + 2 + "/" + "3rdSecdata/1",
		data : myJSON,
		contentType : "application/json",
		dataType : "json",
		
		success : function(data) {
			
			sessionStorage.setItem("currentSectionDisplay", "2.2");
			window.location.reload();
			$('#submit1').addClass('hidden');
		},
		
		error : function() {
			alert("Error: server encountered an internal error. Please try again after some time ");
          
		}
	});
}


function download4_5(){
	var tab_text = '<table id="table245">';
    var textRange; 
    var j = 0;
    
    tab_text = tab_text +"<tr><td>"+"Questions to examine your depressive thoughts"+"</td><td>"+"My favourite questions"+"</td></tr>"+
	"<tr><td>"+"Have I had any experiences that show that this thought is not completely true all the time?"+"</td><td>"+data_array[0]+"</td></tr>"+
    "<tr><td>"+"If my best friend or someone I loved had this thought, what would I tell them?"+"</td></tr>"+
    "<tr><td>"+"f my best friend or someone who loves me knew I was thinking this, what would they say to me?"+"<br>"+
    "What evidence would they point out to me that would suggest that my thoughts were not 100% true?"+"</td></tr>"+
    "<tr><td>"+"When I felt this way in the past, what did I think about that helped me to feel better?"+"</td></tr>"+
    "<tr><td>"+"What have I learned from prior experiences that could help me now?"+"</td></tr>"+
    "<tr><td>"+"Five years from now, if I look back at this situation, will I look at it any differently?"+"</td></tr>"+
    "<tr><td>"+"When I am not feeling this way, do I think about this type of situation any differently?"+"</td></tr>"+
    "<tr><td>"+"Are there any strengths or positives in me or the situation that I am ignoring?"+"</td></tr>"+
    "<tr><td>"+"Am I jumping to any conclusions when I do not really have much evidence?"+"</td></tr>"+
    "<tr><td>"+"What is the effect of thinking this way?"+"</td></tr>"+
    "<tr><td>"+"What is an alternative way of looking at this situation and what would the effect of that be?"+"</td></tr>"+
    "<tr><td>"+"What are the advantages and disadvantages of thinking this way?"+"</td></tr>"+
    "<tr><td>"+"What is the worst that can happen and how can I deal with that?"+"</td></tr>"+
    "<tr><td>"+"Am I confusing a thought with a fact?"+"</td></tr>"+
    "<tr><td>"+"Am I responding and concluding based only on how I am feeling?"+"</td></tr>";
    
    tab_text = tab_text + "</table>";
    tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, "");             //remove if u want links in your table
    tab_text = tab_text.replace(/<img[^>]*>/gi,"");                 // remove if u want images in your table
    tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, "");    // reomves input params

    downlodExcel(tab_text);
}