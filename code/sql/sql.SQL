CREATE TABLE telefono(
	te_codigo			NUMERIC(10)	NOT NULL 	UNIQUE,
	te_tipo				VARCHAR(20)	NOT NULL,
	te_numero			NUMERIC(10)	NOT NULL,
	fk_cliente_natural	NUMERIC(10),
	fk_cliente_juridico	NUMERIC(10),
	fk_empleado			NUMERIC(10),
	fk_proveedor		NUMERIC(10),
	fk_persona_contacto	NUMERIC(10),
	CONSTRAINT pk_te_codigo PRIMARY KEY (te_codigo),
	CONSTRAINT ch_te_tipo CHECK (te_tipo IN ('CELULAR', 'OFICINA', 'CASA')),
	CONSTRAINT fk_cliente_natural FOREIGN KEY (fk_cliente_natural) REFERENCES cliente_natural (ci_id),
	CONSTRAINT fk_cliente_juridico FOREIGN KEY (fk_cliente_juridico) REFERENCES cliente_juridico(ci_id),
	CONSTRAINT fk_empleado FOREIGN KEY (fk_empleado) REFERENCES empleado(em_cedula),
	CONSTRAINT fk_proveedor FOREIGN KEY (fk_proveedor) REFERENCES proveedor(po_id),
	CONSTRAINT fk_persona_contacto FOREIGN KEY (fk_persona_contacto) REFERENCES persona_contacto(peco_cedula)
);

CREATE TABLE empleado_benefico(
	fk_empleado 		NUMERIC(10)		NOT NULL,
	fk_beneficio 		NUMERIC(10),
	CONSTRAINT pk_fk_empleado PRIMARY KEY (fk_empleado),
	CONSTRAINT pk_fk_beneficio PRIMARY KEY (fk_beneficio),
	CONSTRAINT fk_empleado_beneficio FOREIGN KEY (fk_beneficio) REFERENCES be_codigo(beneficio)
);

CREATE TABLE lugar(
	lu_codigo		NUMERIC(10)	NOT NULL 	UNIQUE,
	lu_nombre		VARCHAR(20)	NOT NULL,
	lu_tipo			VARCHAR(20)	NOT NULL,
	fk_lugar		NUMERIC(10),
	CONSTRAINT pk_lu_codigo PRIMARY KEY (lu_codigo),
	CONSTRAINT ch_lu_tipo CHECK(lu_tipo IN ('ESTADO', 'MUNICIPIO', 'PARROQUIA'))
);

CREATE TABLE horario(
	ho_codigo			NUMERIC(10)	NOT NULL 	UNIQUE,
	ho_descripcion		VARCHAR(20),
	ho_hora_entrada		TIME		NOT NULL,
	ho_hora_salida		TIME		NOT NULL,
	CONSTRAINT pk_ho_codigo PRIMARY KEY (ho_codigo)
);


CREATE TABLE beneficio(
	be_codigo		NUMERIC(10)	NOT NULL	UNIQUE,
	be_nombre		VARCHAR(20)	NOT NULL,
	CONSTRAINT pk_be_codigo PRIMARY KEY (be_codigo)
);

CREATE TABLE empleado(
	em_cedula			NUMERIC(10)		NOT NULL	UNIQUE,
	em_rol				VARCHAR(20)		NOT NULL,
	em_p_nombre			VARCHAR(20) 	NOT NULL,
	em_s_nombre			VARCHAR(20),
	em_p_apellido		VARCHAR(20) 	NOT NULL,
	em_s_apellido		VARCHAR(20),
	em_sueldo			NUMERIC(10) 	NOT NULL,
	em_fecha_naci		DATE			NOT NULL,
	CONSTRAINT pk_em_cedula PRIMARY KEY (em_cedula),
	CONSTRAINT ch_em_rol CHECK (em_rol IN ('CAJERO', 'JEFE DE COMPRAS', 'ADMINISTRADOR'))
);

