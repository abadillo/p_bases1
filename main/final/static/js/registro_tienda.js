$(document).ready(function() {

    var tiendas;
    var id_tienda;
    
    $.ajax({
                
        url:   '/tiendas',
        type: 'POST',
        dataSrc: "",
            
        }).done(function(resp){
            
            console.log(resp);
            tiendas = resp;         

            var opciones = [];

            opciones.push('<option value="default" selected disabled>TIENDAS</option>');

            for (var i=0, l=tiendas.length; i<l; i++){
                opciones.push('<option value="'+tiendas[i].ti_codigo+'">'+tiendas[i].ti_nombre+'<opciones>');
            }

            $('#selecttienda').html(opciones.join(''));

            
        }).fail(function(resp){
            $(document).html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
    });

    
    $('#selecttienda').change(function() {

        id_tienda = $(this).find('option:selected').val();
        console.log(id_tienda);

    });
    
});

/*
$(function(){
    $('form').submit(function(e){

        $.ajax({
            
            url:   '/lugares',
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



*/