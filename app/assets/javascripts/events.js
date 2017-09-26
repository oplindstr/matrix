matrixApp.controller('EventsController', ["$scope", "$http", "DateHelper", function ($scope, $http, DateHelper) {
    $http.get('events.json').success(function (data, status, headers, config) {
        $scope.events = data;

        var eventList = $scope.events;

        $scope.show = 'upcoming';

        $scope.upcomingEvents = [];
        $scope.pastEvents = [];

        var now = new Date();

        $scope.events.sort(function compare(a, b) {
            if (new Date(a.starttime) < new Date(b.starttime)) {
                return -1;
            }
            return 1;
        });

        for (var i = 0; i < eventList.length; i++) {
            if (new Date(eventList[i].starttime) < now) {
                eventList[i].starttime = DateHelper.time_format(eventList[i].starttime);
                $scope.pastEvents.push(eventList[i]);
            }
            else {
                eventList[i].starttime = DateHelper.time_format(eventList[i].starttime);
                $scope.upcomingEvents.push(eventList[i]);
            }
        }
    });
}]);

matrixApp.controller('EditEventController', ["$scope", "$http", function ($scope, $http) {
    $http.get('edit.json').success(function (data, status, headers, config) {
        $scope.signup = data.event.signup_required;
    });
}]);

matrixApp.controller('EventParameterController', ["$scope", function ($scope) {
}]);

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
    $(".event_parameter_choices").each(function() {
        if ($(this).prev().val() == 3) {
            $(this).show();
        }
        else {
            $(this).hide();
        }
    });
});