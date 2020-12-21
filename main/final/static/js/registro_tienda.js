$(document).ready(function() {


    var lugares;
    var id_estado;
    var id_municipio;
    var id_parroquia;


    $.ajax({
                
        url:   '/lugares',
        type: 'POST',
        dataSrc: "",
            
        }).done(function(resp){
            
            console.log(resp);
            lugares = resp;         

            var opciones = [];

            opciones.push('<option value="default" selected disabled>ESTADO</option>');

            for (var i=0, l=lugares.length; i<l; i++){
                if (lugares[i].lu_tipo == 'ESTADO')
                    opciones.push('<option value="'+lugares[i].lu_codigo+'">'+lugares[i].lu_nombre+'<opciones>');
            }

            $('#selectestado').html(opciones.join(''));

            
        }).fail(function(resp){
            $(document).html('<div class="alert alert-danger">No se pudo acceder al servidor. Intente de nuevo mas tarde</div>');
    });

    
    //e.preventDefault();
   


    

    $('#selectestado').change(function() {

        id_estado = $(this).find('option:selected').val();
        console.log(id_estado);

        var opciones = [];

        opciones.push('<option value="default" selected disabled>MUNICIPIO</option>');

        for (var i=0, l=lugares.length; i<l; i++){
            if (lugares[i].lu_tipo == 'MUNICIPIO' && lugares[i].fk_lugar == id_estado )
                opciones.push('<option value="'+lugares[i].lu_codigo+'">'+lugares[i].lu_nombre+'<opciones>');
        }

        $('#selectmunicipio').html(opciones.join(''));
        
    });
    


    $('#selectmunicipio').change(function() {

        id_municipio = $(this).find('option:selected').val();
        console.log(id_municipio);

        var opciones = [];

        opciones.push('<option value="default" selected disabled>PARROQUIA</option>');

        for (var i=0, l=lugares.length; i<l; i++){
            if (lugares[i].lu_tipo == 'PARROQUIA' && lugares[i].fk_lugar == id_municipio )
                opciones.push('<option value="'+lugares[i].lu_codigo+'">'+lugares[i].lu_nombre+'<opciones>');
        }

        $('#selectparroquia').html(opciones.join(''));
        
    });

    

    $('#selectparroquia').change(function() {

        id_parroquia = $(this).find('option:selected').val();
        console.log(id_parroquia);

    });
    

});




