homeModule.controller('ModalController', function($location,$scope, $state, $window, DataFactory, $mdDialog, data){
    $scope.data = data;
    console.log("DATA: ", $scope.data);
    $scope.AddNewContent = function(){
        $scope.data.push({title: '', body: '', image: ''});
    }

    $scope.AddNewProductContent = function(){
        $scope.data.body.push({id: '', name: '', description: '', image: ''});
    }
    $scope.Close = function(){
        $mdDialog.hide("Cancel");
    }

    $scope.UpdateProductDetails = function(){
        DataFactory.UpdateProductDetails($scope.data).success(function(response){
            if(response == "Successful"){
                $mdDialog.hide("Successful");
            }
            else {
                $scope.status = "Error updating product info";
            }
        }).error(function(error){

        });
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