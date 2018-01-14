/* ------------------------------------------------------------ */
/* --------------------- SHARED TEMPLATES --------------------- */
/* ------------------------------------------------------------ */

/*/ [ NAVIGATION ] /*/
app.directive("navigation", function () {
    return {
        restrict: 'E',
        controller: 'MainController',
        scope: {

        },
        replace: true,
        link: function (scope, element, attrs) {
        },
        templateUrl: function (scope, element, attrs) {
            return 'public/components/shared/template/navigation/navigation.html'
        }
    }
});
/*/ [ FOOTER ] /*/
app.directive("footer", function () {
    return {
        restrict: 'E',
        controller: 'MainController',
        scope: {

        },
        replace: true,
        link: function (scope, element, attrs) {

        },
        templateUrl: function (scope, element, attrs) {
            //return attrs.templateUrl || 'components/shared/template/navigation/header.html'
            return 'public/components/shared/template/navigation/footer.html'
        }
    }
});

/* ------------------------------------------------------------ */
/* ------------------- CUSTOM - DIRECTIVES -------------------- */
/* ------------------------------------------------------------ */

/*/ [ DIV PROPERTIES ] /*/
app.directive("flexSetter", function () {
    return {
        restrict: 'A',
        scope: {
            heightInPercent: '=',
            widthInPercent: '=',
            minheightInPercent: '=',
            minwidthInPercent: '=',
            fontInPercent: '=',
            margin: '=',
            padding: '='
        },
        replace: true,
        link: function (scope, element, attrs) {
            if (scope.heightInPercent !== undefined) {
                $(element[0]).css("height", scope.heightInPercent.toString() + "%");
            }
            if (scope.widthInPercent !== undefined) {
                $(element[0]).css("width", scope.widthInPercent.toString() + "%");
            }
            if (scope.minheightInPercent !== undefined) {
                $(element[0]).css("min-height", scope.minheightInPercent.toString() + "%");
            }
            if (scope.minwidthInPercent !== undefined) {
                $(element[0]).css("min-width", scope.minwidthInPercent.toString() + "%");
            }
            if (scope.fontInPercent !== undefined) {
                $(element[0]).css("font-size", scope.fontInPercent.toString() + "%");
            }
            if (scope.margin !== undefined) {
                $(element[0]).css("margin", scope.margin);
            }
            if (scope.padding !== undefined) {
                $(element[0]).css("padding", scope.padding);
            }
        }
    }
});
