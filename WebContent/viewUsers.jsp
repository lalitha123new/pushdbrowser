<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
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
	var array_doctor = [];
	
	$.getJSON(serverURL + "users", function(data){
		
		
	myFunction(data);
	
	});
	
	
	
	$.getJSON(serverURL + "users/admin/doctor", function(data){
		
		   
			for(i = 0; i < data.length; i++) {
		     $('#selectdr').append($("<option></option>")
		                    .attr("value",data[i].doctor_id)
		                    .text(data[i].doctor_name)); 
		     
		     array_doctor = data;
		     
		 }
	 
	});
	
	var search_array = [];
	var resultObject = [];
	var doctor_name_array = [];
	
	//function to get the doctor_names of doctor_ids
	function search(idKey, myArray){
		
	    for (i=0;i < myArray.length; i++) {
	        var finalArray =  myArray.filter(function(doct) {
			return doct.doctor_id == idKey;
			
			});
	        
	        return finalArray;
	        
	     }
					   
}
	
	function myFunction(arr) {
		
	    var out = "";
	    var i;
	    var res =[];
	    for(i = 1; i < arr.length; i++) {
	    	if(arr[i].doctor_id > 0){
	        res  = arr[i].doctor_id;
	        
	        
	    	}
	    	
	       
		   //array to store the search results of doctor_name of doctor_id
		   resultObject[i] = search(res, array_doctor);
		   
		
		      if(arr[i].doctor_id == 0){
		    	
			   //resultObject[i].doctor_name = "All";
		    	  doctor_name_array[i] = "All";
			   
		      }else{
		    	 
		    	  //resultObject[i].doctor_name = resultObject[i][0].doctor_name;
		    	  doctor_name_array[i] = resultObject[i][0].doctor_name;
		    	
		      }
	      
   		   if(arr[i].mode == "active"){
   			   
   					 //$('#e'+arr[i].id).hide();
   					 //$('#e' + arr[i].id).addClass("hidden");
   					 out += '<tr id="e' + arr[i].id +'" >' + '<td>' + arr[i].id   + '</td>' +
        			'<td>' + arr[i].name + '</td>' +
        			'<td>' + arr[i].gender + '</td>' +
        			'<td>' + arr[i].age + '</td>' +
        			//'<td>' + arr[i].doctor_id + '</td>' +
        			//'<td>' + resultObject[i].doctor_name+ '</td>' +
        			'<td>' +  doctor_name_array[i]+ '</td>' +
        			'<td style="display:none">' + arr[i].doctor_id + '</td>' +
	        		'<td><a href="user.jsp?userid='+arr[i].id+'" type="button" class="btn btn-primary" ' +
	        		'data-toggle="tooltip" data-placement="top" title="User Details">' + 
	        		'<span class="glyphicon glyphicon-info-sign"></span></a> ' +
  					'</td>' + '<td>'+'<span class="glyphicon glyphicon-warning-sign hidden" id = "' + arr[i].id + '"></span> &nbsp; &nbsp;' +
  					'</td>'+ '<td>' + '<a href="#" id="chk1" class="btn btn-primary text-center" style="text-decoration: none; margin-top: 0px; padding-top: 5px; padding-bottom: 5px;" onclick="mode(\'' + arr[i].id + '\')">&emsp;Deactivate&emsp;</a>'
 					+ '</td>' + '</tr>';
 					
   			}
		
			
	 }
	    
	    
		document.getElementById("table-body").innerHTML = out;
		
		for(i = 1; i < arr.length; i++) {
			
			if(arr[i].flag == "true"){
				
			$('#' + arr[i].id).removeClass("hidden");
			
			}
			
		}
	}
		
	function mode(ui){
		
		var deleteUser = confirm('Do you want to Inactivate this user?');
		if(deleteUser){
			
		$('#e'+ui).hide();
		setMode("Inactive",ui);
		
		}
	}
	
	function deleteFunction(userId){
		
		
		$.getJSON(serverURL + "users/admin/"+userId+"deleteUser" , function(data){
		   alert("User "+data.name+" deleted Successfully");
		});	
	}
	
	//doctor mapping users
	
	</script>
	
</head>

<body class="bgcolor" oncontextmenu="return false">
	<nav class="navbar navbar-inverse">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">PUSH-D</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<!-- <li><a href="webapi/users/download">Download Response</a></li> -->
					<li><a href="inactiveUsers.jsp">Inactive Users</a></li>			
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
	
	<div class="container-fluid" style="height: 100%">
	<div class="row" style="padding: 20px 100px;">
		<!-- <h2>List of Users&emsp;&emsp;<a href="addUser.jsp" class="btn btn-primary">Add User</a></h2> -->
		<h2>List of Users&emsp;&emsp;<a href="addUser.jsp" class="btn btn-primary">Add User</a>&emsp;&emsp;<a href="viewDoctors.jsp" class="btn btn-primary">Doctors</a>&emsp;&emsp;<a href="adminStatistics.html" class="btn btn-primary">Analytics</a>
		&emsp;&emsp;<a href="userRegistrationInfo.html" class="btn btn-primary">Registration info</a></h2>
		<p>Search by Dr <select id="selectdr">
		<option value="0">All</option></select></p>
		
			<hr>
			<table class="table" id="tableUsers">
				<thead>
					<tr>
						<th>UserID</th>
						<th>Name</th>
						<th>Gender</th>
						<th>Age</th>
						<th>Doctor_Name</th>
						<th style="display:none">Doctor_id</th>
					</tr>
				</thead>
				<tbody id="table-body">
				</tbody>
			</table>
	</div>
	</div>
		
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bs/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	//for search based on user_id
	//$("#selectdr").on("keyup", function() {
		
		$('select').on('change', function() {
	     
	    var value =  this.value;

	    if(value!=0){
	    
	    $("#tableUsers tr").each(function(index) {
	        if (index !== 0) {

	            $row = $(this);

	            var id = $row.find('td:eq(5)').text();

	            if (id.indexOf(value) !== 0) {
	                $row.hide();
	            }
	            else {
	                $row.show();
	              
	            }
	        }
	    });
	        
	    }else{
	    	
	    window.location.reload();	
	    }
		
	        
	    
	});
	</script>
	
</body>
</html>