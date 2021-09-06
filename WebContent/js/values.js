//EHRC APP 
// var serverURL = "http://ehrcapps.iiitb.ac.in/pushd/webapi/";
//var serverURL = "http://113.30.156.80:8080/pushd/webapi/";

//LocalServer
 var serverURL = "http://localhost:8080/pushd/webapi/";

//AWS_server
//var serverURL = "http://13.232.16.87:8080/pushd/webapi/";

//nimhans server
 //var serverURL = "https://echargementalhealth.nimhans.ac.in/pushd/webapi/";
 
//var serverURL = "https://echargementalhealth.nimhans.ac.in/pushd/webapi/";
//var serverURL = "http://13.232.16.87:8080/pushd/webapi/";

var userId = $.cookie('userId');
var sectionId = $.cookie('sectionId');
var subsectionId = $.cookie('subsectionId');
var activeSectionId = $.cookie('activeSectionId');
var activeSubSectionId = $.cookie('activeSubSectionId');

var nextURL;
var practice9version = 1;
var practice9new = true;
function setMode(str,ui) {
	
	$.ajax({
		  type: "PUT",
		  url: serverURL + "users/" + ui + "/mode/" + str,
		  success: function() {
			 
		  }
	});
}
function setFlag(str) {
	
	$.ajax({
		  type: "PUT",
		  url: serverURL + "users/" + userId + "/flag/" + str,
		  success: function() {
			  
		  }
	});
}

function setStatus(str) {
	
	$.ajax({
		  type: "PUT",
		  url: serverURL + "users/" + userId + "/status/" + str,
		  success: function() {
			  if(str == "true") {
				  $('#button2').addClass("btn-warning");
					getNextSubSection2();
			  }
		  }
	});
}

function setOptionalStatus(str) {
	
	$.ajax({
		  type: "PUT",
		  url: serverURL + "users/" + userId + "/status/" + str,
		  success: function(data) {
			  if(str == "true") {
				  $('#button3').addClass("btn-warning");
					getNextSubSection3();
			  }
		}
	});
}

function getNextSubSection(sid, ssid) {
	
	
	
	var csid = 0;
	var cssid = 0;
	
	getUrl = serverURL + "users/" + userId + "/next/" + sid + "/" + ssid;
	
	
	
	ajaxGetPage(getUrl,csid,cssid);
}
function getNextSubSection2() {
	
	
	
	$.ajax({
		  type: "GET",
		  url: serverURL + "users/" + userId + "/currSubSection",
		  success: function(data){
			  sid = data['currentSection'];
			  ssid = data['currentSubSection'];
			  asid = data['activeSection'];
			  assid = data['activeSubSection'];
			  
			
			  if((asid == 3 && assid == 2)){
				  
			     getUrl = serverURL + "users/" + userId + "/view/" + 3 + "/" + 3;
			  
			  }else if((asid == 3 && assid == 6)){
				  
				  getUrl = serverURL + "users/" + userId + "/view/" + 3 + "/" + 7;
			  }else{
				  
				  if((asid == 10) && (assid== 4)){
					
					  getUrl = serverURL + "users/" + userId + "/view/" + asid + "/" + assid;
					  
				  }else{
					
					  getUrl = serverURL + "users/" + userId + "/view/" + asid + "/" + assid;
				  }
				   
			  }
				
			  
			  
			  if(sid == asid && ssid == assid)
				  	getNextSubSection(sid, ssid);
		  		else
			  		ajaxGetPage(getUrl,sid,ssid); 		  
		  }
	});
}

function getNextSubSection3() {
	
	
	
	$.ajax({
		  type: "GET",
		  url: serverURL + "users/" + userId + "/currSubSection",
		  success: function(data){
			  sid = data['activeSection'];
			  ssid = data['activeSubSection'];
			 
			  var csid = data['currentSection'];
			  var cssid = data['currentSubSection'];
			 
			  
			 
			  getUrl = serverURL + "users/" + userId + "/optional/" + sid + "/" + ssid;
			  
			 
			  
			  ajaxGetPage(getUrl,csid,cssid);			  
		  }
	});
}

