-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
%load_ext bigdata
%pig_start
%timeout 300

%%pig
fs -put data.tsv

%%pig
--
-- Carga el archivo desde el disco duro
--
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY,
        fecha:CHARARRAY,
        valor:INT);
    
DUMP u;

%%pig
--
-- Los campos del archivo puden ser indicados por nombre
-- o por posición iniciando en 0
--
v = FOREACH u GENERATE $2;
DUMP v;

%%pig
y = ORDER v BY $0;
DUMP y;

%%pig
z = LIMIT y 5;
DUMP z;

%%pig
STORE z INTO 'output';

%%pig
fs -get output/ .

!hadoop fs -ls output/*

!hadoop fs -cat output/part-r-00000

%pig_quit