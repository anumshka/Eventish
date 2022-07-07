/**
 * 
 */

function myFunction(a){
	console.log("Hello know more button called ");
	
	var myEventElem = document.getElementById(a);
	var knowButton = document.getElementById('toggleButton');
	console.log(a);
	console.log(myEventElem)
	console.log(knowButton);
	console.log(myEventElem.style.display);
	if(myEventElem.style.display == 'none'){
		myEventElem.style.display = 'block';
		knowButton.innerHTML = 'Close'
	}
	else{
		myEventElem.style.display = 'none';
		knowButton.innerHTML = 'Know More'
		
	}
	
}
