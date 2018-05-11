angular.module("main", [])
    .service('User', function () {
        this.name = "王老五";
    })
    .controller('mainCtrl', function ($scope, User) {
        $scope.titleName = "测试angular Js"
        $scope.user = User;
        $scope.taskList = [];
        $scope.add = function () {
            $scope.taskList.push($scope.task);
        };
    }).controller('mainCtrl2', function ($scope) {
        $scope.titleName = "测试angular Js";
        ;
    })

