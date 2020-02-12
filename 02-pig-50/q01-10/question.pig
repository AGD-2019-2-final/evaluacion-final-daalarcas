-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
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
    AS (letra:CHARARRAY);
    
DUMP u;

%%pig
y = GROUP u BY $0;
DUMP y;

%%pig
z = FOREACH y GENERATE u, COUNT(u);
DUMP z;

%%pig
wordcount = FOREACH y GENERATE group, COUNT(u);
DUMP wordcount ;

%%pig
STORE wordcount INTO 'output';

%%pig
fs -get output/ .


!hadoop fs -ls output/*

!hadoop fs -cat output/part-r-00000

%pig_quit

!hadoop fs -rm output/*
!hadoop fs -rmdir  output