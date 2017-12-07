function show_event_parameter_choices(id, value) {  
    var element = $('#' + id);
    if (value == 3) {
        element.next().show();
    }
    else {
        element.next().hide();
    }
}

$(document).ready(function () {
    if ($("#event_signup_required")[0].checked) {
        $("#signup-options").show();
    }
    else {
        $("#signup-options").hide();
    }
    $(".event_parameter_choices").each(function() {
        if ($(this).prev().val() == 3) {
            $(this).show();
        }
        else {
            $(this).hide();
        }
    });
});