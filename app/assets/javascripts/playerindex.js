/**
 * Created by oplindst on 2.4.2015.
 */

$(document).ready(function () {
    showPlacements();
});

showPlacements = function() {
    placements = $(".placement");

    for (var i = 1; i < placements.length+1; i++) {
        $("<p>" + i + "</p>").appendTo(placements[i-1]);
    }
}
