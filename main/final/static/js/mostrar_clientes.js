$(document).ready(function() {

    $('#tabla_datatable').DataTable({
        
        ajax: {
            url:   '/mostrar',
            type: 'POST',
            dataSrc: ""
        },

        columns: [
            { data: "cl_id" ,         title: "ID"},
            { data: "cl_correo" ,     title: "CORREO"},
            { data: "cl_contrasena" , title: "CONTRASEÑA"},
            { data: "cl_cedula" ,     title: "CEDULA"},
            { data: "cl_rif" ,        title: "RIF"},
            { data: "cl_p_nombre" ,   title: "P_NOMBRE"},
            { data: "cl_s_nombre" ,   title: "S_NOMBRE"},
            { data: "cl_p_apellido" , title: "P_APELLIDO"},
            { data: "cl_s_apellido" , title: "S_APELLIDO"},
            { data: "cl_afiliacion" , title: "N_AFIL"},
            { data: "cl_puntos" ,     title: "PUNTOS"},
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
        
        var sel = table.row('.selected').data();

        if (sel){

            var sel = table.row('.selected').data();
            console.log(sel);
            console.log(sel['cl_id']);
            
            var id = sel['cl_id']

            $.ajax({
                
                url:   '/mostrar',
                data:  id.toString(),
                type: 'DELETE',
                    
                }).done(function(response){
                    
                    console.log(response);
                    table.row('.selected').remove().draw( false );
                    
                }).fail(function(response){
                    $('form').html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
                });

        }
			
            
    });

    $('#boton_añadir').click( function () {
        window.location.href =  "/registro_natural"		
    } );

    $('#boton_modificar').click( function () {
        //link a modificar datos

    } );

});



