CREATE TABLE lugar(
	lu_codigo		SERIAL,
	lu_nombre		VARCHAR(50)	NOT NULL,
	lu_tipo			VARCHAR(20)	NOT NULL,
	fk_lugar		INTEGER,
	
	CONSTRAINT pk_lu_codigo PRIMARY KEY (lu_codigo),
    CONSTRAINT fk_lugar FOREIGN KEY (fk_lugar) REFERENCES lugar (lu_codigo),
	CONSTRAINT ch_lu_tipo CHECK(lu_tipo IN ('ESTADO', 'MUNICIPIO', 'PARROQUIA', 'DIRECCION'))
);

CREATE TABLE tienda(
	ti_codigo		SERIAL,
	ti_nombre		VARCHAR(20)	NOT NULL,
	fk_lugar		INTEGER NOT NULL,
	CONSTRAINT pk_ti_codigo PRIMARY KEY (ti_codigo),
	CONSTRAINT fk_lugar FOREIGN KEY (fk_lugar) REFERENCES lugar (lu_codigo)
);

CREATE TABLE cliente_natural(
	cl_id				SERIAL,	 
	cl_correo			VARCHAR(50)  NOT NULL 	UNIQUE,
	cl_contrasena		VARCHAR(20)	 NOT NULL,
	cl_afiliacion		NUMERIC(10)	 NOT NULL,
	cl_cedula			NUMERIC(10)	 NOT NULL 	UNIQUE,
	cl_p_nombre			VARCHAR(20)	 NOT NULL,
	cl_s_nombre			VARCHAR(20), 
	cl_p_apellido		VARCHAR(20)	 NOT NULL, 
	cl_s_apellido		VARCHAR(20), 
	cl_rif				VARCHAR(20) 	  		UNIQUE,	
	fk_lugar			INTEGER NOT NULL,
	fk_tienda			INTEGER NOT NULL,

	CONSTRAINT pk_cliente_natural PRIMARY KEY (cl_id),
	CONSTRAINT fk_lugar FOREIGN KEY (fk_lugar) REFERENCES lugar(lu_codigo),
	CONSTRAINT fk_tienda FOREIGN KEY (fk_tienda) REFERENCES tienda(ti_codigo)
);


CREATE TABLE cliente_juridico(
	cl_id				SERIAL,		 
	cl_correo			VARCHAR(50)  NOT NULL 	UNIQUE,
	cl_contrasena		VARCHAR(20)	 NOT NULL,
	
    cl_afiliacion		NUMERIC(10)	 NOT NULL,
	cl_rif              VARCHAR(20)  NOT NULL   UNIQUE,
    cl_razon_social     VARCHAR(50)  NOT NULL,  
	cl_pagina_web       VARCHAR(50),
	cl_den_comercial    VARCHAR(50)  NOT NULL,
    cl_capital          NUMERIC(10)  NOT NULL,
    
	fk_lugar_fiscal		INTEGER NOT NULL,
	fk_lugar_fisica		INTEGER,
	fk_tienda			INTEGER NOT NULL,
	CONSTRAINT pk_cliente_juridico PRIMARY KEY (cl_id),
	
	CONSTRAINT fk_lugar_fiscal FOREIGN KEY (fk_lugar_fiscal) REFERENCES lugar(lu_codigo),
	CONSTRAINT fk_lugar_fisica FOREIGN KEY (fk_lugar_fisica) REFERENCES lugar(lu_codigo),
	CONSTRAINT fk_tienda FOREIGN KEY (fk_tienda) REFERENCES tienda(ti_codigo)
);


CREATE TABLE empleado(
	em_cedula			SERIAL,
    em_correo			VARCHAR(50)     NOT NULL 	UNIQUE,
	em_contrasena		VARCHAR(20)	    NOT NULL,
	em_p_nombre			VARCHAR(20) 	NOT NULL,
	em_s_nombre			VARCHAR(20),
	em_p_apellido		VARCHAR(20) 	NOT NULL,
	em_s_apellido		VARCHAR(20),
	em_sueldo			NUMERIC(10) 	NOT NULL,
	em_fecha_naci		DATE			NOT NULL,

    fk_tienda			INTEGER NOT NULL,
    fk_empleado         INTEGER,
    
    CONSTRAINT fk_tienda FOREIGN KEY (fk_tienda) REFERENCES tienda(ti_codigo),
	CONSTRAINT pk_em_cedula PRIMARY KEY (em_cedula),
	CONSTRAINT fk_empleado FOREIGN KEY (fk_empleado) REFERENCES empleado (em_cedula)
);


CREATE TABLE proveedor(
	po_id				SERIAL,
	po_rif				NUMERIC(10)		NOT NULL	UNIQUE,
	po_den_comercial	VARCHAR(50)		NOT NULL,
	po_razon_social		VARCHAR(50)		NOT NULL,
	po_pagina_web		VARCHAR(50),
	po_correo			VARCHAR(50)		NOT NULL,
	po_correo_alt		VARCHAR(50),
	
	fk_lugar_fisica		INTEGER  		NOT NULL,
	fk_lugar_fiscal		INTEGER  		NOT NULL,
	
    CONSTRAINT pk_po_id PRIMARY KEY (po_id),
	CONSTRAINT fk_lugar_fisica FOREIGN KEY (fk_lugar_fisica) REFERENCES lugar (lu_codigo),
	CONSTRAINT fk_lugar_fiscal FOREIGN KEY (fk_lugar_fiscal) REFERENCES lugar (lu_codigo)
);

CREATE TABLE persona_contacto(
	peco_cedula		SERIAL,
	peco_nombre		VARCHAR(20)	NOT NULL,
	peco_apellido	VARCHAR(20)	NOT NULL,
	fk_juridico		INTEGER,
	fk_proveedor	INTEGER,

	CONSTRAINT pk_peco_cedula PRIMARY KEY (peco_cedula),
	CONSTRAINT fk_juridico FOREIGN KEY (fk_juridico) REFERENCES cliente_juridico(cl_id),
	CONSTRAINT fk_proveedor FOREIGN KEY (fk_proveedor) REFERENCES proveedor(po_id)
);


CREATE TABLE telefono(
	te_codigo			SERIAL,
	te_tipo				VARCHAR(20)	NOT NULL,
	te_numero			NUMERIC(10)	NOT NULL,
	fk_cliente_natural	INTEGER,
	fk_cliente_juridico	INTEGER,
	fk_empleado			INTEGER,
	fk_proveedor		INTEGER,
	fk_persona_contacto	INTEGER,


	CONSTRAINT pk_te_codigo PRIMARY KEY (te_codigo),
	CONSTRAINT ch_te_tipo CHECK (te_tipo IN ('CELULAR', 'OFICINA', 'CASA')),

	CONSTRAINT fk_cliente_natural FOREIGN KEY (fk_cliente_natural) REFERENCES cliente_natural (cl_id),
	CONSTRAINT fk_cliente_juridico FOREIGN KEY (fk_cliente_juridico) REFERENCES cliente_juridico(cl_id),
	CONSTRAINT fk_empleado FOREIGN KEY (fk_empleado) REFERENCES empleado(em_cedula),
	CONSTRAINT fk_proveedor FOREIGN KEY (fk_proveedor) REFERENCES proveedor(po_id),
	CONSTRAINT fk_persona_contacto FOREIGN KEY (fk_persona_contacto) REFERENCES persona_contacto(peco_cedula)
);