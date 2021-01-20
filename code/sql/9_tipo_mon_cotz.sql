
--TIPOS DE PAGO
INSERT INTO tipo_pago VALUES ('TARJETA DE CREDITO');
INSERT INTO tipo_pago VALUES ('TARJETA DE DEBITO');
INSERT INTO tipo_pago VALUES ('CHEQUE');
INSERT INTO tipo_pago VALUES ('EFECTIVO');
INSERT INTO tipo_pago VALUES ('PUNTOS');

--MONEDA
INSERT INTO moneda VALUES ('PUNTOS');
INSERT INTO moneda VALUES ('BOLIVARES');
INSERT INTO moneda VALUES ('DOLARES');
INSERT INTO moneda VALUES ('EUROS');
INSERT INTO moneda VALUES ('YENES');


-- COTIZACION                                            
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_expira,ct_valor) VALUES (1,'2020-01-01 7:20:50+00',NULL,1000);
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_expira,ct_valor) VALUES (2,'2020-01-01 7:20:50+00',NULL,1);

INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_expira,ct_valor) VALUES (3,'2020-01-01 7:20:50+00','2020-01-10 20:10:10+00',1500000);
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_expira,ct_valor) VALUES (3,'2020-01-10 20:10:10+00',NULL,1800000);

INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_expira,ct_valor) VALUES (4,'2020-01-01 7:20:50+00','2020-01-10 20:10:10+00',1700000);
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_expira,ct_valor) VALUES (4,'2020-01-10 20:10:10+00',NULL,2000000);

INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_expira,ct_valor) VALUES (5,'2020-01-01 7:20:50+00','2020-01-10 20:10:10+00',2000);
INSERT INTO cotizacion (fk_moneda,ct_fecha,ct_expira,ct_valor) VALUES (5,'2020-01-10 20:10:10+00',NULL,2300);


