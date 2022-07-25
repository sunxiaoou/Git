#!/bin/sh

# imp_dir=/user/manga/sqoop/fruit
bin/sqoop import \
    --connect jdbc:mysql://localhost:3306/finance --username manga --password manga \
    --driver com.mysql.cj.jdbc.Driver \
    --table instant_price \
    --delete-target-dir \
    --num-mappers 1 \
    --fields-terminated-by '\t' \
    --hive-import \
    --hive-database default \
    --hive-table instant_price
# hdfs dfs -text "$imp_dir/*"
