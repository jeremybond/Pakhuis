var quotes =[
		{
			tekst: "Vergeef altijd je vijanden - er is niets waar ze zich meer aan ergeren.",
			auteur: "Oscar Wilde",
			kleur: "90, 03, 90"
		},
		{
			tekst: "Be yourself; everyone else is already taken.",
			auteur: "Oscar Wilde",
			kleur: "255, 0, 0"
		},
		{
			tekst: "Don't cry because it's over, smile because it happened.",
			auteur: "Dr. Seuss",
			kleur: "100, 10, 30"
		},
		{
			tekst: "You know you're in love when you can't fall asleep because reality is finally better than your dreams.",
			auteur: "Dr. Seuss",
			kleur: "180, 90, 30"
		},
		{
			tekst: "Be the change that you wish to see in the world.",
			auteur: "Mahatma Gandhi",
			kleur: "3, 70, 2"
		},
		{
			tekst: "In three words I can sum up everything I've learned about life: it goes on.",
			auteur: "Robert Frost",
			kleur: "100, 2, 3"
		},
		{
			tekst: "It is better to remain silent at the risk of being thought a fool, than to talk and remove all doubt of it.",
			auteur: "Maurice Switzer",
			kleur: "250, 70, 20"
		},
		{
			tekst: "Darkness cannot drive out darkness: only light can do that. Hate cannot drive out hate: only love can do that.",
			auteur: "Martin Luther King Jr., A Testament of Hope: The Essential Writings and Speeches",
			kleur: "50, 70, 20"
		},
		{
			tekst: "Imperfection is beauty, madness is genius and it's better to be absolutely ridiculous than absolutely boring.",
			auteur: "Marilyn Monroe, Marilyn",
			kleur: "1, 10, 100"
		},
		{
			tekst: "It is better to be hated for what you are than to be loved for what you are not.",
			auteur: "André Gide, Autumn Leaves",
			kleur: "50, 0, 55"
		},
		{
			tekst: "The man who does not read has no advantage over the man who cannot read.",
			auteur: "Mark Twain",
			kleur: "15, 50, 75"
		},
		{
			tekst: "That which does not kill us makes us stronger.",
			auteur: "Friedrich Nietzsche",
			kleur: "150, 150, 150"
		},
		
]

function toonCitaat(quotes) {
	var willekeurig = Math.floor(Math.random() * quotes.length);
	var quotesObject = quotes[willekeurig];
	
	// MAAK VARIABLEN VAN DE VERSCHILLDENDE ID'S IN DE DOM
	var tekstCitaat = document.getElementById("hetCitaat");
	var middenBol = document.getElementById("middenBol");
	var kleineBol = document.getElementById("kleineBol");
	var auteurCitaat = document.getElementById("auteur");

	tekstCitaat.innerHTML = quotesObject.tekst; //voeg aan hetCitaat de tekst uit het object toe
	tekstCitaat.style.background = "rgb(" + quotesObject.kleur +")";
	middenBol.style.background = "rgb(" + quotesObject.kleur +")";
	kleineBol.style.background = "rgb(" + quotesObject.kleur +")";
	auteurCitaat.innerHTML = quotesObject.auteur;
}

function init() {
	toonCitaat(quotes) 
	setInterval("toonCitaat(quotes)", 10000);
}

window.onload = init;