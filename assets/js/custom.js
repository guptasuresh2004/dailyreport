(function(){

	jQuery(document).ready(function(){
		
		/* Prevet default on form submission */
		jQuery(".form-signin").submit(function(e){
			e.preventDefault();

			/* After submit change the state of button */
			var $submit = jQuery("#submit").button('loading');
			/* Get username and password values */
			var email = jQuery("#inputEmail").val().trim();
			var password = jQuery("#inputPassword").val();

			jQuery.ajax({
				url : "server/login.php",
				dataType : 'json',
				type 	: 'POST',
				data : { username : email, password : password }, 
				success : function(data){
					if(data.error){
						$submit.button('reset');
						jQuery(".alert").addClass("in");
					}else{
						/* We can reset the button and redirect the user to login page */
						$submit.button('reset');
						window.location = "http://localhost/dailyreport/index.php";
						//window.location = "http://localhost:8080/citrix-dr/index.php";
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
  					console.log(errorThrown);
				}
			});
		});

	});

	/* Close alert box */
	jQuery(".close").on("click", function(){
		jQuery(this).parent().removeClass('in');
	});

	/* 
		On Logout, since it redirects back to login, 
		we can check on this page if the session is set and 
		we can delete the session? 

		Scenario : Let's say if the user logs in the system, 
		we are using sessionStorage to store his username. 
		If he logs out, and then some one logs back in with another username, 
		then since the username value is in the sessionStorage, 
		it picks that value. To avoid this, 
		we will be deleting the sessionStorage key 
		on login page.
	*/

	if(typeof(Storage) !== "undefined"){
		if(sessionStorage.username){
			sessionStorage.removeItem("username");
		}
	}


})(jQuery);