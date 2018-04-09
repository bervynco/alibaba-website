var mainRouter = angular.module("MainRouter", ["ui.router"])

mainRouter.config(["$stateProvider", "$urlRouterProvider", function ($stateProvider, $urlRouterProvider) {

	$urlRouterProvider.when("", "/home");
	$urlRouterProvider.when("/", "/home");
	$urlRouterProvider.otherwise("/home");

	$stateProvider
		.state("auth", {
			name: "auth",
			parent: "",
			data: {},
			url: "/auth",
			templateUrl: "public/components/modules/auth/auth.html"
			// controller: "MainController"
		})
		.state("site", {
			abstract: "true",
			template: "<ui-view flex layout>"
		})
		.state("settings", {
			name: "settings",
			parent: "site",
			data: {},
			url: "/settings",
			templateUrl: "public/components/modules/settings/settings.html",
			controller: "SettingsController"
		})
		.state("login", {
			name: "login",
			parent: "site",
			data: {},
			url: "/login",
			templateUrl: "public/components/modules/login/login.html",
			controller: "LoginController"
		})
		.state("home", {
			name: "home",
			parent: "site",
			data: {},
			url: "/home",
			templateUrl: "public/components/modules/home/home.landing.html",
			controller: "HomeController",
			resolve: {
				siteData: "HomeFactory"
			}
		})
		.state("products", {
			name: "products",
			parent: "site",
			data: {},
			url: "/home/products",
			templateUrl: "public/components/modules/home/home.products.html",
			controller: "ProductsController",
			resolve: {
				productsData: ["DrilldownFactory", function(DrilldownFactory){
					return DrilldownFactory.getData('products');
				}]
			}
		})
		.state("process", {
			name: "process",
			parent: "site",
			data: {},
			url: "/home/process",
			templateUrl: "public/components/modules/home/home.process.html",
			controller: "ProcessController",
			resolve: {
				processData: ["DrilldownFactory", function(DrilldownFactory){
					return DrilldownFactory.getData('process');
				}]
			}
		})
		.state("vision", {
			name: "vision",
			parent: "site",
			data: {},
			url: "/home/vision",
			templateUrl: "public/components/modules/home/home.vision.html",
			controller: "VisionController",
			resolve: {
				visionData: ["DrilldownFactory", function(DrilldownFactory){
					return DrilldownFactory.getData('vision');
				}]
			}
		})
}]);
