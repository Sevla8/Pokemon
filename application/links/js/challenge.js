function getResults(keywords) { // Effectue une requête et récupère les résultats

	var xhr = new XMLHttpRequest();
	xhr.open('POST', "http://dwarves.iut-fbleau.fr/~dasilvaa/Pokemon/index.php/fight/exists_challenge/");

	xhr.addEventListener('readystatechange', function() {
		if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200 && xhr.responseText != '') {

			alert(xhr.responseText+' sent you a challenge !');

		}
	});
	
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send();

	return xhr;
}

setInterval(getResults, 1000);
