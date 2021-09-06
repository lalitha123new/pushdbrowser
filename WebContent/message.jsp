
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Sub-Section</title>
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
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.cookie.js"></script>
    <script src="js/values.js"></script>
    <script src="js/inc.js"></script>
   	<script src="bs/js/bootstrap.min.js"></script>
	
    <script type="text/javascript">
	    history.forward();
    	$(function(){
    		$('#header').load("navHeader.html");
            $("#includedContent").load("sectionSideNav3.html"); 
	    });
    	
    	function resumeSection(){
    		window.location.href = "section.jsp";
    	}
		
    </script>
    
    <style>
    
    
    #table{
    
    background-color:white;
    border:2px solid black;
    width:100%;
    
    }
    
    .header_class{
    
    background-color:#FFF59D;
    border:2px solid black;
    text-align:center;
    height:60px;
    
    }
    
    .className {
    border:1px solid black;
    /* background-color:#FFF59D; */
    height:50px;
    padding-left:5px;
    }
    
    </style>
    
</head>
<body class="bgcolor" oncontextmenu="return false">

<div id="header">
	</div>

<div class="container-fluid">

	<div class="row" style="width:100%;">
	<div id="includedContent" class="col-md-2"></div>
	<div class="col-md-10">
	
	
	
	<div id="container">
	<h3 style="text-align:center;">Messages from Push-D</h3>
	
	<div id="divID"></div>
	
	<div id="divID_new" style="padding-top:30px;">
	
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
	
	<div class="row" style="margin-top:20px;">
	<div class="col-md-12">
	<div class="col-md-4"></div>
	<div class="col-md-4">
	<button class="btn btn-primary" onclick="resumeSection()">Resume Sections</button>
	</div>
	<div class="col-md-4"></div>
	</div>
	</div>
	
	</div>
	</div>
	</div>

	
	
	<script type="text/javascript">
		
		$(document).ready(function() {
		
			$.ajax({
				  type: "GET",
				  url: serverURL + "users/" + userId + "/getPushdNotes",
				  success: function(data){
					  console.log(data);
					  
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
			
			//update pushd messgae status
			
			$.ajax({
				  type: "POST",
				  url: serverURL + "users/"+userId+"/updatepushdNotes",
				  
				  headers : {
						'Content-Type' : 'application/x-www-form-urlencoded'
					},
				  success: function(data){
				  },
				  error: function(e) {
					  //window.location.href = "error.html";
				  }
			});	
			
		
		});		

	</script>
</body>
</html>