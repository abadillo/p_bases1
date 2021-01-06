from flask import Flask, render_template, json, request, jsonify #para ejecutar servidor
import psycopg2                                                  # 1)entrar al final con "cd"
from psycopg2.sql import SQL, Composable, Identifier, Literal    # 2)comando "python app.py"
from psycopg2 import Error
from psycopg2 import sql

from database.DB_cliente_natural import DB_cliente_natural
from database.DB_cliente_juridico import DB_cliente_juridico

from database.DB_lugar import DB_lugar
from database.DB_telefono import DB_telefono
from database.DB_tienda import DB_tienda
from database.DB_metodo_pago import DB_metodo_pago
from database.DB_generic import DB_generic



app = Flask(__name__)
app.debug = True






#### Interfaces principales ####


@app.route('/')                               
def main():
    return render_template('inicio.html')
    
@app.route('/inicio_sesion',methods=['POST','GET'])         #listo falta ccs
def inicio_sesion():

    if request.method == 'GET':
        return render_template("inicio_sesion.html")

    else: 
        
        db = DB_cliente_natural()

        data = {
            'cl_correo'     : request.form['inputCorreo'],    
            'cl_contraseña' : request.form['inputContraseña']         
        }

        resp = db.verif_login(data)

        return resp
        




##### Interfaces de registro/ver perfil #####



@app.route('/registro/<entidad>', methods=['GET'])  ##ventana registros
def registro(entidad):

    return render_template("registro_"+entidad+".html")
    


@app.route('/<entidad>/<id>',methods=['GET']) ## Ver perfiles
def ver_perfil(entidad,id):
     
    return render_template("perfil_"+entidad+".html")





#####  DATATABLE  #####

@app.route('/mostrar/<obj>',methods=['GET','POST'])    
def mostrar(obj):

    if obj == 'clientes':
    
        if request.method == 'GET':
            return render_template("mostrar_clientes.html")

        if request.method == 'POST':

            db = DB_cliente_natural()         
            resp = db.getall()

            return jsonify(resp)    


    if obj == 'tiendas':

        if request.method == 'GET':

            return render_template
    
        if request.method == 'POST':

            db = DB_tienda()  
            resp = db.getall()

            return jsonify(resp)
    

########   REST   ###########


@app.route('/manejo_tienda',methods=['GET', 'POST','PUT','DELETE'])
def manejo_tienda():
    
    if request.method == 'GET':                 #busca datos con el ti_codigo
        return "datos de tienda"

    if request.method == 'POST':                    #crea la tienda con (Data)

        db = DB_lugar()   

        direccion = {
            'lu_codigo'     :   None,
            'lu_nombre'     :   request.form['inputdir'],        
            'lu_tipo'       :   'DIRECCION',             
            'fk_lugar'      :   request.form['selectparroquia'],         
        }

        id_direccion = db.add(direccion)

        print(id_direccion)

        data = {
            'ti_nombre'     :   request.form['inputtienda'],                 
            'fk_lugar'      :   id_direccion,
        }

        db = DB_tienda()  
        resp = db.add(data)
        return resp

    if request.method == 'PUT':


        return "Tienda actualizado"   #update

    if request.method == 'DELETE':


        return "Tienda eliminado"


