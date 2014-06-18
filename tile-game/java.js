// JavaScript Document

function init(){

	var SpeelVeld = [
		[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
 		[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
		[1,0,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,0,1],
		[1,0,1,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,1],
		[1,0,1,0,1,1,0,1,0,1,1,0,0,0,0,1,1,1,1,0,1,0,1,0,0,1,0,0,0,1,0,1,0,1],
		[1,0,0,0,0,1,1,1,0,1,0,0,1,1,0,0,0,0,0,0,1,0,0,0,1,1,1,1,1,1,0,1,0,1],
		[1,1,1,1,0,1,0,0,0,1,1,0,0,1,1,1,1,1,1,0,1,1,1,1,1,0,0,0,0,0,0,1,0,1],
		[1,0,0,0,0,0,0,1,1,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,0,1,0,0,1],
		[1,0,1,0,1,1,0,1,0,0,0,0,0,1,0,1,1,0,1,1,1,0,1,1,1,0,1,0,0,0,0,1,0,1],
		[1,0,0,0,1,1,0,1,1,1,1,1,1,1,0,1,1,0,1,0,0,0,0,0,0,0,1,0,1,1,0,0,0,1],
		[1,1,1,0,1,1,0,0,0,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,1,1,1,0,0,1,1,1,1,1],
		[0,0,0,0,1,0,0,1,1,0,1,1,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0],
 		[1,1,1,0,0,0,1,0,0,0,1,0,1,0,1,1,1,0,1,0,1,0,1,0,1,1,1,0,1,1,0,0,0,1],
		[1,0,0,0,1,1,1,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,1,0,1,1,1],
		[1,0,1,0,1,0,0,0,0,0,0,1,1,0,1,0,1,1,1,0,1,1,0,1,1,1,1,0,1,0,0,1,0,1],
		[1,0,1,0,1,1,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1,0,0,1,0,0,0,0,1,0,1,1,0,1],
		[1,0,1,0,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1,1,0,0,1,1,0,1,0,1,1,0,0,1,0,1],
		[1,0,1,1,1,1,1,1,1,0,0,1,0,0,0,0,1,0,0,1,1,0,0,1,0,1,0,0,0,1,0,1,0,1],
		[1,0,0,0,0,0,0,0,0,1,0,0,1,0,1,1,1,1,0,0,1,1,0,1,0,0,1,0,1,0,0,1,0,1],
		[1,0,1,0,1,1,0,1,0,0,1,0,0,1,1,1,0,0,0,0,0,1,0,0,1,0,1,0,1,0,1,1,0,1],
		[1,0,1,0,1,0,0,0,1,0,0,1,0,0,1,0,0,1,0,1,0,0,1,0,1,0,0,1,1,0,1,1,0,1],
		[1,0,1,0,1,0,1,0,0,1,0,0,1,0,1,0,1,1,0,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1],
		[1,0,1,0,1,0,1,1,0,1,1,1,0,1,0,0,0,0,0,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1],
		[1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
		[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	];
 
	SpeelVeldBreedte = SpeelVeld[0].length;
	SpeelVeldHoogte = SpeelVeld.length;
	var SpeelTerrein = document.getElementById("speelterrein");


	var SchaalTerrein = 20;
	SpeelTerrein.width = SpeelVeldBreedte * SchaalTerrein;
	SpeelTerrein.height = SpeelVeldHoogte * SchaalTerrein;
	
	
	var ctx = SpeelTerrein.getContext("2d");
	ctx.fillStyle = "white";
	ctx.fillRect(0,0,SpeelTerrein.width,SpeelTerrein.height);

	for (var y=0;y<SpeelVeldHoogte;y++) {
	for (var x=0;x<SpeelVeldBreedte;x++) {
		var steen = SpeelVeld[y][x]; 
			if (steen > 0){
				ctx.fillStyle = "rgb(100,0,0)";
				ctx.fillRect(
					x * SchaalTerrein,
					y * SchaalTerrein,
					SchaalTerrein,
					SchaalTerrein
				);
			}
		}
	}
	
	var speler = {
		x : 0,
		y : 11,
		dir : 0,
		speed : 0
 }
	var SpelerOpVeld = document.getElementById("speelobjecten");
	var sctx = SpelerOpVeld.getContext("2d");
		function TekenSpeler(posX, posY){
			sctx.fillStyle = "rgb(0,200,200)";
			sctx.fillRect(
			posX * SchaalTerrein,
			posY * SchaalTerrein,
			SchaalTerrein,SchaalTerrein
		);
	}
	TekenSpeler(speler.x, speler.y);
	shortcut.add("S", function() {
		alert("Start het spel");
		shortcut.remove("S");
	})
	
	
	shortcut.add("Right",function() {
		VerschuifSpeler("r");
	})
	shortcut.add("Left",function() {
		VerschuifSpeler("l");
	})
	shortcut.add("Up",function() {
		VerschuifSpeler("u");
	})
	shortcut.add("Down",function() {
		VerschuifSpeler("d");
	})
	function VerschuifSpeler(dir){
		var SpelerX=speler.x;
		var SpelerY=speler.y;
		switch(dir){
			case "l":
				SpelerX=SpelerX-1;
				if(SpeelVeld[SpelerY][SpelerX]==0){
					speler.x=SpelerX;
					TekenSpeler(SpelerX, SpelerY);
				};
				break;
			case "r":
				SpelerX=SpelerX+1;
				if(SpeelVeld[SpelerY][SpelerX]==0){
					speler.x=SpelerX;
					TekenSpeler(SpelerX, SpelerY);
				};
				break;
			case "u":
				SpelerY=SpelerY-1;
				if(SpeelVeld[SpelerY][SpelerX]==0){
					speler.y=SpelerY;
					TekenSpeler(SpelerX, SpelerY);
				};
				break;
			case "d":
				SpelerY=SpelerY+1;
				if(SpeelVeld[SpelerY][SpelerX]==0){
					speler.y=SpelerY;
					TekenSpeler(SpelerX, SpelerY);
				};
				break;
			default:
			}
		}
		sctx.clearRect(0.0.SpelerOpVeld.width, SpelerOpVeld.height);
				
				
				
				
				
}
window.onload = init;