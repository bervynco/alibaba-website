app.config(['$httpProvider', function ($httpProvider) {
    //Reset headers to avoid OPTIONS request (aka preflight)
    $httpProvider.defaults.headers.common = {};
    $httpProvider.defaults.headers.post = {};
    $httpProvider.defaults.headers.put = {};
    $httpProvider.defaults.headers.patch = {};
}]);
// app.factory('beforeUnload', function ($rootScope, $window) {
//     // Events are broadcast outside the Scope Lifecycle
    
//     $window.onbeforeunload = function (e) {
//         var confirmation = {};
        
//         var event = $rootScope.$broadcast('onBeforeUnload', confirmation);
//         if (event.defaultPrevented) {
//             return confirmation.message;
//         }
//     };
    
//     return {};
// })
// app.run(function (beforeUnload) {
//     // Must invoke the service at least once
// });
app.factory('DataFactory', function ($http) {

    return {
        //Samples
        SampleGET: function () {
            return $http({
                url: "url/sampleget",
                method: 'GET',
                cache: false
            });
        },
        SamplePOST: function (obj) {
            return $http({
                method: "POST",
                url: "url/samplepost",
                data: obj,
            });
        },
        MainFactorySample: function () {
            return "From Main Factory";
        },
        UpdateTitleDetails: function(data){
            return $http({
                url: "index.php/SiteController/updateTitleInfo",
                method: 'POST',
                data: data,
                cache: false
            });
        },
        UpdateContactDetails: function(contact){
            return $http({
                url: "index.php/SiteController/updateContactInfo",
                method: 'POST',
                data: contact,
                cache: false
            });
        },
        UpdateVisionMission: function(data){
            return $http({
                url: "index.php/SiteController/updateVisionMission",
                method: 'POST',
                data: data,
                cache: false
            });
        },
        UpdateProductDetails: function(data){
            return $http({
                url: "index.php/SiteController/updateProductInfo",
                method: 'POST',
                data: data,
                cache: false
            });
        },
        SignIn: function(user){
            return $http({
                url: "index.php/UserController/signIn",
                method: 'POST',
                data: user,
                cache: false
            });
        },
        SignOut: function(){
             return $http({
                url: "index.php/UserController/signOut",
                method: 'POST',
                cache: false
            });
        }
    }

});
