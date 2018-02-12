app.config(['$httpProvider', function ($httpProvider) {
    //Reset headers to avoid OPTIONS request (aka preflight)
    $httpProvider.defaults.headers.common = {};
    $httpProvider.defaults.headers.post = {};
    $httpProvider.defaults.headers.put = {};
    $httpProvider.defaults.headers.patch = {};
}]);

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
        }
    }

});
