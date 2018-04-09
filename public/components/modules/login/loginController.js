var LoginModule = angular.module('LoginModule', []);
LoginModule.controller('LoginController', function($location, $scope, $state, $window, DataFactory) {
    
    $scope.user = {
        'username': '',
        'password': ''
    }
    $scope.signIn = function(){
        DataFactory.SignIn($scope.user).success(function(response){
            var object = {'creds': response};
            if(response != null){
                sessionStorage.setItem('user', JSON.stringify(object));
            }
            $state.go('home');
            setTimeout(function(){ 
                $window.location.reload();
            }, 500);
            // $window.location.reload();
        }).error(function(error){

        });
    }
});