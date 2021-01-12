-- TODAS LAS MONEDAS
INSERT INTO moneda VALUES ('1','BOLÍVARES' )
INSERT INTO moneda VALUES ('2','DOLARES')
INSERT INTO moneda VALUES ('3','EUROS')
INSERT INTO moneda VALUES ('4','PUNTOS')

--TIPOS DE PAGO
INSERT INTO tipo_pago VALUES ('1','Tarjeta de crédito')
INSERT INTO tipo_pago VALUES ('2','Tarjeta de débito')
INSERT INTO tipo_pago VALUES ('3','Cheque')
INSERT INTO tipo_pago VALUES ('4','Efectivo')
INSERT INTO tipo_pago VALUES ('5','Puntos')

-- COTIZACION
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_valor) VALUES (2,current_timestamp,1088800)
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_valor) VALUES (3,current_timestamp,1359000)
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_valor) VALUES (4,current_timestamp,10000)


UPDATE cotizacion SET ct_expira = current_timestamp WHERE fk_moneda= '2' 

INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_valor) VALUES (2,current_timestamp,1230800)

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




-- CLIENTES


INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (1,'V309068691','NATURAL',0,13,30906869,'JUAN','MÁXIMO','OVIDIO','ANDRÉS',32);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (2,'V138733389','NATURAL',0,13,13873338,'IGNACIO','TARSICIO','ALEXANDER','JOSÉ',32);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (3,'V197110626','NATURAL',0,13,19711062,'JONATHAN','FEDERICO','MARK','EMILIO',32);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (4,'V239433011','NATURAL',0,13,23943301,'EMILIA','GEORGINA','DULCINEA','ADRIANA',32);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (5,'V122792088','NATURAL',0,13,12279208,'CORNELIO','ALEXANDER','CLEMENTE','DOMENICO',32);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (6,'V293947632','NATURAL',0,13,29394763,'LORENA','DÁMARIS','MARINA','MARÍA',32);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (7,'V345802724','NATURAL',0,13,34580272,'CLEMENTE','BIENVENIDO','MARGARITO','PACIANO',32);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (8,'J324380654','JURIDICO',0,13,'Lidotel Centro Lido Caracas, S.A.S.','http://www.lidotel.com/Venezuela/1/Caracas','Lidotel',55000000000,NULL,32);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (9,'J116800325','JURIDICO',0,13,'Restaurant Alto, C.A.','https://www.instagram.com/restaurantalto/','Alto Restaurant',27000000000,NULL,32);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (10,'J675261630','JURIDICO',0,13,'Centro MediAlfa','https://www.instagram.com/centromedialfa/?hl=es','MediAlfa',44500000000,NULL,32);

INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (1,'V242608669','NATURAL',0,14,24260866,'FABIÁN','SAMUEL','OCTAVIO','JUAN',33);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (2,'V130500633','NATURAL',0,14,13050063,'AURELIA','LUZ','ESPERANZA','FACUNDA',33);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (3,'V274888689','NATURAL',0,14,27488868,'AIDANA','ZOE','VIVIANA','AFRODITA',33);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (4,'V335806289','NATURAL',0,14,33580628,'JUDITH','ESMERALDA','ALTAGRACIA','MOIRA',33);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (5,'V341429761','NATURAL',0,14,34142976,'MARCUS','ELEAZAR','NICOLÁS','SILVESTER',33);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (6,'V120383449','NATURAL',0,14,12038344,'JORDANA','LINDA','MARILUZ','ADRIA',33);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (7,'J472443997','JURIDICO',0,14,'Hotel Eurobuilding, C.A.','http://www.hoteleuro.com/','Eurobuilding',70000000000,NULL,33);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (8,'J846784790','JURIDICO',0,14,'Meliá Caracas, C.A.','https://www.melia.com/en/hotels/venezuela/caracas/gran-melia-caracas/','Meliá Caracas',50000000000,NULL,33);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (9,'J999308074','JURIDICO',0,14,'El Rincon Del Sabor de Petare, S.A.S.',NULL,'El Roncón Del Sabor',22800000000,NULL,33);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (10,'J648529850','JURIDICO',0,14,'Pizzería Restaurant la Guacamaya, S.R.L.',NULL,'La Guacamaya',33500000000,NULL,33);

INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (1,'V280898877','NATURAL',0,15,28089887,'BRENO','IVÁN','FAUSTO','LEONARDO',34);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (2,'V158832647','NATURAL',0,15,15883264,'IMMA','GRETA','CELINA','NAZARET',34);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (3,'V213321900','NATURAL',0,15,21332190,'TRINIDAD','DANIELA','ADELINA','HEIDI',34);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (4,'V179544142','NATURAL',0,15,17954414,'JACQUELINE','MIA','EMILIA','LUCÍA',34);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (5,'V270584342','NATURAL',0,15,27058434,'ÁNGEL','FACUNDO','KLEMENT','MAGNUS',34);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (6,'V148598489','NATURAL',0,15,14859848,'OLIVIA','GEORGIA','FABRICIA','TIFFANY',34);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (7,'V162770051','NATURAL',0,15,16277005,'OPHELIA','NADIA','NINA','BEATRIZ',34);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (8,'V242349798','NATURAL',0,15,24234979,'JHOAN','HÉRCULES','JAVIER','MARCELO',34);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (9,'J869076112','JURIDICO',0,15,' Hospital General Dr. José Ignacio Baldó, C.A.',NULL,' Hospital El Algodonal',12000000000,NULL,34);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (10,'J259324782','JURIDICO',0,15,'Prolicor ANTÍMANO III, S.R.L.',NULL,'Prolicor ANTÍMANO III',45000000000,NULL,34);

INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (1,'V255515744','NATURAL',0,16,25551574,'CARLOS','BENICIO','YVES','FERMÍN',35);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (2,'V100321702','NATURAL',0,16,10032170,'PEREGRINO','LEOPOLDO','JULIANO','MARCUS',35);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (3,'V202479438','NATURAL',0,16,20247943,'IGNACIO','OVIDIO','LEONEL','ANTHONY',35);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (4,'V265864520','NATURAL',0,16,26586452,'FABIO','CARLOS','FACUNDO','ELEAZAR',35);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (5,'V304505546','NATURAL',0,16,30450554,'JAVIER','ADRIÁN','CAMILO','CLEMENTE',35);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (6,'V245223863','NATURAL',0,16,24522386,'PASTOR','RÉGULO','FACUNDO','MATÍAS',35);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (7,'V128023631','NATURAL',0,16,12802363,'JULIA','ADELA','CARLOTA','POLA',35);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (8,'V203660110','NATURAL',0,16,20366011,'VALERIO','MARGARITO','AMADOR','PASTOR',35);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (9,'J725532390','JURIDICO',0,16,'Hesperia WTC Valencia, C.A.','https://www.hoteleshesperia.com.ve/hotel/hesperia-wtc-valencia','WTC Valencia',68540000000,NULL,35);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (10,'J272744426','JURIDICO',0,16,'Executive Suites Valencia, S.A.S.','https://executivesuites.com.ve/','Executive Suites',38000000000,NULL,35);

INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (1,'V348752651','NATURAL',0,17,34875265,'JUAN','ISIDRO','EDWIN','ÁLVARO',36);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (2,'V130493682','NATURAL',0,17,13049368,'SANTIAGO','FAUSTO','CALÍGULA','BENITO',36);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_cedula, cl_p_nombre, cl_s_nombre, cl_p_apellido, cl_s_apellido, fk_lugar) VALUES (3,'V170310810','NATURAL',0,17,17031081,'BRUNO','CONSTANTINO','CRISTO','CICERÓN',36);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (4,'J590860351','JURIDICO',0,17,'Clinica Zulia, S.R.L.',NULL,'Clinica Zulia',75000000000,NULL,36);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (5,'J799800422','JURIDICO',0,17,'Centro Clinico Los Olivos, S.A.S.','http://cclo.com.ve/','Centro Clinico Los Olivos',50000000000,NULL,36);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (6,'J529510113','JURIDICO',0,17,'Centro Clínico Materno Pediátrico Zulia, S.R.L.','http://clinicazulia.com/','Materno Pediátrico Zulia',8000000000,NULL,36);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (7,'J753179559','JURIDICO',0,17,'Clinica La Sagrada Familia, C.A.','http://www.lasagrada.com.ve/','Clinica Sagrada Familia',90000000000,NULL,36);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (8,'J810797583','JURIDICO',0,17,'Cauchos La Plaza, S.A.S.',NULL,'Cauchos La Plaza',3000000000,NULL,36);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (9,'J161434617','JURIDICO',0,17,'Viacasa Automercados, C.A.','http://www.viacasa.com/','Viacasa',4000000000,NULL,36);
INSERT INTO cliente (cl_afiliacion, cl_rif, cl_tipo, cl_puntos, fk_tienda, cl_razon_social, cl_pagina_web, cl_den_comercial, cl_capital, fk_lugar_fiscal, fk_lugar_fisica) VALUES (10,'J235121809','JURIDICO',0,17,'Automercado & Panaderia La Marina, S.A.S.',NULL,' Automercado La Marina',77500000000,NULL,36);








--EMPLEADOS

INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21368152,'TULIO','AURELIO','PARDO','SANTILLAN',300000000,('2002-7-9'),13);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32851596,'CORANIA','VICTORIA','VERDUGO','CONTRERAS',250000000,('1974-11-18'),13);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25021196,'CONSUELO','BELINDA','PLASCENCIA','ANTONIO',250000000,('1965-10-25'),13);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16720822,'FERMÍN','IGNACIO','AVALOS','PINA',250000000,('2001-10-13'),13);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29759353,'PACIANO','ÁLVARO','VELASCO','CERDA',190000000,('1987-1-5'),13);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12865632,'AMADA','SARA','ARELLANO','ALMARAZ',190000000,('1960-11-20'),13);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19484352,'MIA','LEOPOLDA','ROBLEDO','MORENO',190000000,('1960-2-12'),13);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29670125,'CHRISTIANE','JENNIFER','URBINA','IZQUIERDO',150000000,('1953-1-3'),13);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32099424,'MIGUEL','AGUSTÍN','TELLEZ','WILSON',150000000,('1975-8-4'),13);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24266294,'THAIS','CONSUELO','GALICIA','JAQUEZ',150000000,('1958-2-28'),13);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19339011,'OROSIO','DAVID','OROZCO','LEWIS',300000000,('1987-3-25'),14);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16000213,'TULIO','BRANDON','SALDIVAR','NAJERA',250000000,('1992-6-28'),14);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29136898,'BENJAMÍN','CONSTANTINO','DUQUE','VARELA',250000000,('1996-1-12'),14);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13707216,'MARTINA','GLADYS','GUARDADO','CARMONA',250000000,('1994-7-14'),14);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28791977,'YVES','DANTE','VALLEJO','CEPEDA',190000000,('1974-12-27'),14);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12787486,'CHRISTIAN','CALÍXTRATO','ROLDAN','FUNES',190000000,('1975-5-26'),14);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20438750,'ÁLVARA','BERNARDA','PAZ','MITCHELL',190000000,('1962-11-5'),14);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14382588,'TRINIDAD','GLADYS','AVELAR','BECERRA',150000000,('1988-3-27'),14);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20091331,'ROSARIO','NAZARET','CASTANON','ARAIZA',150000000,('1992-11-25'),14);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24357368,'BENICIO','CEFERINO','JAUREGUI','CARPIO',150000000,('1970-8-15'),14);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29976864,'LUCAS','RAFAEL','PALOMO','NORIEGA',300000000,('1993-4-22'),15);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23223880,'BIENVENIDO','LUCAS','HENDERSON','BARRIENTOS',250000000,('1980-1-3'),15);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13941301,'LIGIA','MARIANA','VALLADARES','MATEO',250000000,('1996-8-8'),15);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32824951,'DÉBORA','LILIANA','PATINO','CORDERO',250000000,('1973-9-26'),15);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33517682,'CARLOS','SILVIO','MILLER','CARPIO',190000000,('1951-8-2'),15);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10581003,'LIONEL','SAMUEL','CASANOVA','PLASCENCIA',190000000,('1990-9-24'),15);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16888911,'PERLA','SHARON','VERA','LONG',190000000,('2001-8-10'),15);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14489842,'EMPERATRIZ','ROSALIA','CORIA','TAPIA',150000000,('1984-4-25'),15);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18665853,'SOFÍA','RITA','ANDRADE','JAIMES',150000000,('1971-6-24'),15);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28878248,'CRISTIANO','JAYDEN','CASTANEDA','SAAVEDRA',150000000,('1962-12-19'),15);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30079767,'LILIANA','ZOE','SAAVEDRA','SALGADO',300000000,('1972-11-17'),16);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14387570,'MARCUS','CHRISTIAN','GARZA','VALLES',250000000,('1989-12-16'),16);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27125402,'MARCUS','CRISTIAN','MEZA','AVILES',250000000,('1995-9-1'),16);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24974309,'CECILIO','CALÍXTRATO','RENTERIA','REYNA',250000000,('1982-2-13'),16);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24567945,'LILI','BELLA','ZUNIGA','URIBE',190000000,('1970-12-2'),16);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34904229,'CAMILO','ANTONIO','PIMENTEL','ANDINO',190000000,('1975-4-18'),16);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12690413,'CLEMENTE','LINCOLN','DELAGARZA','ZUNIGA',190000000,('1993-8-20'),16);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32259585,'MARGARITA','JANE','COLIN','CARRANZA',150000000,('1990-2-24'),16);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13193530,'CLOE','SOLEDAD','DEJESUS','FRIAS',150000000,('1967-8-28'),16);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16704487,'AYALA','FACUNDA','AGUILAR','BUENO',150000000,('1971-12-17'),16);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29018732,'ANTHONY','ANTONIO','LUCIANO','CRESPO',300000000,('1962-9-24'),17);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27694359,'JUSTIN','VALENTÍN','ROLON','MEZA',250000000,('1963-10-23'),17);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28201421,'MARGARITO','CHRISTIAN','GUADARRAMA','ZAMORA',250000000,('1989-8-14'),17);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21935498,'FERNANDA','LAURA','ALBARRAN','ANTUNEZ',250000000,('1987-7-1'),17);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20013439,'EMA','SHARON','MAESTAS','UMANA',190000000,('1998-11-28'),17);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22615756,'LUCAS','MAGNUS','OLGUIN','OJEDA',190000000,('1999-11-25'),17);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31967073,'SILVESTER','RENATO','LONG','PARDO',190000000,('1975-12-6'),17);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11010208,'HEIDI','SARA','COX','VILLALPANDO',150000000,('1950-10-17'),17);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15897867,'SOLEDAD','ANASTASIA','CUEVAS','VALENCIA',150000000,('1968-6-8'),17);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24776138,'ASHLEY','NANCY','ZEPEDA','MARTIN',150000000,('1971-9-23'),17);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25396527,'DAVID','AUGUSTO','QUINTERO','VILLASENOR',300000000,('1956-7-11'),18);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18405247,'ASCENSIÓN','BONITA','ANDERSON','ZAMORA',250000000,('1955-8-19'),18);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10413423,'FAUSTINIANO','EDELBERTO','QUESADA','CALDERA',250000000,('1955-9-21'),18);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28612671,'LINCOLN','IGNACIO','SERVIN','GOVEA',250000000,('1970-5-18'),18);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21432780,'FÉLIX','JOSÉ','OLVERA','ARGUELLO',190000000,('1960-11-24'),18);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34748949,'MARIAM','NAOMI','DEANDA','GUADARRAMA',190000000,('1974-10-17'),18);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14466486,'DAVID','AMADOR','LUIS','GUARDADO',190000000,('1976-4-20'),18);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25685270,'VICENTE','MARSELLO','LEE','IGLESIAS',150000000,('1962-3-25'),18);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21224877,'MAXIMINA','MAGALI','FRIAS','PACHECO',150000000,('1965-5-14'),18);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29002004,'NATHALY','SARA','SAMANIEGO','VALLE',150000000,('1972-8-25'),18);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30511483,'FELICIA','FABIOLA','PAEZ','ZARAGOZA',300000000,('1976-4-28'),19);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20434731,'ALEXANDER','ÁLVARO','DIAZ','MACIAS',250000000,('1971-10-6'),19);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31749313,'SILVESTRE','MARSELLO','ALBA','VALVERDE',250000000,('1987-5-4'),19);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14686318,'PEREGRINO','JOSÉ','PANTOJA','RUELAS',250000000,('1966-2-7'),19);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11275676,'ELVIRA','JACQUELINE','CEDENO','MORIN',190000000,('1979-3-4'),19);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31439535,'LIGIA','ELIANA','YANEZ','SALINAS',190000000,('1954-8-11'),19);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27933408,'MARTINIANO','PAULO','OROSCO','TENORIO',190000000,('1997-12-25'),19);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18854164,'BRANDON','PATRICIO','MIRANDA','MARAVILLA',150000000,('1982-10-22'),19);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22599138,'JORDANA','ALICIA','BUSTILLOS','BELL',150000000,('1994-12-4'),19);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18337447,'FELICIA','MAXIMINA','ESCOBEDO','VALLE',150000000,('1966-12-27'),19);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19568867,'MARISOL','GRACIA','URIAS','PAREDES',300000000,('2002-10-14'),20);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22588742,'JOSÉ','AMADOR','OLIVAREZ','DELVALLE',250000000,('1980-10-28'),20);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18061149,'MARTINA','PAZ','GUAJARDO','GONZALEZ',250000000,('1974-12-3'),20);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32465807,'FIDEL','VITALICIO','MENENDEZ','BENNETT',250000000,('1999-8-5'),20);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15966564,'TORIBIO','GABRIEL','QUINTANILLA','VASQUEZ',190000000,('1968-12-27'),20);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10473840,'JACOB','MELCHOR','LEIJA','ARGUETA',190000000,('1991-8-18'),20);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29298497,'MOIRA','BERTA','QUILES','ACEVES',190000000,('1967-10-3'),20);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14176241,'CRISTIAN','JULIÁN','POLANCO','ROBLEDO',150000000,('1977-11-11'),20);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17854063,'ALBERTO','AMÍLCAR','PEDROZA','AMBRIZ',150000000,('1998-9-21'),20);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21051326,'BERTRUDIS','ROSAURA','OLIVAS','LANDAVERDE',150000000,('1969-7-9'),20);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25691785,'CARMEN','JOHANNA','CORTES','SANABRIA',300000000,('2001-2-23'),21);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13707571,'NANCY','BERTA','DURAN','SOSA',250000000,('1998-4-15'),21);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23189931,'SILVESTRE','CHRISTIAN','QUINTERO','OCHOA',250000000,('1991-4-1'),21);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18406380,'JIOVANI','PETRONILO','DELOSSANTOS','COTTO',250000000,('1964-2-21'),21);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34759597,'AGUSTÍN','ROMEO','PONCE','AGUERO',190000000,('1998-11-1'),21);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33974955,'EDUVIGES','MARTINA','PABON','PEREZ',190000000,('2001-1-1'),21);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11361781,'ODILIA','AIDANA','BARBOZA','MADERA',190000000,('1991-8-19'),21);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14136418,'ELOY','JONATHAN','VENEGAS','STEVENS',150000000,('1987-12-10'),21);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22441247,'OVIDIO','MARCIAL','LUNA','LEAL',150000000,('1973-9-7'),21);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10732310,'PAULA','FABIANA','ASCENCIO','CARRENO',150000000,('1997-2-6'),21);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30932946,'VILMA','SARA','LOZA','MENDOZA',300000000,('1985-4-16'),22);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15653180,'CAROLA','GLADYS','VIGIL','FALCON',250000000,('1954-11-13'),22);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34854061,'RÉGULO','CLAUDIO','OLIVA','HUIZAR',250000000,('2000-9-14'),22);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15851423,'SOL','FABIOLA','CANALES','CAMARENA',250000000,('1983-1-8'),22);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19341770,'FACUNDO','BRUNO','ZAPATA','ARANDA',190000000,('1970-1-11'),22);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18001785,'JACOB','REGIE','OCAMPO','ESCOBAR',190000000,('1998-12-9'),22);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32147154,'FELICIO','SANTIAGO','TRINIDAD','VASQUEZ',190000000,('1985-7-14'),22);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10176121,'BELINDA','FLORENCIA','MESA','CHAVIRA',150000000,('1959-6-6'),22);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15339495,'EDWIN','JORGE','GARNICA','RUSSELL',150000000,('1990-6-21'),22);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16062004,'FIDEL','ÁNGEL','MORIN','FERNANDEZ',150000000,('1969-1-12'),22);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16741292,'DULCE','MAFALDA','LIRA','PADILLA',300000000,('1962-3-10'),23);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31104349,'NICOLE','ROSARIO','CANALES','IZQUIERDO',250000000,('2002-12-7'),23);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22743550,'ROSARIO','FLORENTINA','MORENO','REED',250000000,('1964-1-6'),23);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29166762,'AUGUSTO','CELSO','MALDONADO','GALVEZ',250000000,('1982-12-22'),23);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18148810,'YVES','ADRIÁN','CABRERA','JONES',190000000,('1970-2-21'),23);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29674793,'ALEJANDRO','INOCENCIO','LIRA','ARMENTA',190000000,('1992-7-6'),23);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27321345,'LORENA','DANIELA','HILL','DELAPAZ',190000000,('1964-4-13'),23);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15771443,'DELFINA','AMADA','PENALOZA','CEBALLOS',150000000,('1992-2-25'),23);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28312242,'FELICIANO','HÉRCULES','CARABALLO','URRUTIA',150000000,('1962-5-22'),23);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19013478,'ALBERTO','ALFREDO','ROGERS','MENESES',150000000,('1960-1-24'),23);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27345050,'LIBERTAD','NATIVIDAD','AGUERO','PALOMINO',300000000,('1978-7-13'),24);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13232819,'NICOLE','ZAMIRA','RECINOS','ALEJO',250000000,('1973-5-17'),24);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20978858,'GEORGIA','JUSTINIANA','PORTILLO','RUSSELL',250000000,('1971-5-6'),24);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24501933,'SALVADOR','RAMÓN','ESPINOSA','PINA',250000000,('2000-10-28'),24);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25464954,'AFRODITA','CLOE','JORDAN','VACA',190000000,('1997-7-15'),24);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29967543,'MARTINIANO','KEVIN','RAMIREZ','GASTELUM',190000000,('1983-12-18'),24);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11451100,'CRISTO','FELICIANO','VACA','ARANA',190000000,('1971-5-27'),24);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34087896,'JAVIER','DANIEL','MONTOYA','LEMUS',150000000,('1959-5-5'),24);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10171045,'ARACELI','NAZARET','MIRELES','LARA',150000000,('1994-6-17'),24);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13599810,'ÁLVARO','IVÁN','SUAZO','COLLADO',150000000,('1990-6-12'),24);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34951822,'MARGARITO','IVÁN','DEJESUS','VILLALPANDO',300000000,('1990-6-15'),25);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22360598,'AUXILIADORA','FABIA','GODINEZ','SANCHEZ',250000000,('1952-1-17'),25);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17651488,'GRETA','GRACIELA','LEOS','LEDEZMA',250000000,('2002-1-20'),25);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23080410,'NIEVES','LEOPOLDA','CASTELLON','VICENTE',250000000,('1974-10-20'),25);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23066198,'OVIDIO','JAVIER','LOREDO','SALGADO',190000000,('1990-5-9'),25);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20346059,'VENANCIO','VENANCIO','RUELAS','ACUNA',190000000,('1985-7-11'),25);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26292287,'EMILIO','LEO','BERNAL','DAMIAN',190000000,('1990-7-16'),25);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20632538,'DÁMARIS','MARTINA','LEOS','PARADA',150000000,('1974-1-10'),25);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19243661,'SAIDA','SAIDA','MUNIZ','GIL',150000000,('2000-12-9'),25);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31163860,'ALBERTO','ANTHONY','PULIDO','ESQUIVEL',150000000,('1966-9-22'),25);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29636173,'EDUARDO','ALEXANDER','CEDENO','MENDOZA',300000000,('1976-12-18'),26);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10241654,'MARICRUZ','FRANCA','FONSECA','FUNES',250000000,('1953-6-22'),26);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24411474,'AMÉRICA','ANGELA','THOMAS','DELVALLE',250000000,('1999-7-17'),26);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20337660,'CONSTANZA','MYRIAM','CURIEL','ARVIZU',250000000,('1965-8-9'),26);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15042159,'SILVESTER','ISAAC','MORRIS','CRESPO',190000000,('2001-6-3'),26);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15632775,'BELINDA','ENEIDA','SARMIENTO','PALAFOX',190000000,('1976-2-23'),26);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31041171,'SILVIO','ULISES','SAMANIEGO','BLANCO',190000000,('1977-11-6'),26);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14558642,'BENITO','RAMÓN','BETANCOURT','ARMENDARIZ',150000000,('1984-6-22'),26);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15483662,'TARSICIO','MAXIMILIANO','COOK','WOOD',150000000,('1957-1-1'),26);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34186981,'BERNARDA','LAILA','LORA','CALDERA',150000000,('1950-1-22'),26);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26566711,'PATRICIO','YOVANNI','AREVALO','ROBERTS',300000000,('1955-7-11'),27);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13214023,'IGNACIO','KLEMENT','VALDOVINOS','CASTANON',250000000,('1952-11-11'),27);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30684895,'MIRELLA','ADELINA','HERRERA','CARRERA',250000000,('1982-10-24'),27);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24595616,'LUDMILA','VICTORIA','RAYA','CARRENO',250000000,('1967-10-8'),27);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16144725,'AFRODITA','VILMA','MITCHELL','BIANCO',190000000,('1977-1-14'),27);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24617439,'MARCOS','DANTE','YEPEZ','BIANCO',190000000,('1966-9-19'),27);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30924564,'BRANDON','JUAN','LEDESMA','ROA',190000000,('2001-4-12'),27);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17878412,'CLAUDIO','ELEAZAR','ROBINSON','ORDONEZ',150000000,('1976-6-26'),27);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10781811,'LUCILA','POLA','ANGULO','MENESES',150000000,('1988-9-3'),27);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16640354,'SILVANA','FIONA','AVINA','MONTEMAYOR',150000000,('1964-1-25'),27);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31367639,'ANTHONY','VICENTE','URRUTIA','BETANCOURT',300000000,('1968-7-16'),28);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23158803,'RÓMULO','MIGUEL','BERRIOS','PIZARRO',250000000,('2000-2-20'),28);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16755705,'OCTAVIA','CONSTANCIA','MONTELONGO','CARDONA',250000000,('1965-6-27'),28);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13127430,'HERMIONE','MABEL','MEDRANO','PARRA',250000000,('1988-3-24'),28);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24641066,'BETTY','JACQUELINE','PONCE','CEBALLOS',190000000,('1952-5-16'),28);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16188246,'MARCIAL','ALFREDO','TAVERAS','STEVENS',190000000,('1980-11-14'),28);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32259244,'ALANA','ROSAURA','TAMEZ','MACHUCA',190000000,('1960-1-3'),28);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27820725,'ELADIO','CRISTO','HILL','PLASCENCIA',150000000,('1988-12-13'),28);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18417942,'VALENTÍN','JULIANO','NAJERA','LUIS',150000000,('1982-1-19'),28);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32151684,'VICENTE','JACOB','ARREOLA','NEGRETE',150000000,('1980-4-23'),28);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11261636,'ZARA','ELIANA','ARGUETA','CARTAGENA',300000000,('1957-5-19'),29);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25165255,'AGUSTÍN','FAUSTO','JAVIER','JACOBO',250000000,('1996-8-27'),29);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25832056,'GREGORIO','EDUARDO','CASAREZ','CORDOVA',250000000,('1987-9-23'),29);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19932823,'NATIVIDAD','HERIBERTA','PORTILLO','MORRIS',250000000,('1971-8-6'),29);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14805452,'NATALIA','NIEVES','MONCADA','HENRIQUEZ',190000000,('1961-3-17'),29);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16624145,'CHANTAL','VIRGINIA','RIVAS','ARANA',190000000,('1958-4-9'),29);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11167302,'CAMILO','FABIANO','ORDONEZ','CUELLAR',190000000,('1982-6-13'),29);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22898282,'PEREGRINO','FAUSTO','PHILLIPS','MOYA',150000000,('1958-2-23'),29);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10558551,'VITALICIO','LORENZO','ROBLEDO','HUGHES',150000000,('1971-8-17'),29);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26612843,'CLAUDIA','ADRIA','VARGAS','SEVILLA',150000000,('1988-9-4'),29);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25371642,'LUISA','AMANDA','PEDROZA','MIRANDA',300000000,('1963-8-22'),30);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13382718,'MARK','SANTIAGO','ESCAMILLA','ROBLES',250000000,('1973-1-5'),30);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19106809,'ISAAC','SALVADOR','LANDEROS','ESPINOZA',250000000,('1976-5-24'),30);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34523302,'ROXANA','NAZARET','ROJAS','VENTURA',250000000,('1969-7-7'),30);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11570633,'NATALIA','AGNES','IGLESIAS','GALLO',190000000,('1960-9-23'),30);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18097360,'GUADALUPE','ISABELLA','HERMOSILLO','CARDOZA',190000000,('1967-1-14'),30);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19275154,'VIVALDO','PACIANO','FERNANDEZ','BARRIOS',190000000,('1972-10-18'),30);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23752872,'CAMILA','ENEIDA','AGUILAR','TORRES',150000000,('1967-5-1'),30);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12357695,'FELICIO','MARCUS','VALENTIN','MERAZ',150000000,('1961-5-4'),30);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24388993,'CLEMENTE','CHRISTIAN','ORTIZ','WHITE',150000000,('1982-2-26'),30);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28503955,'NICOLÁS','ÁLVARO','REYES','BUSTILLOS',300000000,('1994-8-9'),31);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21148895,'DÁMARIS','ATENEA','BRAVO','GREEN',250000000,('1962-1-1'),31);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20144126,'LIONEL','MATÍAS','TAVAREZ','TREJO',250000000,('1971-10-27'),31);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19736484,'FERMÍN','ISAAC','ESCAMILLA','CASANOVA',250000000,('1956-1-22'),31);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25549158,'BERTRUDIS','JANE','CUELLAR','MATA',190000000,('1960-3-12'),31);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11595999,'VILMA','CELESTE','ANDERSON','ESPINO',190000000,('1974-7-22'),31);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19992608,'LIBERTAD','LUDMILA','WATSON','SIERRA',190000000,('1986-4-27'),31);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29608542,'MÁXIMO','JULIO','MOREIRA','INFANTE',150000000,('1991-2-21'),31);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30997279,'MELCHOR','GULLIVER','ANDERSON','IZAGUIRRE',150000000,('1989-9-23'),31);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26350265,'ALBERTO','IGNACIO','BAILEY','GARZA',150000000,('1958-8-25'),31);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29482377,'EMMA','OLIVIA','BATISTA','INIGUEZ',300000000,('1971-2-1'),32);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30663707,'LUCRECIA','LILIANA','LOZADA','MANCILLA',250000000,('1970-5-14'),32);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24173551,'BENIGNO','SANTIAGO','DELEON','GIL',250000000,('1977-11-14'),32);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14567355,'YOVANNI','ABELARDO','CARTER','ESCALERA',250000000,('1976-8-16'),32);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19089972,'ALEYDA','JANE','OCHOA','GALLARDO',190000000,('1978-9-18'),32);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21489038,'IMELDA','FELICIA','JASSO','PALOMARES',190000000,('1962-10-26'),32);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23678116,'ROCÍO','IRMA','ORTEGA','BUENO',190000000,('1958-5-17'),32);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13121455,'VALENTÍN','JIOVANI','URBINA','JARA',150000000,('1998-9-8'),32);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12022212,'VALENTINA','ANGELA','LOZANO','ELIZONDO',150000000,('1988-6-8'),32);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26795410,'JUSTO','CARLOS','CARO','ARANA',150000000,('2001-6-5'),32);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26264712,'RÉGULO','LEÓN','HENRIQUEZ','RIVERO',300000000,('1981-8-7'),33);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21034026,'RÓMULO','MARCOS','HARRIS','BARRERA',250000000,('1954-2-7'),33);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14514821,'DULCE','ANGELA','ALCANTAR','PALAFOX',250000000,('1960-3-7'),33);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17047290,'TULIO','TULIO','BROWN','ABREU',250000000,('1954-6-6'),33);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22571569,'KEVIN','CECILIO','ALVARENGA','LOREDO',190000000,('1980-5-8'),33);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27217041,'ADELAIDA','HEIDI','CANDELARIA','FAVELA',190000000,('1982-2-3'),33);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26746858,'ADELINA','CARLOTA','AGUILERA','SOLORZANO',190000000,('1998-3-6'),33);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15589976,'ABIGAIL','VIOLETA','WHITE','CABRAL',150000000,('1997-7-6'),33);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34812308,'CORNELIO','VENANCIO','DESANTIAGO','BUENO',150000000,('1993-3-11'),33);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31099216,'JULIANO','ISAAC','GALVEZ','VALLEJO',150000000,('1950-11-10'),33);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13451076,'JUSTO','BRENO','CARREON','CARDOSO',300000000,('1987-6-24'),34);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27294030,'VICTORIA','BETTY','AGUILERA','TOBAR',250000000,('1982-4-17'),34);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31896071,'LUCÍA','CATALINA','TURCIOS','OCAMPO',250000000,('1979-9-25'),34);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14422195,'BENJAMÍN','MICHAEL','HARO','AGUILAR',250000000,('1973-3-18'),34);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29516771,'ROCKY','LUCAS','LOYA','GUILLEN',190000000,('1950-12-5'),34);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24476760,'BIBIANA','CARLOTA','CARVAJAL','SANTILLAN',190000000,('1980-1-11'),34);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13795479,'VALERIA','SAMANTA','MOTA','MOREIRA',190000000,('1961-5-20'),34);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21719475,'FABIA','ANASTASIA','CONTRERAS','ROQUE',150000000,('1992-10-18'),34);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28662606,'CLAUDIO','MARTÍN','AVELAR','PALOMO',150000000,('1973-3-13'),34);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21848690,'ELIANA','ADA','BERRIOS','ORDONEZ',150000000,('1976-9-17'),34);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11408208,'AMÍLCAR','HÉRCULES','BIANCO','SALMERON',300000000,('1975-11-27'),35);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28567671,'IVES','KEVIN','BOTELLO','JARAMILLO',250000000,('1970-5-19'),35);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25525586,'AMÍLCAR','FEDERICO','ELIZONDO','LAZO',250000000,('1971-9-5'),35);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24239602,'FLOR','LAUREANA','BETANCOURT','ROSARIO',250000000,('1966-1-25'),35);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27506387,'ALAN','CALÍXTRATO','BUSTOS','SOTO',190000000,('1972-3-26'),35);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14609688,'SALVADOR','ELEAZAR','JACOBO','LONG',190000000,('1952-9-23'),35);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29201036,'MARLENE','TIFFANY','ESPARZA','LUGO',190000000,('1992-11-1'),35);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25102320,'ANUNCIACION','GLORIA','MIRANDA','UMANA',150000000,('1969-8-6'),35);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11574270,'EMMA','CARMEN','DESANTIAGO','RAYA',150000000,('1982-10-10'),35);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21014691,'FABIÁN','WILLIAM','MEDINA','TIRADO',150000000,('1951-9-21'),35);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10071602,'ARTURO','BRANDON','PELAYO','ORTIZ',300000000,('1998-6-4'),36);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27948875,'MAXIMILIANO','SALVADOR','ALEJO','BAKER',250000000,('1969-7-17'),36);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28624405,'ATENEA','MARLENE','ORNELAS','LOREDO',250000000,('1988-12-14'),36);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28887903,'BETTY','MERCEDES','CONCEPCION','FRANCO',250000000,('1994-11-10'),36);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28374171,'MARCUS','AGUSTÍN','VILLATORO','PERAZA',190000000,('1966-9-27'),36);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32614090,'MARCOS','JHOAN','ACOSTA','JOHNSON',190000000,('1956-5-7'),36);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25437960,'CARLA','ANGELA','LOYA','BARBA',190000000,('1983-11-2'),36);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32354016,'PETRONILA','MELINA','ROMERO','ZAMORA',150000000,('1972-2-10'),36);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25385531,'ROSARIO','AVA','VASQUEZ','MENESES',150000000,('1984-6-11'),36);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19332155,'MARCELO','ADOLFO','TAPIA','GUERRA',150000000,('1994-4-16'),36);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28013713,'PILAR','LAURA','CARO','VILLASENOR',300000000,('1969-4-4'),37);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13623310,'REGIE','ELIÁN','GASTELUM','APONTE',250000000,('1979-9-22'),37);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31347204,'VITALICIO','DAVID','DELEON','CASTELLON',250000000,('1995-11-9'),37);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15524829,'OROSIO','CLAUDIO','ZAMUDIO','NUNEZ',250000000,('1981-3-19'),37);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30111645,'TEODORA','ATENEA','ARAUJO','CEDILLO',190000000,('1966-10-23'),37);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20261686,'JIOVANI','TITO','BALDERRAMA','SOLIS',190000000,('1958-2-6'),37);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32186538,'ROCKY','EMILIO','RIZO','COLLADO',190000000,('1988-7-3'),37);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13069126,'CLOE','OCTAVIA','FUENTES','LOZANO',150000000,('1994-10-19'),37);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22684986,'ZAMIRA','ADELA','MADRID','MATEO',150000000,('2000-11-15'),37);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29413769,'ANUNCIACION','BRENDA','GIRALDO','MACIAS',150000000,('1984-1-8'),37);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10785071,'ANDRÉS','IVES','ROBLES','ORELLANA',300000000,('1996-11-10'),38);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31554682,'DIEGO','LINCOLN','ANDERSON','MANCILLA',250000000,('1956-9-4'),38);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13519339,'FACUNDO','YVES','HERRERA','RAMIREZ',250000000,('1988-4-2'),38);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18524660,'LUDMILA','CLAUDIA','COOPER','HIDALGO',250000000,('1964-5-12'),38);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10446974,'PAULA','MARIBEL','REYNOSO','VELAZQUEZ',190000000,('1950-12-9'),38);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17804119,'LEONEL','MARTÍN','LANDEROS','CARTAGENA',190000000,('1977-3-19'),38);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30975877,'LEO','JUSTIN','CATALAN','DIAZ',190000000,('1980-2-17'),38);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33080728,'ALMA','PAMELA','DAMIAN','ESCALERA',150000000,('1965-4-9'),38);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31925692,'ALTAGRACIA','TANIA','ANGEL','RIVERO',150000000,('1969-5-9'),38);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22757735,'GABRIELA','BELLA','ORNELAS','COLLAZO',150000000,('1990-5-8'),38);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22285779,'PASTOR','MICHAEL','GAYTAN','JASSO',300000000,('2002-7-24'),39);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34016746,'LIGIA','EDNA','MAESTAS','OLMOS',250000000,('1991-11-18'),39);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12553889,'CRISTO','CECILIANO','GALVEZ','SERVIN',250000000,('1995-10-20'),39);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12836775,'ANTONIO','MAGNUS','MIRAMONTES','ABARCA',250000000,('1978-11-22'),39);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25624540,'ÁNGEL','VALENTÍN','JACKSON','AMAYA',190000000,('1986-11-1'),39);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14312404,'BELLA','MILENA','AMAYA','BALLESTEROS',190000000,('1953-9-22'),39);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21515916,'MARSELLO','JUDAS','REGALADO','LONGORIA',190000000,('1977-10-21'),39);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15492569,'GREGORIO','CECILIO','DELCID','SALAZAR',150000000,('1950-1-24'),39);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28120397,'MELANIA','CLARA','AMEZCUA','PORRAS',150000000,('1991-1-23'),39);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29401906,'GRACIELA','DÁMARIS','GUADARRAMA','SANCHES',150000000,('1955-4-2'),39);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21672624,'AIDANA','VIVIANA','LOVATO','CAMPOS',300000000,('1966-1-2'),40);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25972607,'DIEGO','ÁNGEL','AVENDANO','OLVERA',250000000,('1983-7-7'),40);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32443300,'CAYETANO','JONATHAN','PERDOMO','SALGUERO',250000000,('1950-8-21'),40);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24220508,'PABLO','MELCHOR','VELEZ','GIRALDO',250000000,('1982-5-26'),40);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32870309,'ROSARIO','BENITA','AYALA','FERREIRA',190000000,('1957-9-21'),40);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17066139,'FRIDA','ENCARNACIÓN','AMEZCUA','RODRIQUEZ',190000000,('1974-9-26'),40);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32391778,'HÉRCULES','ELOY','ELIZALDE','NIEVES',190000000,('1984-8-24'),40);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18333624,'PATRICIO','VÍCTOR','LUCIO','MILLER',150000000,('1973-2-23'),40);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25023877,'ELOÍSA','CHRISTIANE','ABARCA','ACOSTA',150000000,('1977-2-23'),40);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15441893,'CELESTE','AMÉRICA','WARD','ANDRADE',150000000,('1972-12-13'),40);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30390896,'FACUNDA','FELICIA','ROSS','HIDALGO',300000000,('1999-5-24'),41);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25764958,'FELICIANO','PAULO','VALADEZ','RECINOS',250000000,('1963-6-17'),41);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15489247,'DANIELA','ADA','ORONA','AVILA',250000000,('1994-8-28'),41);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10201317,'ANDRÉS','RENATO','ROBINSON','PIZARRO',250000000,('1982-10-15'),41);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21419954,'ELOY','KEVIN','ALBA','PALOMINO',190000000,('1987-8-12'),41);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24078165,'MELCHOR','AURELIO','MELO','TRINIDAD',190000000,('1982-4-26'),41);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23196430,'AURELIA','MILENA','JAIME','PETERSON',190000000,('1963-9-2'),41);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17383017,'IVES','SILVESTRE','BANUELOS','ESCALERA',150000000,('2001-4-18'),41);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15079422,'ADOLFO','SILVESTER','THOMAS','MONTERO',150000000,('1950-2-7'),41);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28018435,'HERMIONE','MARIBEL','ALBA','ACOSTA',150000000,('1958-5-11'),41);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29624850,'ALANA','MARISOL','FERNANDEZ','ORDAZ',300000000,('1973-2-19'),42);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15741810,'IMELDA','LIBERTAD','SANTOYO','VALLADARES',250000000,('1962-7-18'),42);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19912484,'PONCIO','AMÍLCAR','MACHADO','ROSAS',250000000,('1968-6-7'),42);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25387341,'ÁNGEL','DANIEL','CASTELLANOS','SILVA',250000000,('2000-8-2'),42);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30858668,'AMADOR','SEBASTÍAN','ALCARAZ','MIRANDA',190000000,('1960-1-16'),42);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25953698,'LEONILDA','LUCÍA','ESPINAL','RENDON',190000000,('1999-5-23'),42);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32623376,'MARIANA','AGATHA','ARAGON','REYNA',190000000,('1973-9-4'),42);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26230751,'MARCO','ELIDIO','SARMIENTO','SERRANO',150000000,('1994-12-18'),42);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18833723,'FABIANO','VÍCTOR','BAEZ','CERDA',150000000,('1973-7-28'),42);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31837454,'CANDELARIA','ZARA','LEE','RODRIGUEZ',150000000,('1956-7-9'),42);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10907556,'ALBERTA','NIKITA','CARABALLO','TALAVERA',300000000,('1984-11-28'),43);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11345857,'CELINA','FABIA','BANDA','GAITAN',250000000,('1958-2-25'),43);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17273984,'OVIDIO','ELOY','ANGUIANO','PALMA',250000000,('1984-8-20'),43);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27427972,'LUCIANA','MARCELA','CHAVEZ','ARREGUIN',250000000,('1958-8-27'),43);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17996393,'ANDRÉS','CECILIANO','CEPEDA','DELGADILLO',190000000,('1963-11-26'),43);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13235071,'VICENTE','ADOLFO','MATIAS','SOLIZ',190000000,('1997-5-13'),43);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17498651,'AUGUSTO','JACOB','ROSA','MOREIRA',190000000,('1961-7-7'),43);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10621304,'RAMONA','MIRELLA','SILVA','ROLON',150000000,('1987-7-3'),43);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26972282,'PACIANO','DAVID','SARAVIA','ARROYO',150000000,('1994-10-16'),43);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30034229,'LUIS','IVES','ORELLANA','RUANO',150000000,('1986-9-25'),43);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15841410,'ALMA','PERLA','ALMANZA','REGALADO',300000000,('1964-1-18'),44);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25355796,'JOHANNA','NATHALY','SAENZ','DEJESUS',250000000,('1958-7-4'),44);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32635494,'DULCE','JUANA','VARGAS','VILLAREAL',250000000,('1978-3-20'),44);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20373689,'CASTRENSE','PATRICIO','BERMUDEZ','ABREGO',250000000,('1979-12-7'),44);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30604166,'ALBERTO','AURELIO','LANDAVERDE','JIMENEZ',190000000,('1975-1-9'),44);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22001560,'EDWIN','ALAN','FAJARDO','LOZA',190000000,('1982-5-18'),44);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16694854,'FLORENCIA','SHEILA','OBREGON','AVELAR',190000000,('1980-11-13'),44);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24311205,'DOLORES','MILENA','ZAMORA','MARTINEZ',150000000,('1995-8-2'),44);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28969110,'MATÍAS','AGUSTÍN','BUSTILLOS','DESANTIAGO',150000000,('2001-11-20'),44);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20049749,'JUSTO','JULIO','FIGUEROA','ROA',150000000,('1985-9-20'),44);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31500628,'NAZARET','PAZ','BENNETT','MANZO',300000000,('1960-4-11'),45);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30237194,'LAUREANA','BERTRUDIS','VALADEZ','BAUTISTA',250000000,('1967-5-28'),45);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28489317,'MARILUZ','NADIA','PINTO','CARRIZALES',250000000,('1954-4-22'),45);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30292495,'LUIS','FLORINDO','SAAVEDRA','PONCE',250000000,('1996-12-26'),45);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30315075,'MELANIA','NADIA','CARMONA','MELGAR',190000000,('1978-1-17'),45);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28268119,'MARK','LUIS','DELTORO','PEREIRA',190000000,('1960-6-17'),45);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25117173,'SALVADOR','LINCOLN','MATOS','GUERRERO',190000000,('1988-5-12'),45);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19931160,'FÉLIX','VALERIO','BALLESTEROS','BETANCOURT',150000000,('1960-2-1'),45);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24880392,'AMARA','ALTAGRACIA','MAGDALENO','ARTEAGA',150000000,('1975-7-7'),45);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23218848,'ELEAZAR','MANUEL','VALADEZ','OSUNA',150000000,('1994-11-9'),45);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24745153,'JAYDEN','VICTORIANO','ALMAGUER','GAMBOA',300000000,('1970-7-7'),46);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32304415,'NAOMI','ADELINA','LARIOS','AMADOR',250000000,('1967-7-25'),46);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18546587,'MAFALDA','MARISOL','RAMIRES','YBARRA',250000000,('1987-5-3'),46);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33326387,'MARCELA','EMMA','DELCID','PADILLA',250000000,('1967-3-5'),46);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23856248,'SERGIO','BRANDON','MONCADA','VEGA',190000000,('1992-8-4'),46);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26329074,'ADÁN','LEO','SIMON','TAYLOR',190000000,('1973-11-9'),46);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18847826,'AMADOR','VICENTE','OSUNA','PERRY',190000000,('1989-12-22'),46);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31309492,'LUCIANA','BIBIANA','MEDRANO','MACIAS',150000000,('1972-10-15'),46);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27984722,'NADIA','VITALICIA','MELENDEZ','AGUILERA',150000000,('2002-10-9'),46);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15453040,'CLAUDIO','JACOB','BRIONES','GAITAN',150000000,('1968-10-19'),46);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31301259,'MAXIMILIANO','MARCUS','VERDUZCO','DIAZ',300000000,('1984-3-20'),47);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11500849,'ELBA','JULIA','LEE','PALOMINO',250000000,('1952-12-13'),47);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28953762,'DELFINA','ANUNCIACION','ARCHULETA','RANGEL',250000000,('1996-1-14'),47);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17779635,'MYRTA','MATILDE','NAVARRO','AVILA',250000000,('1950-10-21'),47);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26414167,'VALERIO','HÉRCULES','ALARCON','CHACON',190000000,('1954-9-9'),47);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16002472,'CAROLINA','MARIBEL','HOLGUIN','ORONA',190000000,('2001-6-4'),47);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13034206,'DOMENICO','VIRGILIO','MACHUCA','ACEVES',190000000,('1995-12-22'),47);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25551078,'ADRIÁN','PEREGRINO','ARANGO','GAYTAN',150000000,('1980-4-12'),47);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26391157,'JUSTIN','VÍCTOR','MAGALLANES','PARDO',150000000,('1961-3-24'),47);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21902253,'CELIA','LIBERTAD','MONREAL','THOMPSON',150000000,('1976-8-6'),47);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32790230,'ANTHONY','WILLIAM','ESPINAL','LORA',300000000,('1964-3-5'),48);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17869968,'PATRICIO','RAFAEL','CERNA','RINCON',250000000,('1958-12-24'),48);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23133090,'SARA','PALOMA','ARANA','SMITH',250000000,('1972-6-1'),48);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14105211,'INOCENCIA','RITA','CEDILLO','WATSON',250000000,('1962-2-9'),48);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29180876,'GRACIA','LUISA','SANTILLAN','AGUILERA',190000000,('1950-10-23'),48);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30198168,'VÍCTOR','CAYETANO','ROA','VERDUGO',190000000,('1976-10-28'),48);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21104961,'JACOB','VENANCIO','WILSON','PRICE',190000000,('1999-7-28'),48);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25277359,'CASTRENSE','ABELARDO','GOVEA','PARDO',150000000,('1997-10-10'),48);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17591447,'ROSAURA','CAROLINA','GUADARRAMA','ROBERTS',150000000,('1988-6-25'),48);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19800652,'ISABELLA','BETSABÉ','URENA','ALARCON',150000000,('1967-5-13'),48);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23884813,'MANUEL','JULIANO','ROMO','ZAVALA',300000000,('1987-2-13'),49);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34988715,'MAGNUS','PABLO','ESPARZA','BONILLA',250000000,('1992-8-19'),49);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32329034,'LILIANA','PERLA','CEDENO','CHAIREZ',250000000,('1958-9-6'),49);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11786053,'OLIVIA','BERNARDA','VALADEZ','ORTEGA',250000000,('1999-8-22'),49);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21597171,'AVA','PAZ','VERGARA','ANDRADE',190000000,('1993-6-26'),49);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26541054,'RAMÓN','CICERÓN','JURADO','NORIEGA',190000000,('1968-12-6'),49);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12124724,'ROCÍO','ADELA','COLON','TAMEZ',190000000,('1990-7-17'),49);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26072112,'JAYDEN','ROCKY','VERGARA','SALGADO',150000000,('1950-1-6'),49);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32233314,'CARMONA','CHISTOPHER','GUADARRAMA','PALOMO',150000000,('1992-6-17'),49);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29338778,'FAUSTO','MARK','BAKER','MIGUEL',150000000,('1962-6-9'),49);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27886973,'GABRIELA','ISABEL','ESPARZA','MENJIVAR',300000000,('1999-6-23'),50);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32408879,'CARLOS','IGNACIO','MORIN','PLASCENCIA',250000000,('1977-8-23'),50);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34910627,'CECILIO','EMILIO','BANDA','FOSTER',250000000,('2001-6-22'),50);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25971441,'ADRIANA','THAIS','ROBINSON','CORRAL',250000000,('1984-12-3'),50);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33331185,'ADELA','IRMA','GRIMALDO','GUTIERREZ',190000000,('1968-4-7'),50);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24848420,'FLOR','VALERIA','ALICEA','ROA',190000000,('1963-12-20'),50);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30315660,'BENIGNO','ALEJANDRO','PAGAN','COX',190000000,('1961-1-23'),50);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14515921,'CLEMENTE','MARIO','ALEXANDER','SALVADOR',150000000,('1962-2-9'),50);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12719817,'BENJAMÍN','TORIBIO','SOLIS','LOVATO',150000000,('1965-10-11'),50);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33679543,'BERTA','AGNES','PRADO','ARCHULETA',150000000,('1961-6-3'),50);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22659884,'ZARA','AURORA','SANTOS','NEVAREZ',300000000,('1978-4-24'),51);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28409435,'ADÁN','FELICIO','SANTOYO','PALACIO',250000000,('1954-3-3'),51);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16732515,'EDELBERTO','KLEMENT','BONILLA','TAPIA',250000000,('1956-8-9'),51);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32498382,'MYRIAM','MIRANDA','CARBAJAL','CHAVEZ',250000000,('1966-9-2'),51);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31760390,'NIKITA','CARLOTA','REYNA','BANUELOS',190000000,('1975-2-3'),51);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14334069,'MARCELA','ROSAURA','CASTANON','QUINTANA',190000000,('1999-11-3'),51);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21168852,'MARCELO','JUSTINIANO','LIZARRAGA','CALDERA',190000000,('1954-8-17'),51);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13159658,'CORANIA','ADELAIDA','RENDON','LARIOS',150000000,('1997-12-16'),51);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15221579,'CÉSAR','SALVADOR','MARQUEZ','TAPIA',150000000,('1961-8-17'),51);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10546389,'FABIÁN','JAVIER','PELAEZ','TREJO',150000000,('1969-1-15'),51);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33382335,'ISAAC','SAMUEL','LARIOS','HERRERA',300000000,('1956-9-11'),52);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25453975,'VITALICIA','IMMA','ANGUIANO','ESTRELLA',250000000,('1997-3-10'),52);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13644160,'ISIDRO','CALÍGULA','BAZAN','GUERRA',250000000,('2001-4-24'),52);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30226533,'ISAAC','LINCOLN','OLMOS','DAVALOS',250000000,('1985-4-20'),52);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11202426,'IMMA','JOCELYNNE','JAUREGUI','BENAVIDEZ',190000000,('1954-2-1'),52);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10462569,'MARTINA','GRACIELA','MONTOYA','MARTIN',190000000,('1957-9-23'),52);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14791531,'AURORA','CINTIA','CHAIREZ','ARAGON',190000000,('1998-2-23'),52);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26365752,'FULGENCIO','JOSÉ','IZQUIERDO','MOJICA',150000000,('1978-4-10'),52);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26866051,'GREGORIO','RAFAEL','RAMIREZ','SARMIENTO',150000000,('1961-2-3'),52);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28257935,'MARCELO','MARGARITO','GALAVIZ','ESTEVEZ',150000000,('1979-9-19'),52);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11424012,'OVIDIA','CARLOTA','BANDA','DELUNA',300000000,('1958-5-24'),53);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14321559,'MAFALDA','DOLORES','TOLEDO','TENORIO',250000000,('2002-11-20'),53);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23897902,'CLEMENTE','JUVENAL','RINCON','GASPAR',250000000,('1978-8-21'),53);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19654179,'OWEN','ISAAC','CANALES','SALGUERO',250000000,('1988-2-21'),53);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21438572,'TIFFANY','ALBERTA','FARIAS','ZAVALA',190000000,('1960-1-25'),53);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28230929,'SAMANTA','ALICIA','ARGUELLO','PABON',190000000,('1999-2-20'),53);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10659813,'AMPARO','MARÍA','STEWART','MONTIEL',190000000,('1985-4-20'),53);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26093725,'LEÓN','PETRONILO','VERA','RIOS',150000000,('1981-12-4'),53);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31205343,'MARLENE','ALANA','SULLIVAN','HARRIS',150000000,('1954-1-5'),53);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12778316,'VÍCTOR','WILLIAM','ZACARIAS','ALMANZA',150000000,('1960-6-10'),53);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23003237,'TULIO','CEFERINO','VERGARA','SALMERON',300000000,('1951-7-10'),54);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22718393,'ABELARDO','MIGUEL','ADAMS','ALARCON',250000000,('1982-6-26'),54);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19829109,'ALICIA','LETICIA','ABREGO','LOREDO',250000000,('2002-11-23'),54);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26383354,'VÍCTOR','AMÍLCAR','CARRASCO','CHAVARRIA',250000000,('1972-3-24'),54);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33482447,'MICHAEL','MAGNUS','AGUIRRE','RODARTE',190000000,('1972-7-17'),54);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34978824,'ALBA','LIGIA','CANALES','ESPINO',190000000,('1987-11-7'),54);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24616286,'DOLORES','LUCÍA','COLLADO','DIAZ',190000000,('1981-9-21'),54);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13539618,'AGNES','GRACIA','VILLAREAL','URENA',150000000,('1995-7-6'),54);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32297204,'JAIME','HUGO','FIERRO','MARTINES',150000000,('1984-2-3'),54);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15783305,'VITALICIO','LIONEL','PADILLA','GARZA',150000000,('1959-4-4'),54);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14180873,'YOVANNI','JACOBO','VEGA','ROSAS',300000000,('1997-3-2'),55);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18619946,'MÓNICA','ALMA','PALMA','VALDOVINOS',250000000,('1951-5-2'),55);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15417245,'ANTONELLA','PAZ','VELARDE','MARQUEZ',250000000,('1972-5-2'),55);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15953401,'MATÍAS','MARIO','BLANCO','GIL',250000000,('1956-8-19'),55);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13337530,'JUSTINIANO','VIRGILIO','COLLAZO','HEREDIA',190000000,('1960-3-24'),55);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25430975,'MARCELA','NAZARET','CEPEDA','BRIONES',190000000,('1997-2-28'),55);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18487900,'MURIEL','FACUNDA','BARRIOS','ANGEL',190000000,('1995-8-25'),55);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21152787,'BLANCA','MIREYA','PARTIDA','CURIEL',150000000,('1980-11-11'),55);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12794015,'FAUSTO','ELIDIO','CARTAGENA','PEDRAZA',150000000,('1991-8-5'),55);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18039872,'GRACIA','VALERIA','LEDESMA','BEDOLLA',150000000,('1958-5-14'),55);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16441622,'JULIO','DANIEL','PAREDES','QUIROZ',300000000,('1955-11-24'),56);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34348515,'SILVIO','MATÍAS','RUBIO','ALCANTARA',250000000,('1983-12-27'),56);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13765848,'SEBASTÍAN','OROSIO','ALVARADO','BEDOLLA',250000000,('1998-1-14'),56);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29705204,'ERIKA','LINDA','MONTIEL','PEDRAZA',250000000,('1953-4-27'),56);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17496370,'BIENVENIDO','FELICIO','SANTOYO','MARQUEZ',190000000,('1995-7-19'),56);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22988354,'REGIE','MARCO','TAFOYA','PERALTA',190000000,('1992-8-12'),56);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20200416,'FABIOLA','GUADALUPE','QUESADA','SALGADO',190000000,('1966-12-2'),56);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16955375,'CONSTANZA','VALERIA','MAGALLANES','ROBLEDO',150000000,('1954-9-23'),56);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33401332,'ANA','GRISELDA','ANTONIO','ROSALES',150000000,('1981-6-11'),56);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26522399,'CÉSAR','MAGNUS','ESPARZA','RANGEL',150000000,('1991-1-7'),56);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12126696,'WILLIAM','ELIÁN','PALOMINO','MACIEL',300000000,('1957-11-21'),57);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29715885,'PETRONILO','HÉRCULES','SAUCEDO','GALINDO',250000000,('1963-7-15'),57);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20579632,'VERÓNICA','AFRODITA','MADRID','NAZARIO',250000000,('1960-10-11'),57);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15764823,'SABRINA','ALANA','HILL','REYNOSO',250000000,('1972-7-6'),57);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32537455,'ABELARDO','JONATHAN','TELLEZ','VILLAREAL',190000000,('1996-4-24'),57);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33011234,'CALÍXTRATO','ADÁN','DELOSSANTOS','SEGOVIA',190000000,('1984-8-1'),57);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20440163,'AVA','VALERIA','JORDAN','LONGORIA',190000000,('1987-8-12'),57);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20848255,'FACUNDA','AMELIA','DELAROSA','ARRIAGA',150000000,('2001-6-15'),57);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31410260,'SOLEDAD','GUADALUPE','CALDERON','HALL',150000000,('1958-4-12'),57);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17656358,'JAIME','ELEAZAR','COLON','GALVEZ',150000000,('1954-9-27'),57);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13508280,'NAOMI','HEIDI','CASAS','AVILES',300000000,('1995-6-28'),58);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (26123793,'MARCELO','JUDAS','IBARRA','ARCE',250000000,('1965-3-24'),58);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21307287,'LORENZO','BRUNO','VARELA','HOWARD',250000000,('1965-1-3'),58);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28635294,'KEVIN','HUGO','ALCANTAR','ELLIS',250000000,('1986-7-10'),58);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21049438,'GRACIELA','JUDITH','SIFUENTES','BARNES',190000000,('1995-1-3'),58);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27650221,'YVES','JONATHAN','GUZMAN','PARTIDA',190000000,('1962-7-19'),58);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21099244,'CONSTANTINO','PEDRO','GALLO','VERDUGO',190000000,('1960-6-5'),58);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32615131,'CARLA','LUCILA','ARMIJO','ZUNIGA',150000000,('1953-7-15'),58);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23478067,'AURORA','MIREYA','NAZARIO','MENJIVAR',150000000,('1997-8-1'),58);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18062597,'GINA','OCTAVIA','ARGUETA','ROSAS',150000000,('1965-12-26'),58);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33521981,'FEDERICO','CECILIO','SORIA','LERMA',300000000,('1977-10-1'),59);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13130471,'ROCKY','MARCUS','OROSCO','INIGUEZ',250000000,('1986-10-18'),59);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24425742,'ELOY','FIDEL','CADENA','GONSALEZ',250000000,('1957-9-9'),59);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25714151,'NANCY','REGINA','VILLALPANDO','STEWART',250000000,('1971-11-14'),59);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29530705,'RITA','LIBERTAD','TELLO','ALMONTE',190000000,('1991-5-16'),59);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (23140287,'JORGE','JUSTO','MORALES','SANTILLAN',190000000,('1966-12-19'),59);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15357134,'ELIÁN','PASTOR','ESTRADA','GUZMAN',190000000,('1961-5-12'),59);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11338965,'ODILIA','FRANCA','MARTIN','LUIS',150000000,('1953-11-22'),59);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28401506,'FACUNDA','CAROLINA','IZQUIERDO','CHAVEZ',150000000,('1996-10-26'),59);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25269604,'MIA','LUNA','SALVADOR','SANTAMARIA',150000000,('1974-6-21'),59);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33833332,'MAXIMILIANO','CICERÓN','HERNANDES','ROSARIO',300000000,('1988-1-22'),60);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32804101,'GRISELDA','VITALICIA','MOYA','DELCID',250000000,('1966-7-11'),60);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21282502,'EDUARDO','TORIBIO','ALMEIDA','ANDRADE',250000000,('1952-1-22'),60);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24388547,'JUAN','KLEMENT','GAITAN','LEOS',250000000,('1984-3-19'),60);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31699939,'OROSIO','JAVIER','MARES','THOMPSON',190000000,('1991-8-7'),60);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31785242,'FLORENTINA','MABEL','ROCHA','HILL',190000000,('1954-9-18'),60);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25508500,'CECILIANO','ADOLFO','ZAVALA','ARGUETA',190000000,('1985-1-12'),60);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14806744,'PATRICIO','RÓMULO','ORELLANA','FERNANDEZ',150000000,('1973-9-24'),60);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14978581,'SABRINA','CARMEN','DAVIS','ALMONTE',150000000,('1975-9-1'),60);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19560077,'GINA','ASCENSIÓN','LUNA','LORENZO',150000000,('1998-11-15'),60);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25256081,'GRETA','GRETA','TOLEDO','RODRIGUEZ',300000000,('1999-5-11'),61);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22538254,'FLORINDO','EMILIANO','PARKER','KELLY',250000000,('1974-11-10'),61);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15955062,'INOCENCIO','FOSTER','ROMO','DELRIO',250000000,('1983-2-5'),61);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13789359,'EDUARDO','EDELBERTO','ALEMAN','BERNAL',250000000,('1977-10-3'),61);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18202115,'GRACIELA','LARA','BATISTA','ROBINSON',190000000,('1985-10-26'),61);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25673688,'VITALICIA','CHANTAL','CONCEPCION','NAVARRETE',190000000,('1973-8-14'),61);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15922447,'RÉGULO','CONSTANTINO','SANTANA','ROBLES',190000000,('1969-2-21'),61);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25291194,'KLEMENT','JULIANO','PUENTE','VALLES',150000000,('1998-11-9'),61);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31990343,'AURELIA','CORANIA','VIGIL','ARROYO',150000000,('1988-9-17'),61);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19917211,'JULIANA','VALENTINA','BARRAZA','ALVARENGA',150000000,('1986-9-19'),61);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11129861,'PALOMA','BERTRUDIS','MONTEMAYOR','ANGUIANO',300000000,('2002-1-20'),62);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11614650,'AGUSTÍN','FIDEL','ELIZALDE','CARRANZA',250000000,('1957-5-5'),62);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32109686,'BIBIANA','FERNANDA','RUSSELL','MOREIRA',250000000,('1967-3-12'),62);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27060354,'AURELIO','JESÚS','ALDANA','SEVILLA',250000000,('1951-12-2'),62);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15981094,'LIONEL','AURELIO','PAZ','BARRAZA',190000000,('1965-6-12'),62);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30839397,'FABIÁN','BENICIO','VALENTIN','BROOKS',190000000,('1991-8-22'),62);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18456923,'LAUREANA','MARILUZ','MURO','GREEN',190000000,('1988-5-28'),62);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18439249,'YVES','FAUSTO','SOSA','CERVANTES',150000000,('1992-3-3'),62);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27491359,'JULIANO','JULIÁN','AVINA','REGALADO',150000000,('1988-7-20'),62);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29628094,'JUANA','LUDMILA','CISNEROS','OSORIO',150000000,('1954-3-22'),62);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17089213,'DAFNE','CHRISTIANE','BUSTILLOS','LONG',300000000,('1979-3-27'),63);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10514936,'SAMANTA','MARICRUZ','OLVERA','PEDROZA',250000000,('1987-1-4'),63);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24841876,'BENICIO','MAXIMILIANO','CASTELLON','FIERRO',250000000,('1951-11-15'),63);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19025556,'CASTRENSE','RENATO','GALARZA','DELGADILLO',250000000,('1956-10-26'),63);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28532742,'EDWIN','ABELARDO','ORELLANA','GRAY',190000000,('2002-6-6'),63);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18849722,'GLORIA','MARINA','MENENDEZ','CONTRERAS',190000000,('1985-4-26'),63);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10235628,'BELINDA','AMELIA','MORALES','RICO',190000000,('1954-4-15'),63);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11963587,'ROCKY','JUDAS','GUERRERO','LUCIO',150000000,('1999-9-14'),63);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28338988,'CAYETANO','KLEMENT','BOCANEGRA','VIRAMONTES',150000000,('1968-11-21'),63);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24835681,'RENATA','INOCENCIA','COX','MILLAN',150000000,('1980-3-9'),63);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12753175,'DONATILA','LUCILA','SARMIENTO','NAVA',300000000,('2002-10-4'),64);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33920883,'AMARA','ELBA','VALLADARES','ALMAGUER',250000000,('1966-3-22'),64);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24697099,'LINCOLN','NICOLÁS','VIGIL','ABARCA',250000000,('1966-7-28'),64);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16921169,'LAUREANA','FACUNDA','WOOD','ALMARAZ',250000000,('1950-3-24'),64);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13357474,'MARTINIANO','MARCIAL','GARCES','ULLOA',190000000,('1995-5-9'),64);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16305845,'TITO','FÉLIX','ALVARADO','HARRIS',190000000,('1964-7-20'),64);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15296430,'ANTHONY','FLORINDO','MACIEL','URBINA',190000000,('1962-2-26'),64);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24768195,'JULIA','MOIRA','ROCHA','BATISTA',150000000,('1974-11-21'),64);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19852327,'LIONEL','SILVESTRE','ALLEN','LEOS',150000000,('1959-2-25'),64);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17408035,'VALERIO','LIONEL','HIDALGO','NEVAREZ',150000000,('1977-11-3'),64);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (20476719,'LEOPOLDA','EMILIANA','MEDINA','FRANCO',300000000,('2001-8-7'),65);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30988275,'ADELINA','BERTA','CASTREJON','SOTO',250000000,('1979-5-24'),65);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15539728,'BIANCA','EDNA','TELLO','ROBINSON',250000000,('1986-2-2'),65);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32284948,'CRISTO','ULISES','CHAVARRIA','OTERO',250000000,('1959-2-28'),65);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12377261,'MELCHOR','PABLO','ANGULO','RUSSELL',190000000,('1966-7-2'),65);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16371052,'VALENTÍN','LEO','PHILLIPS','VAZQUEZ',190000000,('2000-8-16'),65);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10872516,'SHEILA','HERMIONE','RICHARDSON','VILLASENOR',190000000,('1961-4-4'),65);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17848711,'SILVIA','CELIA','OVIEDO','SILVA',150000000,('1993-5-23'),65);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31345131,'MARTÍN','EDWIN','MANZANO','CARVAJAL',150000000,('1961-2-23'),65);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10028967,'RENATO','PABLO','CASTRO','CERNA',150000000,('1999-10-7'),65);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (24629128,'BONITA','FÁTIMA','CORDERO','CASTREJON',300000000,('1954-11-10'),66);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21987194,'FABIANA','PASTORA','SALMERON','DELVALLE',250000000,('1991-3-7'),66);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29741833,'DELFINA','CELINA','VILLATORO','AYALA',250000000,('1970-11-14'),66);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14950392,'JUAN','JIOVANI','URIAS','WOOD',250000000,('1986-10-25'),66);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16428192,'FABIANA','VIVIANA','CADENA','CARMONA',190000000,('1960-3-22'),66);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22142004,'CONSTANTINO','FAUSTINIANO','SARMIENTO','CENTENO',190000000,('1994-4-23'),66);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30746283,'TULIO','TARSICIO','RIVERA','VELEZ',190000000,('1989-12-3'),66);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10016798,'YOVANNI','SALVADOR','PINEDA','ALMARAZ',150000000,('1995-11-24'),66);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10440549,'CHRISTIANE','CINTIA','CHAPA','MONTES',150000000,('1965-12-5'),66);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29219711,'PABLO','CAMILO','ALFARO','OLIVAREZ',150000000,('1965-6-21'),66);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30818599,'ULISES','MARCO','NIEVES','HENDERSON',300000000,('1963-2-1'),67);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17999464,'MARIAM','HAYDÉE','QUILES','PUGA',250000000,('1962-12-26'),67);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18547057,'BERTA','GEORGINA','ALFARO','CORDERO',250000000,('1976-4-16'),67);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21826142,'FRANCA','LILIANA','IBANEZ','WRIGHT',250000000,('1961-2-21'),67);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (11499593,'MELCHOR','DANTE','VEGA','TAYLOR',190000000,('1989-4-19'),67);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27333515,'LORENZO','ÁNGEL','ESQUEDA','DURON',190000000,('1951-2-16'),67);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16270686,'CLARENCE','MICHAEL','SANTIAGO','BUTLER',190000000,('1984-10-7'),67);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31400075,'ZAMIRA','JESSICA','MEJIA','ROSARIO',150000000,('1960-7-12'),67);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17520363,'MIRELLA','ALICIA','CARRASCO','BUSTILLOS',150000000,('1957-7-3'),67);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12764026,'ARTURO','CHISTOPHER','CADENA','ZAMUDIO',150000000,('1953-9-3'),67);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12581726,'JAYDEN','CESARINO','VILLARREAL','ARRIOLA',300000000,('1982-2-12'),68);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33286890,'FABRICIA','INOCENCIA','OCAMPO','GUERRERO',250000000,('1982-4-20'),68);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (12481493,'JOCELYNNE','ADRIA','PHILLIPS','ESPINOZA',250000000,('1963-5-19'),68);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16795426,'NICOLE','PAZ','ALMARAZ','TEJADA',250000000,('1973-10-1'),68);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (29580802,'JUSTINIANO','PEREGRINO','PEDRAZA','PETERSON',190000000,('1964-8-19'),68);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10444534,'ANUNCIACION','BIANCA','GRIJALVA','VIDAL',190000000,('1967-11-12'),68);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (33662631,'FELICIO','EDWIN','MONTANO','MENA',190000000,('1990-11-22'),68);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14199891,'ELIÁN','EDELBERTO','POLANCO','GONZALES',150000000,('1972-6-27'),68);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15398746,'FOSTER','CHISTOPHER','RICHARDSON','ZUNIGA',150000000,('1971-1-24'),68);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32892124,'LUCRECIA','PETRA','MANCILLA','MARAVILLA',150000000,('1970-3-19'),68);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21101578,'EMILIO','ANDRÉS','TINOCO','ARREOLA',300000000,('1973-5-19'),69);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10128623,'NICOLÁS','RENATO','GRACIA','ALFARO',250000000,('1967-8-15'),69);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21583307,'EMILIA','FABIA','ORELLANA','ANGELES',250000000,('1958-4-5'),69);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (18636994,'CAMILA','ADRIANA','GRIMALDO','ACOSTA',250000000,('1982-7-5'),69);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15565457,'CELESTE','SOL','ROBLEDO','PENALOZA',190000000,('2002-12-7'),69);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21845881,'FOSTER','DANTE','BOJORQUEZ','SOLIZ',190000000,('1966-2-2'),69);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (22186662,'LUCAS','JUSTO','COOK','COX',190000000,('2001-12-21'),69);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (10709090,'VIRGILIO','LINCOLN','MATA','GOMEZ',150000000,('1991-5-24'),69);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19995932,'INOCENCIA','FELICIA','PINA','GARNICA',150000000,('1953-8-13'),69);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17944162,'GRACIELA','CAMILA','RIVERO','CAVAZOS',150000000,('1963-10-21'),69);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16941100,'PASTOR','BRUNO','PASCUAL','JACOBO',300000000,('2002-10-20'),70);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (31955137,'SERGIO','ALFREDO','LORA','NELSON',250000000,('1971-8-9'),70);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (21364733,'LAUREANA','AURORA','MERCADO','CORTES',250000000,('1978-10-16'),70);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25388433,'LAUREANA','TIFFANY','MOREIRA','IBARRA',250000000,('1982-1-28'),70);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34415249,'CAMILA','LAUREANA','ALVA','FAVELA',190000000,('1958-7-17'),70);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (13033602,'GREGORIO','MARIO','ARENAS','DELAPAZ',190000000,('1963-8-6'),70);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34653414,'ADRIA','FLOR','BANUELOS','JARA',190000000,('1993-12-16'),70);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (17904772,'OCTAVIO','ALEXANDER','ROLON','RESENDEZ',150000000,('1990-2-26'),70);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14893086,'MAGNUS','ADOLFO','OZUNA','STEVENS',150000000,('1977-4-18'),70);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14462179,'MARTÍN','JAVIER','MELENDEZ','OLIVER',150000000,('2002-1-12'),70);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (27625806,'MOIRA','VIVIANA','CARRIZALES','PRADO',300000000,('1971-5-24'),71);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (25932727,'YVES','ROCKY','QUINONES','LEIJA',250000000,('1995-4-2'),71);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (32861304,'MARCELO','FABIO','CAZARES','JACKSON',250000000,('1972-10-27'),71);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (16584096,'FABRICIA','INOCENCIA','ALFARO','ESCOBAR',250000000,('1978-2-24'),71);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (34114367,'NAOMI','AMÉRICA','MELO','BAHENA',190000000,('1991-4-19'),71);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (30055435,'DÁMARIS','PAULA','SIMON','NUNEZ',190000000,('1995-4-19'),71);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (15977645,'LEO','SILVIO','ACEVEDO','ENRIQUEZ',190000000,('1986-4-12'),71);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (28625625,'ADÁN','CONSTANTINO','MADRIGAL','GAMBOA',150000000,('2002-10-5'),71);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (19121310,'MANUEL','LEO','ARTEAGA','NIETO',150000000,('1954-5-10'),71);
INSERT INTO empleado (em_cedula, em_p_nombre, em_s_nombre, em_p_apellido, em_s_apellido, em_sueldo, em_fecha_nac, fk_tienda) VALUES (14108321,'CAROLA','PASTORA','BUTLER','SALAZAR',150000000,('1996-2-21'),71);


select * from empleado;