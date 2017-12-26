var app = angular.module('MainApplication', ['ngAnimate', 'ngMaterial', 'MainRouter', 'AuthModule', 'HomeModule', 'SettingsModule', 'angular-momentjs']);
app.config(function($momentProvider) {
    $momentProvider
        .asyncLoading(true)
});
app.run(function($rootScope, $state, $anchorScroll) {
    $rootScope.$on("$locationChangeSuccess", function() {
        $anchorScroll();
    })
});
app.run(['$anchorScroll', function($anchorScroll) {
    $anchorScroll.yOffset = 50;
}]);
app.controller('MainController', function($anchorScroll, $scope, $location, $state, $interval, $timeout, $mdDialog, $rootScope, $window, DataFactory) {
    //Header - Clock
    var setClock = function() {
        $scope.clock = Date.now();
    }
    setClock();
    $interval(setClock, 1000);

    //NAVIGATION
    $scope.ChangeState = function(state) {
        $state.go(state);
    }

    //
    $scope.siteLocation = $location.path();
    $scope.$watch(function() {
        return $location.path()
    }, function(n, o) {
        $scope.siteLocation = n;
    })
    $scope.GoToTag = function(elementId) {
        var newHash = elementId;
        if ($scope.siteLocation != '/home') {
            $state.go('home');
        }

        if ($location.hash() !== elementId) {
            $timeout(function(){$location.hash(elementId);},100);
        } else {
            $timeout(function(){$anchorScroll();},100);
        }
    };

    // SITE RESPONSIVENESS
    var w = angular.element($window);
    $scope.ScreenDimension = {
        height: $window.screen.height,
        width: $window.screen.width,
        innerHeight: $window.innerHeight,
        innerWidth: $window.innerWidth,
    }
    w.bind('resize', function() {
        $scope.ScreenDimension = {
            height: this.screen.height,
            width: this.screen.width,
            innerHeight: this.innerHeight,
            innerWidth: this.innerWidth
        };
    });

    //TOGGLE NAVIGATION BAR
    $scope.ToggleNavigation = function() {
        var el = $("div.toggle-navbar.hidden");
        if (el.length == 0) {
            el = $("div.toggle-navbar");
            el.addClass("hidden");
        } else {
            el.removeClass("hidden");
        }
    }

});
