<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Session Expired</title>
	<link href="bs/css/bootstrap.min.css" rel="stylesheet">
	<script src="bs/js/jquery-2.1.1.min.js"></script>
	<script src="js/values.js"></script>
    <script type="text/javascript">
    //alert(serverURL);
		$(function(){
		    $("#header").load("navHeader2.html"); 
	    });	
	</script>
</head>
<body>
	<%
		String id = request.getParameter("id");
	
	try {
		//ehrcAPP SER VER
		//URL url = new URL("http://ehrcapps.iiitb.ac.in/pushd/webapi/users/" + id + "/logout");
		//URL url = new URL("http://113.30.156.80:8080/pushd1/webapi/users/" + id + "/logout");
		 
		 StringBuffer sb = new StringBuffer(request.getRequestURL());
		 String str = sb.toString();
		 String[] data = str.split("/se");
		//LOCAL SEREVR
	     URL url = new URL(data[0]+"/webapi/users/" + id + "/logout");

		 //URL url = new URL("https://echargementalhealth.nimhans.ac.in/pushd1/webapi/users/" + id + "/logout");
				
		HttpURLConnection http = (HttpURLConnection) url.openConnection();
		http.setRequestMethod("POST");
		http.setDoOutput(false);
		
		BufferedReader buffread = new BufferedReader(new InputStreamReader(http.getInputStream()));

		String recv = "", recvbuff = "";
	   	
		while ((recv = buffread.readLine()) != null)
	    	recvbuff += recv;
	   
		buffread.close();

	   	//System.out.println("Response : " + recvbuff);
	}
	catch(Exception e) {
		response.sendRedirect("index.jsp");
	}
	%>
	<div id="header">
	</div>
	<div class="container text-center">
		Your session has expired . <a href="index.jsp">Click Here</a> to login again.
	</div>
</body>
</html>