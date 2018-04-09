var homeModule = angular.module('HomeModule', []);
homeModule.controller('HomeController', function($location, $scope, $state, $window, DataFactory, HomeFactory, siteData, $mdDialog) {
	window.scroll(0, 0);

	$scope.PageData = siteData;
	//Drilldown
	$scope.GoToDrilldown = function(data, link) {
		$state.go(link, data);
	}

	console.log($scope.PageData[0].content);
	var sampCarousel = [{
		"body": "Our company Frank and David Food Manufacturing Corporation is the maker of “Alibaba” Brand Corn chips and “Bawang na Bawang (BNB) Cornick and Green Peas.",
		"image": "assets/img/logo/default/placeholder.png",
		"title": "FRANK AND DAVID FOOD MANUFACTURING CORPORATION"
	}, {
		"body": "Our company Frank and David Food Manufacturing Corporation is the maker of “Alibaba” Brand Corn chips and “Bawang na Bawang (BNB) Cornick and Green Peas.",
		"image": "assets/img/logo/default/placeholder.png",
		"title": "FRANK AND DAVID FOOD MANUFACTURING CORPORATION"
	}];

    $scope.OpenContact = function(title, value, ev) {
        var input = {type:title, info: value};
        $mdDialog.show({
			parent: angular.element(document.body),
			targetEvent: ev,
			templateUrl: "public/components/modules/modals/contact.html",
			locals: {
				data: input
			},
			controller: 'ModalController'
		}).then(function(data) {
			if (data === 'Successful') {
				$state.reload();
			}
		});
    }

	$scope.EditTitle = function(title, ev) {
		console.log(title);
		$mdDialog.show({
			parent: angular.element(document.body),
			targetEvent: ev,
			templateUrl: "public/components/modules/modals/editTitleModal.html",
			locals: {
				data: title
			},
			controller: 'ModalController'
		}).then(function(data) {
			if (data === 'Successful') {
				$state.reload();
			}
		});
	}

	$scope.EditContact = function(contact, ev) {
		$mdDialog.show({
			parent: angular.element(document.body),
			targetEvent: ev,
			templateUrl: "public/components/modules/modals/editContactModal.html",
			locals: {
				data: contact.content
			},
			controller: 'ModalController'
		}).then(function(data) {
			if (data === 'Successful') {
				$state.reload();
			}
		});
	}
});

