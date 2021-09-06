	var ctx1 = document.getElementById("myChart1").getContext("2d");
	
	var pieData = [
	            {
			        value: 40,
			        color: "#FDB45C",
			        highlight: "#FFC870",
			        label: "Completed"
			    },
	            {
	                value: 60,
	                color:"#F7464A",
	                highlight: "#FF5A5E",
	                label: "Remaining"
	            }
	        ];

	var options =
	{
	    //Boolean - Whether we should show a stroke on each segment
	    segmentShowStroke : true,

	    //String - The colour of each segment stroke
	    segmentStrokeColor : "#fff",

	    //Number - The width of each segment stroke
	    segmentStrokeWidth : 3,

	    //Number - The percentage of the chart that we cut out of the middle
	    percentageInnerCutout : 70, // This is 0 for Pie charts

	    //Number - Amount of animation steps
	    animationSteps : 100,

	    //String - Animation easing effect
	    animationEasing : "easeOutBounce",

	    //Boolean - Whether we animate the rotation of the Doughnut
	    animateRotate : true,

	    //Boolean - Whether we animate scaling the Doughnut from the centre
	    animateScale : false,

	}
	
	$(document).ready(function() {
	
		var myPieChart = new Chart(ctx1).Pie(pieData,options);
		
		$.ajax({
			  type: "GET",
			  url: serverURL + "users/" + userId,
			  success: function(data){
				  
		 		  $("#user-name").append(data['fname']);
		 		 $('#chk0').addClass("hidden");
		 		  if(data['agreed'] == "true") {
					  $("#agree").prop("disabled", "disabled");
					  $('#list0').removeClass("btn-primary");
				  	  
				  	  
					  for(i=0; i<=3; i++) {
				  		  $('#list'+i).prop("disabled", false);
				  		  $('#glyph'+i).removeClass('fa fa-circle-o');
						  $('#glyph'+i).addClass("fa fa-dot-circle-o");
				  		  $('#glyph'+i).css('color','green');
				  	  }
					  count = 4;
				  	  
					  $('#chk').attr("title", "Hello");
					  
					  if(data['checkpoint'] == "true") {
			 			  $('#chk1').addClass("hidden");
			 			  $('#chk2').addClass("hidden");
			 			  $('#chk3').removeClass("hidden");
			 			 $('#chk0').addClass("hidden");
			 			  
			 			 $.ajax({
			 				  type: "GET",
			 				  url: serverURL + "users/" + userId + "/currSubSection",
			 				  success: function(data){
			 			
			 					  	sectionId = data['currentSection'];
			 					  	
			 					  	$.cookie("sectionId", sectionId);
			 				        $.cookie("subsectionId", data['currentSubSection']);
			 				  
			 				  },
			 				  error: function() {
			 					  alert("Error occured due to " + serverURL + "users/" + userId + "/currSubSection");
			 					  
			 				  } 
			 			});
			 		  }
			 		  else {
			 			  $('#chk1').addClass("hidden");
			 			  $('#chk2').removeClass("hidden");
			 			  $('#chk3').addClass("hidden");
			 			 $('#chk0').addClass("hidden");
			 		  }
		 		  }
			  },
			  error: function() {
				  alert("Error occured due to " + serverURL + "users/" + userId);
				  
			  }
		});
	});
	
	var count = 0;
	
	function next() {
		j = count;
		if(j < 3) {
		
			for(i=0; i<=count; i++) {
				$("#list"+i).removeClass("btn-primary");
				$("#list"+i).addClass("btn-default");
				$('#'+i).addClass("hidden");
				$('#list'+i+">i").css("color", "green");
			}
			
			$("#list"+j).removeClass("btn-primary");
			$("#list"+j).addClass("btn-default");
			$('#glyph'+j).removeClass('fa fa-circle-o');
			$('#glyph'+j).addClass('fa fa-dot-circle-o');
			$('#glyph'+j).css('color','green');
			$('#'+j).addClass("hidden");
			j=j+1;
			$('#'+j).removeClass("hidden");
			$("#list"+j).prop("disabled", false);
			$("#list"+j).addClass("btn-primary");
			count=j;
		}
		if(j==3)
		{
		$('#chk1').addClass("hidden");
		$('#chk0').removeClass("hidden");
		}
	}
	
	//redirecting correct page 
	function nextSectionPage() {
		
		
		alert("10%");
	}
	
	
	
	function showContent(id) {
	
		for(i=0; i<=count; i++) {
			$("#list"+i).removeClass("btn-primary");
			$("#list"+i).addClass("btn-default");
			$('#'+i).addClass("hidden");
			$('#list'+i+">i").css("color", "green");
		}
		$('#'+id).removeClass("hidden");
		$("#list"+id).prop("disabled", false);
		$("#list"+id).addClass("btn-primary");
		$('#list'+id+">i").css("color", "white");
	}
	
	function agreeButton() {	
		
		$.ajax({
			  type: "POST",
			  url: serverURL + "users/" + userId + "/true",
			  success: function(data){
				  location.reload();
			  },
			  error: function() {
				  alert("Error occured due to " + serverURL + "users/" + userId + "/true");
				 
			  }
		});	
	}
	
