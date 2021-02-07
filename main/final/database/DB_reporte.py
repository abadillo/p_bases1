from database.DB import DB
from flask import Flask, render_template, json, request, jsonify
import psycopg2 
from psycopg2.sql import SQL, Composable, Identifier, Literal
from psycopg2 import Error
from psycopg2 import sql
import decimal
from datetime import datetime

 

class DB_reporte(DB):


    def report (self,fecha,tienda):

        try:
            fe = fecha           
            id = tienda
            
           

            qry = '''SELECT  E.em_cedula,
                    E.em_p_nombre || ' ' || E.em_s_nombre || ', ' ||
                    E.em_p_apellido || ' ' || E.em_s_apellido N_empleado,
                    to_char(co.coen_entrada::TIME, 'HH12:MI AM') coen_entrada,
                    to_char (co.coen_salida::TIME, 'HH12:MI AM') coen_salida,
                    (SELECT ro_nombre 
                        FROM rol 
                        WHERE ro_codigo = (
                            SELECT fk_rol 
                                FROM USUARIO 
                                WHERE fk_empleado = E.em_codigo
                                        )
                    ) ROL,
                    co.coen_entrada:: DATE Dia_reporte,
                    ti.ti_nombre Tienda_reporte                    
                    FROM control_entrada co, empleado E, tienda ti 
                    WHERE co.fk_empleado =  E.em_codigo 
                    AND E.fk_tienda = ti.ti_codigo
                    AND co.coen_entrada::DATE= '{0}'
                    AND E.fk_tienda ={1}
                    ORDER BY co.coen_entrada;'''.format(fe,id)    

            #print(self.cursor.mogrify(qry))

            self.cursor.execute(qry)           

            resp = self.cursor.fetchall()

            columnas = self.cursor.description           

            data = self.querydictdecimal(resp,columnas)            

            for entidad in data:
                for atributo in entidad:
                    if type(entidad[atributo]) == datetime.date:
                        entidad[atributo] = str(entidad[atributo])

            return data 

        except Exception:
            print('ERROR DE EXCEPTION')
            return ({'error':'Error: Hubo un problema con el servidor o el cliente no existe'})


    def ingreso (self,fecha1,fecha2):

        try:
            fe1=fecha1
            fe2=fecha2           
            
            
            qry = '''SELECT ti.ti_codigo,
                ti.ti_nombre,
                (SELECT SUM(co.co_monto_cancelar)
                    FROM compra co, carrito ca
                    WHERE co.co_fecha_hora::DATE BETWEEN '{0}' AND '{0}'
                    AND co.fk_carrito = ca.ca_id
                    AND ca.fk_tienda  = ti.ti_codigo
                ) ti_ingresos,
                (SELECT SUM(od.or_cantidad * od.or_monto_unidad)
                    FROM orden_reposicion od
                    WHERE od.fk_tienda = ti.ti_codigo
                    AND od.or_fecha::DATE BETWEEN '{1}' AND '{1}'
                ) ti_egresos
                FROM tienda ti
                GROUP BY ti.ti_codigo,ti.ti_nombre
                ORDER BY ti.ti_codigo; '''.format(fe1,fe2) 



            self.cursor.execute(qry)           

            resp = self.cursor.fetchall()

            columnas = self.cursor.description           

            data = self.querydictdecimal(resp,columnas)            

            for entidad in data:
                for atributo in entidad:
                    if type(entidad[atributo]) == datetime.date:
                        entidad[atributo] = str(entidad[atributo])

            return data   

        except Exception:
            print('ERROR DE EXCEPTION1')
            return ({'error':'Error: Hubo un problema con el servidor o el cliente no existe'})