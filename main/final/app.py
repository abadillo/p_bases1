from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql

from modules.DB_cliente_natural import DB_cliente_natural


app = Flask(__name__)
app.debug = True


####################################################################


@app.route('/')                                     #metodo request de default es GET
def main():
    return render_template('inicio.html')
    

@app.route('/registro', methods= ['GET', 'POST'] )
def registro():
    
    if request.method == 'POST':
        return render_template("registro_natural.html")
    
    else:
        try:

            data = {
                'cl_correo'     : 'ale12@gmail.com',
                'cl_cedula'     : 215220331,
                'cl_rif'        : 1221221,
                
                'cl_contraseña' : 'buenobueno',
                'cl_puntos'     : 0,
                'cl_afiliacion' : 123,
                'cl_p_nombre'   : 'fernan',
                'cl_s_nombre'   : 'flow',          #None
                'cl_p_apellido' : 'will',
                'cl_s_apellido' : 'rex',           #None
            }

            db = DB_cliente_natural()   
            resp = db.add(data)

            return resp

        except Exception :
            return jsonify({'error':'Error: Hubo un problema con el servidor'})


@app.route('/perfil/<cl_nombre>')
def perfil(cl_nombre):
    return render_template("perfil_natural.html", cl_nombre = cl_nombre)    


@app.route('/producto/<int:pr_id>')        #url generico
def datos_producto(pr_id):
    return "datos produto %s" %pr_id     #escribe en pantalla 


@app.route('/carrito', methods= ['GET', 'POST'] )
def carrito():

    if request.method == 'GET':
        
        lista = ["Pantalones", "Pollo", "Caraotas"]


        return render_template("carrito.html", lista = lista)   
    

    else:   return "ah bueno"


@app.route('/inicio_sesion',methods=['POST','GET'])
def inicio_sesion():

    if request.method == 'GET':
        return render_template("inicio_sesion.html")

    else: 
        correo = request.form['inputCorreo']
        contraseña = request.form['inputContraseña']

        db = DB_cliente_natural()         
        #print(type(correo))
        #print(correo)
        
        #db.cursor.execute("SELECT cl_contraseña FROM cliente_natural WHERE cl_correo = %s ;", (correo,))

        db.cursor.execute("SELECT * FROM cliente_natural WHERE cl_correo = %s ;", (correo,))

        #print('nose2')
    
        db.connection.commit()
        
        data = db.cursor.fetchone()
 
        
        if data is None:   
            
            return jsonify({'mensaje':'correo o contraseña invalida'})   
             
        else: 
           
            if data[2] == contraseña:  
                return jsonify({'mensaje':'conexion_ establecida'}) 
            else:
                return jsonify({'mensaje':'correo o contraseña invalida'}) 
       

        #if correo and contraseña:
         #   return render_template("registro_natural.html")
        #else:
         #   return json.dumps({'html':'<span>Enter the required fields</span>'})
       
        

@app.route('/update_correo',methods=['POST','GET'])
def update_correo():
    return "hola vale" 
            
        
   








###########################


   

@app.route('/showSignin')
def showSignin():
    return render_template('signin.html')

@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')


@app.route('/signUp2',methods=['POST','GET'])
def signU2p():
    try:
        db = DB_cliente_natural()
        _name = request.form['inputName']
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']
        #if db.cursor :  return json.dumps({'message':'Conexion Establecida !'})

        # validate the received values
        if _name and _email and _password:
            
            # All Good, let's call MySQL
            #ok = ok
            #conn = mysql.connect()
            #cursor = conn.cursor()
            #cursor.callproc('sp_createUser',(_name,_email,_password))
            #data = cursor.fetchall()

            print(_name)

            if db.cursor : 
                db.cursor.execute("INSERT INTO cliente_natural (cl_nombre) VALUES ('%s');" %(_email) )
                db.connection.commit()
                return json.dumps({'message':'conexion establecida'})
            
            
            """if len(data) is 0:
                #conn.commit()
                return json.dumps({'message':'User created successfully !'})
            else:
                return json.dumps({'error':str(data[0])})"""

        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})

    except Exception as e:
        return json.dumps({'error':str(e)})
 



if (__name__ == '__main__'):    
    app.run(port=5005)