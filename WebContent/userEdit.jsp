<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin - Home</title>

<%

	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	
	if(session.getAttribute("USERID")==null){
		response.sendRedirect(request.getContextPath() + "/sessionExpired.jsp");
	}
	
%>

	<!-- Bootstrap -->
	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">  
	
    
	<script src="bs/js/jquery-2.1.1.min.js"></script>
	<script src="bs/js/jquery.cookie.js"></script>
	<script src="js/values.js"></script>
	<script src="js/inc.js"></script>
	
	<script type="text/javascript">
	
	history.forward();
	
	<% //System.out.println("--------"+request.getParameter("userid"));%>	
	$.getJSON(serverURL + "users/admin/"+<%= request.getParameter("userid") %>, function(data){
		
	    myFunction(data);
	    
	});

	function myFunction(arr) {
		
		
	    var out = "";
	    var i;
	    $("#id").val(arr.id) ; 
	    $("#userId").val(arr.id) ; 
	   	$("#userName1").val(arr.name) ;
	   	$("#name").val(arr.name); 
	  
	   $("#gender > [value=" + arr.gender + "]").attr("selected", "true");
	   $("#age").val(arr.age); 
	   $("#mobileNumber").val(arr.mobileNumber); 
	   $("#education").val(arr.education); 
	   $("#maritalStatus > [value=" + arr.maritalStatus + "]").attr("selected", "true");
	   $("#livingArrangement").val(arr.livingArrangement); 
	   $("#significantOther").val(arr.significantOther); 
	   $("#mailId").val(arr.mailId);
	   $("#lastPhoneCall").val(arr.lastPhoneCall); 
	   $("#nextCallDue").val(arr.nextCallDue);
	   $("#selectdr").val(arr.doctor_id);
	   
	  
	    }
	
$.getJSON(serverURL + "users/admin/doctor", function(data){
			for(i = 0; i < data.length; i++) {
		     $('#selectdr')
		         .append($("<option></option>")
		                    .attr("value",data[i].doctor_id)
		                    .text(data[i].doctor_name)); 
			 }
	});
	
	
	</script>

</head>
<body class="bgcolor" oncontextmenu="return false">
	<nav class="navbar navbar-inverse">
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
			<div class="col-md-1" style="padding:10px 10px 0px 25px;">
				
				
				<a  href="viewUsers.jsp" type="button" class="btn btn-success pull-right" data-toggle="tooltip" data-placement="top" 
                           title="Home"><i class="glyphicon glyphicon-home"></i></a>
				</div>
				<div class="col-md-1" style="padding: 10px 10px 0px 25px;">
			<a href="user.jsp?userid=<%=request.getParameter("userid")%>" type="button" class="btn btn-success"
				data-toggle="tooltip" data-placement="top" title=""><i
				class="glyphicon ">Back</i></a>
		</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse col-md-1" id="navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="logout.jsp">Logout</a></li>	
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
	
	<div class="container-fluid" style="height: 100%">
	<div class="row">
		<div class="col-md-12">
		<form id="editUser" class="form-horizontal">
			<div class="panel-body">
								<div class="form-group">
									<label class="col-sm-3 control-label">User Id</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="id" name="id"
											placeholder="User ID" disabled> <span id="err"> </span>
											<input type="hidden" name ="id" id="userId"/>
												<input type="hidden" name ="name" id="userName1" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="name"
											name="name" placeholder="Name" disabled>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">New Password</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="password"
											name="password" placeholder="Enter new password">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Gender</label>
									<div class="col-sm-8">
										<select class="form-control" id="gender" name="gender">
											<option selected>Male</option>
											<option>Female</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">Age</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="age"
											name="age" placeholder="Age">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Mobile Number</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="mobileNumber"
											name="mobileNumber" placeholder="Mobile Number">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Education</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="education"
											name="education" placeholder="Educaion">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Marital Status</label>
									<div class="col-sm-8">
										<select class="form-control" id="maritalStatus"
											name="maritalStatus">
											<option>Single</option>
											<option>Married</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Living
										Arrangement</label>
									<div class="col-sm-8">
										<input type="text" class="form-control"
											id=livingArrangement name="livingArrangement"
											placeholder="Living Arrangement">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Significant Other</label>
									<div class="col-sm-8">
										<input type="text" class="form-control"
											id="significantOther" name="significantOther"
											placeholder="significantOther">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">Mail Id</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="mailId"
											name="mailId" placeholder="mailId" disabled>
									</div>
								</div>
								<div class="form-group">
								<label class="col-sm-3 control-label">Assign Doctor</label>
									<div class="col-sm-8">
								<select name="doctor_id" id="selectdr">
		                        <option value="0">All</option>
		                        </select>
		                        </div>
		                        </div>
		                        
						
							
          <div class="panel-footer">
						<div class="row">
							<div class="col-md-11">
								<div class="pull-right">
									<button type="button" id="update_button" onclick="update()"
										class="btn btn-success">Update</button>
									<!-- <button type="submit" class="btn btn-success">Create</button> -->
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>     
	</form>
	</div>
	</div>
	</div>	
	
	<!-- Include all compiled plugins(below), or include individual files as needed -->
	<script src="bs/js/bootstrap.min.js"></script>
	<script type="text/javascript">	
	function update() {
		$("#update_button").attr("disabled", true);
	var formData = $("#editUser").serialize(); 
	
		
		$.ajax({
			  type: "POST",
			  url: serverURL + "users/updateUser",
			  data: formData,
			  success: function(data){ 
				 
				  //window.location.href = "viewUsers.jsp"; 
			  },
			  error: function() {
				  alert("update failed");
				  window.location.href = "viewUsers.jsp";
			  }
		});
	}
	</script>
	
</body>
</html>