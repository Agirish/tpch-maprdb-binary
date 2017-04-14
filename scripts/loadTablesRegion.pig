--Default Scale Factor
%default scaleFactor '0.01'

/* ----- REGION : 1-Key PKey ----- */
-- Reading CSV Data
REGION_DATA = LOAD '/drill/testdata/tpch_maprdb/sf${scaleFactor}/text/region' USING PigStorage('|') as
    (
    r_regionkey:long,
    r_name:chararray,
    r_comment:chararray
    );

-- Writing HBase Data [Implicitly, first column is ROW_KEY]
STORE REGION_DATA INTO '/drill/testdata/tpch_maprdb/sf${scaleFactor}/region_$scaleFactor'
    USING org.apache.pig.backend.hadoop.hbase.HBaseStorage
    ('
    data:r_name,
    data:r_comment
    ');
