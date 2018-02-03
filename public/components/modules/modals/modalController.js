homeModule.controller('ModalController', function($location,$scope, $state, $window, DataFactory, $mdDialog, data){
    $scope.data = data;

    $scope.AddNewContent = function(){
        console.log("Add New Content");
        $scope.data.push({title: '', body: '', image: ''});
    }
    $scope.Close = function(){
        $mdDialog.hide("Cancel");
    }
});