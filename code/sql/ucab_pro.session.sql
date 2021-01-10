

/*
NOTA:  Si atributo es varchar() UNIQUE , no se puede '' y da errorFI
					pero si NO ES UNIQUE entonces si puede ser ''
					por tanto se insertaran como NULL/NONE
*/





SELECT *   --MUESTRA LAS TABLAS QUE HAY EN LA BASE DE DATOS
FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND 
    schemaname != 'information_schema';


SELECT *   --MUESTRA LOS ATRIBUTOS QUE ESTAN EN TODAS LAS TABLAS
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'public' 
ORDER BY ORDINAL_POSITION;

/*
ALTER TABLE cliente_natural DROP cl_rif;
ALTER TABLE cliente_natural ADD cl_rif VARCHAR(20) UNIQUE;
ALTER TABLE cliente DROP cl_rifj;
ALTER TABLE metodo_pago_compra ALTER COLUMN mp_documento TYPE VARCHAR(25);
select * from metodo_pago;
drop table empleado;

select * from rol;
INSERT INTO rol (ro_nombre) VALUES ('CAJERO');



*/
