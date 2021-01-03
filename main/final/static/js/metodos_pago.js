
function alerta(mensaje){
    alert(mensaje);

};


$(document).ready(function() {

    var id = (window.location.pathname.split('/'))[2];

    $('#tabla_datatable').DataTable({
        
        scrollY:        '50vh',
        scrollCollapse: true,
        scrollX: true,

        ajax: {
            url:   '/metodos_pago/'+id,
            type: 'GET',
            dataSrc: ""
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
          
            $.ajax({
                
                url:   '/metodo_pago',
                data:  id.toString(),
                type: 'DELETE',
                    
                }).done(function(response){
                    
                    alerta(response['mensaje']);
                    table.row('.selected').remove().draw( false );
                    
                }).fail(function(response){
                    alerta('No se pudo acceder al servidor. Intente de nuevo mas tarde');
                });

        }
        else alert('Debe seleccionar algo');
            
    });

    $('#boton_añadir').click( function () {
        
        window.location.href =  "/registro/metodo_pago"		

    } );

    $('#boton_modificar').click( function () {
        
        var sel = table.row('.selected').data();

        /*if (sel){

            var id = sel['cl_id'];
            window.location.href =  '/metodo_pago/'+id;	

        }

        else alert('Debe seleccionar algo');
        */
    });

});



