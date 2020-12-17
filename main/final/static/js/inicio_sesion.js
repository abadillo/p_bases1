$(function(){
	$('form').submit(function(e){

		$.ajax({
			
			url:   '/inicio_sesion',
			data:  $('form').serialize(),
			type: 'POST',
				
			}).done(function(response){
				
				
				console.log(response);	
				
				

			}).fail(function(response){
				$('form').html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
			});

		e.preventDefault();
	
	});
});


$(function(){
	$('#btnRegistro').click(function(){

		$.ajax({
			url:  '/registro',
			type: 'GET',
			}).done(function(response){	
			  window.location.href =  "/registro"
			});
		});
});









