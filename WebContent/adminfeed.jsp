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

	userId = "" + <%=request.getParameter("userid") %>;

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
	
	var out='<strong><h3>' + '&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Summary and Review' + '</h3></strong>' + '<br>';
	out += "<hr>"
	var a = 1;
	
	$.ajax({
		  type: "GET",
		  url: serverURL + "users/summary/"+  userId + "/allsections",
		  success: function(data){
			    myFunction(data);
			    
		  },
		  error: function() {
				alert("error");
		  }
	});
	
	function myFunction(arr){
		for(var each in arr)
		{
		
		out += '<b><h4>'+ "&emsp;Section"+ a + '</b></h4>';
		if(arr[each].fname){
		out +='<b><h5>'+ "&emsp;&emsp;Summary: " + '</b></h5>' +  '<p><h5>'+ '&emsp;&emsp;&emsp;'+  arr[each].fname+'</h5></p>';
		out += '<b><h5>'+ "&emsp;&emsp;Review: " + '</b></h5>' + '<p><h5>' + '&emsp;&emsp;&emsp;' +  arr[each].name + '</h5></p>';
		}else{
			out +='<b><h5>'+ "&emsp;&emsp;Summary: " + '</b></h5>' +  '<p><h5>'+ '&emsp;&emsp;&emsp;'+  "No data"+'</h5></p>';
			out += '<b><h5>'+ "&emsp;&emsp;Review: " + '</b></h5>' + '<p><h5>' + '&emsp;&emsp;&emsp;' +  "No data" + '</h5></p>';
		}
		out += '<hr>';
		a++;
		}
		$('#f').html(out);
	}
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
	<nav class="navbar navbar-inverse navbar-static-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header col-md-9">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand active" href="index.jsp">PUSH-D</a>
		</div>
		<div class="col-md-1" style="padding: 10px 10px 0px 25px;">
			<a href="viewUsers.jsp" type="button" class="btn btn-success"
				data-toggle="tooltip" data-placement="top" title="Home"><i
				class="glyphicon glyphicon-home"></i></a>
		</div>
		
		<div class="col-md-1" style="padding: 10px 0px 0px 5px;">
			<a href="adminWorkBook.jsp?userid=<%=request.getParameter("userid")%>" type="button" class="btn btn-success"
				data-toggle="tooltip" data-placement="top" title=""><i
				class="glyphicon ">Back</i></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse col-md-1" id="navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.jsp">Logout</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
		
	</div>
	
	
</nav>
<div id = "f"></div>
</body>	