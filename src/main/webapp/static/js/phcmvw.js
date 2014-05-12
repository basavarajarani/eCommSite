var PHCApp = angular.module('PHCApp',['ngRoute']);

PHCApp.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){
	$routeProvider.
		when('/',{
			templateUrl:'static/html/FeatureTemplate.html',
			controller: 'ShowSliderController'
		}).
		when('/index.html',{
			redirectTo:'/'
		}).
		when('/login',{
			templateUrl:'static/html/login.html'
		}).
		when('/products/category=:categoryId',{
			templateUrl:'static/html/ProductItems.html',
			controller: 'ProductsItemsController'
		}).
		when('/product/id=:productId',{
			templateUrl:'static/html/ProductSingleItemPage.html',
			controller:'ProductsSingleItemController'
		}).
		otherwise({
			controller:'OtherWiseController'
		});

}])

.controller('ShowSliderController', function($scope, $location){

})

.controller('ProductsItemsController', function($scope, $http, $routeParams,$location){
	$http.get("products/category="+$routeParams.categoryId+"/page=1").
	success(function(data, status, headers,config){
		$scope.products = data;
	}).
	error();
})
.controller('ProductsSingleItemController',function($scope, $routeParams,$location){
	
})
.controller('OtherWiseController', function($scope, $routeParams,$location){
	alert($location.path);
});