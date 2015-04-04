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

			
			/* Load more data pagination code */
			$scope.show_more = function () {
		        $scope.currentPage += 1;
		        $scope.loadData();
    		}

		    $scope.has_more = function () {
		        return $scope.more;
		    }

		    $scope.loadData = function () {

		    	var params = {
					action : "getUserData",
					itemsPerPage : $scope.itemsPerPage,
					currentPage : $scope.currentPage
				};

		    	fetchRecordsDb.getData(params).then(function(data){
					$scope.bigTotalItems = data.pagination[0].total;
					delete data.pagination;
					var records = $scope.getUserRecords.concat(data.userrecords);

					var completetaskdetails = [];

					angular.forEach(records, function(key, value){
						
						//"AT-TaskID : Project Name - Project Description - Time Spent"

						if(typeof key.project_names != "string"){
							for(var i = 0; i< key.project_names.length; i++){
								completetaskdetails.push("AT-" + key.project_attask_id[i] + ": " + key.project_names[i] + " - " + key.project_description[i] + "Time Spent : " + key.time_spent[i]);
							}	
						}else{
								completetaskdetails.push("AT-" + key.project_attask_id + ": " + key.project_names + " - " + key.project_description + "Time Spent : " + key.time_spent);
						}
						
						key.completetaskdetails = completetaskdetails;
						completetaskdetails = [];
					});
					
					$scope.getUserRecords = records;
					
					/* Disable pagination button if number of records in the array exceeds total items from database */
					if(Object.keys($scope.getUserRecords).length >= $scope.bigTotalItems){
						$scope.more = false;
					}
				});
		    }

		    $scope.itemsPerPage = 5;
		    $scope.currentPage = 1;
		    $scope.more = true;
		    $scope.getUserRecords = [];
		    $scope.loadData();


	}]);

})();