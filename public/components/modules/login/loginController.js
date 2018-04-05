var LoginModule = angular.module('LoginModule', []);
LoginModule.controller('LoginController', function($location, $scope, $state, $window, DataFactory) {
    
    $scope.user = {
        'username': '',
        'password': ''
    }
    $scope.signIn = function(){
        DataFactory.SignIn($scope.user).success(function(response){
            console.log("RESPONSE: ", response);
        }).error(function(error){

        });
    }
});