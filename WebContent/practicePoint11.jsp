<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="refresh"
	content="<%=session.getMaxInactiveInterval()%>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID")%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Sub-Section</title>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	if (session.getAttribute("USERID") == null) {
		response.sendRedirect(request.getContextPath() + "/sessionExpired.jsp");
	}
%>
<!-- Bootstrap -->
<link href="bs/css/bootstrap.min.css" rel="stylesheet">
<link href="fa/css/font-awesome.min.css" rel="stylesheet">

<script src="js/externalFiles/xlsx.core.min.js"></script>
<script src="bs/js/jquery-2.1.1.min.js"></script>
<script src="bs/js/jquery.cookie.js"></script>
<script src="js/values.js"></script>
<script src="bs/js/bootstrap.min.js"></script>
<script src="js/inc.js"></script>
<script src="js/practice11.js"></script>




<style type="text/css">
.table>thead>tr>th {
	vertical-align: middle;
	text-align: center;
}

.checkbox {
	margin-top: 0px;
	margin-bottom: 0px;
}

.newtdclass {
	border: 1px solid #FFB74D;
}

.radio-toolbar label {
	display: block;
	padding: 4px 4px;
	font-size: 14px;
}

.radio-toolbar input[type="radio"].greenradio:checked {
	background-color: green;
}

.button-activity {
	background-color: white;
	height: 35px;
	width: 45px;
	border-color: black;
}




</style>
<script type="text/javascript">
	history.forward();
	$(function() {
		$('#header').load("navHeader.html");
		$('#summary').load("summary.html");
		$('#next').load("nextButton.html");
		$('#progress').load("progressBar.html");
		$("#includedContent").load("sectionSideNav2.html");
	});
</script>
</head>
<body class="bgcolor" oncontextmenu="return false">
	<div id="header"></div>

	<div id="summary"></div>

	<div class="container-fluid" style="height: 100%">
		<div class="row">
			<div class="col-md-1">
				<ul class="nav nav-pills nav-stacked text-center"
					id="includedContent">
				</ul>
			</div>
			<div class="col-md-11">
				<div class="">
					<div id="progress"></div>
					<div class="col-md-2 col-sm-4">
						<img class="img-responsive" alt="" src="images/ss-pp.jpg">
					</div>
					<div class="col-md-10 col-sm-8">
						<div class="row">
						<div id=""><h3><b>Activate: Baby steps to move ahead</b></h3></div>
							<h3>
								<b id="subsection-name"></b>
							</h3>
							<div class="clearfix"></div>
							<div id="pages"></div>
							<div id="pages1"></div>
							<nav id="page" class="text-center"></nav>
						</div>
					</div>



				</div>
				<br> <br> <br>
				<div class="clearfix"></div>
				<br>
				<div class="col-md-2 col-sm-4"></div>

				
				<div class="clearfix"></div>
				<br>
				<div class="col-md-2 col-sm-4"></div>
				
			</div>
		</div>
		<div class="row">

			<div class="col-md-3"></div>
			<div class="col-md-6">
			
			
			</div>
			<div id="next" class="col-md-2 hidden"></div>
			
		</div>

		<div class="clearfix"></div>
		<br> <br> <br>
	</div>

	</div>
	</div>

	<div class="clearfix"></div>
	<br>
	<br>
	<br>
	<script type="text/javascript">
		var i = 0;
		var formData = "";

		$(document).ready(function() {

							$.ajax({
										type : "GET",
										url : serverURL + "users/" + userId+ "/currSubSection",
										success : function(data) {
											
											sectionId = data['currentSection'];
											subsectionId = data['currentSubSection'];
											activeSectionId = data['activeSection'];
											activeSubSectionId = data['activeSubSection'];
											

											$.ajax({
														type : "GET",
														url : serverURL
																+ "sections/"
																+ activeSectionId
																+ "/subsections/"
																+ activeSubSectionId
																+ "/practice3",
														success : function(data1) {

															$("#subsection-name").html(
																			activeSectionId
																					+ "."
																					+ activeSubSectionId
																					+ "&emsp;"
																					+ data1[0]['subSectionName']);
															practice11(data1);
															$('#next').addClass("hidden");
														},
														error : function() {
															alert("Error: server encountered an internal error. Please try again after some time ");
															
															
														}
													});
										},
										error : function() {
											alert("Error: server encountered an internal error. Please try again after some time ");
											
										}
									});

							

						});
	</script>

</body>
</html>