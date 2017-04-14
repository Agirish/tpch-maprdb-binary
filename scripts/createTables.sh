#!/bin/bash

# TPC-H Tests on MapR-DB Tables

# Scale Factor
scaleFactor=$1

# Location of Tables
path="/drill/testdata/tpch_maprdb/sf${scaleFactor}"

# Create MapR-DB Tables
for table in `cat tables`; do
#for table in `cat tables`; do
	
	echo "[INFO] Dropping existing '${path}/${table}_${scaleFactor}'"
	#echo "disable '${path}/${table}_${scaleFactor}'" |hbase shell
        #echo "drop '${path}/${table}_${scaleFactor}'" |hbase shell
	
	echo "disable '${path}/${table}_${scaleFactor}' ; drop '${path}/${table}_${scaleFactor}'" |hbase shell	

	echo "[INFO] Creating '${path}/${table}_${scaleFactor}'"
	
	echo "create '${path}/${table}_${scaleFactor}', 'data'" |hbase shell
	
done