CREATE TABLE vacacion(
	va_codigo			NUMERIC(10) 	NOT NULL	UNIQUE,
	va_estatus			VARCHAR(20)		NOT NULL,
	va_fecha_inicio		DATE			NOT NULL,
	va_fecha_final		DATE			NOT NULL,
	fk_empleado			NUMERIC(10)		NOT NULL,
	CONSTRAINT pk_va_codigo	PRIMARY KEY (va_codigo),
	CONSTRAINT ch_va_estatus CHECK (va_estatus IN ('FINALIZADO', 'EN PROGRESO')),
	CONSTRAINT fk_empleado FOREIGN KEY (fk_empleado) REFERENCES empleado (em_cedula)
);

CREATE TABLE control_entrada(
	coen_codigo			NUMERIC(10)		NOT NULL	UNIQUE,
	coen_fecha			DATE			NOT NULL,
	coen_hora_entrada	TIME			NOT NULL,
	coen_hora_salida	TIME			NOT NULL,
	fk_empleado			NUMERIC(10)		NOT NULL,
	CONSTRAINT pk_coen_codigo PRIMARY KEY (coen_codigo), 
	CONSTRAINT fk_empleado FOREIGN KEY (fk_empleado) REFERENCES empleado (em_cedula)
);

CREATE TABLE proveedor(
	po_id				NUMERIC(10)		NOT NULL	UNIQUE,
	po_rif				NUMERIC(10)		NOT NULL	UNIQUE,
	po_den_comercial	VARCHAR(20)		NOT NULL,
	po_razon_social		VARCHAR(20)		NOT NULL,
	po_pagina_web		VARCHAR(20),
	po_correo			VARCHAR(20)		NOT NULL,
	po_correo_alt		VARCHAR(20),
	po_clasificacion	VARCHAR(20),
	fk_lugar_fisica		NUMERIC(10)		NOT NULL,
	fk_lugar_fiscal		NUMERIC(10)		NOT NULL,
	CONSTRAINT pk_po_id PRIMARY KEY (po_id),
	CONSTRAINT ch_po_clasificacion CHECK (po_clasificacion IN ('ALIMENTOS', 'TEXTILES', 'VARIOS')),
	CONSTRAINT fk_lugar_fisica FOREIGN KEY (fk_lugar_fisica) REFERENCES lugar (lu_codigo),
	CONSTRAINT fk_lugar_fiscal FOREIGN KEY (fk_lugar_fiscal) REFERENCES lugar (lu_codigo)
);

CREATE TABLE tienda(
	ti_codigo		NUMERIC(10)	NOT NULL	UNIQUE,
	ti_nombre		VARCHAR(20)	NOT NULL,
	fk_lugar		NUMERIC(10) NOT NULL,
	CONSTRAINT pk_ti_codigo PRIMARY KEY (ti_codigo),
	CONSTRAINT fk_lugar FOREIGN KEY (fk_lugar) REFERENCES lugar (lu_codigo)
);

CREATE TABLE cotizacion(
	cot_id				NUMERIC(10)	NOT NULL	UNIQUE,
	cot_cambio_euro		NUMERIC(10)	NOT NULL,
	cot_cambio_dolar	NUMERIC(10)	NOT NULL,
	cot_fecha			DATE		NOT NULL,	
	CONSTRAINT pk_cot_id PRIMARY KEY (cot_id),
	CONSTRAINT ch_cot_cambio_euro CHECK (0 < cot_cambio_dolar),
	CONSTRAINT ch_cot_cambio_dolar CHECK (0 < cot_cambio_dolar)
);

CREATE TABLE orden_reposicion(
	orre_id				NUMERIC(10)	NOT NULL	UNIQUE,
	orre_fecha_hora		TIMESTAMP	NOT NULL,
	orre_monto_cancelar	NUMERIC(10)	NOT NULL,
	orre_unidades		NUMERIC(10)	NOT NULL,
	fk_producto			NUMERIC(10) NOT NULL,
	fk_proveedor		NUMERIC(10) NOT NULL,
	fk_tienda			NUMERIC(10) NOT NULL, 
	CONSTRAINT pk_orre_id PRIMARY KEY (orre_id),
	CONSTRAINT fk_proveedor FOREIGN KEY (fk_proveedor) REFERENCES proveedor(po_id),
	CONSTRAINT fk_tienda FOREIGN KEY (fk_tienda) REFERENCES tienda(ti_codigo)
);

