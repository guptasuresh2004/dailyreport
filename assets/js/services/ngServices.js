(function(){

	app.factory('fetchRecordsDb', ['$http', function($http){
		var talkToDatabase = {
			
			/* Grab information about the count of AT-TASK added by user today */
			getData : function(params){
				
				/* Get all the data for today for all the users to display in the Daily report page */
				if(params.ReportForToday){
					var ReportForToday = params.ReportForToday;
				};

				if(params.dateSearch){
					var dateSearch = params.dateSearch;
				};

				if(params.action){
					var action = params.action;
				};
				
				if(params.itemsPerPage){
					var itemsPerPage = params.itemsPerPage;
				};

				if(params.currentPage){
					var currentPage = params.currentPage;
				};
				
				
				var promise = $http({
					method : 'GET',
					url	   :  "server/queryDb.php",
					params : {
						action : action,
						ReportForToday : ReportForToday,
						dateSearch : dateSearch,
						itemsPerPage : itemsPerPage,
						currentPage : currentPage
					},
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