from flask import Flask, render_template, json, request, jsonify #para ejecutar servidor
import psycopg2                                                  # 1)entrar al final con "cd"
from psycopg2.sql import SQL, Composable, Identifier, Literal    # 2)comando "python app.py"
from psycopg2 import Error
from psycopg2 import sql

from database.DB_cliente_natural import DB_cliente_natural

from database.DB_lugar import DB_lugar
from database.DB_telefono import DB_telefono
from database.DB_tienda import DB_tienda





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
        id_direccion = db2.add(direccion)



        data = {
            'cl_correo'     :    request.form['inputcorreo'], 
            'cl_cedula'     :int(request.form['inputcedula']),   
            'cl_rif'        :    request.form['inputrif'], 
            'cl_contrasena' :    request.form['inputcont'],     
            'cl_afiliacion' :    123,
            'cl_p_nombre'   :    request.form['inputpnombre'],
            'cl_s_nombre'   :    request.form['inputsnombre'],   
            'cl_p_apellido' :    request.form['inputpapellido'], 
            'cl_s_apellido' :    request.form['inputsapellido'], 
            'fk_lugar'      :    None,    
            'fk_tienda'     :    int(request.form['selecttienda']),
        }

        data['fk_lugar'] = id_direccion

        resp = db.add(data)


        db = DB_telefono()   

        telefono = {
            'te_tipo'            :   request.form['tipotlf'],        
            'te_numero'          :   int(request.form['inputtelefono']),             
            'fk_cliente_natural' :   None,         
        }

        db.add(telefono) 


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
            'fk_lugar'      :   request.form['selectparroquia'],     
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




#### lugares #####


@app.route('/lugares',methods=['POST','GET'])     #datatable falta update
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



   


if (__name__ == '__main__'):    
    app.run(port=5005)


