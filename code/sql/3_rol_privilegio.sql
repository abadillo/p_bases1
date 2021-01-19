INSERT INTO rol (ro_nombre) VALUES ('Cliente');
INSERT INTO rol (ro_nombre) VALUES ('Gerente de tienda');
INSERT INTO rol (ro_nombre) VALUES ('Coordinador de promoción y Ventas');
INSERT INTO rol (ro_nombre) VALUES ('Coordinador de despacho');
INSERT INTO rol (ro_nombre) VALUES ('Jefe de entrega');
INSERT INTO rol (ro_nombre) VALUES ('Jefe de compras');
INSERT INTO rol (ro_nombre) VALUES ('Jefe de pasillo');
INSERT INTO rol (ro_nombre) VALUES ('Cajero');
INSERT INTO rol (ro_nombre) VALUES ('Coordinador de Talento Humano');


INSERT INTO privilegio (pv_codigo, pv_descripcion) VALUES (1,'IMPRIMIR FACTURA');; 
INSERT INTO privilegio (pv_codigo, pv_descripcion) VALUES (2,'MANTENIMIERTO DE PROVEEDOR');
INSERT INTO privilegio (pv_codigo, pv_descripcion) VALUES (3,'MANTENIMIERTO DE MARCA');
INSERT INTO privilegio (pv_codigo, pv_descripcion) VALUES (4,'MANTENIMIERTO DE MONEDAS');
INSERT INTO privilegio (pv_codigo, pv_descripcion) VALUES (5,'MANTENIMIERTO DE TIENDAS');
INSERT INTO privilegio (pv_codigo, pv_descripcion) VALUES (6,'MANTENIMIERTO DE EMPLEADS');
INSERT INTO privilegio (pv_codigo, pv_descripcion) VALUES (7,'MANTENIMIERTO DE PROVEEDOR');

INSERT INTO privilegio_rol (fk_rol,fk_privilegio) VALUES (8,1);
INSERT INTO privilegio_rol (fk_rol,fk_privilegio) VALUES (3,2);
INSERT INTO privilegio_rol (fk_rol,fk_privilegio) VALUES (3,3);
INSERT INTO privilegio_rol (fk_rol,fk_privilegio) VALUES (3,4);
INSERT INTO privilegio_rol (fk_rol,fk_privilegio) VALUES (3,5);
INSERT INTO privilegio_rol (fk_rol,fk_privilegio) VALUES (3,6);
INSERT INTO privilegio_rol (fk_rol,fk_privilegio) VALUES (3,7);
