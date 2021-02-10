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


    def frecuentes (self):

        try:
                     
            
            
            qry = '''SELECT sele.ti_nombre,
                    sele.nom_cliente,
                    sele.cant_compras,
                    MAX(mon_compras)
                FROM (SELECT ti.ti_nombre,
                            (CASE
                                WHEN cl.cl_tipo = 'NATURAL' THEN
                                    cl.cl_p_nombre||' '||cl.cl_s_nombre||', '||cl.cl_p_apellido||' '||cl.cl_s_apellido
                                WHEN cl.cl_tipo = 'JURIDICO' THEN
                                    cl.cl_razon_social
                            END) nom_cliente,
                            COUNT(1) cant_compras,
                            SUM(co.co_monto_cancelar) mon_compras
                        FROM compra  co,
                            carrito ca,
                            tienda  ti,
                            cliente cl
                        WHERE co.fk_carrito  = ca.ca_id
                        AND ca.fk_tienda   = ti.ti_codigo
                        AND cl.cl_id       = co.fk_cliente
                        GROUP BY ti.ti_nombre, nom_cliente
                        ORDER BY ti.ti_nombre
                        ) sele
                GROUP BY sele.ti_nombre, sele.nom_cliente, sele.cant_compras;

                '''

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

    
    
    def Mes (self):

        try:                     
            
            
            qry = '''
                    SELECT DISTINCT(to_char(co_fecha_hora,'MM')) MES,
                        SUM(co_monto_cancelar),
                        to_char (co_fecha_hora, 'YYYY') AÑO
                     FROM compra
                     GROUP BY to_char(co_fecha_hora,'MM'), to_char (co_fecha_hora, 'YYYY');
                '''

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



    def HORARIO (self,tienda,fecha1,fecha2):
        try:                     
            ti=tienda
            fe1=fecha1
            fe2=fecha2  
            
            qry = '''
                    SELECT empl.em_cedula,
       empl.em_p_nombre,
       empl.em_s_nombre,
       empl.em_p_apellido,
       empl.em_s_apellido,
       cent.coen_entrada,
       cent.coen_salida,
      (CASE
          WHEN (DATE_PART('dow',cent.coen_entrada) NOT EXISTS
                  (SELECT (CASE
                              WHEN hor.ho_dia = 'DOMINGO'   THEN '1'
                              WHEN hor.ho_dia = 'LUNES'     THEN '2'
                              WHEN hor.ho_dia = 'MARTES'    THEN '3'
                              WHEN hor.ho_dia = 'MIERCOLES' THEN '4'
                              WHEN hor.ho_dia = 'JUEVES'    THEN '5'
                              WHEN hor.ho_dia = 'VIERNES'   THEN '6'
                              WHEN hor.ho_dia = 'SABADO'    THEN '7'
                           END
                          ) ho_dia_num
                     FROM horario_empleado hemp,
                          horario hor
                    WHERE hemp.fk_empleado = empl.em_codigo
                      AND hor.ho_codigo  = hemp.fk_horario
                  )
               ) THEN 'N'
          WHEN (DATE_PART('dow',cent.coen_salida) IN
                  (SELECT (CASE
                              WHEN hor.ho_dia = 'DOMINGO'   THEN '1'
                              WHEN hor.ho_dia = 'LUNES'     THEN '2'
                              WHEN hor.ho_dia = 'MARTES'    THEN '3'
                              WHEN hor.ho_dia = 'MIERCOLES' THEN '4'
                              WHEN hor.ho_dia = 'JUEVES'    THEN '5'
                              WHEN hor.ho_dia = 'VIERNES'   THEN '6'
                              WHEN hor.ho_dia = 'SABADO'    THEN '7'
                           END
                          ) ho_dia_num
                     FROM horario_empleado hemp,
                          horario hor
                    WHERE hemp.fk_empleado = empl.em_codigo
                      AND hor.ho_codigo  = hemp.fk_horario
                  )
               ) THEN 'N'
          WHEN (EXTRACT(HOUR FROM cent.coen_entrada) > 
		          (SELECT hor2.hora_ent
                     FROM horario_empleado hemp2,
                          horario hor2
                    WHERE hemp2.fk_empleado = empl.em_codigo
                      AND hor2.ho_codigo  = hemp2.fk_horario
					  AND hor2.ho_dia = (CASE
                                            WHEN DATE_PART('dow',cent.coen_entrada) = '1' THEN 'DOMINGO'
                                            WHEN DATE_PART('dow',cent.coen_entrada) = '2' THEN 'LUNES'
                                            WHEN DATE_PART('dow',cent.coen_entrada) = '3' THEN 'MARTES'
                                            WHEN DATE_PART('dow',cent.coen_entrada) = '4' THEN 'MIERCOLES'
                                            WHEN DATE_PART('dow',cent.coen_entrada) = '5' THEN 'JUEVES'
                                            WHEN DATE_PART('dow',cent.coen_entrada) = '6' THEN 'VIERNES'
                                            WHEN DATE_PART('dow',cent.coen_entrada) = '7' THEN 'SABADO'
                                         END)
                  )
               ) THEN 'N'
          WHEN (EXTRACT(HOUR FROM cent.coen_salida) < 
		          (SELECT hor2.hora_sal
                     FROM horario_emp hemp2,
                          horario hor2
                    WHERE hemp2.fk_empleado = empl.em_codigo
                      AND hor2.ho_codigo  = hemp2.fk_horario
					  AND hor2.ho_dia = (CASE
                                            WHEN DATE_PART('dow',cent.coen_salida) = '1' THEN 'DOMINGO'
                                            WHEN DATE_PART('dow',cent.coen_salida) = '2' THEN 'LUNES'
                                            WHEN DATE_PART('dow',cent.coen_salida) = '3' THEN 'MARTES'
                                            WHEN DATE_PART('dow',cent.coen_salida) = '4' THEN 'MIERCOLES'
                                            WHEN DATE_PART('dow',cent.coen_salida) = '5' THEN 'JUEVES'
                                            WHEN DATE_PART('dow',cent.coen_salida) = '6' THEN 'VIERNES'
                                            WHEN DATE_PART('dow',cent.coen_salida) = '7' THEN 'SABADO'
                                         END)
                  )
               ) THEN 'N'
          ELSE 'S'
       END
      ) ind_cumple
 FROM empleado empl,
      control_entrada cent
WHERE empl.ti_codigo = 1
  AND cent.em_codigo = empl.em_codigo
  AND DATE_TRUNC('day',cent.coen_entrada) >= '2020-12-01'
  AND DATE_TRUNC('day',cent.coen_entrada) <= '2020-12-02'; '''.format(ti,fe1,fe2)

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


