-- TODAS LAS MONEDAS
INSERT INTO moneda VALUES ('BOLÍVARES' );
INSERT INTO moneda VALUES ('DOLARES');
INSERT INTO moneda VALUES ('EUROS');
INSERT INTO moneda VALUES ('PUNTOS');

--TIPOS DE PAGO
INSERT INTO tipo_pago VALUES ('Tarjeta de crédito');
INSERT INTO tipo_pago VALUES ('Tarjeta de débito');
INSERT INTO tipo_pago VALUES ('Cheque');
INSERT INTO tipo_pago VALUES ('Efectivo');
INSERT INTO tipo_pago VALUES ('Puntos');

-- COTIZACION                                            --por evaluar
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_valor) VALUES (current_timestamp,1088800);
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_valor) VALUES (current_timestamp,1359000);
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_valor) VALUES (current_timestamp,10000)
UPDATE cotizacion SET ct_expira = current_timestamp WHERE fk_moneda='2' 
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_valor) VALUES (current_timestamp,1230800);


--HORARIO
--Lunes
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Lunes-Turno mañana','LUNES' ,'07:00' ,'12:00');
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Lunes-Turno tarde','LUNES' ,'07:00' ,'12:00');

--Martes
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Martes-Turno mañana','MARTES' ,'07:00' ,'12:00');
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Martes-Turno tarde','MARTES' ,'01:00' ,'7:00');

--Miercoles
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Miercoles-Turno mañana','MIERCOLES' ,'07:00' ,'12:00');
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Miercoles-Turno tarde','MIERCOLES' ,'01:00' ,'7:00');

--Jueves
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Jueves-Turno mañana','JUEVES' ,'07:00' ,'12:00');
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Jueves-Turno tarde','JUEVES' ,'01:00' ,'7:00');

--Viernes
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Viernes-Turno mañana','VIERNES' ,'07:00' ,'12:00');
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Viernes-Turno tarde','VIERNES' ,'01:00' ,'7:00');

--Sabado
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Sabado-Turno mañana','SABADO' ,'07:00' ,'12:00');
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Sabado-Turno tarde','SABADO' ,'01:00' ,'7:00');

--Domingo
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Domingo-Turno mañana','DOMINGO' ,'07:00' ,'12:00');
INSERT INTO horario (ho_descripcion, ho_dia, ho_hora_entrada, ho_hora_salida) VALUES ('Domingo-Turno tarde','DOMINGO' ,'01:00' ,'7:00');

--ROLES

INSERT INTO rol (ro_nombre) VALUES ('Cliente');
INSERT INTO rol (ro_nombre) VALUES ('Gerente de tienda');
INSERT INTO rol (ro_nombre) VALUES ('Coordinador de promoción y Ventas');
INSERT INTO rol (ro_nombre) VALUES ('Coordinador de despacho');
INSERT INTO rol (ro_nombre) VALUES ('Jefe de entrega');
INSERT INTO rol (ro_nombre) VALUES ('Jefe de compras');
INSERT INTO rol (ro_nombre) VALUES ('Jefe de pasillo');
INSERT INTO rol (ro_nombre) VALUES ('Cajero');
INSERT INTO rol (ro_nombre) VALUES ('Coordinador de Talento Humano');
--BENEFICIO


