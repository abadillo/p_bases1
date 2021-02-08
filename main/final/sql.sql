


TABLE EQUIPO (nomequipo, director )
TABLE CICLISTA (dorsal, nombre, edad, nomequipo )
TABLE ETAPA (numetapa, kms, salida, llegada, dorsal )
TABLE PUERTO (nompuerto, altura, categoria, pendiente, numetapa, dorsal )
TABLE MAILLOT (codigo, tipo, premio, color )
TABLE LLEVA (numetapa, codigo, DORSAL )



Nombre y el equipo de aquellos corredores menores de 30 años que han ganado alguna etapa



SELECT
    C.nombre,
    C.nomequipo
FROM 
    CICLISTA C,
WHERE
    C.edad < 30
AND 
    GANADO ETAPA == TRUE
