(function(){

	/* Directive to check if a input entered is a valid number */

	/* Refer : http://stackoverflow.com/questions/19036443/angularjs-how-to-allow-only-a-number-digits-and-decimal-point-to-be-typed-in */

	app.directive('validNumber', function() {
		return {
				require: '?ngModel',
				link: function(scope, element, attrs, ngModelCtrl) {
					if(!ngModelCtrl) {
						return; 
					}
					ngModelCtrl.$parsers.push(function(val) {
						
						if (angular.isUndefined(val)) {
	            			var val = '';
	        			}	

						var clean = val.replace( /[^0-9]+/g, '');
						if (val !== clean) {
							ngModelCtrl.$setViewValue(clean);
							ngModelCtrl.$render();
						}

						return clean;

					});

				element.bind('keypress', function(event) {
					if(event.keyCode === 32) {
						event.preventDefault();
					}
				});
			}
		};
	});


	/* 
		Directive to display today's date that appears next to the logo
		We can pass any dateFormat in the html as an attribute and then the date will be displayed based on the format
		Usage : In your view write : 
			<div class="date" display-date = "longDate"></div> 
			Here longDate is a angular filter. Other such filter information are available at https://docs.angularjs.org/api/ng/filter/date
			dateFilter is an angular service that has all the filter code
	*/
	app.directive('displayDate',['dateFilter', function(dateFilter){
		return {
			restrict : 'A',
			template : "<div class='date'></div>",
			link : function(scope, element, attrs){
					var format = attrs.displayDate;
					if(format === "undefined"){
						format = "longDate";
					}
					element.text(dateFilter(new Date(), format));
				}
		}
	}]);


})();