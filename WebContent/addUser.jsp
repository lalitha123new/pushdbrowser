<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="refresh" content="<%=session.getMaxInactiveInterval() %>; url=sessionExpired.jsp?id=<%=session.getAttribute("USERID") %>">
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
    
    <script type="text/javascript">
     
     history.forward();
     document.onmousedown=disableclick;
 status="Right Click Disabled";
 function disableclick(event)
 {
   if(event.button==2)
    {
    
      return false;    
    }
 }
     
    </script>
</head>
<body class="bgcolor" oncontextmenu="return false">
 <nav class="navbar navbar-inverse navbar-static-top">
     <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
       <div class="navbar-header col-md-10">
         <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
            data-target="#navbar-collapse-1" aria-expanded="false">
           <span class="sr-only">Toggle navigation</span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
         </button>
          <a class="navbar-brand active" href="index.jsp">PUSH-D</a>
         </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="col-md-1" style="padding: 10px 10px 0px 25px;">
  <a href="viewUsers.jsp" type="button" class="btn btn-success"
   data-toggle="tooltip" data-placement="top" title="Home"><i
   class="glyphicon glyphicon-home"></i></a>
 </div>
      <div class="collapse navbar-collapse col-md-1" id="navbar-collapse-1">
       <ul class="nav navbar-nav navbar-right">
           <li><a href="index.jsp">Logout</a></li>            
         </ul>
     </div><!-- /.navbar-collapse -->
     </div><!-- /.container -->
 </nav>

<div class="container-fluid">
<div class="row">
 <div class="col-md-2">
 </div>
<div class="col-md-10">
 <div class="row">
  <div class="col-md-10">
   <h2 class="text-center">Add User&emsp;&emsp;<a href="viewUsers.jsp" class="btn btn-primary">View Users</a></h2>
   <form id="addUser" class="form-horizontal">
    <div class="panel-body">
      <div class="form-group" style="display:none;">
         <label class="col-sm-3 control-label">User Id</label>
         <div class="col-sm-8">
          <input type="number" title="User Id should be a number" class="form-control" value="8787" id="userId" name="id" placeholder="User ID" onkeyup="check()">
          <span id="err"> </span>
         </div>
       </div> 
     <div class="form-group">
         <label class="col-sm-3 control-label">User Name</label>
         <div class="col-sm-8">
          <input type="text" class="form-control" id="userName" name="name" placeholder="User Name">
         </div>
     </div>
     <div class="form-group">
         <label class="col-sm-3 control-label">Full Name</label>
         <div class="col-sm-8">
          <input type="text" class="form-control" id="fullName" name="fname" placeholder="Full Name">
         </div>
     </div>
     <div class="form-group">
         <label class="col-sm-3 control-label">Password</label>
         <div class="col-sm-8">
          <input type="password" class="form-control" id="userPassword" name="password" placeholder="Password">
         </div>
     </div>
     <div class="form-group">
         <label class="col-sm-3 control-label">Gender</label>
         <div class="col-sm-8">
          <select class="form-control" id="userGender" name="gender">
        <option>Male</option>
        <option>Female</option>
       </select>
         </div>
       </div>
       <div class="form-group">
         <label class="col-sm-3 control-label">Age</label>
         <div class="col-sm-8">
          <input type="number" class="form-control" id="userAge" name="age" placeholder="Age">
         </div>
       </div>
      </div>
    <div class="form-group">
     <label class="col-sm-3 control-label">Education</label>
     <div class="col-sm-8">
      <input type="text" class="form-control" id="userEduaction"
       name="education" placeholder="Educaion">
     </div>
    </div>
    <div class="form-group">
     <label class="col-sm-3 control-label">Mobile Number</label>
     <div class="col-sm-8">
      <input type="number" class="form-control" id="mobileNumber"
       name="mobileNumber" placeholder="Mobile Number">
     </div>
    </div>
    <div class="form-group">
     <label class="col-sm-3 control-label">Marital Status</label>
     <div class="col-sm-8">
      <select class="form-control" id="userMaritalStatus"
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
       id="userLivingArrangement" name="livingArrangement"
       placeholder="Living Arrangement">
     </div>
    </div>
    <div class="form-group">
     <label class="col-sm-3 control-label">Significant Other</label>
     <div class="col-sm-8">
      <input type="text" class="form-control"
       id="userSignificantOther" name="significantOther"
       placeholder="significantOther">
     </div>
    </div>
    <div class="form-group">
     <label class="col-sm-3 control-label">Mail Id</label>
     <div class="col-sm-8">
      <input type="email" class="form-control" id="userMailId"
       name="mailId" placeholder="mailId" required>
     </div>
    </div>
    <div class="panel-footer">
     <div class="row">
      <div class="col-md-11">
       <div class="pull-right">
           <button type="button" onclick="create()" class="btn btn-success">Create</button>
           <!-- <button type="submit" class="btn btn-success">Create</button> -->
       </div>
      </div>
      <div class="col-md-1"></div>
     </div>
    </div>
   </form>
  </div>
  <div class="col-md-2">
  </div>
 </div>
</div>
</div>
</div>

<div id="id01">
</div>
<script src="bs/js/bootstrap.min.js"></script>
<script type="text/javascript">

var user_Id,age,mobile_number;
var user_name,full_name,marital_status,living_arrange,significant_other,gender;
var psw;
var email;
var education;

function create() {
 
 //user_Id = $("#userId").val();
 user_name = $('#userName').val();
 fname = $("#fullName").val();
 psw = $('#userPassword').val();
 age = $('#userAge').val();
 gender = $('#userGender').find(":selected").text();
 mobile_number = $('#mobileNumber').val();
 marital_status = $('#userMaritalStatus').find(":selected").text();
 living_arrange = $('#userLivingArrangement').val();
 education = $('#userEduaction').val();
 email = $('#userMailId').val().toLowerCase();
 significant_other = $('#userSignificantOther').val();
 user_Id = 8484;
 
  var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
 
if(user_name == "" || fname =="" ||   psw == "" || age =="" ||  gender=="" || mobile_number == "" || marital_status =="" ||
	living_arrange =="" || education == "" || email == "" || significant_other == "" || reg.test(email) == false){

 alert("Please fill in all fields with  valid data");
 
 }else{
 
  var formData = $("#addUser").serialize();
 
   $.ajax({
      type: "POST",
      url: serverURL + "users",
      data: formData,
      success: function(data){
       
       window.location.href = "viewUsers.jsp";
      },
      error: function() {
       console.log("Error Occured");
       
      }
   });
 
 
 
 }
}

</script>
</body>
</html>