SELECT DISTINCT gene.* 
    INTO OUTFILE 'C:\\dev\\gensat_db\\exports\\data.csv' 
        FIELDS 
            TERMINATED BY ',' 
            OPTIONALLY ENCLOSED BY '"' 
        LINES 
            TERMINATED BY '\n' 
    FROM annotation AS a, gene
    WHERE a.structure_id=69 AND a.expressionlevel_id=4;