function ajaxGetPage(getUrl,csid,cssid) {
	 
	
	$.ajax({
		  type: "GET",
		  url: getUrl,
		  success: function(data){
	
			  	str = data['link'].link;
			  	activeSectionId = data['link'].sId;
				activeSubSectionId = data['link'].ssId;
				
				 
			    
				
				
				if((activeSectionId == 3) && (activeSectionId == 2)) {
					practice9new = true;
				}
					
				
				
				if(str == "section") {
					
					
					if(sectionId != (activeSectionId-1)) {
						
					if(csid < 11){
						window.location.href = "section.jsp";
						}else{
								window.location.href = "landing_page.jsp";
						}
					}
				
					$('#summaryModal').modal('show');
					$.get( serverURL + "sections", function( data ) {
						
						for(i=0;i<data.length;i++)
							{
							
							if(sectionId==data[i].sectionId)
								{
								
								var output1 = data[i].sectionName;
								}
							}
						$('#date').html(output1);
					
					});
				
					var d = new Date();

					var month = d.getMonth()+1;
					var day = d.getDate();

					var output = d.getFullYear() + '/' +
					    (month<10 ? '0' : '') + month + '/' +
					    (day<10 ? '0' : '') + day;
					
					
					
					if($('#date').html() == output1) {
						
						$('#summaryModal').modal({
				        	  backdrop: 'static',
				        	  keyboard: false
		      		 	});
						$('#start').attr('href', 'redirect.jsp');	
					}
					else {
						//window.location.reload();
					}
					
					
				}	
				else if(str == "optional/section") {
					
					
					
					if(csid < 11){
							window.location.href = "section.jsp";
						}else{
								window.location.href = "landing_page.jsp";
						}
					
					
				}	
				else {
					
					if(str == "check3")
		        		str = 'checkPoint3.jsp';
				 	
					else if(str == "commit")
				 		str = 'commitPoint.jsp';
				 	
					else if(str == "discovery3")
		        		str = 'discPoint3.jsp';
					
					else if(str == "discovery4")
		        		str = 'discPoint4.jsp';
					
					else if(str == "discovery5")
				 		str = 'discPoint5.jsp';
					
					else if(str == "discovery6")
				 		str = 'discPoint6.jsp';
					
					else if(str == "discovery7")
				 		str = 'discPoint7.jsp';
					
					else if(str == "discovery8")
				 		str = 'discPoint8.jsp';
					
					else if(str == "demo")
				 		str = 'demoPoint.jsp';
					
					else if(str == "knowledge2")
		        		str = 'knowledgePoint2.jsp';
					
					else if(str == "knowledge3")
		        		str = 'knowledgePoint3.jsp';
					
					else if(str == "knowledge4")
		        		str = 'knowledgePoint4.jsp';
					
					else if(str == "letter")
		        		str = 'letter.jsp';
				 	
					else if(str == "video")
		        		str = 'video.jsp';
				 	
					else if(str == "practice1")
		        		str = 'practicePoint1.jsp';
				 	
					else if(str == "practice2")
		        		str = 'practicePoint2.jsp';
				 	
					else if(str == "practice3")
		        		str = 'practicePoint3.jsp';
				 	
					else if(str == "practice4")
				 		str = 'practicePoint4.jsp';
				 	
					else if(str == "practice5")
				 		str = 'practicePoint5.jsp';
				 	
					else if(str == "practice6")
				 		str = 'practicePoint6.jsp';
				 	
					else if(str == "practice7")
				 		str = 'practicePoint7.jsp';
				 	
					else if(str == "practice8")
				 		str = 'practicePoint8.jsp';
				 	
					else if(str == "practice9")
				 		str = 'practicePoint9.jsp';
				 	
					else if(str == "practice10")
				 		str = 'practicePoint10.jsp';
				 	
					else if(str == "practice11")
				 		str = 'practicePoint11.jsp';
				 	
					else if(str == "practice12")
				 		str = 'practicePoint12.jsp';
				 	
					else if(str == "practice15")
				 		str = 'practicePoint15.jsp';
				 	
					else if(str == "toolbox")
		        		str = 'toolBox.jsp';
				 	
					else if(str == "tool2")
		        		str = 'toolBox2.jsp';
				 	
					else if(str == "tool3")
		        		str = 'toolBox3.jsp';
				 	
					else if(str == "tool4")
		        		str = 'toolBox4.jsp';
				 	
					else if(str == "tool5")
		        		str = 'toolBox5.jsp';
				 	
					else if(str == "optional/discovery")
		        		str = 'optionalPracticePoint8.jsp';
					
				 	else if(str == "optional/knowledge2")
		        		str = 'optionalKnowledgePoint2.jsp';
				 	
				 	else if(str == "optional/knowledge3")
		        		str = 'optionalKnowledgePoint3.jsp';
				 	
				 	else if(str == "optional/practice6")
		        		str = 'optionalPracticePoint6.jsp';
				 	
				 	else if(str == "optional/practice8")
		        		str = 'optionalPracticePoint8.jsp';
				 	
				 	else if(str == "optional/practice13")
		        		str = 'optionalPracticePoint13.jsp';
				 	
				 	else if(str == "optional/practice14")
		        		str = 'optionalPracticePoint14.jsp';
				 	
				 	else if(str == "optional/toolbox")
		        		str = 'optionalToolBox.jsp';
				 	
				 	else if(str == "optional/tool3")
		        		str = 'optionalToolBox3.jsp';
				 	
				 	else if(str == "optional/tool4")
		        		str = 'optionalToolBox4.jsp';
				 	
				 	else if(str == "optional/tool6")
		        		str = 'optionalToolBox6.jsp';
				 	
				 	window.location.href = str;
		 		}
		  },
		  error: function() {
			  //alert("Error occured due to " + serverURL + "users/" + userId + "/next");
			  
		  } 
	});
}	

