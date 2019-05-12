function getResults2() { 

	var xhr2 = new XMLHttpRequest();
	xhr2.open('POST', "http://localhost/Pokemon/user/abandon/");

	xhr2.addEventListener('readystatechange', function() {
		if (xhr2.readyState == XMLHttpRequest.DONE && xhr2.status == 200 && (xhr2.responseText == 'win' || xhr2.responseText == 'lose')) {
			if (xhr2.responseText == 'win')
				document.location.href="http://localhost/Pokemon/fight/win";
			if (xhr2.responseText == 'lose')
				document.location.href="http://localhost/Pokemon/fight/lose";
		}
	});
	
	xhr2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr2.send();

	return xhr2;
}

setInterval(getResults2, 1000);
