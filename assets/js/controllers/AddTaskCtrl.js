(function(){

	app.controller("AddTaskCtrl", [
			
			"$scope",
			"$filter",
			"$http",
			'fetchRecordsDb',

		function(

			$scope, 
			$filter, 
			$http, 
			fetchRecordsDb

		){

		$scope.you_have_filled_dr = false;
		$scope.you_have_not_filled_dr = false;

		
		/* Grab information about the count of AT-TASK added by user today */
		$scope.getData = function(id){
			/* This code gets the count of projects that a user has entered in the system */
			if(!arguments.length){
				id = '';
			}else{
				id = id;
			}			

			var promise = $http({
				method : 'GET',
				url	   : "server/queryDb.php?action=getTodayInfo"
			});

			promise 
				.then(function(obj){
					if(id!=""){
						var AtTaskToEdit = $filter('filter')(obj.data, function (d) {
							return d.id === id;
						})[0];
						
						$scope.AtTaskForm.editAtTaskId = AtTaskToEdit.id;
						$scope.AtTaskForm.attaskId = AtTaskToEdit.ATtask_id;
						$scope.AtTaskForm.projectName = AtTaskToEdit.project_name;
						$scope.AtTaskForm.projectDescription = AtTaskToEdit.description;
						$scope.AtTaskForm.timeSpent = AtTaskToEdit.time_spent;
						$scope.AtTaskForm.projectStatus = AtTaskToEdit.project_status;
						
					}

					if(obj.data.length){
						$scope.data = obj.data;
						$scope.you_have_filled_dr = true;
						$scope.you_have_not_filled_dr = false;
						$scope.count_of_items_in_dr = obj.data.length;
					}else{
						$scope.data = {};
						$scope.you_have_not_filled_dr = true;
						$scope.you_have_filled_dr = false;
					}
				
				})

				.catch(function(err){
					console.log("Some error occurred " + err);
				})

				.finally(function(obj){
					console.log("Data loaded");
				});
		};
		
		/* Reset form function */
		$scope.resetForm = function(form){
			form.attaskId = "";
			form.projectName = "";
			form.projectDescription = "";
			form.timeSpent = "";
			form.projectStatus = "";
    	};

		$scope.submitForm = function(formName){

		     if (formName.$valid) {

				var submitButton = jQuery("#submit").button('loading');
				

				/* Default parameters that are used in the form */
				var config = {
					params : {
						'ATtask_id'			: $scope.AtTaskForm.attaskId,
						'project_name'		: $scope.AtTaskForm.projectName,
						'description'		: $scope.AtTaskForm.projectDescription,
						'time_spent'		: $scope.AtTaskForm.timeSpent,
						'project_status'	: $scope.AtTaskForm.projectStatus 
					},
				};

				/* Check if the Id of At-Task is available in hidden field and based on that you can udpate */
				if($scope.AtTaskForm.editAtTaskId){
					config.params.id = $scope.AtTaskForm.editAtTaskId;
				}

				var url = "server/queryDb.php?action=postTodayInfo";

				$http({
		   			method: 'POST',
		    		url: url,
		  			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
		    		transformRequest: function(obj) {
				        var str = [];
				        for(var p in obj)
				        str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
				        return str.join("&");
				    },
		    		data: config.params
				})

				.success(function () {
						/* Call the database to display the updated data */
						submitButton.button('reset');
						$scope.getData();
						formName.$submitted = false;
						/* Reset the form */
						$scope.resetForm($scope.AtTaskForm);
				});

			
			} // End if form.$valid

		}; /* End submit */
		

		/* Edit the information, so refill the data in the form */
		$scope.editAtTaskInformation = function(id){
			$scope.getData(id);
		}


		/* Get the id to be delete in the controller */
		$scope.setDeleteAtTask = function(DeleteId){
			$scope.deleteId = DeleteId;
		}

		/* Delete AT-Task information */
		$scope.deleteAtTask = function(id){
			console.log(id);
			var urlToDelete = "server/queryDb.php?action=deletePost";

			/* Default parameters that are used in the form */
			var deleteParams = {
				params : {
					'id'	: 	id
				},
			};

			$http({
		   			method: 'POST',
		    		url: urlToDelete,
		  			headers: {'Content-Type': 'application/x-www-form-urlencoded'},
		    		transformRequest: function(obj) {
				        var str = [];
				        for(var p in obj)
				        str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
				        return str.join("&");
				    },
		    		data: deleteParams.params
				})

				.success(function () {
						console.log("success");
						$scope.getData();
				});

		};
		

		/* Delete confirm box after view is loaded */
		$scope.$on('$viewContentLoaded', function() {
          
			jQuery("#deleteAtTask").on("click", function(){
				jQuery("#confirm-delete").modal("hide");
    			jQuery("#confirm-delete").on('hidden.bs.modal', function () {
    				$scope.deleteAtTask($scope.deleteId);
    				$scope.$apply();
				});
	            	
	        });
	        
		});
		/* End Delete confirm box */

	}]);

})();