  directives:
  ng-app
    ng-controller = "thecontroller"

  Avoid global variables by introducing immediately invoked functions (iife)

  (function(){

    /**  all your program here  */

  }());


  // binding expression expression
  // they output the properties that $scope has {{message.content}} for example
  // binding expressions can be used to set html properties

  // chrome: resource -> ctrl + o for debugging


  // controller definition:

  var theController = function($scope){
    $scope.thingToOutput = ...;
  }
  // controller never manipulates the View(DOM), it only modifies the $scope

  // event triggered -> directives notity the controller the triggered event -> controller modifies the scope to respond to the event

  // controllers can be nested

  // ng-html_properties, this properties waits for angular to be loaded


  // $http resembles $.ajax({})
  // it runs asychronously:

  var theController = function($scope, $http){

    var callback = function(response){
      // do something with response
    }

    var onError = function(err) {
      // deal with the error
    }

    // returns a "promise" object
    $http.get("url").then(callback, onError);
  }


  // Modules
  // controllers are always inside modules

  // definition:

  var app = angular.module('theModule', []);
  // [] : array of dependencies

  // controller definition
  var theController = function($scope, $http){
    // ......
  }

  // register controller in a module

  app.controller("theController", theController);

  // in production: for minification

  app.controller("theController", ["$scope", "$http",theController]);

  //Binding expressions are also directives

  // move data from views to model
  // There are directives for it too!

  // pass data from an input form

  <form name="theForm">
  {/* The ng-model directive create a "username" property and pass the value of the input field to it. */}
    <input type="search" ng-model="username" />
    <input type="submit" value="Search" />
  </form>

  // ng-events : e.g. ng-click=function()


  // loop : ng-repeat
  // filters : {{property | filtername}}
  <input type="submit" value="Search" ng-click = "search(username)" />
  <tr ng-repeat="repo in repos">
    <td>{{repo.name}}</td>
    <td>{{repo.stargazers_couny | number}}</td>
    <td>{{repo.language}}</td>
  </tr>

  // ng-show/hide, sort

  // ng-include

  // custom directives & 3rd-party directives

  // services in MVC
  // It should contain all the business logic, views only do presentation

  // services: some ng-service are iifes
  // it helps to keep the simplicity of the controller - pass in to the controller method as a parameter

  // sevices also can be invoked in directives
  // $log : useful for debugging
  // can even send client side error back to the server console

  // UI related services


  
