from flask import Flask, render_template, json, request, jsonify, session, redirect, url_for,make_response,send_file,send_from_directory  #para ejecutar servidor
from datetime import datetime, timedelta                                        # 1)entrar al final con "cd"
                                                                                # 2)comando "python app.py"

from database.DB_usuario import DB_usuario
from database.DB_cliente import DB_cliente
from database.DB_lugar import DB_lugar
from database.DB_telefono import DB_telefono
from database.DB_tienda import DB_tienda
from database.DB_metodo_pago import DB_metodo_pago
from database.DB_generic import DB_generic
from database.DB_empleado import DB_empleado
from database.DB_persona_contacto import DB_persona_contacto
from database.DB_proveedor import DB_proveedor
from database.DB_inventario import DB_inventario
from database.DB_reporte import DB_reporte
from Reporte import Reporte
import pdfkit
from flask import send_from_directory, current_app as app
from werkzeug.utils import secure_filename
import os

#from PyQt5 import QAxContainers

ruta_descarga =  os.getcwd() + r'\reportes\pdf'


app = Flask(__name__)
app.debug = True
app.config['DOWNLOAD_FOLDER'] = ruta_descarga



@app.route('/pdf')                               
def pdf():
    filename = 'Asistencia.pdf'
    return send_from_directory(app.config['DOWNLOAD_FOLDER'], filename,as_attachment=False)
  



@app.route('/Genera',methods=['GET','POST'])    
def Generar():

    if request.method == 'GET':
        return render_template('Genera.html')

    if request.method == 'POST':

        db = Reporte()
       
        A = request.form['Fecha']      
    
        B = request.form['Tienda']    
        
        resp = db.asistencia(A,B)           

        return resp        
     

if (__name__ == '__main__'):    
    app.run(port=5005)
   




