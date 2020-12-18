from modules.DB import DB
from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql

class DB_cliente_natural(DB):

    def verifica(self,data):

        try:
            
            self.cursor.execute("SELECT %s FROM cliente_natural WHERE cl_correo = %s ;", ('cl_id',data['cl_correo'],))
                 
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'mensaje':'correo ya registrado'})              

        
            self.cursor.execute("SELECT %s FROM cliente_natural WHERE cl_cedula = %s ;", ('cl_id',data['cl_cedula'],))
                    
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'mensaje':'cedula ya registrada'})  


            self.cursor.execute("SELECT %s FROM cliente_natural WHERE cl_rif = %s ;", ('cl_id',data['cl_rif'],))
                    
            obj = self.cursor.fetchone()  

            if obj is not None:    
                return jsonify({'mensaje':'el rif ya esta registrado'})  

            return 0


        except Exception:
            return Exception 
            #jsonify({'error':'Error: Hubo un problema con el servidorr'})
    
    def add (self, data):
        
        try:

            resp = self.verifica(data)

            if (resp != 0): return resp
            else:
                
                #return data
                
                query = sql.SQL("INSERT INTO cliente_natural({fields}) VALUES ({values});").format(
                    fields=sql.SQL(',').join([
                        sql.Identifier('cl_correo'),                 
                        sql.Identifier('cl_contraseña'),
                        sql.Identifier('cl_puntos'),
                        sql.Identifier('cl_afiliacion'),
                        sql.Identifier('cl_cedula'),
                        sql.Identifier('cl_p_nombre'),
                        sql.Identifier('cl_s_nombre'),
                        sql.Identifier('cl_p_apellido'),
                        sql.Identifier('cl_s_apellido'),
                        sql.Identifier('cl_rif')
                    ]),
                    values=sql.SQL(',').join([
                        sql.Literal(data['cl_correo']),
                        sql.Literal(data['cl_contraseña']),
                        sql.Literal(data['cl_puntos']),
                        sql.Literal(data['cl_afiliacion']),
                        sql.Literal(data['cl_cedula']),
                        sql.Literal(data['cl_p_nombre']),
                        sql.Literal(data['cl_s_nombre']),
                        sql.Literal(data['cl_p_apellido']),
                        sql.Literal(data['cl_s_apellido']),
                        sql.Literal(data['cl_rif'])
                    ]))

            
                self.cursor.execute(query)
                self.connection.commit()

                return jsonify({'mensaje':'Cliente creado satisfactoriamente'})

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})


   



   