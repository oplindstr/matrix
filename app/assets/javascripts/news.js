matrixApp.controller('NewsController', ["$scope", "$http", function ($scope, $http) {
    $http.get('news.json').success(function (data, status, headers, config) {
        $scope.news = data;

        $scope.news.sort(function compare(a, b) {
            if (new Date(a.created_at) < new Date(b.created_at)) {
                return -1;
            }
            return 1;
        });

        $scope.news = $scope.news.slice(0,3);
    });
}]);