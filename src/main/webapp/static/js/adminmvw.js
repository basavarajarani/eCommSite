var AdminApp = angular.module('AdminApp',['ngRoute','ngSanitize']);


AdminApp.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){
	$routeProvider.
	when('/',{
		templateUrl:'static/html/AdminTemplates/AdminDashboard.html',
		controller: 'DashboardController'
	}).
	when('/index.html',{
		redirectTo:'/'
	}).
	when('/UsersGrid',{
		templateUrl:'static/html/AdminTemplates/AdminUsersGrid.html',
		controller: 'UsersGridController'
	}).
	when('/ProductsCategoryGrid',{
		templateUrl:'static/html/AdminTemplates/ProductsCategoryGrid.html',
		controller:'ProductsCategoryGridController'
	}).
	when('/ProductsGrid',{
		templateUrl:'static/html/AdminTemplates/ProductsGrid.html',
		controller:'ProductsGridController'
	}).
	otherwise({
		controller:'OtherWiseController'
	});

}])

.controller('DashboardController', function($scope, $location){

})

.controller('UsersGridController', function($scope, $http, $routeParams,$location){
	alert("UsersGrid Invoked");
})
.controller('ProductsCategoryGridController',function($scope, $http, $routeParams,$location){

})
.controller('OtherWiseController', function($scope, $routeParams,$location){
	alert($location.path);
}).controller('ProductsGridController', function($scope,shoppingcartservice){

});