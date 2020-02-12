-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        birthday, 
--        DATE_FORMAT(birthday, "yyyy"),
--        DATE_FORMAT(birthday, "yy"),
--    FROM 
--        persons
--    LIMIT
--        5;
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
    
r = FOREACH u GENERATE $3;
DUMP r;

%%pig
v = FOREACH r GENERATE GetYear(ToDate($0, 'yyyy-MM-dd')), SUBSTRING($0, 2, 4);
DUMP v;

%%pig
STORE v INTO 'output' USING PigStorage(',');

%%pig
fs -get output/ .

!hadoop fs -ls output/*

!hadoop fs -cat output/part-m-00000

%pig_quit