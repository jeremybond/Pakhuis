$('#mo').css('left','-525px');
$('#mi').css('left','-525px');
$('#mz').css('left','-525px');

//mo: -5px          mi: -5px          mz: -5px

// eastic bounce back circ sine cubi expo

uitschuiven();


function uitschuiven(){
	$('#mo').animate({left: '-25px'},{duration: 2000, easing: 'easeOutBounce'})//easeOutElastic
	$('#mi').delay(500).animate({left: '-25px'},{duration: 2850, easing: 'easeOutBounce'})//easeOutBack
	$('#mz').delay(1000).animate({left: '-25px'},{duration: 3300, easing: 'easeOutBounce'})//easeOutBounce

}
function inschuiven(){
	$('#mo').animate({left: '-525px'},{duration: 3300, easing: 'easeInBounce'})//easeOutElastic
	$('#mi').delay(200).animate({left: '-525px'},{duration: 2850, easing: 'easeInBounce'})//easeOutBack
	$('#mz').delay(500).animate({left: '-525px'},{duration: 2000, easing: 'easeInBounce'})//easeOutBounce
	uitschuiven();
}

$('#mo').click(function(){inschuiven();})
$('#mi').click(function(){inschuiven();})
$('#mz').click(function(){inschuiven();})