homeModule.controller('ProductsController', function($location, $scope, $state, $stateParams, $window, productsData, $mdDialog) {
	$scope.DrilldownData = productsData[0];
	$scope.displayProduct = false;
	$scope.Products = [];
	$scope.ProductCategory = [];
	console.log($scope.DrilldownData);

	$scope.ProductSearch = function(item) {
		if ($scope.ProductSearchInput == undefined)
			return true;
		else {
			if (item.process.toLowerCase().indexOf($scope.ProductSearchInput.toLowerCase()) != -1)
				return true;
		}
		return false;
	}

	var sample = [{
		"category": "food",
		"name": "Alibaba Corn Chips - Barbeque - Small",
		"content_id": "1",
		"description": "1",
		"id": "1",
		"image": "assets/img/logo/sample/alibaba-barbeque-small.png",
		"overall_id": "1"
	}, {
		"category": "food",
		"name": "Alibaba Corn Chips - Barbeque - Large",
		"content_id": "2",
		"description": "2",
		"id": "2",
		"image": "assets/img/logo/sample/alibaba-barbeque-large.png",
		"overall_id": "2"
	}, {
		"category": "food",
		"name": "Alibaba Corn Chips - Sweet Corn - Small",
		"content_id": "3",
		"description": "3",
		"id": "3",
		"image": "assets/img/logo/sample/alibaba-sweetcorn-small.png",
		"overall_id": "3"
	}, {
		"category": "stuff",
		"name": "Alibaba Corn Chips - Sweet Corn - Large",
		"content_id": "4",
		"description": "4",
		"id": "4",
		"image": "assets/img/logo/sample/alibaba-sweetcorn-large.png",
		"overall_id": "4"
	}, {
		"category": "merch",
		"content_id": "5",
		"description": "5",
		"id": "5",
		"image": "assets/img/logo/default/placeholder.png",
		"overall_id": "5"
	}, {
		"category": "food",
		"content_id": "6",
		"description": "6",
		"id": "6",
		"image": "assets/img/logo/default/placeholder.png",
		"overall_id": "6"
	}, {
		"category": "food",
		"content_id": "7",
		"description": "7",
		"id": "7",
		"image": "assets/img/logo/default/placeholder.png",
		"overall_id": "7"
	}, {
		"category": "merch",
		"content_id": "8",
		"description": "8",
		"id": "8",
		"image": "assets/img/logo/default/placeholder.png",
		"overall_id": "8"
	}, {
		"category": "food",
		"content_id": "9",
		"description": "9",
		"id": "9",
		"image": "assets/img/logo/default/placeholder.png",
		"overall_id": "9"
	}, {
		"category": "merch",
		"content_id": "10",
		"description": "10",
		"id": "10",
		"image": "assets/img/logo/default/placeholder.png",
		"overall_id": "10"
	}];

	function GetProducts(obj) {
		var arr = [];
		_.forEach(obj, function(i, k) {
			arr.push({
				category: i.category, // set category here - nothing specified yet
				content_id: i.content_id,
				description: i.description,
				id: i.id,
				image: 'public/' + i.image,
				overall_id: i.overall_id
			});
		});
		
		console.log($scope.ScreenDimension);
		if($scope.ScreenDimension.innerWidth < 400)
		{
			$scope.Products = _.chunk(arr, 1);
		}	
		else{
			$scope.Products = _.chunk(arr, 4);
		}	
	}

	// Set Product Categories
	function GetProductCategories(obj) {
		if (obj.length > 0) {
			$scope.ProductCategory = _.keyBy(obj, 'category');
			_.set($scope.ProductCategory, 'all', {
				category: 'all'
			});
			$scope.ProductCategory = _.sortBy($scope.ProductCategory, ['category']);;
			$scope.displayProduct = true;
		}
		console.log($scope.ProductCategory);
	}

	// Sort Viewable Products
	$scope.SelectedProductCategory = 'all';
	$scope.SetSelectedProductCategory = function(category) {
		$scope.SelectedProductCategory = category;
		// var arr = (category=='all')?$scope.DrilldownData.body: _.filter($scope.DrilldownData.body, { 'category': category});
		var arr = (category == 'all') ? sample : _.filter(sample, {
			'category': category
		});
		GetProducts(arr);
	}

	// Edit Product Data Page
	$scope.EditProducts = function(data, ev) {
		$mdDialog.show({
			parent: angular.element(document.body),
			targetEvent: ev,
			templateUrl: "public/components/modules/modals/editProductsModal.html",
			locals: {
				data: data
			},
			controller: 'ModalController'
		}).then(function(data) {
			if (data === 'Successful') {
				$state.reload();
			}
		});
	}

	function LoadPage() {
		// GetProducts($scope.DrilldownData.body);
		
		GetProducts(sample);
		GetProductCategories(sample);
	}
	// Initialize Page
	LoadPage();
});

homeModule.controller('ProcessController', function($location, $scope, $state, $stateParams, $window, processData) {
	$scope.DrilldownData = processData[0];
});

homeModule.controller('VisionController', function($location, $scope, $state, $stateParams, $window, visionData, $mdDialog) {
	$scope.DrilldownData = visionData[0];
	$scope.EditVisionMissionData = function(data, ev) {
		$mdDialog.show({
			parent: angular.element(document.body),
			targetEvent: ev,
			templateUrl: "public/components/modules/modals/editVisionMissionModal.html",
			locals: {
				data: data
			},
			controller: 'ModalController'
		}).then(function(data) {
			if (data === 'Successful') {
				$state.reload();
			}
		});
	}
});
