// JavaScript Document

$(document).ready(function(){
	var gebieden = [
		{ lnks: 0, bvn: 0, brdt: 1067, hgt: 623, kromm: 0, tekstId:"allesTekst"}, // 0 alles
		{ lnks: 0, bvn: 180, brdt: 255, hgt: 440, kromm: 30, tekstId:"sheldonTekst"}, // 1 sheldon
		{ lnks: 220, bvn: 50, brdt: 250, hgt: 567, kromm: 30, tekstId:"leonardTekst"}, // 2 leonard
		{ lnks: 435, bvn: 110, brdt: 155, hgt: 513, kromm: 30, tekstId:"pennyTekst"}, // 3 penny
		{ lnks: 585, bvn: 168, brdt: 224, hgt: 459, kromm: 30, tekstId:"howardTekst"}, // 4 howard
		{ lnks: 845, bvn: 135, brdt: 220, hgt: 489, kromm: 30, tekstId:"rajeshTekst"} // 5 rajesh
	];
	var infoNaarBoven = false;
	
	
	function schuifGebieden(gebiedsObject) {
		// object gereed maken voor acties
		var links = gebiedsObject.lnks + "px";
		var boven = gebiedsObject.bvn + "px";
		var achtergrondPositie = "-" + links + " -" + boven;
		var breedte = gebiedsObject.brdt + "px";
		var hoogte = gebiedsObject.hgt + "px";
		var kromming = gebiedsObject.kromm + "px";
		var idTekst = "#" + gebiedsObject.tekstId;
		
		// #venster animeren (acties)
		$('#venster').css("left", links);
		$('#venster').css("top", boven);
		$('#venster').css("background-position", achtergrondPositie);
		$('#venster').css("width", breedte);
		$('#venster').css("height", hoogte);
		$('#venster').css("border-radius", kromming);
		
		// de juiste tekst selecteren
		selecteerTekst(idTekst);
	}
	
	function selecteerTekst(idVanDiv){
		$('article div').removeClass("zichtbaar");
		$('article div').addClass("onzichtbaar");
		$(idVanDiv).removeClass("onzichtbaar");
		$(idVanDiv).addClass("zichtbaar");
		bovenkant = 590 - $('div.zichtbaar').height();
		console.log(bovenkant);
		if(infoNaarBoven){
			$('article div').animate( { top: bovenkant}, 2000);
		}
	}
	
	
	// de website opstarten
	$('#houder').css("overflow", "hidden");
	schuifGebieden(gebieden[0]);
	var bovenkant = 350;
		
	$('#alles').click( function() {
		$('nav a').removeClass("actief");
		$(this).addClass("actief");
		schuifGebieden(gebieden[0]);
		return false;
	})
	
	$('#huisgenoot').click( function() {
		$('nav a').removeClass("actief");
		$(this).addClass("actief");
		schuifGebieden(gebieden[1]);
		return false;
	})
	
	$('#leonard').click( function() {
		$('nav a').removeClass("actief");
		$(this).addClass("actief");
		schuifGebieden(gebieden[2]);
		return false;
	})
	
	$('#buurmeisje').click( function() {
		$('nav a').removeClass("actief");
		$(this).addClass("actief");
		schuifGebieden(gebieden[3]);
		return false;
	})
	
	$('#joodse-vriend').click( function() {
		$('nav a').removeClass("actief");
		$(this).addClass("actief");
		schuifGebieden(gebieden[4]);
		return false;
	})
	
	$('#indiese-vriend').click( function() {
		$('nav a').removeClass("actief");
		$(this).addClass("actief");
		schuifGebieden(gebieden[5]);
		return false;
	})
	
	//-----------------menu centreren---------------
	function meetBreedte(elementen) {
		var totaleBreedte = 1;
		elementen.each(function() {
			var elementBreedte = $(this).width();
			totaleBreedte += elementBreedte + 1;
			totaleBreedte += elementBreedte + 1;
		})
		return totaleBreedte;
	}
	var menuBreedte = meetBreedte($('nav li'));
	$('nav ul').css("width" , menuBreedte);
	
	// --------------de info knop -------------
	$('#infoKnop').click(function(){
		if (infoNaarBoven){
			$('#infoKnop').removeClass("geklikt");
			$('article div').animate( { top: 700}, 2000);
			infoNaarBoven = false;
			
		}
		else {
			$('#infoKnop').addClass("geklikt");
			bovenkant = 590 - $('div.zichtbaar').height();
			console.log(bovenkant);
			$('article div').animate( { top: bovenkant}, 2000);
			infoNaarBoven = true;
		}
		
		return false;
	})
	
	
})


