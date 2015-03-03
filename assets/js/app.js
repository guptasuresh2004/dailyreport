(function(){
	
	window.app = angular.module("citrixDeadlyReport", [
			'ngRoute',
			'angular.filter',
			'ui.bootstrap'
		]);


	/* Manage All the Routes here */
	app.config(["$routeProvider", function($routeProvider){

		/* Home Route */
		$routeProvider
			.when('/home', {
				templateUrl	: "views/AddTask-view.html",
				controller	: "AddTaskCtrl"
			});

		/* My Task Route */	
		$routeProvider
			.when('/MyTask', {
				templateUrl : "views/MyTask-view.html",
				controller	: "MyTaskCtrl"
			});

		/* Daily Report Route */	
		$routeProvider
			.when('/DailyReport', {
				templateUrl : "views/DailyReport-view.html",
				controller	: "DailyReportCtrl"
			});

		/* All Report */	
		$routeProvider
			.when('/AllReports', {
				templateUrl : "views/AllReports-view.html",
				controller	: "AllReportsCtrl"
			});

		$routeProvider
			.when('/todo', {
				templateUrl : "views/todo-view.html",
				controller 	: "todoCtrl"
			})

		$routeProvider
			.otherwise({
				redirectTo : '/home'
			});	

	}]);


	app.controller("headerCtrl", ["$scope", "$http", 'fetchRecordsDb', function($scope, $http, fetchRecordsDb){
		/* Get the username via http */

		
		if(typeof(Storage) !== "undefined"){
			if(sessionStorage.username){
				$scope.username = sessionStorage.username;
			}else{
				var params = {
					action : "getUsername"
				};
				fetchRecordsDb.getData(params).then(function(data){
						$scope.username = data.username;
						sessionStorage.username = data.username;
				});
			}
		}

		

	}]);


})(window);