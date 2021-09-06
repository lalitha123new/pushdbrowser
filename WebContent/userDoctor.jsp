<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="pushd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin - Home</title>

<!-- Bootstrap -->
<link href="bs/css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/angular.js"></script>
<script src="bs/js/jquery-2.1.1.min.js"></script>
<script src="bs/js/jquery.cookie.js"></script>
<script src="js/values.js"></script>
<script src="js/inc.js"></script>
<script src="js/resetsections.js"></script>
<script src="js/checklist-model.js"></script>
</head>
<script type="text/javascript">
	$.getJSON(serverURL + "users/admin/" +
<%=request.getParameter("userid")%>
	, function(data) {
		
		myFunction(data);
	});
	
	function myFunction(arr) {
		var out = "";
		var i;
		
		$("#userName").html(arr.id);
		$("#name").html(arr.name);
		$("#fname").html(arr.fname);
		$("#gender").html(arr.gender);
		$("#age").html(arr.age);
		$("#mobileNumber").html(arr.mobileNumber);
		$("#education").html(arr.education);
		$("#maritalStatus").html(arr.maritalStatus);
		$("#livingArrangement").html(arr.livingArrangement);
		$("#significantOther").html(arr.significantOther);
		$("#mailId").html(arr.mailId);
		$("#nextSession").html(arr.nextSession);
		$("#noOfExercisesCompleted").html(arr.noOfExercisesCompleted);
		$("#currentSubSection").html(arr.currentSubSection);
		$("#noOfTimesLoggedIn").html(arr.noOfTimesLoggedIn);
		$("#noOfSectionsCompleted").html(arr.noOfSectionsCompleted);
		$("#currentSection").html(arr.currentSection);
		$("#remindersNeeded").html(arr.remindersNeeded);
		$("#lastPhoneCall").html(arr.lastPhoneCall);
		$("#nextCallDue").html(arr.nextCallDue);
		var sessionStats = arr.sessionStats;

		var i;
		var out;

		for (i = 0; i < sessionStats.length; i++) {

			

			out = "<tr><td>" + (i + 1) + "</td><td>"
					+ sessionStats[i].loginTime + "</td><td>"
					+ sessionStats[i].logoutTime + "</td><td>"
					+ sessionStats[i].lastActivity + "</td><td>"
					+ sessionStats[i].timeSpent + "</td><td>"
					+ sessionStats[i].smiley + "</td></tr>";

			$("#session_table").append(out);
		}
		

	}
</script>

