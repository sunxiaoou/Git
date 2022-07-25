#!/bin/sh

imp_dir=/user/hive/warehouse/instant_price
timestamp="2022-07-21 10:15:27"

bin/sqoop import \
    --connect jdbc:mysql://localhost:3306/finance --username manga --password manga \
    --driver com.mysql.cj.jdbc.Driver \
    --table instant_price \
    --num-mappers 1 \
    --fields-terminated-by '\t' \
    --target-dir $imp_dir \
    --incremental append \
    --check-column ts \
    --last-value "$timestamp"

