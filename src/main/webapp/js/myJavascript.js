/**
 * 
 */

function myFunction(a){
	console.log("Hello know more button called ");
	
	var myEventElem = document.getElementById(a);
	console.log(a);
	console.log(myEventElem.style.display);
	if(myEventElem.style.display == 'none'){
		myEventElem.style.display = 'block';
	}
	else{
		myEventElem.style.display = 'none';
	}
	
}
