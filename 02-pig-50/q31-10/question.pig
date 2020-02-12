-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
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
v = FOREACH r GENERATE GetYear(ToDate($0, 'yyyy-MM-dd'));
DUMP v;

%%pig
y = ORDER v BY $0;%%pig


DUMP y;

%%pig
z = GROUP y BY $0;
DUMP z;

%%pig
wordcount = FOREACH z GENERATE group, COUNT(y);
DUMP wordcount ;

%%pig
STORE wordcount INTO 'output' USING PigStorage(',');

%%pig
fs -get output/ .

!hadoop fs -ls output/*

!hadoop fs -cat output/part-r-00000

%pig_quit

