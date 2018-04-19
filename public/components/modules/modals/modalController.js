homeModule.controller('ModalController', function($location,$scope, $state, $window, DataFactory, $mdDialog, data){
    $scope.data = angular.copy(data);
    console.log("DATA: ", $scope.data);
    $scope.saveFlag = 0;
    $scope.AddNewContent = function(){
        $scope.data.push({title: '', body: '', image: ''});
    }

    $scope.AddNewProductContent = function(){
        $scope.data.body.push({id: '', name: '', description: '', image: ''});
    }
    $scope.Close = function(){
        
        if($scope.saveFlag == 0){
            $scope.data = data;
        }
        $mdDialog.hide();
        
    }

    $scope.titleDetails = function(){
        console.log("TITLE DETAILS");
        DataFactory.UpdateTitleDetails($scope.data).success(function(response){
            if(response == "Successful"){
                $mdDialog.hide("Successful");
            }
            else {
                $scope.status = "Error updating title info";
            }
        }).error(function(error){

        });
    }

    $scope.UpdateProductDetails = function(){
        console.log("UPDATE PRODUCT DETAILS:", $scope.data);
        DataFactory.UpdateProductDetails($scope.data).success(function(response){
            if(response == "Successful"){
                $scope.saveFlag = 1;
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

    $scope.RemoveProduct = function(index){
        $scope.data.body.splice(index, 1);
    }
});
