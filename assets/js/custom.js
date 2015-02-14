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


})(jQuery);