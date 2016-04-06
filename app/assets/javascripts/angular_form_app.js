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

.controller('formController', function($scope, $http) {
    
    $scope.formData = {people: []};
    $scope.person = {};
    $scope.vehicle = {};
    
    $scope.errorMessage = "";
    
    // function to process the form
    $scope.processForm = function() {
        alert('awesome!');
    };
    
    $scope.addPerson = function(entry){
        if (entry.last_name){ //don't want to add to the array if object we got was empty
            entry.vehicles = [];
            $scope.formData.people.push(entry);
        }        
        $scope.person = {};
    };
    
    $scope.addVehicle = function(entry){
        if (entry.license){
            $scope.formData.people[entry.ownerIndex].vehicles.push(entry);
        }
        $scope.vehicle = {};
    };
    
    $scope.processForm = function(){
        var fullFormData = $scope.formData;
           
       $http({url: '/households.json', method: 'POST', data: fullFormData
        }).then(function successCallback(response) {
            createPeople(response.data.id, fullFormData);
          }, function failureCallback(response){$scope.errorMessage = response.data});//alert if household data wasn't accepted
        var createPeople = function (household_id, fullformData){
            var peeps = fullFormData.people;
            peeps.forEach(function (person){
                person.household_id = household_id;
                $http.post('/people.json', person).
                then(function successCallback(response){
                    var cars = person.vehicles;
                    cars.forEach(function (car){ //create a car for each one this person owns
                        car.person_id = response.data.person_id;
                        $http.post('/vehicles.json', car);
                    });
                }, function failureCallback(response){$scope.errorMessage = response.data});//alert on rejected person data
            });
        };

    };
    
});