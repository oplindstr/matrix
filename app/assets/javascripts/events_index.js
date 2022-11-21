$(document).ready(function () {
    $(".showDescriptionToggle").on('click', function(){
        $(this).next(".eventDescription").toggle('is-active');
    });
});