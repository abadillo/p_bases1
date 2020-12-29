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

            self.cursor.execute("SELECT * FROM cliente_juridico")
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
      
    def add (self , data):

        try:

            resp = self.verifica_exist(data)

                if (resp !=0):
                     return resp

                else:
                    keys = data.keys()
                    clomuns = ','.join(keys)
                    values =','.join(['%({})s'.format(k) for k in keys])

                    query = 'INSERT INTO cliente_juridico ({0}) VALUES ({1})'.format(columns, values)

                    print(self.cursor.mogrify(query, data))
                    self.cursor.execute(query, data)
                    self.connection.commit()

                    return jsonify({'mensaje':'Cliente creado aparece'})

                except Exception:
                    print(Exception)
                    return jsonify({'error':'Error: hubo un problema con el servidor'})       
                 
    def delete (self, id ):

        try:
                self.cursor.execute("DELETE FROM cliente_juridico WHERE cl_id = %s",(id,))

                self.connection.commit()       

        return jsonify({'mensaje':'cliente eliminado satisfactoriamente'})

    execept Exception:
        return jsonify({'error':'error:hubo un problema con el servidor'})


    def verifica_exist(self,data):

            try:

                self.cursor.execute("SELECT %s FROM cliente_juridico WHERE cl_correo= %s ;", ('cl_id',data['cl_correo'],))

                obj = self.cursor.fetchone() 

                if obj is not None:
                    return jsonify({'invalido': 'correo ya registado'})

                 self.cursor.execute("SELECT %s FROM cliente_juridico WHERE cl_cedula = %s ;", ('cl_id',data['cl_cedula'],))
                    
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'invalido':'Pagina web ya registrada'})  

            if data['cl_rif'] != None: 
                return 0

            self.cursor.execute("SELECT %s FROM cliente_juridico WHERE cl_rif = %s ;", ('cl_id',data['cl_rif'],))
                    
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'invalido':'el rif ya esta registrado'})  

            return 0


        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})
       
