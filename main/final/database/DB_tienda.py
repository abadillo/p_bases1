from database.DB import DB
from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql
import decimal
 


class DB_tienda(DB):


    def getall (self):  
    
        try:

            self.cursor.execute("SELECT * FROM tienda")
            resp = self.cursor.fetchall()
            columnas = self.cursor.description

            data = self.querydict(resp,columnas)

            for entidad in data:
                for atributo in entidad:
                    if type(entidad[atributo]) == decimal.Decimal:
                        entidad[atributo] = int(entidad[atributo])

            return data 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})
      
    def add (self, data):
        
        try:

            keys = data.keys()
            columns = ','.join(keys)
            values = ','.join(['%({})s'.format(k) for k in keys])

            
            query = 'INSERT INTO tienda ({0}) VALUES ({1})'.format(columns, values)
            
            #print(self.cursor.mogrify(query, data))  

            self.cursor.execute(query,data)
            self.connection.commit()

                     
            return jsonify({'mensaje':'Tienda creado satisfactoriamente'}) 


        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})
      

    def delete (self,id):

        try:

            self.cursor.execute("DELETE FROM tienda WHERE lu_codigo = %s", (id,) )
         
            self.connection.commit()
            

            return jsonify({'mensaje':'eliminado satisfactoriamente'}) 

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})


    def verifica_exist(self,data):
        return None
       

    def verif_login(self,data):
        return None
   