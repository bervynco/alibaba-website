var homeModule = angular.module('HomeModule', []);
homeModule.controller('HomeController', function($location,$scope, $state, $window, DataFactory, HomeFactory, siteData, $mdDialog) {
	window.scroll(0,0);

	$scope.PageData = siteData;
    //Drilldown
    $scope.GoToDrilldown = function(data, link) {
        $state.go(link, data);
	}
	
	$scope.EditTitle = function(title, ev){
		console.log(title);
		$mdDialog.show({
            parent: angular.element(document.body),
            targetEvent: ev,
            templateUrl: "public/components/modules/modals/editTitleModal.html",
            locals: {
                 data:title
            },
            controller: 'ModalController'
        }).then(function(data){
			if(data === 'Successful'){
				$state.reload();
			}
        });
	}

	$scope.EditContact = function(contact, ev){
		$mdDialog.show({
            parent: angular.element(document.body),
            targetEvent: ev,
            templateUrl: "public/components/modules/modals/editContactModal.html",
            locals: {
                 data:contact.content
            },
            controller: 'ModalController'
        }).then(function(data){
			if(data === 'Successful'){
				$state.reload();
			}
        });
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

homeModule.controller('VisionController', function($location,$scope,$state,$stateParams,$window, visionData, $mdDialog){
	$scope.DrilldownData = visionData[0];
	$scope.EditVisionMissionData = function(data, ev){
		console.log(data);
		$mdDialog.show({
            parent: angular.element(document.body),
            targetEvent: ev,
            templateUrl: "public/components/modules/modals/editVisionMissionModal.html",
            locals: {
                 data:data
            },
            controller: 'ModalController'
        }).then(function(data){
			if(data === 'Successful'){
				$state.reload();
			}
        });
	}
});