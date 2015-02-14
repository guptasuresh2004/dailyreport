(function(){
	window.app = angular.module("DailyReport", [
			'ngRoute'
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
			.otherwise({
				redirectTo : '/home'
			});	

	}]);

})(window);