

function alerta(mensaje){
    alert(mensaje);

};





$(document).ready(function() {


    var tiendas;
    var id_tienda;
    
    $.ajax({
                
        url:   '/mostrar/tiendas',
        type: 'POST',
        dataSrc: "",
            
        }).done(function(resp){
            
            tiendas = resp;         

            var opciones = [];

            opciones.push('<option value="default" selected disabled>TIENDAS</option>');

            for (var i=0, l=tiendas.length; i<l; i++){
                opciones.push('<option value="'+tiendas[i].ti_codigo+'">'+tiendas[i].ti_nombre+'<opciones>');
            }

            $('#selecttienda').html(opciones.join(''));

            
        }).fail(function(resp){
            alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
    });


    $('#selecttienda').change(function() {

        id_tienda = $(this).find('option:selected').val();

    });
    
});


$(function(){
    $('form').submit(function(e){

        $.ajax({
            
            url:   '/manejo_empleado',
            data:  $('form').serialize(),
            type: 'POST',
                
            }).done(function(response){
                            
                if(response['error'])
					alerta(response['error']);
				
				else if (response['invalido'])
                    alerta(response['invalido']);
				
                else
                    /*window.location.href =  "/mostrar/empleados";*/
                    window.location.href =  "/"
                    			
                
            }).fail(function(response){
                alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
            });

        e.preventDefault();
    
    });
});

