﻿

--Pruebas
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('1', 'Colgate','FALSE')
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('2', 'Ariel','FALSE')
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('3', 'Head & Shoulders','FALSE')
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('4', 'Primor','FALSE');
--Pruebas
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('5', 'Martextil','TRUE');
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('6', 'Tecnomarca','TRUE');
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('7', 'Chocolatieres','TRUE');
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('8', 'FishMarket','TRUE');
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('9', 'AvesMart','TRUE');
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('10', 'DelicatesesMart','TRUE');
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('11', 'Ofis','TRUE');
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('12', 'Mueblesoft','TRUE');
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('13', 'MuebleHogar','TRUE');
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('14', 'CarMarket','TRUE');
INSERT INTO marca (ma_codigo,ma_nombre,ma_ucabmart) VALUES ('15', 'IndustrialMart','TRUE');


--------RUBROS--------
--Pruebas
INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('1','Higiene');
--IndustrialMart
INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('2','Limpieza');

INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('3','Alimentos');
--Pruebas
--MarTextil
INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('4','Lenceria');

INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('5','Almohadas');

INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('6','Colchones');
--Tecnomarca
INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('7','Televisores');

INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('8','Equipo de Sonido');
--Chocolatieres
INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('9','Chocolate');
--FishMarket
INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('10','Frutos de mar Congelados');

INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('11','Empacados al Vacio');
--AvesMart
INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('12','Pollo');

INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('13','Pavo');
--DelicatesesMart
INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('14','Embutidos');
--Ofis
INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('15','Papeleria');
--Mueblesoft
INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('16','Mobiliario de Oficina');
--MuebleHogar 
INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('17','Mobiliario de Hogar');
--CarMarket
INSERT INTO rubro (ru_codigo,ru_nombre) VALUES ('18','Cauchos');












-- TODAS LAS MONEDAS
INSERT INTO moneda VALUES ('1','BOLÍVARES' )
INSERT INTO moneda VALUES ('2','DOLARES')
INSERT INTO moneda VALUES ('3','EUROS')
INSERT INTO moneda VALUES ('4','PUNTOS')
INSERT INTO moneda VALUES ('5','YENES')

--TIPOS DE PAGO
INSERT INTO tipo_pago VALUES ('1','Tarjeta de crédito')
INSERT INTO tipo_pago VALUES ('2','Tarjeta de débito')
INSERT INTO tipo_pago VALUES ('3','Cheque')
INSERT INTO tipo_pago VALUES ('4','Efectivo')
INSERT INTO tipo_pago VALUES ('5','Puntos')


-- COTIZACION
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_valor) VALUES (2,current_timestamp,2088800);
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_valor) VALUES (3,current_timestamp,2359000);
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_valor) VALUES (4,current_timestamp,20000);

UPDATE cotizacion SET ct_expira = current_timestamp WHERE fk_moneda= '2' ;

INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_valor) VALUES (2,current_timestamp,1230800);

--HORARIO
--Lunes
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (1, 'Lunes-Turno mañana', 'LUNES' ,'07:00' ,'12:00'); 
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (2, 'Lunes-Turno tarde', 'LUNES' ,'07:00' ,'12:00');

--Martes
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (3, 'Martes-Turno mañana', 'MARTES' ,'07:00' ,'12:00'); 
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (4, 'Martes-Turno tarde', 'MARTES' ,'01:00' ,'7:00'); 

--Miercoles
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (5, 'Miercoles-Turno mañana', 'MIERCOLES' ,'07:00' ,'12:00');
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (6, 'Miercoles-Turno tarde', 'MIERCOLES' ,'01:00' ,'7:00');

--Jueves
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (7, 'Jueves-Turno mañana', 'JUEVES' ,'07:00' ,'12:00');
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (8, 'Jueves-Turno tarde', 'JUEVES' ,'01:00' ,'7:00');

--Viernes
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (9, 'Viernes-Turno mañana', 'VIERNES' ,'07:00' ,'12:00');
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (10, 'Viernes-Turno tarde', 'VIERNES' ,'01:00' ,'7:00');

--Sabado
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (11, 'Sabado-Turno mañana', 'SABADO' ,'07:00' ,'12:00');
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (12, 'Sabado-Turno tarde', 'SABADO' ,'01:00' ,'7:00');

--Domingo
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (13, 'Domingo-Turno mañana', 'DOMINGO' ,'07:00' ,'12:00');
INSERT INTO horario (ho_codigo, ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES (14, 'Domingo-Turno tarde', 'DOMINGO' ,'01:00' ,'7:00');


--ROLES

INSERT INTO rol (ro_codigo, ro_nombre) VALUES (1, 'Cliente');

INSERT INTO rol (ro_codigo, ro_nombre) VALUES (2, 'Gerente de tienda');

INSERT INTO rol (ro_codigo, ro_nombre) VALUES (3, 'Coordinador de promoción y Ventas');

INSERT INTO rol (ro_codigo, ro_nombre) VALUES (4, 'Coordinador de despacho');

INSERT INTO rol (ro_codigo, ro_nombre) VALUES (5, 'Jefe de entrega');

INSERT INTO rol (ro_codigo, ro_nombre) VALUES (6, 'Jefe de compras');

INSERT INTO rol (ro_codigo, ro_nombre) VALUES (7, 'Jefe de pasillo');

INSERT INTO rol (ro_codigo, ro_nombre) VALUES (8, 'Cajero');

INSERT INTO rol (ro_codigo, ro_nombre) VALUES (9, 'Coordinador de Talento Humano');

INSERT INTO rol (ro_codigo, ro_nombre) VALUES (10, 'Jefe de Almacen');

INSERT INTO rol (ro_codigo, ro_nombre) VALUES (11, 'Anaquelero');

INSERT INTO rol (ro_codigo, ro_nombre) VALUES (12, 'Despachador');

--BENEFICIO


INSERT INTO beneficio (be_codigo, be_nombre) VALUES (1, 'Seguro medico');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (2, 'Jubilaciom');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (3, 'Gastos de transporte');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (4, 'Seguro de vida');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (5, 'Seguro de discapacidad');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (6, 'Reembolso de matriculas');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (7, 'Descuento en gimnasio');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (8, 'Estacionamiento gratuito');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (9, 'Vacaciones');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (10, 'Pensiones');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (11, 'Pago de horas extras');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (12, 'Pago de horas nocturnas');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (13, 'Teletrabajo');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (14, 'Pago de guardería');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (15, 'Extensión de baja maternal/paternal');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (16, 'Formación laboral');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (17, 'Utilidades/Aguinaldos');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (18, 'Fondo de ahorro');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (19, 'Bonos de productividad');

INSERT INTO beneficio (be_codigo, be_nombre) VALUES (20, 'Comedor gratuito');


INSERT INTO estatus_reposicion (er_nombre) VALUES ('EN REVISION');

INSERT INTO estatus_reposicion (er_nombre) VALUES ('APROBADO');

INSERT INTO estatus_reposicion (er_nombre) VALUES ('EN TRANSITO');

INSERT INTO estatus_reposicion (er_nombre) VALUES ('RECIBIDO EN TIENDA');



INSERT INTO estatus_despacho (ed_nombre) VALUES ('EN PROCESO');

INSERT INTO estatus_despacho (ed_nombre) VALUES ('LISTO PARA ENTREGA');

INSERT INTO estatus_despacho (ed_nombre) VALUES ('ENTREGADO');



INSERT INTO privilegio (pv_codigo, pv_descripcion) VALUES (1,'IMPRIMIR FACTURA'); 
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



