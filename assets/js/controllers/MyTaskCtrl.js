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

			$scope.users = fetchRecordsDb.getInformation();
	}]);

})();