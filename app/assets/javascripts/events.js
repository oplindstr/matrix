function show_event_parameter_choices(id, value) {  
    var element = $('#' + id);
    if (value == 3) {
        element.parent().next().show();
    }
    else {
        element.parent().next().hide();
    }
}

function toggle_signup_options() {  
    $("#signup-options").toggle();
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
    $("#event_starttime")[0].defaultValue = $("#event_starttime")[0].defaultValue.substring(0,23);
    $("#event_endtime")[0].defaultValue = $("#event_endtime")[0].defaultValue.substring(0,23);
    $("#event_signup_start")[0].defaultValue = $("#event_signup_start")[0].defaultValue.substring(0,23);
    $("#event_signup_end")[0].defaultValue = $("#event_signup_end")[0].defaultValue.substring(0,23);
    $("#event_signup_cancellable_until")[0].defaultValue = $("#event_signup_cancellable_until")[0].defaultValue.substring(0,23);

    $('.flatpickr').flatpickr({
        enableTime: true,
        time_24hr: true,
        locale: {
            firstDayOfWeek: 1,
            weekdays: {
                shorthand: ["Su", "Ma", "Ti", "Ke", "To", "Pe", "La"],
                longhand: [
                  "Sunnuntai",
                  "Maanantai",
                  "Tiistai",
                  "Keskiviikko",
                  "Torstai",
                  "Perjantai",
                  "Lauantai",
                ],
            },

            months: {
                shorthand: [
                  "Tammi",
                  "Helmi",
                  "Maalis",
                  "Huhti",
                  "Touko",
                  "Kesä",
                  "Heinä",
                  "Elo",
                  "Syys",
                  "Loka",
                  "Marras",
                  "Joulu",
                ],
                longhand: [
                  "Tammikuu",
                  "Helmikuu",
                  "Maaliskuu",
                  "Huhtikuu",
                  "Toukokuu",
                  "Kesäkuu",
                  "Heinäkuu",
                  "Elokuu",
                  "Syyskuu",
                  "Lokakuu",
                  "Marraskuu",
                  "Joulukuu",
                ],
            }
        }
    });
});