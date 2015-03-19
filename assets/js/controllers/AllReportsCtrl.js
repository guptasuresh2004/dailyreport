(function(){

	app.controller('AllReportsCtrl',
			[	
				"$scope", 
				"$http",
				'fetchRecordsDb',
				'd3BarGraph',

		function(

				$scope,
				$http,
				fetchRecordsDb,
				d3BarGraph

			){

			if(typeof(Storage) !== "undefined") {
    			// Check if sessionStorage for all users is set
    			if(sessionStorage.getItem("getAllUsersRecords")){
    				$scope.getAllUsersRecords = JSON.parse(sessionStorage.getItem("getAllUsersRecords"));
    			}else{
		    				/* Get all the users name and ID from database on page load */
					var getAllUsers = {
						action : "getActiveUsers"
					};

					fetchRecordsDb.getData(getAllUsers).then(function(data){
						$scope.getAllUsersRecords = data;
						sessionStorage.setItem("getAllUsersRecords", JSON.stringify(data));
					});		
    			}
			}

			$scope.today = function() {
				$scope.startDate = moment(new Date()).format("YYYY-MM-DD");
				$scope.endDate = moment(new Date()).format("YYYY-MM-DD");
			};

			$scope.today();

			// Disable weekend selection
			$scope.disabled = function(date, mode) {
				return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
			};

			$scope.minDate = '2015-01-01';
			$scope.maxDate = new Date();

			$scope.startDateopen = function($event) {
				$event.preventDefault();
				$event.stopPropagation();
				$scope.startDateopened = true;
			};

			$scope.endDateopen = function($event) {
				$event.preventDefault();
				$event.stopPropagation();
				$scope.minEndDate = $scope.startDate;
				$scope.endDateopened = true;
			};

			$scope.dateOptions = {
				formatYear: 'yy',
				startingDay: 1
			};

			$scope.formats = ['yyyy-MM-dd', 'dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
			$scope.format = $scope.formats[0];


			$scope.AllReportSubmit = function(){

				$scope.UpdatedstartDate = $scope.startDate;
				$scope.UpdatedendDate = $scope.endDate;

				var AllReportparams = {
					action : "getUserReports",
					user : $scope.selectUser, 
					startDate : moment($scope.startDate).format("YYYY-MM-DD"),
					endDate : moment($scope.endDate).format("YYYY-MM-DD")
				};

				fetchRecordsDb.getData(AllReportparams).then(function(data){
					$scope.getGraphRecords = data;
					$scope.totalDaysSearchedFor = Object.keys(data).length;
				});
			}


	}]);

})();