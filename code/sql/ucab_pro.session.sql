

/*
NOTA:  Si atributo es varchar() UNIQUE , no se puede '' y da errorFI
					pero si NO ES UNIQUE entonces si puede ser ''
					por tanto se insertaran como NULL/NONE
*/



select * from cotizacion
SELECT * FROM EMPLEADO;
SELECT * FROM CLIENTE;
SELECT * FROM TIENDA

SELECT pr_id,pr_nombre FROM PRODUCTO;
SELECT * FROM PRIVILEGIO;
select * from zona;
select * from telefono;

SELECT * FROM PROVEEDOR

delete from empleado where em_codigo > 0;

select * from usuario;
/*				



SELECT *   --MUESTRA LAS TABLAS QUE HAY EN LA BASE DE DATOS
FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND 
    schemaname != 'information_schema';


SELECT *   --MUESTRA LOS ATRIBUTOS QUE ESTAN EN TODAS LAS TABLAS
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'public' 
ORDER BY TABLE_NAME;


ALTER TABLE cliente_natural DROP cl_rif;
ALTER TABLE cliente_natural ADD cl_rif VARCHAR(20) UNIQUE;
ALTER TABLE cliente DROP cl_rifj;
ALTER TABLE metodo_pago_compra ALTER COLUMN mp_documento TYPE VARCHAR(25);
select * from metodo_pago;
drop table empleado;
SELECT COUNT(fk_tienda) FROM cliente WHERE fk_tienda = 2;

DELETE FROM cliente WHERE cl_id = 10;

select * from
cliente

select * from rol;
INSERT INTO rol (ro_nombre) VALUES ('CAJERO');


SELECT * from cliente;


drop table persona_contacto;
ALTER TABLE persona_contacto ALTER COLUMN peco_cedula TYPE INTEGER;


ALTER TABLE empleado DROP CONSTRAINT fk_empleado_sup;
ALTER TABLE empleado
add CONSTRAINT fk_empleado_sup FOREIGN KEY (fk_empleado_sup) REFERENCES empleado (em_codigo);
	ALTER TABLE empleado ADD
    CONSTRAINT fk_rubro FOREIGN KEY (fk_rubro) REFERENCES rubro (ru_codigo) ON DELETE CASCADE,
	CONSTRAINT fk_marca FOREIGN KEY (fk_marca) REFERENCES marca (ma_codigo) ON DELETE CASCADE,
	CONSTRAINT fk_proveedor FOREIGN KEY (fk_proveedor) REFERENCES proveedor (po_id) ON DELETE CASCADE	



SELECT * 
FROM producto 
INNER JOIN pasillo ON pasillo.fk_producto = producto.pr_id
INNER JOIN almacen ON almacen.fk_producto = producto.pr_id
WHERE almacen.fk_tienda = 18;








INSERT INTO telefono (te_tipo,te_numero,fk_empleado) VALUES ('CASA',4125788466,12)
SELECT * FROM telefono

ALTER TABLE proveedor ALTER COLUMN po_rif TYPE VARCHAR(50);

select * from producto;

DELETE FROM empleado WHERE em_codigo = 13





ALTER TABLE tienda DROP CONSTRAINT fk_empleado;
ALTER TABLE telefono
add CONSTRAINT fk_empleado FOREIGN KEY (fk_empleado) REFERENCES empleado (em_codigo) ON DELETE CASCADE;


drop table metodo_pago;
delete from cliente where cl_id > 0 ;
*/

drop database grupo4db1_;

create database grupo4bd1_;