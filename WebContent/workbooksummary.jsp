<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>PUSH-D</title>
	
	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="css/workbook.css" rel="stylesheet">
	
	<script src="bs/js/jquery-2.1.1.min.js"></script>
	<script src="bs/js/jquery.cookie.js"></script>
	<script src="bs/js/bootstrap.min.js"></script>
	<script src="js/values.js"></script>
   	<script src="js/check3.js"></script>
    <script src="js/practice4.js"></script>
    <script src="js/practice6.js"></script>
    <script src="js/practice7.js"></script>
    <script src="js/practice10.js"></script>
    <script src="js/practice11.js"></script>
    <script src="js/practice15.js"></script>
    <script src="js/tool2.js"></script>
 	<script src="js/workbook.js"></script> 
	<script src="js/slimscroll.js"></script>
    <script type="text/javascript">



	history.forward();
	
    window.onload = function() {
		if (!navigator.userAgent.match('Macintosh')) {
			var element = document
					.querySelectorAll('.slimScroll');

			// Apply slim scroll plugin
			var one = new slimScroll(
					element[0],
					{
						'wrapperClass' : 'scroll-wrapper unselectable mac',
						'scrollBarContainerClass' : 'scrollBarContainer',
						'scrollBarContainerSpecialClass' : 'animate',
						'scrollBarClass' : 'scroll',
						'keepFocus' : true
					});

			// resize example
			// To make the resizing work, set the height of the container in PERCENTAGE
			window.onresize = function() {
				one.resetValues();
			}
		} else {
			document
					.write("For Mac users, this custom slimscroll styles will not be applied");
		}
	}
	
	
	var out='<strong><h3>' + '&emsp;Summary and Review' + '</h3></strong>' + '<br>';
	out += "<hr>"
	var a = 1;
	
		
							$.ajax({
								type : "GET",
								url : serverURL + "users/summary/"+ userId + "/allsections",
								
								
								success : function(data) {
		
		                            
	                                myFunction(data);
		                      }, error: function(e) {
			                     alert("Error occured due to "+e);
			                   
		                       }
	});

	
	function myFunction(arr){
		
		for(var each in arr)
		{
		out += '<b><h4>'+ "&emsp;Section"+ a + '</b></h4>';
		if(arr[each].fname){
		       out +='<b><h5>'+ "&emsp;&emsp;Summary: " + '</b></h5>' +  '<p><h5>'+ '&emsp;&emsp;&emsp;'+  arr[each].fname +'</h5></p>';
		       out += '<b><h5>'+ "&emsp;&emsp;Review: " + '</b></h5>' + '<p><h5>' + '&emsp;&emsp;&emsp;' +  arr[each].name + '</h5></p>';
		}else{
			  out +='<b><h5>'+ "&emsp;&emsp;Summary: " + '</b></h5>' +  '<p><h5>'+ '&emsp;&emsp;&emsp;'+  "No Data" +'</h5></p>';
			  out += '<b><h5>'+ "&emsp;&emsp;Review: " + '</b></h5>' + '<p><h5>' + '&emsp;&emsp;&emsp;' +  "No Data" + '</h5></p>';	
		}
		
		out += '<hr>'
		a++;
		}
		$('#f').html(out);
	}
	 $(function(){
		 $('#header').load("navHeader.html");
         $("#includedContent").load("sectionSideNav3.html"); 

     });
</script>
	<style>
		.truncate {
		    width: 150px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    display: inline-block;
		    text-decoration: none;
		}
		a:focus, a:hover {
		    color: #23527C;
		    text-decoration: none;
		}
	</style>
</head>
<body class="bgcolor" oncontextmenu="return false">
<div id="header">
</div>
<div class="container-fluid" style="height: 100%">
	<div class="row">
	<div id="includedContent" class="col-md-2"></div>
	<div class="col-md-10">
	<div id = "f"></div>
	</div>
	</div>
	</div>
	
	
</body>	