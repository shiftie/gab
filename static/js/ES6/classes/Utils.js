/* exported Utils */
/* global respimage */
/* global picturefill */

class Utils {
    static getCurrentSrc(element){
	    var getSrc;
	    if(!window.HTMLPictureElement){
	        if(window.respimage){
	            respimage({elements: [element]});
	        } else if(window.picturefill){
	            picturefill({elements: [element]});
	        }
	        return element.src;
	    }

	    getSrc = function(){
	        element.removeEventListener('load', getSrc);
	        element.removeEventListener('error', getSrc);
	    };

	    element.addEventListener('load', getSrc);
	    element.addEventListener('error', getSrc);
	    if(element.complete){
	        getSrc();
	        return element.currentSrc;
	    }
	}

	static getView(){
        return $('.page').data('page') ? $('.page').data('page') : 'home';
    }
}
