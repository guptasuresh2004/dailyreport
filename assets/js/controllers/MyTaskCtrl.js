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
			$scope.totalItems = 64;
			$scope.currentPage = 4;

			$scope.setPage = function (pageNo) {
			    $scope.currentPage = pageNo;
			};

			$scope.pageChanged = function() {
				$log.log('Page changed to: ' + $scope.currentPage);
			};

			$scope.maxSize = 5;
			$scope.bigTotalItems = 175;
			$scope.bigCurrentPage = 1;


			var params = {
				action : "getUserData",
				maxSize : 3
			};

			fetchRecordsDb.getData(params).then(function(data){
				$scope.getUserRecords = data;
			});

			$scope.$on('$viewContentLoaded', function(){

			});
			

	}]);

})();