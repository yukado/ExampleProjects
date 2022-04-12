
   (function() {
	    
	    // get references to select list and display text box
	    var sel = document.getElementsById('sub_catname',);
	    var el = document.getElementsById('subcatname');


	    function getSelectedOption(sel) {
	        var opt;
	        for ( var i = 0, len = sel.options.length; i < len; i++ ) {
	            opt = sel.options[i];
	            if ( opt.selected === true ) {
	                break;
	            }
	        }
	        return opt;
	    }

	    // assign onclick handlers to the buttons
	    document.getElementsById('showVal').onclick = function () {
	        el.value = sel.value;    
	    }
   
})