-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
%load_ext bigdata
%pig_start
timeout 300

%%pig
fs -put data.tsv

%%pig
--
-- Carga el archivo desde el disco duro
--
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY, clave:BAG{()}, col:MAP[]);
r= FOREACH u GENERATE $2;
DUMP r;

%%pig
x = FOREACH r GENERATE FLATTEN($0);
DUMP x;

%%pig
y = FOREACH x GENERATE $0 ;
DUMP y;

%%pig
z = ORDER y BY $0;
m = GROUP z BY $0;
DUMP m;

%%pig
wordcount = FOREACH m GENERATE group, COUNT(z);
DUMP wordcount ;

%%pig
STORE wordcount INTO 'output' USING PigStorage(',');

%%pig
fs -get output/ .


!hadoop fs -ls output/*

!hadoop fs -cat output/part-r-00000

%pig_quit