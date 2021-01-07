
function alerta(mensaje){
    alert(mensaje);

};

$(document).ready(function(){

    $('#tabla_datable').DataTable({

        scrollY:        '50vh',
        scrollCollapse:  true,
        scrollX:         true,

        ajax: {
            url: '/mostrar/tiendas',
            type: 'POST',
            dataSrc: "",
        },

        columns:[
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



});