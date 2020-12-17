$(function(){
	$('#btnIniciarSesion').click(function(e){
		
		$.ajax({
			url: '/inicio_sesion',
			data: $('form').serialize(),
			type: 'POST',
				success: function(response){
					console.log(response);
					$(error).replaceWith( '<p id="error">'+response['mensaje']+'</p>'   );
				},
				error: function(error){
					console.log(error);
					
				}	
		});
	});
});






