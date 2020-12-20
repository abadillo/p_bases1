
CREATE SEQUENCE id_secuencia INCREMENT BY 1 START WITH 1;

CREATE TABLE cliente_natural(

	cl_id			NUMERIC(10)  NOT NULL SET DEFAULT nextval('id_secuencia');	 
	cl_correo		VARCHAR(50)  NOT NULL UNIQUE,
	cl_contraseña	VARCHAR(20)	 NOT NULL,
	cl_puntos		NUMERIC(10)	 NOT NULL 		 DEFAULT 0,	
	cl_afiliacion	NUMERIC(10)	 NOT NULL,
	cl_cedula		NUMERIC(10)	 NOT NULL UNIQUE,
	cl_p_nombre		VARCHAR(20)	 NOT NULL,
	cl_s_nombre		VARCHAR(20), 
	cl_p_apellido	VARCHAR(20)	 NOT NULL, 
	cl_s_apellido	VARCHAR(20), 
	cl_rif			VARCHAR(20)	 		  UNIQUE,
	
	CONSTRAINT pk_cliente_natural PRIMARY KEY (cl_id)

);


ALTER TABLE cliente_natural DROP cl_rif;
ALTER TABLE cliente_natural ADD cl_rif VARCHAR(20) UNIQUE;



INSERT INTO public.cliente_natural(
	cl_id, 
	cl_correo, 
	cl_contraseña, 
	cl_puntos, 
	cl_afiliacion, 
	cl_cedula, 
	cl_p_nombre, 
	cl_s_nombre, 
	cl_p_apellido, 
	cl_s_apellido, 
	cl_rif)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);



CREATE TABLE cliente_juridico(

	ci_id			NUMERIC(10)  NOT NULL, 		 
	ci_correo		VARCHAR(20)  NOT NULL UNIQUE,
	ci_contraseña	VARCHAR(50)	 NOT NULL,
	ci_puntos		NUMERIC(10)	 NOT NULL 		 DEFAULT 0,	
	ci_afiliacion	NUMERIC(10)	 NOT NULL UNIQUE,
	ci_rif			NUMERIC(10)	 NOT NULL UNIQUE,
	ci_razon_social	VARCHAR(20)	 NOT NULL,
	ci_pagina_web	VARCHAR(20), 
	ci_p_apellido	VARCHAR(20)	 NOT NULL, 
	ci_s_apellido	VARCHAR(20), 
	ci_rif			NUMERIC(10)	 		  UNIQUE,
	
	CONSTRAINT pk_cliente_natural PRIMARY KEY (cl_id),

);

CREATE SEQUENCE id_secuencia INCREMENT BY 1 START WITH 1;

CREATE TABLE producto(

	pr_id			NUMERIC(10)  NOT NULL SET DEFAULT nextval('id_secuencia');	 
	pr_nombre		VARCHAR(50)  NOT NULL UNIQUE,
	pr_precio    	NUMERIC(10)	 NOT NULL,
	pr_peso 		NUMERIC(10)	 NOT NULL 		 DEFAULT 0,	
	pr_zona	        VARCHAR(20)	 NOT NULL,
	pr_descuento    NUMERIC(20)	 NOT NULL,

	
	CONSTRAINT pk_cliente_natural PRIMARY KEY (cl_id)

);

