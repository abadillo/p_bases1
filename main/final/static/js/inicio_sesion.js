$(function(){
	$('form').submit(function(e){

		$.ajax({
			
			url:   '/inicio_sesion',
			data:  $('form').serialize(),
			type: 'POST',
				
			}).done(function(response){
				
				console.log(response);
				
				if(response['error'])
					c_error();
				
				else if (response['invalido'])
					$(m_invalido).replaceWith( '<p id="m_invalido">'+response['invalido']+'</p>'   )
				
				else
					window.location.href =  "/"					
				
			}).fail(function(response){
				c_error();
			});

		e.preventDefault();
	
	});
});





$(function(){
	$('#btnRegistro').click(function(){
			window.location.href =  "/registro"
		});
});



function c_error(){
	$('form').html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
};


/*
$(
	function(){
	window.setInterval(function(){	update_correo()  } , 1000)

		function update_correo(){
			$.ajax({
				url:"/update_correo",
				type:"POST",
				dataType: "json",
				data: $('form').serialize(),
				success: function(data){	$(correo_invalido).replaceWith(data)		}
			});
		}

	}

);

*/