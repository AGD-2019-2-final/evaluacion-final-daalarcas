-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
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
    AS (letra:CHARARRAY, clave:BAG{()});
r= FOREACH u GENERATE $1;
DUMP r;

%%pig
x = FOREACH r GENERATE FLATTEN($0);
DUMP x;

%%pig
y = ORDER x BY $0;
m = GROUP y BY $0;
DUMP m;

%%pig
wordcount = FOREACH m GENERATE group, COUNT(y);
DUMP wordcount ;

%%pig
STORE wordcount INTO 'output';

%%pig
fs -get output/ .


!hadoop fs -ls output/*

!hadoop fs -cat output/part-r-00000

%pig_quit
