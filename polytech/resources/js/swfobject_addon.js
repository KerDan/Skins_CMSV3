function jsnAddEvent(target, event, func){ 
	if (target.addEventListener){ 
		target.addEventListener(event, func, false); 
		return true; 
	} else if (target.attachEvent){ 
		var result = target.attachEvent("on"+event, func); 
		return result; 
	} else { 
		return false; 
	}
}

function registerSWFObject(so, container)
{
	// Safari check
	isSafari = navigator.userAgent.toLowerCase().indexOf('safari') != -1,

	// ActiveX check
	isAX = typeof window.ActiveXObject != "undefined";
	
	// If IE ActiveX
	if(isAX && !isSafari) {
		var fobjs = {}, init = false;
		
		function writeSWFObject() {
			so.write(container);
			document.getElementById(container).style.visibility="visible";
		}
		
		document.getElementById(container).style.visibility="hidden";
		jsnAddEvent(window, "load", writeSWFObject);
	} else {
		so.write(container);
	}
}