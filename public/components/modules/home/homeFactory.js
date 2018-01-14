homeModule.factory('HomeFactory', function($http, HomeService) {
    var siteData = {};
    var getData = function() {
        return HomeService.GetData().then(function(response) {
            return angular.extend(siteData, response.data);
        })
    }
    return getData();
});
homeModule.factory('DrilldownFactory', function($http, $location, HomeService) {
    var siteData = {};
    return {
        getData: function(state) {
            return HomeService.GetData().then(function(response) {
                return angular.extend(siteData, _.filter(response.data[1].content, function(o) {
                    return o.link == state;
                }));
            })
        }
    }
});
homeModule.service('HomeService', function($http, $window) {
    this.GetData = function() {
        return $http({
            url: "index.php/SiteController/getAllSiteData",,
            // url: "api/sitedata.json",
            method: 'GET'
        });
    }
});
