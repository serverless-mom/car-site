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
        });
        
    //want to default to the 'household' view
    $urlRouterProvider.otherwise('/form/household');
})

.controller('formController', function($scope) {
    
    $scope.formData = {};
    $scope.formData.people = [];
    $scope.person = {};
    
    // function to process the form
    $scope.processForm = function() {
        alert('awesome!');
    };
    
    $scope.logPerson = function(person){
        console.log (person);
    };
    
});