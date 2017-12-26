settingsModule.factory('SettingsFactory', function ($http) {

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
        SettingsFactorySample: function () {
            return "From Settings Factory";
        }
    }

});
