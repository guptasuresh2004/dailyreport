/*

A directive to get the statistics of Users role v/s number of hours spent and the total hours based on the date.
This directive will be used in the Daily reports page.

*/

(function(){
	
	app.directive("getStatistics", ["$http", "fetchRecordsDb", function($http, fetchRecordsDb){
		
		return {

			restrict : 'E',
			templateUrl : './templates/getStatistics-tpl.html',
			scope : {
				dateToGetInformation : '@'
			},
			link : function(scope, elements, attributes, ctrl){
				var argument = {
					action : "getStatisticsToDispaly",
					ReportForToday : 1,
					dateSearch : attributes.datetogetinformation
				};

				scope.$watch(
					function(){
						return attributes.datetogetinformation;	
					},					
					function() {
						argument.dateSearch = attributes.datetogetinformation;
						fetchRecordsDb.getData(argument).then(function(data){
							scope.getStatisticsToDispaly = data;
						});
					}
				);
		
			}

		}
		
	}]);


})();