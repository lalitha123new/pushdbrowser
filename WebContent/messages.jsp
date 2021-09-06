<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>PUSH-D</title>

	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="css/workbook.css" rel="stylesheet">
	<script src="js/values.js"></script>
	
	<script src="bs/js/jquery-2.1.1.min.js"></script>
	<script src="bs/js/jquery.cookie.js"></script>
	<script src="bs/js/bootstrap.min.js"></script>
	<script>
	var doctor_id = 0;
	</script>
	
<style>
	
	body{
	
	background-color:#FFF59D;
	
	}
	
	 #table{
    
    background-color:white;
    border:2px solid black;
    width:80%;
    margin: 0 auto;
    
    }
    
    .header_class{
    
    background-color:#FFF59D;
    border:2px solid black;
    text-align:center;
    height:60px;
    
    }
    
    td{
    text-align:left;
    }
    
    .className {
    border:1px solid black;
    height:50px;
    padding-left:5px;
    }
	
</style>

</head>

<body>

	<nav class="navbar navbar-inverse navbar-static-top">

	<div>
	<div class="col-md-12">
	
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header col-md-9">
		
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
				
				<span class="sr-only">Toggle navigation</span>
				 <span class="icon-bar"></span> <span class="icon-bar"></span> 
				 <span class="icon-bar"></span>
				 
			</button>
			
			<a class="navbar-brand active" href="index.jsp">PUSH-D</a>
			
		</div>
		
		<div class="col-md-1" style="padding: 10px 0px 0px 25px;">
		
			<a href="viewUsers.jsp" type="button" class="btn btn-success" data-toggle="tooltip" data-placement="top" title="Home">
			<i class="glyphicon glyphicon-home"></i>
			</a>
			
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
		
		</div>
	</div>
	

	</nav>
	
	<!-- begin display sent messages to the user from pushd tead -->
	<div id="container">
	<h3 style="text-align:center;">Sent Messages</h3>
	
	<div id="divID" class="col-md-12"></div>
	
	<div id="divID_new" style="padding-top:30px;"  class="col-md-12">
	
		<table id="table">
		<thead>
		
		<tr>
		
			<th class="header_class">Sl.No</th>
			<th class="header_class">Date</th>
			<th class="header_class">Message</th>
		
		</tr>
		</thead>
		
		</table>
	
	</div>
	
	</div>
	<!-- end display sent messages to the user from pushd tead -->
	 
<div class="col-md-12" style="margin-bottom:10px;">

		<h3 style="text-align:center;">Messages from Push-D</h3>
	
</div>
<div>
<div class="col-md-12">
		<textarea id = "messages_data" rows="17" cols="100"  style="text-align: left;margin-left: auto;margin-right: auto;display: block;"></textarea>
		
	</div>
	
	<div class="col-md-12" style="text-align:center;">
		<button type="submit"  class="btn btn-primary" style="width: 20%; margin-top:40px;margin-bottom:20px;" value="Submit" onclick = "submit()">Submit</button>
		
		</div>	
		</div>

</body>
<script>

$(document).ready(function() {
	
	var url_path=window.location.href;
	var arr=url_path.split("?");
	var arr1=arr[1].split("=");
	var userId = arr1[1];
	
	$.ajax({
		  type: "GET",
		  url: serverURL + "users/" + userId + "/getPushdNotes",
		  success: function(data){
			 
			  
			  if(data.length == 0 ){
				  var container1 = document.getElementById('divID_new');
					var table = document.getElementById('table');
					table.setAttribute("style", "border: 1px solid black;");
					var tr = document.createElement('tr'); 
				    var td1 = document.createElement('td');
				    var td2 = document.createElement('td');
				    var td3 = document.createElement('td');
				    
				    td1.setAttribute("style", "width: 10%");
				    td2.setAttribute("style", "width: 20%");
				    
				    td1.setAttribute('class', 'className');
				    td2.setAttribute('class', 'className');
				    td3.setAttribute('class', 'className');
				    td3.setAttribute('style', 'color:blue;');
				    
				    
				    td3.innerHTML = "No message to display";
				   
				    tr.appendChild(td1);
				    tr.appendChild(td2);
				    tr.appendChild(td3);

				    table.appendChild(tr);
				    container1.appendChild(table);
	   
	}else{
		
	    
	   
var container1 = document.getElementById('divID_new');
var table = document.getElementById('table');
table.setAttribute("style", "border: 1px solid black;");

for (var i=0;i<data.length;i++){
	
    var tr = document.createElement('tr'); 
    var td1 = document.createElement('td');
    var td2 = document.createElement('td');
    var td3 = document.createElement('td');
    
    td1.setAttribute("style", "width: 10%");
    td2.setAttribute("style", "width: 20%");
    
    td1.setAttribute('class', 'className');
    td2.setAttribute('class', 'className');
    td3.setAttribute('class', 'className');
    
    td1.innerHTML =(i+1);
    td2.innerHTML = data[i]["time"];
    td3.innerHTML = data[i]["notes"];
   
    tr.appendChild(td1);
    tr.appendChild(td2);
    tr.appendChild(td3);

    table.appendChild(tr);
}
	container1.appendChild(table);
	
				  
			  }
	
		  },
		  error: function() {
			  alert("Error Occured due to " + serverURL + "users/" + userId + "/currSection");
			
		  } 
		  
	});
});


//object to hold the text box value
var data_obj = {};

	//begin function to submit message
	function submit(){
		
		
		var url_path=window.location.href;
		var arr=url_path.split("?");
		var arr1=arr[1].split("=");
		
		
	data_obj.message = $('#messages_data').val();
	data_obj.message = data_obj.message.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
	
	if (!$("#messages_data").val()) {
		alert("Please write message");
	   
	}else{
		
	
		
	
	 $.ajax({
		  type: "POST",
		  url: serverURL + "users/pushdNotes",
		  data:{data:data_obj.message,user_id:arr1[1],doctor_id:doctor_id},
		  headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			},
		  success: function(data){
			  
			window.location.reload();
			
		  },
		  error: function(e) {
			  alert("Error occured due to "+e);
			  
		  }
	});	
	 
	
	}
	
	
	}
	
	//end of submit function
</script>

</html>