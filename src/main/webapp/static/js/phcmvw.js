var PHCApp = angular.module('PHCApp',['ngRoute','ngSanitize']);

PHCApp.directive("myDirective", function(){
	return function(scope, element, attrs){
		attrs.$observe('value',function(actual_value){
			element.val(actual_value);
		});
		element.spinner({
			min:1,
			max:99,
			stop:function(event, ui){
				var cart = shopCart.returnCart();
				var items = cart.items;

				var spinnerItemId = this.name;
				var spinnerNewValue = this.value;
				var newTotal = 0;

				var itemTotalAfter = 0;
				var noOfItems = 0;

				$.each(items, function(key,value){
					if (value.id == spinnerItemId) {
						var itemPrice = value.price;
						itemTotalAfter = eval(itemPrice*spinnerNewValue);
						value.quantity = spinnerNewValue;
						value.total = parseFloat(itemTotalAfter).toFixed(2);
					}
					newTotal += parseFloat(value.total);
					noOfItems ++;

				});
				shopCart.overWriteCart(cart,newTotal,noOfItems);

				var parentTd = $(this).parents("td");
				var itemPriceTd = $(parentTd).next();
				var itemTotalTd = $(itemPriceTd).next();
				$(itemTotalTd).html("$"+parseFloat(itemTotalAfter).toFixed(2));
				$("#cartsubtotal").html("$"+parseFloat(""+newTotal).toFixed(2));
				console.log("hello");
				shoppingcartservice.retrieveCart();
				shoppingcartservice.returnTotal();
			}
		});
	};
	
});

PHCApp.factory('shoppingcartservice', function(){
	var items = [];
	var shoppingcartservice = {};
	shoppingcartservice.retrieveCart = function(){
		var cart=null;
		if (null != shopCart)
			cart = shopCart.returnCart();
		if (null != cart)
			items = cart.items;
	};
	shoppingcartservice.returnTotal = function(){
		if (null != shopCart)
			return shopCart.returnTotal();
	};
	shoppingcartservice.getCartItems = function() {
		shoppingcartservice.retrieveCart();
		return items;
	};
	return shoppingcartservice;
});
PHCApp.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){
	$routeProvider.
		when('/',{
			templateUrl:'static/html/FeatureTemplate.html',
			controller: 'ShowSliderController'
		}).
		when('/index.html',{
			redirectTo:'/'
		}).
		when('/loginregister',{
			templateUrl:'static/html/loginregister.html'
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
}).controller('ShoppingCartController', function($scope,shoppingcartservice){

	$scope.shoppingcartlist = shoppingcartservice.getCartItems;	
	
	$scope.shoppingCartTotal = shoppingcartservice.returnTotal;
	$scope.refresh = shoppingcartservice.retrieveCart;
	$scope.removeItem = function($event){
		var productId = $($event.target).data("productid");
		if (null != shopCart){
			shopCart.removeItem(productId);
		}
		var parentTr = $(this).parents("tr");
		$(parentTr).remove();
	};
	

	
}).controller('ViewCartController', function($scope, shoppingcartservice){
	
	$scope.updateViewCart = shoppingcartservice.retrieveCart;
});