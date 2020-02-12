--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname,
--        color
--    FROM 
--        u 
--    WHERE color = 'blue' AND firstname LIKE 'Z%';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
%load_ext bigdata
%pig_start
%timeout 300

%%pig
fs -put data.csv

%%pig
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
    
r = FOREACH u GENERATE $1, $4;
DUMP r;

%%pig
y = FILTER r BY $1 MATCHES 'blue';
DUMP y;

%%pig
z = FILTER  y BY $0 MATCHES 'Z.*';
DUMP z;

%%pig
STORE z INTO 'output';

%%pig
fs -get output/ .

!hadoop fs -ls output/*

!hadoop fs -cat output/part-m-00000

%pig_quit