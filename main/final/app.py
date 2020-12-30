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


@app.route('/<accion>/tienda',methods=['GET'])
def tienda(accion):

    if accion == 'perfil':
        return render_template("perfil_tienda.html")
    
    if accion == 'registro'
        return render_template("registro_tienda.html")
    

@app.route('/<accion>/natural',methods=['GET'])
def natural(accion):

    if accion == 'perfil':
        return render_template("perfil_natural.html")
    
    if accion == 'registro'
        return render_template("registro_natural.html")
    

@app.route('/<accion>/juridico',methods=['GET'])
def natural(accion):

    if accion == 'perfil':
        return render_template("perfil_juridico.html")
    
    if accion == 'registro'
        return render_template("registro_juridico.html")
    



#####  DATATABLE  #####

@app.route('/mostrar/<obj>',methods=['GET'])    
def mostrar(obj):

    if obj == 'cliente':
    
        if request.method == 'GET':
            return render_template("mostrar_clientes.html")

        if request.method == 'POST':

            db = DB_cliente_natural()         
            resp = db.getall()

            return jsonify(resp)    


    if obj == 'lugar':

        if request.method == 'GET':

            return render_template
    
        if request.method == 'POST'

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

        data = {
            'ti_nombre'     :   request.form['inputtienda'],                 
            'fk_lugar'      :   id_direccion,
        }

        db = DB_tienda()  
        resp = db.add(data)
        return resp

    if request.method == 'PUT':
        return "cliente actualizado"   #update

    if request.method == 'DELETE':
        return "cliente eliminado"


@app.route('/manejo_natural', methods= ['GET', 'POST','PUT','DELETE'])
def manejo_natural():

    if request.method == 'GET':
        
        db = DB_cliente_natural()
         
        datos_usuario = db.get(cl_id) 

        for atributo in datos_usuario[0]:
            if (datos_usuario[0][atributo] == None): datos_usuario[0][atributo] = ''
        
        return jsonify(datos_usuario)

    if request.method == 'POST': 
       
        db = DB_lugar()   

        lu_codigo = db.getlastid()

        direccion = {
            'lu_codigo'     :   lu_codigo,
            'lu_nombre'     :   request.form['inputdir'],        
            'lu_tipo'       :   'DIRECCION',             
            'fk_lugar'      :   request.form['selectparroquia'],         
        }

        id_direccion = db.add(direccion)


        data = {
            'cl_correo'     :    request.form['inputcorreo'],            #string    
            'cl_cedula'     :int(request.form['inputcedula']),             #int 
            'cl_rif'        :    request.form['inputrif'],               #int
            
            'cl_contrasena' :    request.form['inputcont'],         #string 
            'cl_afiliacion' :    123,                                       #int
            'cl_p_nombre'   :    request.form['inputpnombre'],             #string 
            'cl_s_nombre'   :    request.form['inputsnombre'],               #string 
            'cl_p_apellido' :    request.form['inputpapellido'],               #string 
            'cl_s_apellido' :    request.form['inputsapellido'],                #string  
            'fk_lugar'      :    None,    
            'fk_tienda'     :    int(request.form['selecttienda']),
        }

        data['fk_lugar'] = id_direccion


        for key in data.keys():
            if (data[key] == '' or data[key] == ' '): data[key] = None

        db = DB_cliente_natural()   
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
        return "xd"

    if request.method == 'DELETE':

        id = int(request.get_data())

        db = DB_cliente_natural()   

        resp = db.delete(id)

        #delete cliente natural {id} 

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


