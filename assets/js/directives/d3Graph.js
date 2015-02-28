(function(){

	app.directive('d3Graph', ["$http", "fetchRecordsDb", "d3BarGraph", function($http, fetchRecordsDb, d3BarGraph){
		return {
			restrict : "EA",
			templateUrl : "./templates/graph-tpl.html",
			scope : {
				datatopopulate : '=',
				graphname : '@',
				datetogetinformation : '@'
			},
			link : function(scope, element, attributes){

				d3.select("svg").attr("width", "0");
				d3.select("svg").attr("height", "0");
				var graphName = attributes.graphname;
				scope.$watch("datatopopulate", function(newValue, oldValue){
					/* Remove all the occurrances of the D3 before creating a new D3 Graph. We are updating the graph everytime the data is updated. */      
					d3.select("svg").selectAll('*').remove();
					if((newValue !== undefined) && (JSON.stringify(newValue)!='{}')){
						//d3BarGraph.deleteChart();
						d3.select("svg").attr("width", "700");
						d3.select("svg").attr("height", "400");						
						d3BarGraph.InitChart(newValue, graphName);		
					}
				});

				/* To get the graph for each day's report, pass the date */
				scope.$watch("datetogetinformation",function(newValue) {
					d3.select("svg").selectAll('*').remove();
					if(newValue !== undefined){
						var argument = {
							action : "getStatisticsforGraph",
							ReportForToday : 1,
							dateSearch : attributes.datetogetinformation
						};

						fetchRecordsDb.getData(argument).then(function(data){
							d3.select("svg").attr("width", "700");
							d3.select("svg").attr("height", "400");						
							d3BarGraph.InitChart(data, graphName);
						});
					}
				});

				

			}
		}
	}]);

})();