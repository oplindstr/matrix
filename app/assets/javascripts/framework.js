$(document).ready(function () {

	$('.dropdown-toggle').hover(function() {
	  $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown("fast");
	}, function() {
	  $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp("fast")
	});
});