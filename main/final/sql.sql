
SELECT
    D.RUT,
    D.Nombre,
    D.Apellido
FROM 
    Dueño D,
    Casa  C,
WHERE
    D.RUT = C.RUTDueno

HAVING COUNT(DISC.ID_CASA) 
    


SELECT
    *
FROM
    empleado
