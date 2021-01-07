from database.DB import DB
from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql
import decimal
from pprint import pprint


class DB_cliente_juridico(DB):

    def getall (self):  
    
        try:

            self.cursor.execute("SELECT * FROM cliente_juridico WHERE cl_tipo = 'NATURAL")
            resp = self.cursor.fetchall()

            self.connection.commit()

            columnas = self.cursor.description

            data = self.querydictdecimal(resp,columnas)

            for entidad in data:
                for atributo in entidad:
                    if type(entidad[atributo]) == decimal.Decimal:
                        entidad[atributo] = int(entidad[atributo])

            return data 

        except Exception:
            return pprint({'error':'Error: Hubo un problema con el servidor'})
      
    
    def add (self, data):
        
        try:

            for key in data.keys():
                if (data[key] == '' or data[key] == ' '): data[key] = None
                     
            keys = data.keys()
            columns = ','.join(keys)
            values = ','.join(['%({})s'.format(k) for k in keys])

            query = 'INSERT INTO cliente ({0}) VALUES ({1}) RETURNING cl_id'.format(columns, values)
            
            print(self.cursor.mogrify(query, data)) 
            self.cursor.execute(query,data)
            self.connection.commit()
            
            id_creado = self.cursor.fetchone()[0]

            return id_creado

        except Exception:
            print(Exception)
            return jsonify({'error':'Error: Hubo un problema con el servidor'})


    def delete (self, id ):

        try:
            self.cursor.execute("DELETE FROM cliente_juridico WHERE cl_id = %s",(id,))

            self.connection.commit()       

            return jsonify({'mensaje':'cliente eliminado satisfactoriamente'})

        except Exception:
            return jsonify({'error':'error:hubo un problema con el servidor'})


    def verifica_exist(self,data):

        try:
                       
            self.cursor.execute("SELECT %s FROM cliente WHERE cl_correo = %s ;", ('cl_id',data['cl_correo'],))
                 
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'invalido':'correo ya registrado'})  

       
           
            self.cursor.execute("SELECT %s FROM cliente WHERE cl_rif = %s ;", ('cl_id',data['cl_rif'],))
                    
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'invalido':'el rif ya esta registrado'})  

           

            return 0


        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})
