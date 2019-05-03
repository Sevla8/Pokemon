function getResults() { // Effectue une requête et récupère les résultats

	var xhr = new XMLHttpRequest();
	xhr.open('POST', "http://localhost/Pokemon/fight/refresh/");

	xhr.addEventListener('readystatechange', function() {
		if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200 && xhr.responseText == 'do_it') {

			document.location.href="http://localhost/Pokemon/fight/";

		}
	});
	
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send();

	return xhr;
}

setInterval(getResults, 1000);