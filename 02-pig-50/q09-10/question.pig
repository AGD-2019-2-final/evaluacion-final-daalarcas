-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.csv` escriba una consulta en Pig que genere la 
-- siguiente salida:
-- 
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
%load_ext bigdata
%pig_start
timeout 300

%%pig
fs -put data.csv

%%pig
--
-- Carga el archivo desde el disco duro
--
u = LOAD 'data.csv' USING PigStorage(',')
    AS (num:INT, name:CHARARRAY, last:CHARARRAY);
r= FOREACH u GENERATE $1, $2;
DUMP r;

%%pig
z= FOREACH r GENERATE CONCAT ($0,'@',$1);
DUMP z;

%%pig
STORE z INTO 'output';

%%pig
fs -get output/ .

!hadoop fs -ls output/*

!hadoop fs -cat output/part-m-00000

%pig_quit

