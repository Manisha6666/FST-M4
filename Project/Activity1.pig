inputFile - LOAD 'hdfs:///user/Manisha_Mod4/inputs_project' USING PigStorage('\t') AS (name:chararray, line:chararray);
grpd - GROUP inputFile BY name;
cntd - FOREACH grpd GENERATE $0, COUNT($1) AS numlines;
ord = ORDER cntd BY multilines DESC;
STORE ord INTO 'hdfs:///user/Manisha_Mod4/Output';