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

			/*
			Pagination code
			*/
			
			// $scope.setPage = function (pageNo) {
			//     $scope.currentPage = pageNo;
			// };

			// $scope.pageChanged = function() {
			// 	params.currentPage = $scope.currentPage;
			// 	/* So everytime the page changes, we need to get the records from the database */
			// 	fetchRecordsDb.getData(params).then(function(data){
			// 		delete data.pagination;
			// 		$scope.getUserRecords = data;
			// 	});	
			// };

			// $scope.maxSize = 10; 		//Limit number for pagination size.
			// $scope.currentPage = 1;

			// $scope.itemsPerPage = 5; // (Defaults: 10) : Maximum number of items per page. A value less than one indicates all items on one page.

			// var params = {
			// 	action : "getUserData",
			// 	itemsPerPage : $scope.itemsPerPage,
			// 	currentPage : $scope.currentPage
			// };

			// fetchRecordsDb.getData(params).then(function(data){
			// 	$scope.bigTotalItems = data.pagination[0].total;
			// 	delete data.pagination;
			// 	$scope.getUserRecords = data;
				
			// });

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
					var records = angular.extend($scope.getUserRecords, data, true);

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
		    $scope.getUserRecords = {};
		    $scope.loadData();


	}]);

})();