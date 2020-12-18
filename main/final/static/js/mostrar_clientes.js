$(document).ready(function() {
   
    var dataset;

    $.ajax({
			
        url:   '/mostrar',
        type: 'POST',
            
        }).done(function(data){
            
            dataset = data;
            //console.log(dataset);
            
            /*
            if (response['mensaje'] == 'correo o contraseña invalida')
                $(error).replaceWith( '<p id="error">'+response['mensaje']+'</p>'   )
            else
                window.location.href =  "/"			 */		
            
        }).fail(function(data){
            $('form').html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
        });    



    console.log(dataset);


    $('#tabla_datatable').DataTable({
        
        "ajax": dataset,
        "columns": [
            { "data": "cl_cedula" },
            { "data": "cl_id" },
            { "data": "cl_correo" }   
        ]
        
    });
    
   
   
    var table = $('#tabla_datatable').DataTable();
 
    $('#tabla_datatable tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    } );
 
    $('#boton_eliminar').click( function () {
        table.row('.selected').remove().draw( false );
    } );


});



