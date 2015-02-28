(function(){

	/* Create a filter for date formatting for date returned in mysql timestamp. */
	/* As per below SO link, Angular accepts date format in ISO 8601 format */
	app.filter('dateToISO', function(){
		return function(input){
			return new Date(input).toISOString();
		};
	});

	app.filter('sumFilter', function () {
	     return function(groups, toFilter) {
	     	var total = 0; 
	        angular.forEach(groups, function(value, key){
	        	total += Number(value[toFilter]);
			});
	        return total;
	     }; 

	});

	app.filter('capitalize', function() {
	    return function(input, all) {
	      return (!!input) ? input.replace(/([^\W_]+[^\s-]*) */g, function(txt)	{
	      		return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
	      }) : '';
	    }
	});

	

})();