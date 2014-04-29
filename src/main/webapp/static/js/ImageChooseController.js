var imageFetchDialogApp = angular.module('imageFetchDialogApp', []);


imageFetchDialogApp.controller('PicasaController', function($scope, $http){
	/*	$scope.albums = ['one','two','three','four','five','six','seven','eight',
	                 'nine', 'ten','elven','twelve'];*/

	$scope.updateAlbums = function() {
		$http.get('getAlbumList').
		success(function(data, status, headers, config) {
			var albumArray = new Array();
			$.each(data, function(key,value){
				var albumItem = new Object();
				albumItem.key = key;
				albumItem.value = value;

				albumArray.push(albumItem);
			});
			$scope.albums = albumArray;
		}).
		error(function(data, status, headers, config) {
			alert("error");
		});
	};
	
	$scope.retrievePics = function(albumid) {
		
		console.log("retrieving photos");
		$http.get('getAlbumImages', {params:{albumId: albumid}}).
		success(function(data, status, headers,config){
			$scope.photos = data; 
		}).
		error(function(data, status, headers,config){
			alert("error");
		});
	};
});