
NOTA:  Si atributo es varchar() UNIQUE , no se puede '' y da errorFI
					pero si NO ES UNIQUE entonces si puede ser ''
					por tanto se insertaran como NULL/NONE


ALTER TABLE cliente_natural DROP cl_rif;
ALTER TABLE cliente_natural ADD cl_rif VARCHAR(20) UNIQUE;









