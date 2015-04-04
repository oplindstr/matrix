/**
 * Created by oplindst on 2.4.2015.
 */


$(document).ready(function () {

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

    placementHandler.show.showPlacements();
});
