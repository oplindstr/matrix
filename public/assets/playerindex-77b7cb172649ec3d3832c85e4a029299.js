/**
 * Created by oplindst on 2.4.2015.
 */


var placementHandler = {};

placementHandler.show = (function () {
    function showPlacements() {
        var placements = $(".placement");

        for (var i = 1; i < placements.length+1; i++) {
            placements[i-1].innerHTML = i;
        }
    }

    return {
        showPlacements: showPlacements
    };
})();

$(document).ready(function () {
    placementHandler.show.showPlacements();
});

$(window).load(function() {
    placementHandler.show.showPlacements();
});
