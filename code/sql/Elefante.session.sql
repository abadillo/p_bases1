SELECT * FROM producto WERE pr_id=6;

DELETE FROM proveedor WHERE po_id = 2;
    ENTIDAD RURBO
    CONSTRAINT fk_rubro FOREIGN KEY (fk_rubro) REFERENCES rubro (ru_codigo) ON DELETE CASCADE,
	CONSTRAINT fk_marca FOREIGN KEY (fk_marca) REFERENCES marca (ma_codigo) ON DELETE CASCADE,
	CONSTRAINT fk_proveedor FOREIGN KEY (fk_proveedor) REFERENCES proveedor (po_id) ON DELETE CASCADE	

-- ALTER TABLE producto DROP CONSTRAINT fk_proveedor;   Elimina un campo de una tabla

ALTER TABLE producto DROP CONSTRAINT fk_empleado_sup;
ALTER TABLE empleado
add CONSTRAINT fk_empleado_sup FOREIGN KEY (fk_empleado_sup) REFERENCES empleado (em_codigo);
	ALTER TABLE producto ADD CONSTRAINT fk_rubro FOREIGN KEY (fk_rubro) REFERENCES rubro (ru_codigo) ON DELETE CASCADE
	ALTER TABLE producto ADD CONSTRAINT fk_marca FOREIGN KEY (fk_marca) REFERENCES marca (ma_codigo) ON DELETE CASCADE;
	ALTER TABLE producto ADD CONSTRAINT fk_proveedor FOREIGN KEY (fk_proveedor) REFERENCES proveedor (po_id) ON DELETE CASCADE



33) SELECT l_nombre, l_tipo, l_total_habitantes
FROM lugar WHERE l_tipo !='EUROPA' AND l_tipo != 'OCEANIA'
ORDER BY l_tipo DESC



SELECT COUNT(*)  FROM empleado; 






