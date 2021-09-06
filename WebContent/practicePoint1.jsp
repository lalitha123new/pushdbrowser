<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Sub-Section</title>

	<!-- Bootstrap -->
	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="js/values.js"></script>
    <script src="js/inc.js"></script>
    <script src="bs/js/bootstrap.min.js"></script>
	
    <script type="text/javascript">
	    
    	history.forward();
    
    	$(function(){
    		$('#header').load("navHeader.html");
    		$('#summary').load("summary.html");
    		$('#next').load("nextButton.html");
    		$('#progress').load("progressBar.html");
	        $("#includedContent").load("sectionSideNav2.html"); 
	    });
		
    </script>
<style>
.check {
input[type=checkbox].css-checkbox { 
position: absolute;  overflow: hidden; 
 clip: rect(0 0 0 0);  
 height:1px;
   width:1px;  
   margin:-1px;  
   padding:0; 
   border:0; }
    }
   
    .lite-red-check {
    background-color:red;
    }
    </style>
</head>
<body class="bgcolor" oncontextmenu="return false">
<div class="row-fluid">
	<div id="header">
	</div>
	
	<div id="summary">
	</div>
	
	<div class="container-fluid" style="height: 100%">
	<div class="row">
		<div class="col-md-1">
			<ul class="nav nav-pills nav-stacked text-center" id="includedContent">
			</ul>
		</div>
		<div class="col-md-11">
			<div class="">
				<div id="progress">
				</div>
				<div class="col-md-2 col-sm-4">
					<img class="img-responsive" alt="" src="images/ss-pp.jpg">
				</div>
				<div class="col-md-10 col-sm-8">
					<div class="row">
						<div class="col-md-10">
						<div id=""><h3><b>Understanding Depression</b></h3></div>
							<h3><b id="subsection-name"></b></h3>
						</div>
						<div class="col-md-2">
						</div>
					</div>
					<p id="subsection-desc" class="text-justify">
					<p>				
					<hr style="border-bottom: 1px solid black;">
					<h3 id="exercise-title"></h3>
					<p id="exercise-desc" class="text-justify">
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-10">
							<form id="myForm">
								<ul id="section-ques" class="list-group">
								</ul>
								<button id="submit" type="button" onclick="checkpoint()" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</div>
				</div>		
			</div>
			<br>
			<div class="clearfix"></div>
			<br>
			<br>
		
			<div class="col-md-9">
			</div>
			<div id="next" class="col-md-2 hidden">
			</div>
		</div>	<!-- col-md-11 -->
	
	
	
	</div>	<!-- row -->
		
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header modal-header-success">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body text-justify">
					<p id="correct" class="hidden"><strong>Good!</strong> You picked <strong id="checked1"></strong> Out of 16 symptoms that came up in Neena's story. <br><strong>NOTE</strong> : Symptoms in red font are not the symptoms which Neena reported</p>
					<p id="wrong" class="hidden"><strong>OOPS!</strong> You picked <strong id="checked2"></strong> Out of 16 symptoms that came up in Neena's story. <br><strong>NOTE</strong> : Symptoms in red font are not the symptoms which Neena reported</p>
				</div>
				<div class="modal-footer">
					<button id="myInput" type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	<br>
	</div>
	<script type="text/javascript">
	
		$(document).ready(function(){

			$.ajax({
				  type: "GET",
				  url: serverURL + "users/" + userId + "/currSubSection",
				  success: function(data){
			
					  	sectionId = data['currentSection'];
						subsectionId = data['currentSubSection'];
		
						activeSectionId = data['activeSection'];
						activeSubSectionId = data['activeSubSection'];
			
						
						
						$.ajax({
							  type: "GET",
							  url: serverURL + "sections/" + activeSectionId + "/subsections/" + activeSubSectionId + "/practice1",
							  success: function(data){
								  
								  $("#subsection-name").html(activeSectionId+"."+activeSubSectionId+" "+data['subSectionName']);
								  $("#subsection-desc").html(data['subSectionDesc']);
								  $("#exercise-title").html(data['exerciseTitle']);
						          $("#exercise-desc").html(data['exerciseDesc']);
							        
						          myFunction(data['questions']);
						          
						          disableCheckBoxesWhenReviewing(data['questions'].length);
									
							  },
							  error: function() {
								  alert("Error: server encountered an internal error. Please try again after some time ");
								 
							  }
						});
					    
				  },
				  error: function() {
					  alert("Error: server encountered an internal error. Please try again after some time ");
					 
				  } 
			});
			
			function disableCheckBoxesWhenReviewing(length)
			{
				flag = false; // set this to true if he is reviewing
				if(sectionId == activeSectionId)
				{
					if(subsectionId == activeSubSectionId)
					{
						//if not reviewing	data['questions']
					}
					else
					{
						flag = true;	
					}
				}
				else
				{
					flag = true;	
				}
				
				//flag is true then disable the checkboxes
				if(flag == true)
				{
					checkpoint();
					for(i=1; i<=length; i++)
					{
						$('#' + i).prop("disabled", "disabled");
					}
				}
			}
			
			function myFunction(arr) {
			    
		    	var out = "";
			    for(i = 0; i < arr.length; i++) {
			        out +=  '<li class="list-group-item"> <div class="checkbox"><label id="l' + arr[i].quesNo + '"> <input type="checkbox" id="' + arr[i].quesNo + '"   name="check" value="' + arr[i].quesNo + '">' + 
			        						arr[i].ques + '</label>' + 
		        					  '</div>' + 
		       					  '</li>'
		    				;
    				ans.push(arr[i].ans);
				}	    
			    
			    $("#section-ques").html(out);
			}
		});
		
		var ans = [];
		var count = 0;
		
		function checkpoint() {
			for ( j = 1; j <= i; j++) {
				if(("-"+$('#' + j).is(":checked")) == ("-"+ans[(j-1)]) && ans[(j-1)] == "true") {			//ans[(j-1)]
					count++;
				}	
				$('#' + j).prop("disabled", "disabled");
				
				if(ans[(j-1)] == "true"){
					$('#l' + j).css("color", "green");
				   $('#l' + j).append('<span class="glyphicon glyphicon-ok" style="color:green"></span>');
				}
				else {
					
					$('#l' + j).css("color", "red"); 
				    $('#l' + j).append('<span class="glyphicon glyphicon-remove" style="color:red"></span>');
					    
				
				 
				}
				
			}
			
			if(count == 0)
				$('#wrong').removeClass("hidden");
			else
				$('#correct').removeClass("hidden");
			
			$('#checked1').html(count);
			$('#checked2').html(count);
			$('#submit').addClass("hidden");
			$('#myModal').modal('show');
			
			var formData = $("#myForm").serialize();
			
			$("#next").removeClass('hidden');
			
					
		}
	</script>
	
</body>
</html>