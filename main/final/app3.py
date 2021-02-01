import os 
from flask import Flask, render_template, json, request, jsonify, session, redirect, url_for, send_from_directory

# os.path.dirname(os.path.abspath(__file__)) 

ruta_descarga =  os.getcwd() + r'\reportes\pdf'


app = Flask(__name__)
app.debug = True
app.config['DOWNLOAD_FOLDER'] = ruta_descarga





@app.route('/')                            
def main():

    filename = 'Asistencia.pdf'
    
    return send_from_directory(app.config['DOWNLOAD_FOLDER'], filename, as_attachment=False)




if (__name__ == '__main__'):    
    app.run(port=5005)
