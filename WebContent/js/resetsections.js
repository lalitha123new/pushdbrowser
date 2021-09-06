var app = angular.module("pushd",["checklist-model"]);

app.controller("pushcontroller", function($scope,$http){
	
	var parameters = location.search.substring(1).split("&");
	var temp = parameters[0].split("=");
	l = unescape(temp[1]);
	console.log("val of l = "+l);
	
	$scope.resetsections = function(){
		
		var reset = confirm('Are you sure you want to reset?')
		
		if(reset == true){
			
			$http.get(serverURL+"reset/resetstatus?userId="+l)
			.success(function(data){
				
				alert("Reset Success");
				
				
			})
			.error(function(data){
				
				console.log("error");
			})
			
		}else{		
			
		}	
	}

	
	$scope.check='';
	var array=[];
	$scope.locksections = function(){
		$http.get(serverURL+"sections")
		.success(function(data){
			
		
			$scope.check = data;
			
		})
		.error(function(data){
			
			console.log(data);
			
		})	
	}
	
	$scope.locksections();

	
	$scope.locksection=[];
	$scope.check =[];
	$scope.stateChanged = function(ck,index){
		
		
		$scope.locksection = ck;
					
		}
	
	$scope.locksubmit = function(){
		
		$http.post(serverURL+"users/locksection?userId="+l+"&lock="+$scope.locksection)
		.success(function(data){
			
			
			
			console.log("success");
						
		})
		.error(function(data){
			
			console.log("error");
		})	
	}
	$scope.lockoption=[];
	$scope.unlocksection = [];
	$scope.getlocksection = function(){		
		$http.get(serverURL+"users/getlocksection?userId="+l)
		.success(function(data){

			array = JSON.parse("[" + data + "]");
			
			$scope.unlocksection = array.toString();
			$scope.array1=[];
			var arrayAsString = array.toString();
			$scope.checkvalue = arrayAsString;
			for(var i=0;i<array.length;i++){
				$scope.array1.push(array[i].toString());				
			}		
			$scope.checkvalue=$scope.array1;
			
		})
		.error(function(data){
			
			console.log(data);
			
		})
	}
	
	$scope.getlocksection();
	
})