function showLogout() {
	
	$('#next-session').removeClass("hidden");
	$('#logoutBtn').prop("disabled", false);
}

function getPage(n) {
	
	if($('#next').hasClass("hidden")) {
		alert("SORRY!!! You can not go to other sections without submitting this exercise")
	}
	else {
		
		sectionId = n;
		$.cookie('activeSectionId', sectionId);
		
		$.ajax({
			  type: "GET",
			  url: serverURL + "users/" + userId + "/sections/" + sectionId + "/view",
			  success: function(data){
				  $.cookie('activeSectionId', activeSectionId);
				  $.cookie('activeSubSectionId', 0);
				  
				  activeSectionId = data['activeSection'];
				  activeSubSectionId = data['activeSubSection'];
				  sectionId = data['currentSection'];
				  subsectionId = data['currentSubSection'];
				  
				  if(activeSectionId > 10)
					  window.location.replace("section3.jsp");
				  else if(activeSectionId == sectionId)
					  window.location.replace("redirect.jsp");
				  else
					  window.location.replace("redirect2.jsp");
				  
				 
			  },
			  error: function() {
				  //window.location.href = "error.html";
			  }
		});
	}
}

function nextPage() {
	 
	$.ajax({
		  type: "GET",
		  url: $.cookie('nextURL'),
		  success: function(data){
			  if(data['sectionName'].contains("Discovery"))
				  window.location.href = discPoint2.html;
			  else if(data['sectionName'].contains("Knowledge"))
				  window.location.href = knowledgePoint.html;
			  else if(data['sectionName'].contains("Check"))
				  window.location.href = checkPoint2.html;
			  else if(data['sectionName'].contains("Summarizing"))
				  window.location.href = toolBox.html;
			  
			  
		  },
		  error: function() {
			  //window.location.href = "error.html";
		  }
	});
}

var formData = "";


