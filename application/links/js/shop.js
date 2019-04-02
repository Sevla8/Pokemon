var potionElement = document.getElementById('potion');
var pokeballElement = document.getElementById('pokeball');
var totalElement = document.getElementById('total');
var potion = 0;
var pokeball = 0;

function getResults(potion, pokeball) { // Effectue une requête et récupère les résultats
	var xhr = new XMLHttpRequest();
	xhr.open('POST', site_url('/Shop/ajax/'));
	xhr.addEventListener('readystatechange', function() {
		if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
			displayResults(xhr.responseText);
		}
	});
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send('potion='+potion+'&pokeball='+pokeball);
	return xhr;
}

function displayResults(response) { // Affiche les résultats d'une requête
	totalElement.innerHTML = 'Total : '+response+' poke$';
}

function getValues() {
	tmpPotion = potionElement.value;
	tmpPokeball = pokeballElement.value;
	if (tmpPotion != potion || tmpPokeball != pokeball) {
		potion = tmpPotion;
		pokeball = tmpPokeball;
		getResults(potion, pokeball);
	}
}

setInterval(getValues, 100);
