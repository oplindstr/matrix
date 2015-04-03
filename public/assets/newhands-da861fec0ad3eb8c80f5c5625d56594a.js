/**
 * Created by oplindst on 3.4.2015.
 */


$(document).ready(function () {

    var kirjanpito = {};

    kirjanpito.nayta = (function () {
        var playerstring = $("#players")[0].innerHTML;
        var players = playerstring.split(",");
        var dealer = 1;
        var team1scoretag = $("#team1score")[0];
        var team2scoretag = $("#team2score")[0];
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

        function calculateScores() {
            var team1scores = $(".team1handscore:visible");
            var team2scores = $(".team2handscore:visible");
            var team1totalscore = 0;
            var team2totalscore = 0;

            for (var i = 0; i < team1scores.length; i++) {
                team1totalscore += parseInt(team1scores[i].childNodes[0].value)
                team2totalscore += parseInt(team2scores[i].childNodes[0].value)
            }

            team1scoretag.innerHTML = team1totalscore;
            team2scoretag.innerHTML = team2totalscore;
        }
        return {
            showDealers: showDealers,
            calculateScores: calculateScores
        };
    })();

    var addbuttons = $(".add_nested_fields");
    var addbutton = addbuttons[0];
    addbutton.addEventListener("mouseout", kirjanpito.nayta.showDealers);
    addbutton.addEventListener("click", kirjanpito.nayta.calculateScores);

    kirjanpito.nayta.showDealers();
});
