var app = angular.module('MainApplication', ['ngAnimate', 'ngMaterial', 'MainRouter', 'AuthModule', 'HomeModule', 'SettingsModule', 'LoginModule', 'angular-momentjs', 'jkAngularCarousel']);
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
app.service('anchorSmoothScroll', function(){

    this.scrollTo = function(eID) {

        // This scrolling function
        // is from http://www.itnewb.com/tutorial/Creating-the-Smooth-Scroll-Effect-with-JavaScript

        var startY = currentYPosition();
        var stopY = elmYPosition(eID);
        var distance = stopY > startY ? stopY - startY : startY - stopY;
        if (distance < 100) {
            scrollTo(0, stopY); return;
        }
        var speed = Math.round(distance / 200);
        if (speed >= 100) speed = 100;
        var step = Math.round(distance / 25);
        var leapY = stopY > startY ? startY + step : startY - step;
        var timer = 0;
        if (stopY > startY) {
            for ( var i=startY; i<stopY; i+=step ) {
                setTimeout("window.scrollTo(0, "+leapY+")", timer * speed);
                leapY += step; if (leapY > stopY) leapY = stopY; timer++;
            } return;
        }
        for ( var i=startY; i>stopY; i-=step ) {
            setTimeout("window.scrollTo(0, "+leapY+")", timer * speed);
            leapY -= step; if (leapY < stopY) leapY = stopY; timer++;
        }

        function currentYPosition() {
            // Firefox, Chrome, Opera, Safari
            if (self.pageYOffset) return self.pageYOffset;
            // Internet Explorer 6 - standards mode
            if (document.documentElement && document.documentElement.scrollTop)
                return document.documentElement.scrollTop;
            // Internet Explorer 6, 7 and 8
            if (document.body.scrollTop) return document.body.scrollTop;
            return 0;
        }

        function elmYPosition(eID) {
            var elm = document.getElementById(eID);
            var y = elm.offsetTop;
            var node = elm;
            while (node.offsetParent && node.offsetParent != document.body) {
                node = node.offsetParent;
                y += node.offsetTop;
            } return y;
        }

    };

});
app.controller('MainController', function($anchorScroll, $scope, $location, $state, $interval, $timeout, $mdDialog, $rootScope, $window,anchorSmoothScroll, DataFactory) {
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
            $location.hash(elementId);
            anchorSmoothScroll.scrollTo(elementId);
            // $timeout(function(){$location.hash(elementId);},100);
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
    $scope.$watch("ScreenDimension", function(newValue, oldValue){
        $scope.ScreenDimension = newValue;
        console.log("RESIZE:", $scope.ScreenDimension);
        // w.off('resize');
    });
    w.bind('resize', function() {
        $scope.ScreenDimension = {
            height: this.screen.height,
            width: this.screen.width,
            innerHeight: this.innerHeight,
            innerWidth: this.innerWidth
        };
        $scope.$apply();
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
    
    $scope.CheckSession = function(){
        $scope.user = JSON.parse(sessionStorage.getItem("user"));
    }
    // $scope.beforeUnloadFlag = false;
    // $scope.$on('onBeforeUnload', function (e, confirmation) {
    //     if($scope.beforeUnloadFlag == false){
    //         var navigationType = $window.performance.navigation.type;
    //         $scope.beforeUnloadFlag = true;
            
    //         console.log(e.keyCode);
    //         if(e.keyCode != 116){
    //             DataFactory.SignOut().then(function(response){
    //             });
    //         }
            
    //     }
    // });
    $scope.CheckSession();
});
