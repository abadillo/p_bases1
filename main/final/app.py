from flask import Flask, render_template, json, request
import psycopg2
from psycopg2 import Error

from DB_cliente_natural import DB_cliente_natural
from DB import DB
import logging


app = Flask(__name__)
app.debug = True






####################################################################


@app.route('/')                                     #metodo request de default es GET
def main():
    return render_template('inicio.html')


@app.route('/registro', methods= ['GET', 'POST'] )
def registro():
    
    if request.method == 'GET':
        return render_template("registro_natural.html")
    
    else:
        return "pagina registro %s" % request.method    #escribe en pantalla 


@app.route('/perfil/<cl_nombre>')
def perfil(cl_nombre):
    return render_template("perfil_natural.html", cl_nombre = cl_nombre)    


@app.route('/producto/<int:pr_id>')        #url generico
def datos_producto(pr_id):
    return "datos produto %s" %pr_id     #escribe en pantalla 




#########################################


@app.route('/showSignin')
def showSignin():
    return render_template('signin.html')

@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')



@app.route('/signUp',methods=['POST','GET'])
def signUp():
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