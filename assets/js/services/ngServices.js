(function(){

	app.factory('fetchRecordsDb', ['$http', function($http){
		return {
			getInformation : function () {
				return [
					{
						firstName : "idrish",
						lastName : "laxmidhar"
					},
					{
						firstName : "john",
						lastName	: "Doe"
					}
				];
			}
		}
	}]);

})();