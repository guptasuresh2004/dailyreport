(function(){

	app.factory('fetchRecordsDb', ['$http', function($http){
		var talkToDatabase = {
			
			/* Grab information about the count of AT-TASK added by user today */
			getData : function(params){
				
				var promise = $http({
					method : 'GET',
					url	   :  "server/queryDb.php",
					params : params,
					headers: {
    					'Content-type': 'application/json'
  					}
				}).then(function(response){
					return response.data;
				})
				.catch(function(err){
					console.log("Some error occurred " + err);
				})
				.finally(function(obj){
					console.log("Data loaded");
				});
				
				return promise;

			}

		} // End talkToDatabase

		return talkToDatabase;
	}]);

})();