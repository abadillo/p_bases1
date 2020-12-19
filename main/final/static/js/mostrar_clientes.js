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
            { data: "cl_contraseña" , title: "CONTRASEÑA"},
            { data: "cl_cedula" ,     title: "CEDULA"},
            { data: "cl_rif" ,        title: "RIF"},
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



