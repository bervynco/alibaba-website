<!DOCTYPE html>
<html lang="">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Alibaba</title>
	<link rel="shortcut icon" type="image/png" href="/assets/img/logo/client/client-logo.jpg" sizes="16x16" />
	<!-------------------------------------------------------------------------------------->
	<!-------------------------------------    CUSTOM    ----------------------------------->
	<!-------------------------------------------------------------------------------------->

	<link rel="stylesheet" href="public/assets/css/main.css">
	<link rel="stylesheet" href="public/assets/css/material-override.css">

	<!-------------------------------------------------------------------------------------->
	<!-----------------------------------    ANIMATION    ---------------------------------->
	<!-------------------------------------------------------------------------------------->

	<link rel="stylesheet" href="public/assets/css/animate.css">

	<!-------------------------------------------------------------------------------------->
	<!-----------------------------------      FONTS      ---------------------------------->
	<!-------------------------------------------------------------------------------------->

	<link rel="stylesheet" href="public/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="public/assets/lib/material/material-icons.css">

	<!-------------------------------------------------------------------------------------->
	<!-----------------------------------    LIBRARIES    ---------------------------------->
	<!-------------------------------------------------------------------------------------->

	<!-- ANGULAR MATERIAL CSS -->
	<link rel="stylesheet" href="public/assets/lib/material/angular-material.min.css">
	<link rel="stylesheet" href="public/assets/lib/material/material-icons.css">

	<!-- JQUERY -->
	<script src="public/assets/lib/jquery/jquery.min.js"></script>
	<script src="public/assets/lib/jquery/jquery-2.2.1.js"></script>

	<!-- ANGULAR JS -->
	<script src="public/assets/lib/angular/moment.js"></script>
	<script src="public/assets/lib/angular/angular.min.js"></script>
	<script src="public/assets/lib/angular/angular-animate.min.js"></script>
	<script src="public/assets/lib/angular/angular-aria.min.js"></script>
	<script src="public/assets/lib/angular/angular-messages.min.js"></script>
	<script src="public/assets/lib/angular/uirouter.js"></script>
	<script src="public/assets/lib/angular/angular-momentjs.js"></script>

	<!-- ANGULAR MATERIAL LIBRARY -->
	<script src="public/assets/lib/material/angular-material.min.js"></script>

	<!-- JQUERY SCROLLBAR -->
	<script src="public/assets/lib/jquery/jquery.scrollbar.min.js"></script>

	<!-- JQUERY SCROLLBAR CSS -->
	<link rel="stylesheet" href="public/assets/lib/jquery/jquery.scrollbar.css">

	<!-- LODASH -->
	<script src="public/assets/lib/lodash/lodash.js"></script>

	<!-------------------------------------------------------------------------------------->
	<!--------------------------------    SHARED MODULES    -------------------------------->
	<!-------------------------------------------------------------------------------------->

	<!-- APP -->
	<script src="public/components/shared/mainController.js"></script>
	<script src="public/components/shared/mainDirectives.js"></script>
	<script src="public/components/shared/mainFactory.js"></script>
	<script src="public/components/shared/mainRouter.js"></script>

	<!-------------------------------------------------------------------------------------->
	<!-------------------------------    public/components    ------------------------------>
	<!-------------------------------------------------------------------------------------->

	<!-- AUTH -->
	<script src="public/components/modules/auth/authController.js"></script>
	<script src="public/components/modules/auth/authDirective.js"></script>
	<script src="public/components/modules/auth/authFactory.js"></script>

	<!-- HOME -->
	<script src="public/components/modules/home/homeController.js"></script>
	<script src="public/components/modules/home/homeDirective.js"></script>
	<script src="public/components/modules/home/homeFactory.js"></script>

	<!-- SETTINGS -->
	<script src="public/components/modules/settings/settingsController.js"></script>
	<script src="public/components/modules/settings/settingsDirective.js"></script>
	<script src="public/components/modules/settings/settingsFactory.js"></script>

</head>
<body ng-app="MainApplication" ng-controller="MainController" class="scroll" layout="column" layout-align="start stretch" ng-cloak>
	<!-- START:WEBPAGE NAVIGATION -->
	<div flex="none" layout layout-align="start stretch" class="site-navigation element-fixed">
		<navigation></navigation>
	</div>
	<!-- END:WEBPAGE NAVIGATION -->

	<!-- START:CONTENT -->
	<div flex layout="row" layout-align="start stretch" ui-view ng-cloak autoscroll></div>
	<!-- END:CONTENT -->
</body>
</html>

<!-- <script>
function CheckDimension(){
	console.log("w",window.innerWidth);
	console.log("h",window.innerHeight);
}
</script> -->
