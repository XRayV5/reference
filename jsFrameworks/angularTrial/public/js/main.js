(function(){
  var app = angular.module("githubViewer", []);

  var MainController = function ($scope, $http, $interval, $log, $anchorScroll, $location){
    var onUserComplete = function(res){
      $scope.user = res.data;
      $http.get($scope.user.repos_url).then(onRepos, onError);
    };

    var onRepos = function(response){
      $scope.repos = response.data;
      $location.hash("userDetails");
      $anchorScroll();
    };

    var onError = function(reason) {
      $scope.error = "Could not fetch the user";
    };

    $scope.search = function(username){
      $log.info("Searching for" + username);
      $http.get("http://api.github.com/users/" + username).then(onUserComplete, onError);
      if(countdownInterval){
        $interval.cancel(countdownInterval);
        $scope.countdown = null;
      }
    };

    var decrementCountdown = function ()
    {
      $scope.countdown -=1;
      if($scope.countdown < 1){
        $scope.search($scope.username);
      }
    };

    var countdownInterval = null;
    var startCoundown = function (){
      countdownInterval = $interval(decrementCountdown, 1000, $scope.countdown);
    };

    $scope.username = "angular";
    $scope.message = "GitHub Viewer";
    $scope.repoSortOrder = "-stargazers_count";

    $scope.countdown = 5;
    startCoundown();
  };

  app.controller("MainController", ["$scope", "$http", "$interval", "$log", "$anchorScroll", "$location", MainController]);

}());
