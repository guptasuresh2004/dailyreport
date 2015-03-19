(function(){

	app.controller("DailyReportCtrl", [

			'$scope',
			'$http',
			'fetchRecordsDb',
			'$filter',
			
		function(

			$scope,
			$http,
			fetchRecordsDb,
			$filter
			
			){

		$scope.status = {
    		isFirstOpen: true,
    		isFirstDisabled: false
  		};

		
		var dateToSearch, todayDate;
	 	var today = new Date();
	 	var dd = ("0" + today.getDate()).slice(-2)
	 	var MM = ("0" + (today.getMonth() + 1)).slice(-2) //January is 0!
	 	var yyyy = today.getFullYear();
		dateToSearch = yyyy+"-"+MM+"-"+dd;
	 	todayDate = dateToSearch;
		$scope.dateDropDownInput = dateToSearch;


		$scope.today = function() {
			$scope.dateDropDownInput = dateToSearch;
		};

		$scope.today();

		// Disable weekend selection
		$scope.disabled = function(date, mode) {
			return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
		};

		$scope.minDate = '2015-01-01';
		$scope.maxDate = new Date();

		$scope.open = function($event) {
			$event.preventDefault();
			$event.stopPropagation();
			$scope.opened = true;
		};

		$scope.dateOptions = {
			formatYear: 'yy',
			startingDay: 1
		};

		$scope.formats = ['yyyy-MM-dd', 'dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
		$scope.format = $scope.formats[0];

		getDataonDateChange(dateToSearch);
			
		$scope.$watch('dateDropDownInput', function(newDate, oldDate) {
			filterDate(newDate);
		}, false);


		function filterDate(newDate){
			if(newDate != undefined){
				var dateToSearch = $filter('date')(newDate, "yyyy-MM-dd");
				getDataonDateChange(dateToSearch);
			}
		}


		function getDataonDateChange(dateToSearch){
			/* Disable next day button if the current date is today's date */
			if(dateToSearch == todayDate){
				$scope.nextDatestatus = true;
			}else{
				$scope.nextDatestatus = false;
			}

			if(dateToSearch == $scope.minDate){
				$scope.previousDatestatus = true;
			}else{
				$scope.previousDatestatus = false;
			}

			$scope.dateDropDownInput = dateToSearch;

			var argument = {
				action : "getTodayInfo",
				ReportForToday : 1,
				dateSearch : dateToSearch
			};

			fetchRecordsDb.getData(argument).then(function(data){
				$scope.getDailyReportInformation = data;
			});
		}

		
		$scope.previousDate = function(currentDate){
			filterDate(moment(currentDate).subtract(1,'days')._d);
		}

		$scope.nextDate = function(currentDate){	
			filterDate(moment(currentDate).add(1,'days')._d);
		}

		
		$scope.$on("$viewContentLoaded", function(){
			
			
		});


	}]);

})();