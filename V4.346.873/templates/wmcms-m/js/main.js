/**
 * main.js
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2014, Codrops
 * http://www.codrops.com
 */
function getElementsByClassName(tagName,className) {
        var tag = document.getElementsByTagName(tagName);
        var tagAll = [];
        for(var i = 0 ; i<tag.length ; i++){
            if(tag[i].className.indexOf(className) != -1){
                tagAll[tagAll.length] = tag[i];
            }
        }

        return tagAll;

    }


(function() {

	var bodyEl = document.body,
		content = document.querySelector( '.content-wrap' ),
		openbtn = document.getElementById( 'open-rside' ),
		closebtn = document.getElementById( 'close-rside' ),
		isOpen = false;

	function init() {
		initEvents();
	}

	function initEvents() {
		
		if( openbtn ) {
		openbtn.addEventListener( 'click', toggleMenu );
		}
		if( closebtn ) {
			closebtn.addEventListener( 'click', toggleMenu );
		}

		// close the menu element if the target it´s not the menu element or one of its descendants..
		content.addEventListener( 'click', function(ev) {
			var target = ev.target;
			if( isOpen && target !== openbtn ) {
				toggleMenu();
			}
		} );
	}

	function toggleMenu() {
		if( isOpen ) {
			classie.remove( bodyEl, 'show-rside' );
		}
		else {
			classie.add( bodyEl, 'show-rside' );
		}
		isOpen = !isOpen;
	}

	init();

})();

