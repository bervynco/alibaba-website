var homeModule = angular.module('HomeModule', []);
homeModule.controller('HomeController', function($location,$scope, $state, $window, DataFactory, HomeFactory, siteData) {
	window.scroll(0,0);

	$scope.PageData = siteData;
    //Drilldown
    $scope.GoToDrilldown = function(data, link) {
        $state.go(link, data);
    }
});

homeModule.controller('ProductsController', function($location,$scope,$state,$stateParams,$window, productsData){
	$scope.DrilldownData = productsData[0];
	$scope.ProductSearch = function(item){
		if ($scope.ProductSearchInput == undefined)
			return true;
		else {
			if (item.process.toLowerCase().indexOf($scope.ProductSearchInput.toLowerCase()) != -1)
				return true;
		}
		return false;
	}
});

homeModule.controller('ProcessController', function($location,$scope,$state,$stateParams,$window, processData){
	$scope.DrilldownData = processData[0];
});

homeModule.controller('VisionController', function($location,$scope,$state,$stateParams,$window, visionData){
	$scope.DrilldownData = visionData[0];
});
