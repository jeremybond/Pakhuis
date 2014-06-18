// JavaScript Document voor een slider

$(document).ready(function(e) {
	var aantalDias = 7;
	var diaBreedte = 800;
	var strookBreedte = aantalDias * diaBreedte;
	var teller = 1;
	
	$('#strook').css("width", strookBreedte);
	$('#venster').css("overflow", "hidden");
	
	verschuiven = function() {
			if(teller === aantalDias) {
				teller = 1;
				$('#strook').css("left", "0");
			}
		var verschuiving = teller * diaBreedte;
		$('#strook').animate({left: -verschuiving} , 1000 );
		teller += 1;
	}
	
	spelen = function() {
		doorSchuiven = setInterval(function() {
		verschuiven();
		}, 2000);
	}
	
	spelen();
	
	$('.dia').hover(function() {
		clearInterval(doorSchuiven);
		$(this).css("cursor", "pointer");
		
	}, function() {
		verschuiven();
		spelen();
	}
	)
});