CREATE TABLE producto(
	pr_id			NUMERIC(10)	NOT NULL	UNIQUE,
	pr_nombre		VARCHAR(20)	NOT NULL,
	pr_precio		NUMERIC(10)	NOT NULL,
	pr_peso			NUMERIC(10)	NOT NULL,
	pr_zona			VARCHAR(20)	NOT NULL,
	pr_descuento		NUMERIC(10)	NOT NULL,
	pr_pasillo		VARCHAR(20)	NOT NULL,
	fk_cotizaciones	NUMERIC(10) NOT NULL,
	CONSTRAINT pk_pr_id PRIMARY KEY (pr_id),
	CONSTRAINT ch_pr_descuento CHECK ( 0 <= pr_descuento AND pr_descuento <= 100),
	CONSTRAINT fk_cotizaciones FOREIGN KEY (fk_cotizaciones) REFERENCES cotizacion(cot_id)
);

CREATE TABLE producto_tienda(
	fk_producto			NUMERIC(10)	NOT NULL	UNIQUE,
	fk_tienda			NUMERIC(10) NOT NULL	UNIQUE,
	prti_unidades		NUMERIC(10)	NOT NULL,
	prti_u_almacen		NUMERIC(10)	NOT NULL,
	CONSTRAINT pk_fk_producto PRIMARY KEY (fk_producto),
	CONSTRAINT pk_fk_tienda PRIMARY KEY (fk_tienda),
	CONSTRAINT fk_producto FOREIGN KEY (fk_producto) REFERENCES producto(pr_id),
	CONSTRAINT fk_tienda FOREIGN KEY	(fk_tienda) REFERENCES tienda(ti_codigo)
);

CREATE TABLE producto_revista(
	prre_descuento		NUMERIC(10)	NOT NULL,
	fk_producto			NUMERIC(10) NOT NULL,
	fk_revista			NUMERIC(10) NOT NULL,
	CONSTRAINT ch_prre_descuento CHECK (0 <= prre_descuento AND prre_descuento <= 100),
	CONSTRAINT pk_fk_producto PRIMARY KEY (fk_producto),
	CONSTRAINT pk_fk_revista PRIMARY KEY (fk_revista),
	CONSTRAINT fk_producto FOREIGN KEY (fk_producto) REFERENCES producto(pr_id),
	CONSTRAINT fk_revista FOREIGN KEY (fk_producto) REFERENCES revista(re_id)
);

CREATE TABLE revista(
	re_id			NUMERIC(10)	NOT NULL	UNIQUE,
	Re_fecha		DATE		NOT NULL,
	CONSTRAINT pk_re_id PRIMARY KEY (re_id)
);

CREATE TABLE carrito(
	ca_id			NUMERIC(10)	NOT NULL	UNIQUE,
	ca_monto_total		NUMERIC(10)	NOT NULL,
	CONSTRAINT pk_ca_id PRIMARY KEY (ca_id)
);

CREATE TABLE carrito_producto(
	fk_carrito			NUMERIC(10) NOT NULL,
	fk_producto			NUMERIC(10) NOT NULL,
	Capr_unidades		NUMERIC(10)	NOT NULL,
	CONSTRAINT pk_fk_carrito PRIMARY KEY (pk_fk_carrito),
	CONSTRAINT pk_fk_producto PRIMARY KEY (fk_producto),
	CONSTRAINT fk_carrito FOREIGN KEY (fk_carrito) REFERENCES carrito(ca_id),
	CONSTRAINT fk_producto FOREIGN KEY (fk_prodcuto) REFERENCES producto(pr_id)
);

CREATE TABLE medios_pago(
	mepa_codigo			NUMERIC(10)	NOT NULL	UNIQUE,
	mepa_credito		NUMERIC(10)	NOT NULL,
	mepa_debito			VARCHAR(20)	NOT NULL,
	mepa_efectivo		VARCHAR(20)	NOT NULL,
	mepa_cheque			VARCHAR(20)	NOT NULL,
	CONSTRAINT pk_mepa_codigo PRIMARY KEY (mepa_codigo),
	CONSTRAINT ch_mepa_debito CHECK (mepa_debito IN ('si', 'no')),
	CONSTRAINT ch_mepa_efectivo CHECK (mepa_efectivo IN ('si', 'no')),
	CONSTRAINT ch_mepa_cheque CHECK (mepa_cheque IN ('si', 'no'))
);

