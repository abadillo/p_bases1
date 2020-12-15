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