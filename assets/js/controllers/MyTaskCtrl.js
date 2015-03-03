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
			
			$scope.setPage = function (pageNo) {
			    $scope.currentPage = pageNo;
			};

			$scope.pageChanged = function() {
				params.currentPage = $scope.currentPage;
				/* So everytime the page changes, we need to get the records from the database */
				fetchRecordsDb.getData(params).then(function(data){
					delete data.pagination;
					$scope.getUserRecords = data;
				});	
			};

			$scope.maxSize = 10; 		//Limit number for pagination size.
			$scope.currentPage = 1;

			$scope.itemsPerPage = 5; // (Defaults: 10) : Maximum number of items per page. A value less than one indicates all items on one page.

			var params = {
				action : "getUserData",
				itemsPerPage : $scope.itemsPerPage,
				currentPage : $scope.currentPage
			};

			fetchRecordsDb.getData(params).then(function(data){
				$scope.bigTotalItems = data.pagination[0].total;
				delete data.pagination;
				$scope.getUserRecords = data;
				
			});

			$scope.$on('$viewContentLoaded', function(){

			});
			

	}]);

})();