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
	     	//console.log(groups);
	        angular.forEach(groups, function(value, key){
	        	for (var key in value){
	        		if(key == toFilter){
	        			total += Number(value[toFilter]);		
	        		}
	        	}
	        	
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


	/* 
		Filter to convert an object to array of objects so that we can use filters on ng-repeat directive 
		Reference : https://github.com/angular/angular.js/issues/1286#issuecomment-24649699
	*/
	app.filter('toArray', function () {
    	
    	return function (obj) {
	        if (!(obj instanceof Object)) {
	        	return obj;
	        }

	        var log = []
	        angular.forEach(obj, function(k, v){
	        	log = Object.keys(obj).map(function (key) {
	        		return Object.defineProperty(obj[key], '$key', {__proto__: null, value: key});
	        	});
	        	
	        }, log);

	        return log;
			
	    }

	});

	

})();