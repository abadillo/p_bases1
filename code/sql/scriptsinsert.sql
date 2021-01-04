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
