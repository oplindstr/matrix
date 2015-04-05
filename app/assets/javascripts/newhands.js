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
            dealers = $(".dealer:visible");
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
            var winnerstag = $("#winners")[0];
            var team1wintag = $("#team1winning")[0];
            var team2wintag = $("#team2winning")[0];
            team1wintag.innerHTML = "";
            team2wintag.innerHTML = "";
            winnerstag.value = 0;

            for (var i = 0; i < team1scores.length; i++) {
                var score1 = team1scores[i].childNodes[2].value;
                if (score1 != "") {
                    team1totalscore += parseInt(team1scores[i].childNodes[2].value);
                }
                var score2 = team2scores[i].childNodes[2].value;
                if (score2 != "") {
                    team2totalscore += parseInt(team2scores[i].childNodes[2].value);
                }
            }

            team1scoretag.innerHTML = team1totalscore;
            team2scoretag.innerHTML = team2totalscore;

            if (team1totalscore >= 500 || team2totalscore >= 500) {
                if (team1totalscore > team2totalscore) {
                    winnerstag.value = 1;
                    team1wintag.innerHTML = ", voittavat";
                }
                if (team2totalscore > team1totalscore) {
                    winnerstag.value = 2;
                    team2wintag.innerHTML = ", voittavat";
                }
            }
        }

        function addEventListeners() {
            $("input[type=number]").off();
            $("input[value='-']").off();
            $("input[type=number]").change(calculateScores);
            $("input[value='-']").click(function() {
                var value = $(this).next()[0].value;
                $(this).next()[0].value = -1 * value;
                calculateScores();
            });
        }

        function doEverything() {
            showDealers();
            calculateScores();
            addEventListeners();
        }

        return {
            showDealers: showDealers,
            calculateScores: calculateScores,
            addEventListeners: addEventListeners,
            doEverything: doEverything
        };
    })();

    kirjanpito.nayta.doEverything();

    $(document).on('nested:fieldAdded', function(event){
        kirjanpito.nayta.doEverything();

    })

    $(document).on('nested:fieldRemoved', function(event){
        kirjanpito.nayta.doEverything();
    })
});