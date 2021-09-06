/**
 * 
 */
function showPage(p) {
	
		for (j = 0; j <= 5; j++) {
			$('#page'+j).removeClass("active");
			$('#list'+j).removeClass("active");
			$('#page'+j).addClass("hidden");
		}
		$('#page'+p).addClass("active");
		$('#list'+p).addClass("active");
		$('#page'+p).removeClass("hidden");
		
}

function showPrevious() {
	
	for (j = 0; j <= 5; j++) {
		if($('#page'+j).hasClass("active")) {
			$('#page'+j).removeClass("active");
			$('#list'+j).removeClass("active");
			$('#page'+j).addClass("hidden");
			p = parseInt(j)-1;
			$('#page'+p).addClass("active");
			$('#list'+p).addClass("active");
			$('#page'+p).removeClass("hidden");
			break;
		}
	
	}
}

function showNext() {
	
	for (j = 0; j <= 5; j++) {
		if($('#page'+j).hasClass("active")) {
			console.log(j);
			$('#page'+j).removeClass("active");
			$('#list'+j).removeClass("active");
			$('#page'+j).addClass("hidden");
			p = parseInt(j)+1;
			$('#page'+p).addClass("active");
			$('#list'+p).addClass("active");
			$('#page'+p).removeClass("hidden");
			
			break;
		}
	}
}