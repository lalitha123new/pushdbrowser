<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="in.ac.nimhans.model.Path"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%-- <%@page import="java.util.Base64"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%
	
	String userid = request.getParameter("id");
	
	
	
	try {
  			session.setAttribute("USERID", userid);
			session.setMaxInactiveInterval(1800);
			Cookie ck=new Cookie("userId","" + userid);
	        ck.setMaxAge(100000);
	        response.addCookie(ck);
	        
			
				response.sendRedirect("doctorUsers.jsp");
			
	}
	catch(Exception e) {
		
		e.printStackTrace();
	}
	
	%>
</body>
</html>
   	
<%
	   
%>