</head>
<body class="bgcolor" oncontextmenu="return false"
	ng-controller="pushcontroller">
	<nav class="navbar navbar-inverse">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header col-md-9 col-sm-9">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand active" href="#">PUSH-D</a>
		</div>
		<div class="col-md-1 col-sm-1" style="padding: 10px 10px 0px 25px;">


			<a href="doctorUsers.jsp" type="button"
				class="btn btn-success pull-right" data-toggle="tooltip"
				data-placement="top" title="Home"><i
				class="glyphicon glyphicon-home"></i></a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse col-md-1 col-sm-1"
			id="navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<div class="container-fluid" style="height: 100%">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading" style="padding: 29px 15px;">
						<div class="panel-title pull-left">
							<h3 class="panel-title" id="userName"></h3>
						</div>
						<div class="panel-title pull-right">
							<!-- <button type="button" data-toggle="modal" data-target="#myModal"
								style="margin-top: -12px;" class="btn btn-danger">Unlocked
								sections</button>
							<button type="button" ng-click="resetsections()"
								style="margin-top: -12px;" class="btn btn-warning">Reset
								sections</button> -->
						</div>
					</div>
					<div class="panel-body">
						<div class="row">
							<!--     <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png" class="img-circle img-responsive"> </div>
              -->
							<div class=" col-md-12 col-lg-12 ">
								<table class="table table-hover">
									<tbody id="table-body">
										<tr>

											<th>User Id</th>
											<td id="name"></td>
										</tr>
										<tr>

											<th>Full Name</th>
											<td id="fname"></td>
										</tr>
										<tr>

											<th>Gender</th>
											<td id="gender"></td>
										</tr>
										<tr>

											<th>Next Session</th>
											<td id="nextSession"></td>
										</tr>
										<tr>

											<th>Age</th>
											<td id="age"></td>
										</tr>
										<tr>

											<th>Education</th>
											<td id="education"></td>
										</tr>
										<tr>

											<th>Marital Status</th>
											<td id="maritalStatus"></td>
										</tr>
										<tr>

											<th>Living Arrangement</th>
											<td id="livingArrangement"></td>
										</tr>
										<tr>

											<th>Mail Id</th>
											<td id="mailId"></td>
										</tr>
										<tr>

											<th>Mobile Number</th>
											<td id="mobileNumber"></td>
										</tr>
										<tr>

											<th>Significant Other</th>
											<td id="significantOther"></td>
										</tr>
										<tr>

											<th>Last Phone Call</th>
											<td id="lastPhoneCall"></td>
										</tr>
										<tr>

											<th>Next Call Due</th>
											<td id="nextCallDue"></td>
										</tr>
										<tr>
											<th>No Of Exercises Completed</th>
											<td id="noOfExercisesCompleted"></td>
										</tr>
										<tr>
											<th>Current Section</th>
											<td id="currentSection"></td>
										</tr>
										<tr>
											<th>Current SubSection</th>
											<td id="currentSubSection"></td>
										</tr>
										<tr>
											<th>Unlocked Sections</th>
											<td>{{unlocksection}}</td>
										</tr>

										<tr>
											<th>No Of Sections Completed</th>
											<td id="noOfSectionsCompleted"></td>
										</tr>
										<tr>
											<th>No Of Times LoggedIn</th>
											<td id="noOfTimesLoggedIn"></td>
										</tr>
										<tr>
											<th>No Of Reminders Needed</th>
											<td id="remindersNeeded"></td>
										</tr>
									</tbody>
								</table>


							</div>
							<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog modal-sm">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header modal-primary">
											Sections
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
										<form method="post">
											<div class="modal-body">
												<div class="checkbox" ng-repeat="c in check">
													<label><input type="checkbox"
														ng-click="stateChanged(checkvalue,$index)"
														checklist-model="checkvalue" checklist-value="c.sectionId"
														ng-model="lockoption">{{c.sectionName}}</label>
												</div>
											</div>
											<div class="modal-footer">
												<!-- <button type="submit" class="btn btn-success pull-right">Login</button> -->
												<button type="button" ng-click="locksubmit()"
													data-dismiss="modal" class="btn btn-success pull-right">SUBMIT</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<hr>
							<div class="col-md-12 col-lg-12 ">
								<h3>Sessions</h3>
								<table class="table table-hover">
									<tbody id="session_table">
										<tr align="center">
											<th align="center">Sr No.</th>
											<th align="center">LogIn Time</th>
											<th align="center">LogOut Time</th>
											<th align="center">Last Activity</th>
											<th align="center">Time Spent</th>
											<th align="center">Smiley</th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<!-- <a data-original-title="Broadcast Message" data-toggle="tooltip"
							type="button" class="btn btn-sm btn-primary"><i
							class="glyphicon glyphicon-envelope"></i></a> -->
							 <span
							class="pull-right">
							 <%-- <a
							title="Edit this user"
							href="userEdit.jsp?userid=<%=request.getParameter("userid")%>"
							data-toggle="tooltip" type="button" class="btn  btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a> --%> 
							<a type="button"
							class="btn btn-success"
							href="doctorWorkBook.jsp?userid=<%=request.getParameter("userid")%>"
							data-toggle="tooltip" data-placement="top" title="Work Book"><i
								class="glyphicon glyphicon-book"></i></a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bs/js/bootstrap.min.js"></script>


</body>
</html>