@app.route('/manejo_natural', methods= ['GET', 'POST','PUT','DELETE'])
def manejo_natural():

    if request.method == 'GET':
     
        id = request.args['id']
        
        db = DB_cliente_natural()
        data = db.get(id) 

        return jsonify(data)

    if request.method == 'POST': 
       
        data = {
            'cl_correo'     :    request.form['inputcorreo'], 
            'cl_cedula'     :int(request.form['inputcedula']),   
            'cl_rif'        :   request.form['inputrif'], 
            'cl_contrasena' :    request.form['inputcont'],     
            'cl_afiliacion' :    123,
            'cl_p_nombre'   :    request.form['inputpnombre'],
            'cl_s_nombre'   :    request.form['inputsnombre'],   
            'cl_p_apellido' :    request.form['inputpapellido'], 
            'cl_s_apellido' :    request.form['inputsapellido'], 
            'fk_lugar'      :    None,    
            'fk_tienda'     :    int(request.form['selecttienda']),
            'cl_tipo'       :    'NATURAL',
        }
        

        db = DB_cliente_natural()
        resp = db.verifica_exist(data)
        if (resp != 0): return resp

        
        direccion = {
            'lu_codigo'     :   None,
            'lu_nombre'     :   request.form['inputdir'],        
            'lu_tipo'       :   'DIRECCION',             
            'fk_lugar'      :   request.form['selectparroquia'],         
        }

        db2 = DB_lugar() 
        data['fk_lugar'] = db2.add(direccion)

        id_cliente = db.add(data)


        db = DB_telefono()   

        telefono = {
            'te_tipo'            :   request.form['tipotlf'],        
            'te_numero'          :   int(request.form['inputtelefono']),  
            'fk_cliente'         :   id_cliente,         
        }

        db.add(telefono) 


        return jsonify({'mensaje': id_cliente }) 

 
    if request.method == 'PUT':
        
        id = int(request.form['id_user'])

        data = {
            
            'cl_contrasena' :    request.form['inputcont'],
            'cl_p_nombre'   :    request.form['inputpnombre'], 
            'cl_s_nombre'   :    request.form['inputsnombre'],  
            'cl_p_apellido' :    request.form['inputpapellido'], 
            'cl_s_apellido' :    request.form['inputsapellido'],
        }
        
        db = DB_cliente_natural()
        resp = db.update(id,data)

        
        id_direccion = (db.get(id))['fk_lugar']

        direccion = {
            'lu_nombre'     :   request.form['inputdir'],   
            'fk_lugar'      :   int(request.form['selectparroquia']),     
        }
        
        db = DB_lugar()
        resp2 = db.update( id_direccion , direccion ) 


        #resp3 =  DB_telefono().update() 

        #nota, si ambas claves son iguales solo retorna una 

        if ('mensaje') in resp.keys(): 
            return jsonify(resp)
            
        if ('mensaje') in resp2.keys(): 
            return jsonify(resp2)

 
        return jsonify(resp)
        
    if request.method == 'DELETE':

        id = int(request.get_data())

        db = DB_cliente_natural()   

        resp = db.delete(id)

        return resp



@app.route('/manejo_juridico', methods= ['GET', 'POST','PUT','DELETE'])
def manejo_juridico():

    if request.method == 'GET':
     
        id = request.args['id']
        
        db = DB_cliente_juridico()
        data = db.get(id) 

        return jsonify(data)

    if request.method == 'POST':

        data = {
            'cl_correo'         :    request.form['inputcorreo'],   
            'cl_rif'            :    request.form['inputrif'], 
            'cl_contrasena'     :    request.form['inputcont'],     
            'cl_afiliacion'     :    123,

            'cl_razon_social'   :    request.form['inputrazon'],
            'cl_pagina_web'     :    request.form['inputpagina'],   
            'cl_den_comercial'  :    request.form['inputden'], 
            'cl_capital'        :    int(request.form['inputcapital']), 

            'fk_lugar_fiscal'   :    None,   
            'fk_lugar_fisica'   :    None,   
            'fk_tienda'         :    int(request.form['selecttienda']),
            'cl_tipo'           :    'JURIDICO',
        }
        
        
        db = DB_cliente_juridico()
        resp = db.verifica_exist(data)
        if (resp != 0): return resp

        
        direccion = {
            'lu_codigo'     :   None,
            'lu_nombre'     :   request.form['inputdir'],        
            'lu_tipo'       :   'DIRECCION',             
            'fk_lugar'      :   request.form['selectparroquia'],         
        }
       
        
        db2 = DB_lugar()  
        data['fk_lugar_fiscal'] = db2.add(direccion)
        
        try:
            
            direccion2 = {
                'lu_codigo'     :   None,
                'lu_nombre'     :   request.form['inputdir2'],        
                'lu_tipo'       :   'DIRECCION',             
                'fk_lugar'      :   request.form['selectparroquia2'],         
            }

            if not (direccion2['lu_nombre'] == '' or direccion2['lu_nombre'] == ' '):
                data['fk_lugar_fisica'] = db2.add(direccion2)
       
        except: None
            


        id_cliente = db.add(data)


        db = DB_telefono()   

        telefono = {
            'te_tipo'            :   request.form['tipotlf'],        
            'te_numero'          :   int(request.form['inputtelefono']), 
            'fk_cliente'         :   id_cliente,         
        }

        db.add(telefono) 

        
        try:

            telefono2 = {
                'te_tipo'            :   request.form['tipotlf2'],        
                'te_numero'          :   int(request.form['inputtelefono2']), 
                'fk_cliente'         :   id_cliente,         
            }

            db.add(telefono2) 
       
        except: None

        try:

            telefono3 = {
                'te_tipo'            :   request.form['tipotlf3'],        
                'te_numero'          :   int(request.form['inputtelefono3']), 
                'fk_cliente'         :   id_cliente,         
            }

            db.add(telefono3) 

        except: None

        '''

        Primer-nom	"alez"
        Segundo-nom	"ba"
        Primer-ap	"dasd"
        Segundo-ap	"dasd"
        Cedula1 "26993117"
        Telefono2	"0412578466"

        Primer-nom2	"antonio"
        Segundo-nom2	"badil524123lo"
        Primer-ap2	"alexander"
        Segundo-ap2	"leon"
        Telefono2	"04125788461"

        '''


        return jsonify({'mensaje': id_cliente }) 

 
    if request.method == 'PUT':
        
        id = int(request.form['id_user'])

        data = {
            
            'cl_contrasena' :    request.form['inputcont'],
            'cl_p_nombre'   :    request.form['inputpnombre'], 
            'cl_s_nombre'   :    request.form['inputsnombre'],  
            'cl_p_apellido' :    request.form['inputpapellido'], 
            'cl_s_apellido' :    request.form['inputsapellido'],
        }
        
        db = DB_cliente_juridico()
        resp = db.update(id,data)

        
        id_direccion = (db.get(id))['fk_lugar']

        direccion = {
            'lu_nombre'     :   request.form['inputdir'],   
            'fk_lugar'      :   int(request.form['selectparroquia']),     
        }
        
        db = DB_lugar()
        resp2 = db.update( id_direccion , direccion ) 


        #resp3 =  DB_telefono().update() 

        #nota, si ambas claves son iguales solo retorna una 

        if ('mensaje') in resp.keys(): 
            return jsonify(resp)
            
        if ('mensaje') in resp2.keys(): 
            return jsonify(resp2)

 
        return jsonify(resp)
        
    if request.method == 'DELETE':

        id = int(request.get_data())

        db = DB_cliente_juridico()   

        resp = db.delete(id)

        return resp





