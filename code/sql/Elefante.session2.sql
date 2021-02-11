SELECT * FROM producto WERE pr_id=6;

DELETE FROM proveedor WHERE po_id = 2;
    ENTIDAD RURBO
    CONSTRAINT fk_rubro FOREIGN KEY (fk_rubro) REFERENCES rubro (ru_codigo) ON DELETE CASCADE,
	CONSTRAINT fk_marca FOREIGN KEY (fk_marca) REFERENCES marca (ma_codigo) ON DELETE CASCADE,
	CONSTRAINT fk_proveedor FOREIGN KEY (fk_proveedor) REFERENCES proveedor (po_id) ON DELETE CASCADE	

-- ALTER TABLE producto DROP CONSTRAINT fk_proveedor;   Elimina un campo de una tabla

ALTER TABLE producto DROP CONSTRAINT fk_empleado_sup;
ALTER TABLE empleado
add CONSTRAINT fk_empleado_sup FOREIGN KEY (fk_empleado_sup) REFERENCES empleado (em_codigo);
	ALTER TABLE producto ADD CONSTRAINT fk_rubro FOREIGN KEY (fk_rubro) REFERENCES rubro (ru_codigo) ON DELETE CASCADE
	ALTER TABLE producto ADD CONSTRAINT fk_marca FOREIGN KEY (fk_marca) REFERENCES marca (ma_codigo) ON DELETE CASCADE;
	ALTER TABLE producto ADD CONSTRAINT fk_proveedor FOREIGN KEY (fk_proveedor) REFERENCES proveedor (po_id) ON DELETE CASCADE



33) SELECT l_nombre, l_tipo, l_total_habitantes
FROM lugar WHERE l_tipo !='EUROPA' AND l_tipo != 'OCEANIA'
ORDER BY l_tipo DESC

SELECT  E.em_cedula,
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
                    AND co.coen_entrada::DATE= '2020-12-19'
                    AND E.fk_tienda =1
                    ORDER BY co.coen_entrada

SELECT COUNT(*)  FROM empleado; 

--ASISTENCIA
SELECT  
 E.em_cedula,
 E.em_p_nombre || ' ' || E.em_s_nombre || ', ' ||
 E.em_p_apellido || ' ' || E.em_s_apellido N_empleado,
 to_char(co.coen_entrada::TIME, 'HH12:MI AM') coen_entrada,
 to_char (co.coen_salida::TIME, 'HH12:MI AM') coen_salida,
 to_char (co.coen_entrada::DATE, 'YYYY-MM-DD') coen_entrada,
 ti.ti_nombre, 
 (SELECT ro_nombre 
  	FROM rol 
 	WHERE ro_codigo = (
  		SELECT fk_rol 
			FROM USUARIO 
			WHERE fk_empleado = E.em_codigo
					)
 ) ROL
 FROM control_entrada co, empleado E, tienda ti 
 WHERE co.fk_empleado =  E.em_codigo 
 AND E.fk_tienda = ti.ti_codigo
 AND co.coen_entrada::DATE= {0}
 AND E.fk_tienda ={1}
 ORDER BY co.coen_entrada;

 SELECT  
 E.em_cedula,
 E.em_p_nombre || ' ' || E.em_s_nombre || ', ' ||
 E.em_p_apellido || ' ' || E.em_s_apellido N_empleado,
 to_char(co.coen_entrada::TIME, 'HH12:MI AM') coen_entrada,
 to_char (co.coen_salida::TIME, 'HH12:MI AM') coen_salida,
 to_char (co.coen_entrada::DATE, 'YYYY-MM-DD') Fecha_entrada,
 to_char (co.coen_salida::DATE, 'YYYY-MM-DD') Fecha_salida,

 ti.ti_nombre, 
 (SELECT ro_nombre 
  	FROM rol 
 	WHERE ro_codigo = (
  		SELECT fk_rol 
			FROM USUARIO 
			WHERE fk_empleado = E.em_codigo
					)
 ) ROL
 FROM control_entrada co, empleado E, tienda ti 
 WHERE co.fk_empleado =  E.em_codigo 
 AND E.fk_tienda = ti.ti_codigo
 AND co.coen_entrada::DATE='2020-12-06'
 AND E.fk_tienda =1
 ORDER BY co.coen_entrada;

