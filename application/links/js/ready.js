function getResults2() { // Effectue une requête et récupère les résultats

	var xhr2 = new XMLHttpRequest();
	xhr2.open('POST', "http://localhost/Pokemon/fight/make_attack/");

	xhr2.addEventListener('readystatechange', function() {
		if (xhr2.readyState == XMLHttpRequest.DONE && xhr2.status == 200 && xhr2.responseText == 'do_it') {

		}
	});
	
	xhr2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr2.send();

	return xhr2;
}

setInterval(getResults2, 1000);
