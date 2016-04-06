angular.module('formApp', ['ngAnimate', 'ui.router', 'templates'])

// configuring our routes 
// =============================================================================
.config(function($stateProvider, $urlRouterProvider) {
    
    $stateProvider
    
        // route to show our basic form (/form)
        .state('form', {
            url: '/form',
            templateUrl: 'form.html',
            controller: 'formController'
        })
        
        // nested states 

        .state('form.household', {
            url: '/household',
            templateUrl: 'form-household.html'
        })
        
        .state('form.people', {
            url: '/people',
            templateUrl: 'form-people.html'
        })
        

        .state('form.vehicles', {
            url: '/vehicles',
            templateUrl: 'form-vehicles.html'
        })
        
        .state('form.finalize', {
            url: '/finalize',
            templateUrl: 'form-finalize.html'
        });
        
    //default to the 'household' view
    $urlRouterProvider.otherwise('/form/household');
})

.controller('formController', function($scope) {
    
    $scope.formData = {people: [], vehicles: []};
    $scope.person = {};
    $scope.vehicle = {};
    
    // function to process the form
    $scope.processForm = function() {
        alert('awesome!');
    };
    
    $scope.addPerson = function(entry){
        if (!entry.last_name){ //don't want to add to the array if object we got was empty
            $scope.formData.people.push(entry);
        }        
        $scope.person = {};
    };
    $scope.addVehicle = function(entry){
        if (!entry.license){
            $scope.formData.vehicles.push(entry);
        }
        
        $scope.vehicle = {};
    };
    
});