CREATE TABLE compra_web(
	co_web_id				NUMERIC(10)	NOT NULL	UNIQUE,
	co_fecha_hora		TIMESTAMP	NOT NULL,
	co_monto_cancelar	NUMERIC(10)	NOT NULL,
	co_despacho_id		NUMERIC(10)	NOT NULL	UNIQUE,
	co_despacho_estatus	VARCHAR(20)	NOT NULL,
	fk_carrito			NUMERIC(10) NOT NULL,
	fk_medios_pago		VARCHAR(20) NOT NULL,
	fk_cliente_natural	NUMERIC(10) NOT NULL,
	fk_cliente_juridico	NUMERIC(10) NOT NULL,
	fk_lugar_alt		NUMERIC(10) NOT NULL,
	CONSTRAINT pk_co_web_id PRIMARY KEY (co_web_id),
	CONSTRAINT ch_co_despacho_estatus CHECK (co_despacho_estatus IN ('No listo para entrega', 'Listo para entregar', 'Entregado')),
	CONSTRAINT fk_carrito FOREIGN KEY (fk_carrito) REFERENCES carrito(ca_id),
	CONSTRAINT fk_medios_pago FOREIGN KEY (fk_medios_pago) REFERENCES medios_pago(mepa_codigo),
	CONSTRAINT fk_cliente_natural FOREIGN KEY (fk_cliente_natural) REFERENCES cliente_natural(cl_id),
	CONSTRAINT fk_cliente_juridico FOREIGN KEY (fk_cliente_juridico) REFERENCES cliente_juridico(cl_id),
	CONSTRAINT fk_lugar_alt FOREIGN KEY (fk_lugar_alt) REFERENCES lugar(lu_codigo)
);

CREATE TABLE compra_fisica(
	co_fi_id				NUMERIC(10)	NOT NULL	UNIQUE,
	co_fecha_hora		TIMESTAMP	NOT NULL,
	co_monto_cancelar	NUMERIC(10)	NOT NULL,
	fk_carrito			NUMERIC(10) NOT NULL,
	fk_medios_pago		NUMERIC(10) NOT NULL,
	fk_cliente_natural	NUMERIC(10) NOT NULL,
	fk_cliente_juridico	NUMERIC(10) NOT NULL,
	fk_empleado			NUMERIC(10) NOT NULL,
	CONSTRAINT pk_co_fi_id PRIMARY KEY (co_fi_id),
	CONSTRAINT fk_carrito FOREIGN KEY (fk_carrito) REFERENCES carrito(ca_id),
	CONSTRAINT fk_medios_pago FOREIGN KEY (fk_medios_pago) REFERENCES medios_pago(mepa_codigo),
	CONSTRAINT fk_cliente_natural FOREIGN KEY (fk_cliente_natural) REFERENCES cliente_natural(cl_id),
	CONSTRAINT fk_cliente_juridico FOREIGN KEY (fk_cliente_juridico) REFERENCES cliente_juridico(cl_id),
	CONSTRAINT fk_empleado FOREIGN KEY (fk_empleado) REFERENCES empleado(em_cedula)
);

CREATE TABLE cliente_natural(
	ci_id				NUMERIC(10)      NOT NULL 	UNIQUE,		 
	ci_correo			VARCHAR(20)  	 NOT NULL 	UNIQUE,
	ci_contraseña		VARCHAR(50)	 NOT NULL,
	ci_puntos			NUMERIC(10)	 NOT NULL 		 	DEFAULT 0,	
	ci_afiliacion		NUMERIC(10)	 NOT NULL	UNIQUE,
	ci_cedula			NUMERIC(10)	 NOT NULL 	UNIQUE,
	ci_p_nombre			VARCHAR(20)	 NOT NULL,
	ci_s_nombre			VARCHAR(20), 
	ci_p_apellido		VARCHAR(20)	 NOT NULL, 
	ci_s_apellido		VARCHAR(20), 
	ci_rif				NUMERIC(10)	 	  	UNIQUE,	
	fk_valor_puntos		NUMERIC(10),
	fk_medios_pago		NUMERIC(10),
	fk_lugar			NUMERIC(10),
	fk_tienda			NUMERIC(10),
	CONSTRAINT pk_cliente_natural PRIMARY KEY (ci_id),
	CONSTRAINT fk_valor_puntos FOREIGN KEY (fk_valor_puntos) REFERENCES valor_puntos(vapu_id),
	CONSTRAINT fk_medios_pago FOREIGN KEY (fk_medios_pago) REFERENCES medios_pago(mepa_codigo),
	CONSTRAINT fk_lugar FOREIGN KEY (fk_lugar) REFERENCES lugar(lu_codigo),
	CONSTRAINT fk_tienda FOREIGN KEY (fk_tienda) REFERENCES tienda(ti_codigo)
);

