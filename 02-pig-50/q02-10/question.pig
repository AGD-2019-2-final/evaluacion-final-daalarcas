-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
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
y = ORDER u BY $0, $2;
DUMP y;

%%pig
STORE y INTO 'output';

%%pig
fs -get output/ .

!hadoop fs -ls output/*

!hadoop fs -cat output/part-r-00000

%pig_quit



