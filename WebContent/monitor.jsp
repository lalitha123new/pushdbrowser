<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>;	url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Home</title>

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
	
    
    <script src="bs/js/jquery-2.1.1.min.js"></script>
    <script src="bs/js/jquery.session.js"></script>
	<script src="bs/js/jquery.cookie.js"></script>
	<script src="bs/js/bootstrap.min.js"></script>
    <script src="js/values.js"></script>
    <script src="js/inc.js"></script>
    <style type="text/css">
    	.image { 
		   position: relative; 
		   width: 100%; /* for IE 6 */
		}
		
		h2 { 
		   position: absolute; 
		   top: 70px; 
		   right: -100px;
		   width: 100%;
		   text-align: right; 
		}
    </style>
    <script>

    	history.forward();
    	
    	$(function(){
    		$('#header').load("navHeader.html");
    		
	    });
    </script>
	<script type="text/javascript">
	
	$.getJSON(serverURL + "users/admin/"+userId, function(data){
	    myFunction(data);
	});

	function myFunction(arr) {
	    var out = "";
	    var i;
	 
	   $("#userName").html(arr.name) ;
	   $("#name").html(arr.name); 
	   $("#gender").html(arr.gender); 
	   $("#age").html(arr.age); 
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
	   var sessionStats = arr.sessionStats;

	   var i;
	   var out;
		
		
	  for(i = 0; i < sessionStats.length; i++) {
		
		   		out ="<tr><td>"+i+"</td><td>"+sessionStats[i].loginTime+"</td><td>"+sessionStats[i].logoutTime+"</td><td>"+sessionStats[i].timeSpent+"</td></tr>";
		   	 	 $("#session_table").append(out);   
		   }
	     
	 
	}
	
	</script>

</head>
<body class="bgcolor" oncontextmenu="return false">
<div class="bgcolor">
<div id="header">
	</div>

	<div class="container-fluid" style="height: 100%">
	<div class="row">
		<div class="col-md-2">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="home3.jsp">
					<i class="fa fa-home">&emsp;Home</i></a>
				</li>
				<li><a href="section.jsp">
					<i class="fa fa-tasks">&emsp;Sections</i></a>
				</li>
				<!--<li><a href="profile.jsp">
					<i class="fa fa-user">&emsp;Profile</i></a>
				</li>-->
				<li class="active"><a href="#">
					<i class="fa fa-bar-chart">&emsp;Monitor your Pattern</i></a>
				</li>
			</ul>
		</div>
				<div class="col-md-10 col-sm-8">
					<div class="row">
           			<h3>Moniter Your Pattern</h3>
           			
              	 <hr>
                <h3 >Sessions</h3>
                <table class="table table-hover" >
                <tbody id="session_table">
                <tr align="center">
                <th align="center">Sr No.</th>
                <th align="center">LogIn Time</th>
                <th align="center">LogOut Time</th>
                <th align="center">Time Spent</th>
                </tr>
                </tbody>
                </table>
                </div>
              </div>
            </div>
                
	</div>
		
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->

	
	</div>
</body>
</html>