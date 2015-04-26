matrixApp.controller('EventsController', function ($scope, $http, DateHelper) {
    $http.get('events.json').success(function (data, status, headers, config) {
        $scope.events = data;

        var eventList = $scope.events;

        $scope.show = 'upcoming';

        $scope.upcomingEvents = [];
        $scope.pastEvents = [];

        var eventList = $scope.events;

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
});

matrixApp.controller('NewEventController', function ($scope) {
    $scope.signup = false;
});