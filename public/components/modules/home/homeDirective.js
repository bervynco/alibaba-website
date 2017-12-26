homeModule.directive("homeDirectiveName", function () {
    return {
        restrict: 'E',
        scope: {
            stuff: '='
        },
        templateUrl: '',
        link: function (scope, element, attrs) {
            console.log("linked to homeDirectiveName Directive");
        }
    }
});
