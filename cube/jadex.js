addEventListener("load", startScript, false);

var draaiX=110, draaiY=30, draaiZ=20, kubes;

function startScript(){
	kubes = document.getElementById('kubes');
	//console.log(kubes);
	zetOm(kubes, 'rotateX(' + draaiX + 'deg) rotateY(' + draaiY + 'deg) rotateZ(' + draaiZ + 'deg)' );
}

function zetOm(el, waarde) {
	if(typeof el.style.webkitTransform !== 'undefined'){
		el.style.webkitTransform = waarde;
	} else if(typeof el.style.MozTransform !== 'undefined'){
		el.style.MozTransform = waarde;
	} else if(typeof el.style.msTransform !== 'undefined'){
		el.style.msTransform = waarde;
	} else if(typeof el.style.oTransform !== 'undefined'){
		el.style.oTransform = waarde;
	} else if(typeof el.style.transform !== 'undefined'){
		el.style.transform = waarde;
	} else {
		alert('Deze browser ondersteunt geen 3D transformaties');
	}
}
function draai() {
	draaiZ ++;
	draaiX ++;
	draaiY += 3
	zetOm(kubes, 'rotateX(' + draaiX + 'deg) rotateY(' + draaiY + 'deg) rotateZ(' + draaiZ + 'deg)'  );

}

draaiDoor = setInterval(draai, 50);


$(document).ready(function(){

	
})



