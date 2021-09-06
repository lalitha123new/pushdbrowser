//EHRC APPs
//var serverURL = "http://ehrcapps.iiitb.ac.in/pushd/webapi/";
// var serverURL = "http://113.30.156.80:8080/pushd1/webapi/";

//LOCAL SERVER
//var serverURL ="http://localhost:8080/pushd/webapi/";

//nimhans server
 //var serverURL = "https://echargementalhealth.nimhans.ac.in/pushd1/webapi/";


function signup(){
	
	var username = $('#username').val();
	var password = $('#password').val();
	var cpassword = $('#cpassword').val();
	
	
	if(password == cpassword){
		
		$.ajax({
			  type: "POST",
			  url: serverURL + "users/regNewUser",
			  data:{name:username,password:cpassword,email:dec},
			  headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				},
			  success: function(data){
				 
				
				 var str=data.split("#");
				 if(str[0] == "inactive"){
					alert("Email alredy exits");
					
					 window.location.href = "index.jsp";
					
					
					
				 }else if(str[0] == "active"){
					   
					
					localStorage.setItem("srs_id", str[1]);
				 	window.location.href = "terms.html";
				 	 
					 
				 }
				 
				 
			  },
			  error: function(e) {
				  alert("Error occured due to "+e);
				 
			  }
		});	
		
		
	}else{
		
		alert("Entered password is must be same");
		return false
		
	}
		
}

//forgotpassword

function forgot(){
	
	
	var password = $('#password').val();
	var cpassword = $('#cpassword').val();
	
	
	if(password == cpassword){
		
		$.ajax({
			  type: "POST",
			  url: serverURL + "users/forgotPwUpdate",
			  data:{email:dec,password:cpassword},
			  headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				},
			  success: function(data){
				 
				  window.location.href = "index.jsp";
				
				 
			  },
			  error: function(e) {
				  alert("Error occured due to "+e);
				 
			  }
		});	
		
		
	}else{
		
		alert("Entered password is must be same");
		return false;
		
	}
	
	
}


