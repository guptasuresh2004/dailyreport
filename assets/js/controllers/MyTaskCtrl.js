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
				action : "getUserData"
			};

			fetchRecordsDb.getData(params).then(function(data){
				$scope.getUserRecords = data;
			});

			$scope.$on('$viewContentLoaded', function(){

			});
			

	}]);

})();