function logout() {
	
	formData = 'date='+$('#datepicker').val()+'&time='+$('#timepicker').val();


	var mydate=$('#datepicker').val();
	var mytime=$('#timepicker').val();
	
	
	if(($('#datepicker').val() === "") || ($('#timepicker').val() === "")){
		alert("Please select date and time");
		return false;
		}

	
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
	var h=today.getHours();
    var m=today.getMinutes();
    
    var currtime=h+':'+m;	
    
	if(dd<10){
	    dd='0'+dd;
	} 
	if(mm<10){
	    mm='0'+mm;
	} 
	var today = dd+'-'+mm+'-'+yyyy;
	
	
	var arr = mytime.split(':');
	var myhour = parseInt(arr[0]);
	var mymin = parseInt(arr[1]);
	var mymeri = arr[1];
	
	if((mymeri=="00 PM") || (mymeri=="30 PM")){
		myhour=myhour+12;
		
	}
	if(mydate==today){
		if((myhour-h)<6){
			
			
			alert("Please  select  a time-slot   that is at least  after  6  hours from now.");
				
			
		}
			else if(myhour==h){
				if(mymin<=m){
					
					alert("Please  select  a time-slot   that is at least  after  6  hours from now.");
					
				
				}
				else
					{
					$.ajax({
						  type: "POST",
						  url: serverURL + "users/" + userId + "/nextSession",
						  data: formData,
						  success: function(data){
							  if(data == null) {
								 
								  $.cookie("userId", null);
								  $.cookie("sectionId", null);
								  $.cookie("subsectionId", null);
								 
								  window.location.replace("logout.jsp");
							  }
								  
							  
						  }
					});
					}
			}
			else
				
			$.ajax({
				  type: "POST",
				  url: serverURL + "users/" + userId + "/nextSession",
				  data: formData,
				  success: function(data){
					  if(data == null) {
						  
						  $.cookie("userId", null);
						  $.cookie("sectionId", null);
						  $.cookie("subsectionId", null);
						  window.location.replace("logout.jsp");
					  }
						  
					  
				  }
			});
			
	}
	else
		{
		$.ajax({
			  type: "POST",
			  url: serverURL + "users/" + userId + "/nextSession",
			  data: formData,
			  success: function(data){
				  if(data == null) {
					  
					  $.cookie("userId", null);
					  $.cookie("sectionId", null);
					  $.cookie("subsectionId", null);
					  window.location.replace("logout.jsp");
				  }
					  
				  
			  }
		});
		
		}
	
	
	
	
}



//for downoad excel

function downlodExcel(tab_text){
	
	 //create new dom object
	 var parser = new DOMParser();
	 //convert tab_text(String) to HTMl_DOM_OBJECT
	 var wrapper = parser.parseFromString(tab_text, "text/html");
	
	
	 //wrapper.querySelector->The querySelector() method returns the first child element that matches a specified CSS selector(s) of an element
	 var csv = tableToCSV(wrapper.querySelector( "#table245" ));
	 
	
	  // Create a CSV Blob
	  var blob = new Blob( [ csv ], { type: "text/csv"} );

	  // Determine which approach to take for the download
	  if ( navigator.msSaveOrOpenBlob ) {
	    // Works for Internet Explorer and Microsoft Edge
	    navigator.msSaveOrOpenBlob( blob, "output.csv" );

	  } else {

	    // Attempt to use an alternative method
	    var anchor = document.body.appendChild(
	      document.createElement( "a" )
	    );
	    // If the [download] attribute is supported, try to use it
	    if ( "download" in anchor ) {
	      anchor.download = "output.csv";
	      anchor.href = URL.createObjectURL( blob );
	      anchor.click();
	    }

	  }
	
}

//new function for microsoftedge

function tableToCSV(tab_text) {
	
	// We'll be co-opting `slice` to create arrays
	var slice = Array.prototype.slice;
	
	  
	return slice.call( tab_text.rows ).map(function ( row ) {
	  return slice.call( row.cells ).map(function ( cell ) {
	    return '"t"'.replace( "t", cell.textContent );
	  }).join( "," );
	}).join( "\r\n" );

    }