--INGRESO Y EGRESOS

SELECT SUM(O.or_cantidad * O.or_monto_unidad) egreso_en_tienda,
 to_char (O.or_fecha::DATE, 'YYYY-MM-DD') Fecha_de_egresos, 
 (SELECT SUM(co_monto_cancelar) ingreso_en_tienda,
 to_char (co_fecha_hora::DATE, 'YYYY-MM-DD') Fecha_de_ingresos
 FROM compra
  WHERE co_fecha_hora::DATE='2020-12-06'
  GROUP BY co_fecha_hora
 ), 
 T.ti_tienda
 FROM orden_reposicion O,tienda T
 WHERE O.fk_tienda=T.ti_codigo 
 AND O.or_fecha::DATE='2020-12-06' 
 AND T.ti_codigo=1
 

 --10 mejores por tienda

SELECT sele.ti_nombre,
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
                GROUP BY sele.ti_nombre, sele.nom_cliente, sele.cant_compras
                ORDER BY sele.ti_nombre;


-- 5 mejores
SELECT sele.ti_nombre,
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
                        ) sele, cliente c, tienda t
                WHERE c.fk_tienda = t.ti_codigo
                AND c.cl_id < 2
                GROUP BY sele.ti_nombre, sele.nom_cliente, sele.cant_compras
                ORDER BY sele.ti_nombre
                
--MESES mas productivos?
SELECT DISTINCT(to_char(co_fecha_hora,'MM')) MES,
   SUM(co_monto_cancelar),
   to_char (co_fecha_hora, 'YYYY') AÑO
 FROM compra
 GROUP BY to_char(co_fecha_hora,'MM'), to_char (co_fecha_hora, 'YYYY');
 
-- PRODUCTOS MAS COMPRADOS
SELECT p.pr_nombre,COUNT(p.pr_nombre),p.pr_precio,(to_char(co.co_fecha_hora,'MM')) MES
    FROM carrito c,carrito_producto cp,producto p,compra co
    WHERE c.ca_id = cp.fk_carrito
    AND cp.fk_producto= p.pr_id
    AND co.fk_carrito=c.ca_id
    AND NOT (p.pr_nombre < (SELECT MAX(p.pr_nombre) FROM producto p))
    GROUP BY p.pr_nombre,p.pr_precio,to_char(co.co_fecha_hora,'MM')
    ORDER BY COUNT(p.pr_nombre) ASC;


--HORARIO
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
  AND DATE_TRUNC('day',cent.coen_entrada) <= '2020-12-02';

"tienda parametro" es el código de la tienda que se recibe como parámetro desde el sistema.
"fec_desde_parametro" es la fecha "sin formato de hora" de inicio de rango que se recibe como parámetro desde el sistema.
"fec_hasta_parametro" es la fecha "sin formato de hora" de final de rango que se recibe como parámetro desde el sistema.



--WHERE coen_entrada:: DATE= '2020-12-01'
--DATE_FORMAT(ts_creacion,'%H:%i:%s')
fk_empleado_sup

SELECT * 
FROM ((producto p 
	  INNER JOIN almacen a ON a.fk_producto = p.pr_id) 
	  INNER JOIN pasillo pa 
	  ON pa.fk_producto = p.pr_id) 
	  WHERE a.fk_tienda = {0} 
	  AND pa.fk_tienda = {0}



Select to_char(coen_entrada::Time, 'HH12:MI:SS AM')
SELECT * :: INT FROM ROL
SELECT * FROM usuario WHERE FK_EMPLEADO IS NOT NULL
SELECT date_trunc('minute', TIMESTAMP '2017-03-17 02:09:30');
SELECT coen_entrada::TIME , coen_salida::TIME 

productos por cada carrito 
version mia
SELECT fk_carrito, COUNT(fk_producto)
	FROM carrito_producto
	WHERE fk_producto = 
	(SELECT pr_id 
	FROM producto 
	WHERE pr_id=fk_producto)
	GROUP BY fk_carrito
    
version antonio
SELECT ca_id, 
(SELECT COUNT(*)
 FROM carrito_producto 
 WHERE fk_carrito=ca_id)
 cant_p
 FROM carrito

