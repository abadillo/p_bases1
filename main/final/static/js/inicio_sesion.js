$(function(){
	$('form').submit(function(e){

		$.ajax({
			
			url:   '/inicio_sesion',
			data:  $('form').serialize(),
			type: 'POST',
				
			}).done(function(response){
				
				console.log(response);
				
				if (response['mensaje'] == 'correo o contraseña invalida')
					$(error).replaceWith( '<p id="error">'+response['mensaje']+'</p>'   )
				else
					window.location.href =  "/"					
				
			}).fail(function(response){
				$('form').html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
			});

		e.preventDefault();
	
	});
});


$(function(){
	$('#btnRegistro').click(function(){
			window.location.href =  "/registro"
		});
});









