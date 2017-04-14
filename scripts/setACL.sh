#!/bin/sh

maprcli table cf edit -path /drill/testdata/tpch_maprdb/sf1/customer_1 -cfname data -readperm "u:root |u:mapr"
maprcli table cf edit -path /drill/testdata/tpch_maprdb/sf1/lineitem_1 -cfname data -readperm "u:root |u:mapr"
maprcli table cf edit -path /drill/testdata/tpch_maprdb/sf1/region_1 -cfname data -readperm "u:root |u:mapr"
maprcli table cf edit -path /drill/testdata/tpch_maprdb/sf1/supplier_1 -cfname data -readperm "u:root |u:mapr"
maprcli table cf edit -path /drill/testdata/tpch_maprdb/sf1/orders_1 -cfname data -readperm "u:root |u:mapr"
maprcli table cf edit -path /drill/testdata/tpch_maprdb/sf1/nation_1 -cfname data -readperm "u:root |u:mapr"
maprcli table cf edit -path /drill/testdata/tpch_maprdb/sf1/part_1 -cfname data -readperm "u:root |u:mapr"
maprcli table cf edit -path /drill/testdata/tpch_maprdb/sf1/partsupp_1 -cfname data -readperm "u:root |u:mapr"
