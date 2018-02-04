homeModule.controller('ModalController', function($location,$scope, $state, $window, DataFactory, $mdDialog, data){
    $scope.data = data;
    $scope.AddNewContent = function(){
        console.log("Add New Content");
        $scope.data.push({title: '', body: '', image: ''});
    }
    $scope.Close = function(){
        $mdDialog.hide("Cancel");
    }

    $scope.UpdateContactDetails = function(){
        DataFactory.UpdateContactDetails($scope.data).success(function(response){
            if(response == "Successful"){
                $mdDialog.hide("Successful");
            }
            else {
                $scope.status = "Error updating contact info";
            }
        }).error(function(error){

        });
    }

    $scope.UpdateVisionMissionDetails = function(){
        DataFactory.UpdateVisionMission($scope.data).success(function(response){
            if(response == "Successful"){
                $mdDialog.hide("Successful");
            }
            else {
                $scope.status = "Error updating info";
            }
        }).error(function(error){

        });
    }
});