INSERT INTO beneficio (be_nombre) VALUES ('Seguro medico');
INSERT INTO beneficio (be_nombre) VALUES ('Jubilaciom');
INSERT INTO beneficio (be_nombre) VALUES ('Gastos de transporte');
INSERT INTO beneficio (be_nombre) VALUES ('Seguro de vida');
INSERT INTO beneficio (be_nombre) VALUES ('Seguro de discapacidad');
INSERT INTO beneficio (be_nombre) VALUES ('Reembolso de matriculas');
INSERT INTO beneficio (be_nombre) VALUES ('Descuento en gimnasio');
INSERT INTO beneficio (be_nombre) VALUES ('Estacionamiento gratuito');
INSERT INTO beneficio (be_nombre) VALUES ('Vacaciones');
INSERT INTO beneficio (be_nombre) VALUES ('Pensiones');
INSERT INTO beneficio (be_nombre) VALUES ('Pago de horas extras');
INSERT INTO beneficio (be_nombre) VALUES ('Pago de horas nocturnas');
INSERT INTO beneficio (be_nombre) VALUES ('Teletrabajo');
INSERT INTO beneficio (be_nombre) VALUES ('Pago de guardería');
INSERT INTO beneficio (be_nombre) VALUES ('Extensión de baja maternal/paternal');
INSERT INTO beneficio (be_nombre) VALUES ('Formación laboral');
INSERT INTO beneficio (be_nombre) VALUES ('Utilidades/Aguinaldos');
INSERT INTO beneficio (be_nombre) VALUES ('Fondo de ahorro');
INSERT INTO beneficio (be_nombre) VALUES ('Bonos de productividad');
INSERT INTO beneficio (be_nombre) VALUES ('Comedor gratuito');
--Pruebas de 11/01/2021 Marca,RubroS (Producto 18 Proveedores




 --Pruebas					
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('Colgate', 'FALSE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('Ariel', 'FALSE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('Head & Shoulders', 'FALSE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('Primor', 'FALSE');
 --Pruebas					
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('Martextil', 'TRUE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('Tecnomarca', 'TRUE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('Chocolatieres', 'TRUE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('FishMarket', 'TRUE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('AvesMart', 'TRUE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('DelicatesesMart', 'TRUE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('Ofis', 'TRUE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('Mueblesoft', 'TRUE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('MuebleHogar', 'TRUE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('CarMarket', 'TRUE');
INSERT INTO marca (ma_nombre, ma_ucabmart) VALUES ('IndustrialMart', 'TRUE');



INSERT INTO zona (zo_nombre) VALUES ('Refrigeración')
INSERT INTO zona (zo_nombre) VALUES ('Electrodomesticos')
INSERT INTO zona (zo_nombre) VALUES ('Papeleria')
INSERT INTO zona (zo_nombre) VALUES ('Limpieza')
INSERT INTO zona (zo_nombre) VALUES ('Alimentos')
INSERT INTO zona (zo_nombre) VALUES ('Higiene Personal')
INSERT INTO zona (zo_nombre) VALUES ('Alimentos')
INSERT INTO zona (zo_nombre) VALUES ('AutoAutopartes')



 --Pruebas													
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('1000000', 'Crema de Dientes', '100', '1', '1', '2');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3500000', 'Jabon en Polvo', '500', '2', '2', '2');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3500000', 'Jabon en Liquido', '500', '2', '2', '2');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3500000', 'Shampoo', '300', '1', '3', '2');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('1800000', 'Arroz', '500', '3', '4', '2');
 --Pruebas													
													
-----Marcas Propias------													
 --DelicatesesMart													
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('2000000', 'Mortadela de Pavo', '1000', '3', '10', '5');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('2500000', 'Mortadela de Pollo', '1000', '3', '10', '5');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('1500000', 'Salchicha de Pollo', '1000', '3', '10', '5');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('2500000', 'Nuggets de Pollo', '1000', '3', '10', '5');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('1800000', 'Salchicha de Pavo', '1000', '3', '10', '5');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('1400000', 'Nuggets de Pavo', '1000', '3', '10', '5');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Jamon de Pavo', '1000', '3', '10', '5');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3200000', 'Jamon de Pollo', '1000', '3', '10', '8');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3200000', 'Chorizo de Pollo', '500', '3', '10', '8');
 --Martextil													
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3200000', 'Toallas Grandes', '150', '4', '5', '10');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Toallas Pequeñas', '150', '4', '5', '10');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('4000000', 'Toallas Maquillaje', '150', '4', '5', '10');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('5000000', 'Alfombra para baños', '150', '4', '5', '10');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3200000', 'Alfombra para Entradas', '150', '4', '5', '10');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('6000000', 'Alfombra para Salas', '150', '4', '5', '10');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('6500000', 'Cojines', '150', '5', '5', '7');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('6500000', 'Almohadas', '150', '5', '5', '7');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('9000000', 'Cubre Cama', '150', '6', '5', '7');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('9500000', 'Cobija', '150', '6', '5', '7');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('9500000', 'Sabana', '150', '6', '5', '7');
 --Tecmarca													
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('800000000', 'Televisor Pantalla Plana 32pul', '150', '7', '6', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('1000000000', 'SmarTv', '150', '7', '6', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('950000000', 'Televisor Pantalla Plana 40pul', '150', '7', '6', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('800000000', 'Corneta de Bluetooth', '150', '7', '6', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('1000000000', 'Corneta estero', '150', '7', '6', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('30000000', 'Corneta de Blouetooth estereo', '150', '7', '6', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('30000000', 'Corneta Cajon Bluetooth', '150', '7', '6', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('15000000', 'Control remoto DirecTv', '150', '7', '6', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('10000000', 'Audifonos Inalambrico', '150', '7', '6', '11');
 --Chocolate													
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Toddy', '150', '9', '7', '6');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('1000000', 'Bolitas de Chocolate', '25', '9', '7', '12');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('1000000', 'Caramelos de Chocolate', '15', '9', '7', '12');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Chocolate de taza', '110', '9', '7', '12');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3100000', 'Chocolate de Postre', '110', '9', '7', '12');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('100000', 'Chocolate Blanco', '30', '9', '7', '12');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('250000', 'Bombom de Chocolate', '40', '9', '7', '12');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('400000', 'Bastones de Chocolate', '50', '9', '7', '12');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('300000', 'Galletas Relleno de Chocolate', '30', '9', '7', '12');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('15000000', 'Mani con Chocolate', '100', '9', '7', '12');
 --FishMarket													
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('1000000', 'Calamar', '500', '10', '8', '13');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3500000', 'Atun', '200', '10', '8', '13');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('6000000', 'Langosta', '200', '10', '8', '13');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('7000000', 'Pulpo', '500', '10', '8', '13');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('5000000', 'Ostras', '50', '10', '8', '13');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Mejillones', '200', '10', '8', '13');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('1000000', 'Sardina', '200', '10', '8', '13');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Salmon', '500', '10', '8', '13');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('5000000', 'Bacalao', '200', '10', '8', '13');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('6000000', 'Camarones', '200', '10', '8', '13');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('4000000', 'Cangrego', '200', '10', '8', '13');
 --AverMart													
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('2000000', 'Patas de Pollo y Pavo', '300', '3', '9', '8');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Alas de Pollo y Pavo', '500', '3', '9', '8');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('5000000', 'Pechuga de Pollo y Pavo', '1000', '3', '9', '8');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Medallones de Pavo', '200', '3', '9', '8');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('2000000', 'Pescuezo de Pollo', '200', '3', '9', '8');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Espinaso de Pollo y Pavo', '400', '3', '9', '8');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Pollo Entero', '1000', '3', '9', '8');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3100000', 'Pavo Entero', '1000', '3', '9', '8');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Pollo Esmechado', '500', '3', '9', '8');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('32000000', 'Pavo Esmechado', '500', '3', '9', '8');
 --Ofis													
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('10000000', 'Resma de Papel Tamaño Carta', '150', '15', '11', '14');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('13000000', 'Resma de Papel Tamaño Oficio', '150', '15', '11', '14');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('10000000', 'Engrapadora', '150', '15', '11', '14');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('1000000', 'Grapas', '150', '15', '11', '14');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('8000000', 'Marcadores', '150', '15', '11', '14');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('50000000', 'lapices', '150', '15', '11', '14');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('60000000', 'Boligrafo', '150', '15', '11', '14');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('60000000', 'Tinta de impresora', '150', '15', '11', '14');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('5000000', 'Libretas', '150', '15', '11', '14');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('2000000', 'Carpetas', '150', '15', '11', '14');
 --Mueblesoft													
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('90000000', 'Silla Ejecutiva', '150', '16', '12', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('50000000', 'Silla Oficina de Sala', '150', '16', '12', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('97000000', 'Silla Escritorio', '150', '16', '12', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('14000000', 'Mesa Escritorio', '150', '16', '12', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('20000000', 'Silla Presidenciales', '150', '16', '12', '15');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('20000000', 'Estantes', '150', '16', '12', '15');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('60000000', 'Archivadoras', '150', '16', '12', '15');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('20000000', 'Lamparas de escrotorio', '150', '16', '12', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('20000000', 'Papeleras', '150', '16', '12', '15');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('100000000', 'Lamparas de escrotorio', '150', '16', '12', '15');
 --MuebleHogar													
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('2000000', 'Lamparas Noche', '150', '17', '13', '11');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('140000000', 'Muebles Tipo L', '150', '17', '13', '16');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('150000000', 'Sofa Cama', '150', '17', '13', '16');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('130000000', 'Mesa Para Comedor', '150', '17', '13', '16');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('140000000', 'Juegos de Mueble', '150', '17', '13', '16');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('50000000', 'Puf Grandes y Pequeños', '150', '17', '13', '16');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('60000000', 'Mesas para Niños', '150', '17', '13', '16');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('100000000', 'Perchero Ropero', '150', '17', '13', '16');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('60000000', 'Sillas de Plastico', '150', '17', '13', '16');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('70000000', 'Sillas de Plastico', '150', '17', '13', '16');
 --CarMarket													
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('90000000', 'Cauchos r15', '150', '18', '14', '17');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('110000000', 'Cauchos r16', '150', '18', '14', '17');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('125000000', 'Cauchos r17', '150', '18', '14', '17');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('140000000', 'Cauchos r18', '150', '18', '14', '17');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('190000000', 'Cauchos r20', '150', '18', '14', '17');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('5000000', 'Pegas para Parches', '150', '18', '14', '17');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('110000000', 'Gato Hidraulico', '150', '18', '14', '17');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('70000000', 'Bateria de Carro', '150', '18', '14', '17');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('50000000', 'Cables Auxiliares', '150', '18', '14', '17');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('10000000', 'Alfombras de Carros', '150', '18', '14', '17');
 --IndustriasMart													
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('5000000', 'Detergente', '1000', '2', '15', '18');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('6000000', 'Cloro', '500', '2', '15', '18');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Jabon Liquido', '500', '2', '15', '18');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('2000000', 'Antibacterial Liquido', '250', '2', '15', '18');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Antibacterial Aroma', '250', '2', '15', '18');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('5000000', 'Desinfectante', '1000', '2', '15', '18');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('6000000', 'Cera Neutral', '500', '2', '15', '18');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('4000000', 'Desengrasante', '500', '2', '15', '18');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('3000000', 'Lava plato', '150', '2', '15', '18');
INSERT INTO producto (pr_precio, pr_nombre, pr_peso, fk_rubro, fk_marca, fk_proveedor) VALUES ('4000000', 'Blanqueador', '150', '2', '15', '18');

--------RUBROS--------				
 --Pruebas				
INSERT INTO rubro (ru_nombre) VALUES ('Higiene');
 --IndustrialMart				
INSERT INTO rubro (ru_nombre) VALUES ('Limpieza');
INSERT INTO rubro (ru_nombre) VALUES ('Alimentos');
 --Pruebas				
 --Martextil				
INSERT INTO rubro (ru_nombre) VALUES ('Lenceria');
INSERT INTO rubro (ru_nombre) VALUES ('Almohadas');
INSERT INTO rubro (ru_nombre) VALUES ('Colchones');
 --Tecnomarca				
INSERT INTO rubro (ru_nombre) VALUES ('Televisores');
INSERT INTO rubro (ru_nombre) VALUES ('Equipo de Sonido');
 --Chocolatieres				
INSERT INTO rubro (ru_nombre) VALUES ('Chocolate');
 --FishMarket				
INSERT INTO rubro (ru_nombre) VALUES ('Frutos de mar Congelados');
INSERT INTO rubro (ru_nombre) VALUES ('Empacados al Vacio');
 --AvesMart				
INSERT INTO rubro (ru_nombre) VALUES ('Pollo');
INSERT INTO rubro (ru_nombre) VALUES ('Pavo');
 --DelicatesesMart				
INSERT INTO rubro (ru_nombre) VALUES ('Embutidos');
 --Ofis				
INSERT INTO rubro (ru_nombre) VALUES ('Papeleria');
 --Mueblesoft				
INSERT INTO rubro (ru_nombre) VALUES ('Mobiliario de Oficina');
 --MuebleHogar				
INSERT INTO rubro (ru_nombre) VALUES ('Mobiliario de Hogar');
 --CarMarket				
INSERT INTO rubro (ru_nombre) VALUES ('Cauchos');



INSERT INTO estatus_reposicion (er_nombre) VALUES ('EN REVISION');
INSERT INTO estatus_reposicion (er_nombre) VALUES ('APROBADO');
INSERT INTO estatus_reposicion (er_nombre) VALUES ('EN TRANSITO');
INSERT INTO estatus_reposicion (er_nombre) VALUES ('RECIBIDO EN TIENDA');


INSERT INTO estatus_despacho (ed_nombre) VALUES ('EN PROCESO');
INSERT INTO estatus_despacho (ed_nombre) VALUES ('LISTO PARA ENTREGA');
INSERT INTO estatus_despacho (ed_nombre) VALUES ('ENTREGADO');


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