CREATE TABLE cliente_juridico(
	ci_id				NUMERIC(10)	 NOT NULL 	UNIQUE, 		 
	ci_correo			VARCHAR(20)  NOT NULL 	UNIQUE,
	ci_contraseña		VARCHAR(50)	 NOT NULL,
	ci_puntos			NUMERIC(10)	 NOT NULL 			DEFAULT 0,	
	ci_afiliacion		NUMERIC(10)	 NOT NULL 	UNIQUE,
	ci_cedula			NUMERIC(10)	 NOT NULL 	UNIQUE,
	ci_p_nombre			VARCHAR(20)	 NOT NULL,
	ci_s_nombre			VARCHAR(20), 
	ci_p_apellido		VARCHAR(20)	 NOT NULL, 
	ci_s_apellido		VARCHAR(20), 
	ci_rif				NUMERIC(10)	 			UNIQUE,	
	ci_razon_social		VARCHAR(20),
	ci_pagina_web 		VARCHAR(20)  NOT NULL,
	ci_den_comercia		VARCHAR(20),
	ci_capital			NUMERIC(10),
	fk_valor_punto		NUMERIC(10)	 NOT NULL,
	fk_medios_pago		NUMERIC(10)  NOT NULL,
	fk_lugar_fiscal		NUMERIC(10),
	fk_lugar_fisica		NUMERIC(10)  NOT NULL,
	fk_tienda			NUMERIC(10)  NOT NULL,
	CONSTRAINT pk_cliente_juridico PRIMARY KEY (ci_id),
	CONSTRAINT fk_valor_punto FOREIGN KEY (fk_valor_punto) REFERENCES valor_puntos(vapu_id),
	CONSTRAINT fk_medios_pago FOREIGN KEY (fk_medios_pago) REFERENCES medios_pago(mepa_codigo),
	CONSTRAINT fk_lugar_fiscal FOREIGN KEY (fk_lugar_fiscal) REFERENCES lugar(lu_codigo),
	CONSTRAINT fk_lugar_fisica FOREIGN KEY (fk_lugar_fisica) REFERENCES lugar(lu_codigo),
	CONSTRAINT fk_tienda FOREIGN KEY (fk_tienda) REFERENCES tienda(ti_codigo)
);

CREATE TABLE persona_contacto(
	peco_cedula		NUMERIC(10)	NOT NULL	UNIQUE,
	peco_nombre		VARCHAR(20)	NOT NULL,
	peco_apellido		VARCHAR(20)	NOT NULL,
	fk_juridico		NUMERIC(10),
	fk_proveedor	NUMERIC(10),
	CONSTRAINT pk_peco_cedula PRIMARY KEY (peco_cedula),
	CONSTRAINT fk_juridico FOREIGN KEY (fk_juridico) REFERENCES cliente_juridico(ci_id),
	CONSTRAINT fk_proveedor FOREIGN KEY (fk_proveedor) REFERENCES proveedor(po_id)
);

CREATE TABLE valor_puntos(
	vapu_id			NUMERIC(10)	NOT NULL	UNIQUE,
	vapu_fecha		DATE		NOT NULL,
	vapu_valor		NUMERIC		NOT NULL,
	CONSTRAINT pk_vapu_id PRIMARY KEY (vapu_id),
	CONSTRAINT ch_vapu_valor CHECK (vapu_valor > 0)
);