/**
 * Created by oplindst on 3.4.2015.
 */

$(document).ready(function () {

    var kirjanpito = {};

    kirjanpito.nayta = (function () {
        console.log("suor");
        dealers = $(".dealer");
        playerstring = dealers[0].innerHTML;
        players = playerstring.split(" ");
        var dealer = 1;
        function showDealers() {
            dealers = $(".dealer");
            for (var i = 0; i < dealers.length; i++) {
                dealers[i].innerHTML = players[dealer-1];
                if (dealer === 4) {
                    dealer = 1;
                }
                else {
                    dealer++;
                }
            }
            dealer = 1;
        }
        return {
            showDealers: showDealers
        };
    })();

    var buttons = $(".add_nested_fields");
    var button = buttons[0];
    button.addEventListener("mouseout", kirjanpito.nayta.showDealers);

    kirjanpito.nayta.showDealers();
});