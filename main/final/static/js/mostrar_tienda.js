
function alerta(mensaje){
    alert(mensaje);

};

$(document).ready(function(){

    $('#tabla_datatable').DataTable({

        scrollY:        '50vh',
        scrollCollapse:  true,


        ajax: {
            url: '/mostrar/tiendas',
            type: 'POST',
            dataSrc: "",
        },

        columns:[
            { data:      "ti_codigo"    ,   title:"CODIGO"},
            { data:      "ti_nombre" ,   title: "NOMBRE"},
            { data:      "fk_lugar"  ,   title: "DIRECCION"},
        ]

    });

    var table = $('#tabla_datatable tbody').on( 'click', 'tr', function () {
        if ($(this).hasClass('selcted') ){
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }        

    });

    $('#boton_eliminar').click( function () {
        
        var sel = table.row('.selected').data();

        if (sel){
          
            var codigo = sel['ti_codigo'];

            $.ajax({
                
                url:   '/manejo_tienda',
                data:  codigo.toString(),
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
        
        window.location.href =  "/registro/tienda"		

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