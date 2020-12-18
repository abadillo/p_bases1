from modules.DB import DB
from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql

class DB_cliente_natural(DB):

    def add (self, data):
        
        try:

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
                    sql.Literal('ale1x@gmail.com'),
                    sql.Literal('ab23132'),
                    sql.Literal(12332),
                    sql.Literal(1230),
                    sql.Literal(259232031),
                    sql.Literal('Alex'),
                    sql.Literal(None),
                    sql.Literal('Ber'),
                    sql.Literal('Alf'),
                    sql.Literal(None)
                ]))

          
            self.cursor.execute(query)
            self.connection.commit()

            return jsonify({'mensaje':'Cliente creado satisfactoriamente'})

        except Exception:
            return jsonify({'error':'Error: Hubo un problema con el servidor'})



   