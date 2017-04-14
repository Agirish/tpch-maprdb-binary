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

/* ----- NATION : 1-Key PKey ----- */
-- Reading CSV Data
NATION_DATA = LOAD '/drill/testdata/tpch_maprdb/sf${scaleFactor}/text/nation' USING PigStorage('|') as 
    (
    n_nationkey:long,
    n_name:chararray,
    n_regionkey:long,
    n_comment:chararray
    );

-- Writing HBase Data [Implicitly, first column is ROW_KEY]
STORE NATION_DATA INTO '/drill/testdata/tpch_maprdb/sf${scaleFactor}/nation_$scaleFactor'
    USING org.apache.pig.backend.hadoop.hbase.HBaseStorage
    ('
    data:n_name,
    data:n_regionkey,
    data:n_comment
    ');
 
/* ----- SUPPLIER : 1-Key PKey ----- */
-- Reading CSV Data
SUPPLIER_DATA = LOAD '/drill/testdata/tpch_maprdb/sf${scaleFactor}/text/supplier' USING PigStorage('|') as 
    (
    s_suppkey:long ,
    s_name:chararray ,
    s_address:chararray ,
    s_nationkey:long ,
    s_phone:chararray ,
    s_acctbal:double ,
    s_comment:chararray 
    );

-- Writing HBase Data [Implicitly, first column is ROW_KEY]
STORE SUPPLIER_DATA INTO '/drill/testdata/tpch_maprdb/sf${scaleFactor}/supplier_$scaleFactor'
    USING org.apache.pig.backend.hadoop.hbase.HBaseStorage
    ('
    data:s_name,
    data:s_address,
    data:s_nationkey,
    data:s_phone,
    data:s_acctbal,
    data:s_comment
    ');

/* ----- CUSTOMER : 1-Key PKey ----- */
-- Reading CSV Data
CUSTOMER_DATA = LOAD '/drill/testdata/tpch_maprdb/sf${scaleFactor}/text/customer' USING PigStorage('|') as 
    (
    c_custkey:long ,
    c_name:chararray ,
    c_address:chararray ,
    c_nationkey:long ,
    c_phone:chararray ,
    c_acctbal:double   ,
    c_mktsegment:chararray ,
    c_comment:chararray 
    );

-- Writing HBase Data [Implicitly, first column is ROW_KEY]
STORE CUSTOMER_DATA INTO '/drill/testdata/tpch_maprdb/sf${scaleFactor}/customer_$scaleFactor'
    USING org.apache.pig.backend.hadoop.hbase.HBaseStorage
    ('
    data:c_name,
    data:c_address,
    data:c_nationkey,
    data:c_phone,
    data:c_acctbal,
    data:c_mktsegment,
    data:c_comment
    ');

/* ----- PART : 1-Key PKey ----- */
-- Reading CSV Data
PART_DATA = LOAD '/drill/testdata/tpch_maprdb/sf${scaleFactor}/text/part' USING PigStorage('|') as 
    (
    p_partkey:long ,
    p_name:chararray ,
    p_mfgr:chararray ,
    p_brand:chararray ,
    p_type:chararray ,
    p_size:long ,
    p_container:chararray ,
    p_retailprice:double ,
    p_comment:chararray  
    );
    
-- Writing HBase Data [Implicitly, first column is ROW_KEY]
STORE PART_DATA INTO '/drill/testdata/tpch_maprdb/sf${scaleFactor}/part_$scaleFactor'
    USING org.apache.pig.backend.hadoop.hbase.HBaseStorage
    ('
    data:p_name,
    data:p_mfgr,
    data:p_brand,
    data:p_type,
    data:p_size,
    data:p_container,
    data:p_retailprice,
    data:p_comment
    ');

/* ----- PARTSUPP : 2-Key Composite PKey ----- */
-- Reading CSV Data
PARTSUPP_DATA = LOAD '/drill/testdata/tpch_maprdb/sf${scaleFactor}/text/partsupp' USING PigStorage('|') as 
    (
    ps_partkey:long ,
    ps_suppkey:long ,
    ps_availqty:long ,
    ps_supplycost:double  ,
    ps_comment:chararray  
    );

-- Generating Composite Key
PREFIXED_PARTSUPP_DATA = FOREACH PARTSUPP_DATA GENERATE
    CONCAT((chararray)ps_partkey, CONCAT('_', (chararray)ps_suppkey)),
    ps_partkey,
    ps_suppkey,
    ps_availqty,
    ps_supplycost,
    ps_comment;

-- Writing HBase Data [Implicitly, first column is ROW_KEY]
STORE PREFIXED_PARTSUPP_DATA INTO '/drill/testdata/tpch_maprdb/sf${scaleFactor}/partsupp_$scaleFactor'
    USING org.apache.pig.backend.hadoop.hbase.HBaseStorage
    ('
    data:ps_partkey,
    data:ps_suppkey,
    data:ps_availqty,
    data:ps_supplycost,
    data:ps_comment
    ');


/* ----- ORDERS : 1-Key PKey ----- */
-- Reading CSV Data
ORDERS_DATA = LOAD '/drill/testdata/tpch_maprdb/sf${scaleFactor}/text/orders' USING PigStorage('|') as 
    (
    o_orderkey:long ,
    o_custkey:long ,
    o_orderstatus:chararray ,
    o_totalprice:double ,
    o_orderdate:chararray,
    o_orderpriority:chararray ,  
    o_clerk:chararray , 
    o_shippriority:long ,
    o_comment:chararray 
    );

-- Writing HBase Data [Implicitly, first column is ROW_KEY]
STORE ORDERS_DATA INTO '/drill/testdata/tpch_maprdb/sf${scaleFactor}/orders_$scaleFactor'
    USING org.apache.pig.backend.hadoop.hbase.HBaseStorage
    ('
    data:o_custkey,
    data:o_orderstatus,
    data:o_totalprice,
    data:o_orderdate,
    data:o_orderpriority,
    data:o_clerk,
    data:o_shippriority,
    data:o_comment
    ');

/* ----- LINEITEM : 1-Key PKey ----- */
-- Reading CSV Data
LINEITEM_DATA = LOAD '/drill/testdata/tpch_maprdb/sf${scaleFactor}/text/lineitem' USING PigStorage('|') as 
    (
    l_orderkey:long ,
    l_partkey:long ,
    l_suppkey:long ,
    l_linenumber:long ,
    l_quantity:double ,
    l_extendedprice:double ,
    l_discount:double ,
    l_tax:double ,
    l_returnflag:chararray ,
    l_linestatus:chararray ,
    l_shipdate:chararray,
    l_commitdate:chararray,
    l_receiptdate:chararray,
    l_shipinstruct:chararray ,
    l_shipmode:chararray ,
    l_comment:chararray 
    );

-- Generating Composite Key
PREFIXED_LINEITEM_DATA = FOREACH LINEITEM_DATA GENERATE
    CONCAT((chararray)l_orderkey, CONCAT('_', (chararray)l_linenumber)),
    l_orderkey,
    l_partkey,
    l_suppkey,
    l_linenumber,
    l_quantity,
    l_extendedprice,
    l_discount,
    l_tax,
    l_returnflag,
    l_linestatus,
    l_shipdate,
    l_commitdate,
    l_receiptdate,
    l_shipinstruct,
    l_shipmode,
    l_comment
    ;

-- Writing HBase Data [Implicitly, first column is ROW_KEY]
STORE PREFIXED_LINEITEM_DATA INTO '/drill/testdata/tpch_maprdb/sf${scaleFactor}/lineitem_$scaleFactor'
    USING org.apache.pig.backend.hadoop.hbase.HBaseStorage
    ('
    data:l_orderkey,
    data:l_partkey,
    data:l_suppkey,
    data:l_linenumber,
    data:l_quantity,
    data:l_extendedprice,
    data:l_discount,
    data:l_tax,
    data:l_returnflag,
    data:l_linestatus,
    data:l_shipdate,
    data:l_commitdate,
    data:l_receiptdate,
    data:l_shipinstruct,
    data:l_shipmode,
    data:l_comment
    ');

