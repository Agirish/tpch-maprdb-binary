# Create Views on MapR-DB Tables

use db.tpch_maprdb;

create view region_v as select
    cast(region.row_key as int) r_regionkey,
    cast(region.data.r_name as char(25)) r_name,
    cast(region.data.r_comment as varchar(200)) r_comment
from db.root.`/drill/testdata/tpch_maprdb/sf1/region_1` region;

create view nation_v as select 
    cast(nation.row_key as int) n_nationkey,
    cast(nation.data.n_name as char(25)) n_name,
    cast(nation.data.n_regionkey as int) n_regionkey,
    cast(nation.data.n_comment as varchar(200)) n_comment
from db.root.`/drill/testdata/tpch_maprdb/sf1/nation_1` nation;

create view part_v as select
    cast(part.row_key as int) p_partkey,
    cast(part.data.p_name as varchar(55)) p_name,
    cast(part.data.p_mfgr as char(25)) p_mfgr,
    cast(part.data.p_brand as char(10)) p_brand,
    cast(part.data.p_type as varchar(25)) p_type,
    cast(part.data.p_size as int) p_size,
    cast(part.data.p_container as char(10)) p_container,
    cast(part.data.p_retailprice as double) p_retailprice,
    cast(part.data.p_comment as varchar(200)) p_comment
from db.root.`/drill/testdata/tpch_maprdb/sf1/part_1` part;


create view supplier_v as select
    cast(supplier.row_key as int) s_suppkey,
    cast(supplier.data.s_name as char(25)) s_name,
    cast(supplier.data.s_address as varchar(40)) s_address,
    cast(supplier.data.s_nationkey as int) s_nationkey,
    cast(supplier.data.s_phone as char(15)) s_phone,
    cast(supplier.data.s_acctbal as double) s_acctbal,
    cast(supplier.data.s_comment as varchar(200)) s_comment
from db.root.`/drill/testdata/tpch_maprdb/sf1/supplier_1` supplier;

create view partsupp_v as select
    cast(partsupp.data.ps_partkey as int) ps_partkey,
    cast(partsupp.data.ps_suppkey as int) ps_suppkey,
    cast(partsupp.data.ps_availqty as int) ps_availqty,
    cast(partsupp.data.ps_supplycost as double) ps_supplycost,
    cast(partsupp.data.ps_comment as varchar(200)) ps_comment
from db.root.`/drill/testdata/tpch_maprdb/sf1/partsupp_1` partsupp;


create view customer_v as select
    cast(customer.row_key as int) c_custkey,
    cast(customer.data.c_name as char(25)) c_name,
    cast(customer.data.c_address as varchar(200)) c_address,
    cast(customer.data.c_nationkey as int) c_nationkey,
    cast(customer.data.c_phone as char(15)) c_phone,
    cast(customer.data.c_acctbal as double) c_acctbal,
    cast(customer.data.c_mktsegment as char(10)) c_mktsegment,
    cast(customer.data.c_comment as varchar(200)) c_comment
from db.root.`/drill/testdata/tpch_maprdb/sf1/customer_1` customer;


create view orders_v as select
    cast(orders.row_key as int) o_orderkey,
    cast(orders.data.o_custkey as int) o_custkey,
    cast(orders.data.o_orderstatus as char(1)) o_orderstatus,
    cast(orders.data.o_totalprice as double) o_totalprice,
    cast(orders.data.o_orderdate as date) o_orderdate,
    cast(orders.data.o_orderpriority as char(15)) o_orderpriority,
    cast(orders.data.o_clerk as char(15)) o_clerk,
    cast(orders.data.o_shippriority as int) o_shippriority,
    cast(orders.data.o_comment as varchar(200)) o_comment
from db.root.`/drill/testdata/tpch_maprdb/sf1/orders_1` orders;


create view lineitem_v as select
    cast(lineitem.data.l_orderkey as int) l_orderkey,
    cast(lineitem.data.l_partkey as int) l_partkey,
    cast(lineitem.data.l_suppkey as int) l_suppkey,
    cast(lineitem.data.l_linenumber as int) l_linenumber,
    cast(lineitem.data.l_quantity as double) l_quantity,
    cast(lineitem.data.l_extendedprice as double) l_extendedprice,
    cast(lineitem.data.l_discount as double) l_discount,
    cast(lineitem.data.l_tax as double) l_tax,
    cast(lineitem.data.l_returnflag as char(1)) l_returnflag,
    cast(lineitem.data.l_linestatus as char(1)) l_linestatus,
    cast(lineitem.data.l_shipdate as date) l_shipdate,
    cast(lineitem.data.l_commitdate as date) l_commitdate,
    cast(lineitem.data.l_receiptdate as date) l_receiptdate,
    cast(lineitem.data.l_shipinstruct as char(25)) l_shipinstruct,
    cast(lineitem.data.l_shipmode as char(10)) l_shipmode,
    cast(lineitem.data.l_comment as varchar(200)) l_comment
from db.root.`/drill/testdata/tpch_maprdb/sf1/lineitem_1` lineitem;

