var serverURL = "http://localhost:8080/PUSHD-d/webapi/";

//alert("hhh");
var url_path=window.location.href;
var arr=url_path.split("?");
var arr1=arr[1].split("=");
var dec = window.atob(arr1[1]);
//alert(dec);
document.getElementById("email_id").value = dec;
document.getElementById("username").value = dec;

//alert(dec);
//document.getElementById('email_id').value = dec.toString();
function signup(){
	
	var username = $('#username').val();
	var password = $('#password').val();
	var cpassword = $('#cpassword').val();
	//console.log(cpassword);
	
	if(password == cpassword){
		//$('#termsmodal').modal("show");
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
					window.location.href = "http://localhost:8080/PUSHD-d";
					
					
				 }else if(str[0] == "active"){
					   
					alert("Please complete futher registration forms");
					localStorage.setItem("srs_id", str[1]);
					//localStorage.setItem("srs_id", 9960);
				 	window.location.href = "http://localhost:8080/PUSHD-d/register1.html";
				 	 
				 	
					 
				 }
				 
				 
			  },
			  error: function(e) {
				  alert("Error occured due to "+e);
				  //window.location.href = "error.html";
			  }
		});	
		
		
	}else{
		
		alert("Entered password is must be same");
		return false
		
	}
	
	 //window.location = "http://localhost:8080/PUSHD-d/register1.html";
	
	//alert(username+"  1 "+password+" 2 "+cpassword+"  3");	
}