/**
 * Not for Workbook
 */

function discovery5(arr) {
	var out = "";
    for(i = 0; i < arr.length; i++) {
        out +=  '<li class="list-group-item"> <div class="checkbox"><label> <input type="checkbox" id="' + arr[i].quesNo + '" name="check" value="' + arr[i].quesNo + '">' + 
        						arr[i].ques + '</label>' + 
    					  '</div>' + 
   					  '</li>'
				;
		ans.push(arr[i].ans);
	}	    
    
    $("#section-ques").html(out);
}

var ans = [];
var count = 0;

function checkpoint() {
	str = '';
	formData = '';
	flag = false;
	for ( j = 1; j <= i; j++) {
		
		if($('#' + j).is(":checked")) {
			formData += 'check=' + j + '&';		
			count ++;
		} 
			
		if(("-"+$('#' + j).is(":checked")) == ("-"+ans[(j-1)])) {
			if(ans[(j-1)] == "true") {
				formData += 'suicide=true&';
				flag = true;
			}
		}	
		$('#' + j).prop("disabled", "disabled");
	}
	
	if(count == 1 && flag == false)
		str = 'feedback1';
	else if(count >= 2 || flag == true)
		str = 'feedback2';
	else
		str = 'feedback3';
	
	
	$('#'+str).removeClass("hidden");
	
	$('#checked').html(count);
	$('#submit').addClass("hidden");
	$('#myModal').modal('show');

	$.ajax({
		  type: "POST",
		  url: serverURL + "users/" + userId + "/sections/" + sectionId + "/subsections/" + subsectionId +"/discovery5",
		  data: formData,
		  success: function(data){ 
			  $("#next").removeClass('hidden');		   
		  },
		  error: function() {
			  alert(serverURL + "users/" + userId + "/sections/" + sectionId + "/subsections/" + subsectionId +"/discovery5");
		  }
	});
	
}