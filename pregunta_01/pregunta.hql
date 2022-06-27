/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
DROP TABLE IF EXISTS output;
DROP TABLE IF EXISTS resultado;
CREATE TABLE output (
    letra       string
    ,fecha       string
    ,valor       int
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';


LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE output;


CREATE TABLE resultado AS 
        SELECT letra
        ,count(*)
        FROM output 
        GROUP BY letra;
        
INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM resultado;