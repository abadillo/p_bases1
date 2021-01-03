function c_error(mensaje){
    $(m_invalido).replaceWith( '<p id="m_invalido">'+mensaje+'</p>'   )
};

function alerta(mensaje){
    alert(mensaje);

};


$(document).ready(function() {

    var fk_cliente = 1;

    $('#tabla_datatable').DataTable({
        
        scrollY:        '50vh',
        scrollCollapse: true,
        scrollX: true,

        ajax: {
            url:   '/mostrar/metodos_pago',
            type: 'POST',
            data: {
                'fk_cliente': fk_cliente,
            },
            async: false, 
        },

        columns: [
            { data: "mc_documento" ,         title: "DOC"},
            { data: "fk_tipo_pago" ,        title: "TIPO"},
             
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
          
            var id = sel['cl_id'];

            $.ajax({
                
                url:   '/manejo_natural',
                data:  id.toString(),
                type: 'DELETE',
                    
                }).done(function(response){
                    
                    alerta(response['mensaje']);
                    table.row('.selected').remove().draw( false );
                    
                }).fail(function(response){
                    c_error('No se pudo acceder al servidor. Intente de nuevo mas tarde');
                });

        }
        else alert('Debe seleccionar algo');
            
    });

    $('#boton_añadir').click( function () {
        
        window.location.href =  "/registro/natural"		

    } );

    $('#boton_modificar').click( function () {
        
        var sel = table.row('.selected').data();

        if (sel){

            var id = sel['cl_id'];
            window.location.href =  '/natural/'+id;	

        }

        else alert('Debe seleccionar algo');
    });

});



