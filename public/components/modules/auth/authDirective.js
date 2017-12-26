authModule.directive("authDirectiveName", function () {
    return {
        restrict: 'E',
        scope: {
            stuff: '='
        },
        templateUrl: '',
        link: function (scope, element, attrs) {
            console.log("linked to directiveName Directive");
        }
    }
});
