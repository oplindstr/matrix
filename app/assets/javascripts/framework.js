$(document).ready(function () {

	window.isMobile = /iphone|ipod|ipad|android|blackberry|opera mini|opera mobi|skyfire|maemo|windows phone|palm|iemobile|symbian|symbianos|fennec/i.test(navigator.userAgent.toLowerCase());

	/*$('.dropdown-toggle').hover(function() {
	  $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown("fast");
	}, function() {
	  $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp("fast")
	});*/

	var slidedDown = "none";

	if (isMobile) {
		$('.dropdown-toggle').on("click", function (e) {
		  $('.dropdown-menu').stop(true, true).delay(250).slideUp("fast");
		  if (slidedDown !== $(this).attr("id")) {
	        e.preventDefault();
	        slidedDown = $(this).attr("id");
	        $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown("fast");
    	  };
	    })
	}
	else {
	$('.dropdown-toggle').hover(function() {
	  $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown("fast");
	}, function() {
	  $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp("fast")
	});
	}
});