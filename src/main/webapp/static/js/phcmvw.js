var PHCApp = angular.module('PHCApp',['ngRoute','ngSanitize']);

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
	
	$http.get("getFeaturedProducts").
	success(function(data, status, headers,config){
		$scope.featuredproducts = data;
	}).
	error();
})
.controller('ProductsSingleItemController',function($scope, $http, $routeParams,$location){
	$http.get("products/id="+$routeParams.productId).
	success(function(data,status,headers,config){
		$scope.individualProduct = data;
		attributes = data.attributes;
		
		var attributeSplit = attributes.split("::");
		var attributesArray = new Array();
		$.each(attributeSplit,function(key,value){
			var singleAttrSplit = value.split("-->");
			var attribute = new Object();
			attribute.name = singleAttrSplit[0];
			attribute.value = singleAttrSplit[1];
			attributesArray.push(attribute);
		});
		$scope.productAttributes = attributesArray;
		
	}).
	error();
	$http.get("getFeaturedProducts").
	success(function(data, status, headers,config){
		$scope.featuredproducts = data;
	}).
	error();
	
})
.controller('OtherWiseController', function($scope, $routeParams,$location){
	alert($location.path);
});