@app.route('/metodo_pago', methods= ['GET', 'POST','PUT','DELETE'])
def manejo_metodo_pago():

    if request.method == 'GET':
     
        id = request.args['id']
        
        db = DB_medios_pago()
        data = db.get(id) 

        data.append()

        return jsonify(data)

    if request.method == 'POST': 
       
        data = {
            'mc_documento'   :  request.form['mc_documento'],
            'fk_cliente'     :  int(request.form['fk_cliente']),
            'fk_tipo_pago'   :  int(request.form['fk_tipo_pago']),
        }
        

        db = DB_metodo_pago()
        resp = db.add(data)
        
        return resp
 
    if request.method == 'PUT':
        
        id = int(request.form['id_user'])

        data = {
            
            'cl_contrasena' :    request.form['inputcont'],
            'cl_p_nombre'   :    request.form['inputpnombre'], 
            'cl_s_nombre'   :    request.form['inputsnombre'],  
            'cl_p_apellido' :    request.form['inputpapellido'], 
            'cl_s_apellido' :    request.form['inputsapellido'],
        }
        
        db = DB_cliente_natural()
        resp = db.update(id,data)

        
        id_direccion = (db.get(id))['fk_lugar']

        direccion = {
            'lu_nombre'     :   request.form['inputdir'],   
            'fk_lugar'      :   int(request.form['selectparroquia']),     
        }
        
        db = DB_lugar()
        resp2 = db.update( id_direccion , direccion ) 


        #resp3 =  DB_telefono().update() 

        #nota, si ambas claves son iguales solo retorna una 

        if ('mensaje') in resp.keys(): 
            return jsonify(resp)
            
        if ('mensaje') in resp2.keys(): 
            return jsonify(resp2)

 
        return jsonify(resp)
        
    if request.method == 'DELETE':

        doc = request.form['mc_documento']
        fk_tipo = int(request.form['fk_tipo_pago'])
        fk_cliente = int(request.form['fk_cliente'])

        
        db = DB_metodo_pago()   

        resp = db.delete2(doc,fk_tipo,fk_cliente)

        return resp






#### lugares #####


@app.route('/lugares',methods=['POST','GET'])  
def lugares():
    
    if request.method == 'GET':
 
        tipo = request.args.get('LUGAR')
        fk_lugar = request.args.get('FK_LUGAR')

        db = DB_lugar()  
        resp = db.get2(tipo,fk_lugar)

        return jsonify(resp)


    if request.method == 'POST':
        
        fk_dir = request.form['fk_dir']
        
        db = DB_lugar()
        resp = db.getdir(fk_dir)

        return resp



@app.route('/metodos_pago/<id>',methods=['POST','GET'])  
def metodos_pago(id):
    
    if request.method == 'GET':

        fk_cliente = id

        db = DB_metodo_pago()         
        resp = db.getall2(fk_cliente)
        print(resp)

        return jsonify(resp)

    if request.method == 'POST':

        db = DB_generic()
        resp = db.getall2("tipo_pago")

        return jsonify(resp)

           

        



if (__name__ == '__main__'):    
    app.run(port=5005)


