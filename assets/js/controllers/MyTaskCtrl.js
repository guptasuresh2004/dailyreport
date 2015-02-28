(function(){

	app.controller("MyTaskCtrl", [
		
			"$scope",
			"$http",
			'fetchRecordsDb',
			
			function(

				$scope, 
				$http, 
				fetchRecordsDb
			
			){


			var params = {
				action : "getUserData",
				pageStart : 0,
				limit : 5
			};

			fetchRecordsDb.getData(params).then(function(data){
				$scope.getUserRecords = data;
			});

			$scope.$on('$viewContentLoaded', function(){

			});
			

	}]);

})();