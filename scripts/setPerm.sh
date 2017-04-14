#!/bin/sh

AUTO_HOME=/root/drillAutomation
Timeout=600

sshpass -p "mapr" pssh -t ${Timeout} -A -h $AUTO_HOME/scripts/dockerIP_control -O LogLevel=quiet -O UserKnownHostsFile=/dev/null -O StrictHostKeyChecking=no "maprcli table cf edit -path \"/drill/testdata/tpch_maprdb/sf0.01/customer_0.01\" -cfname \"data\"  -readperm \"u:root | u:mapr\" "
sshpass -p "mapr" pssh -t ${Timeout} -A -h $AUTO_HOME/scripts/dockerIP_control -O LogLevel=quiet -O UserKnownHostsFile=/dev/null -O StrictHostKeyChecking=no "maprcli table cf edit -path \"/drill/testdata/tpch_maprdb/sf0.01/lineitem_0.01\" -cfname \"data\"  -readperm \"u:root | u:mapr\" "
sshpass -p "mapr" pssh -t ${Timeout} -A -h $AUTO_HOME/scripts/dockerIP_control -O LogLevel=quiet -O UserKnownHostsFile=/dev/null -O StrictHostKeyChecking=no "maprcli table cf edit -path \"/drill/testdata/tpch_maprdb/sf0.01/orders_0.01\" -cfname \"data\"  -readperm \"u:root | u:mapr\" "
sshpass -p "mapr" pssh -t ${Timeout} -A -h $AUTO_HOME/scripts/dockerIP_control -O LogLevel=quiet -O UserKnownHostsFile=/dev/null -O StrictHostKeyChecking=no "maprcli table cf edit -path \"/drill/testdata/tpch_maprdb/sf0.01/part_0.01\" -cfname \"data\"  -readperm \"u:root | u:mapr\" "
sshpass -p "mapr" pssh -t ${Timeout} -A -h $AUTO_HOME/scripts/dockerIP_control -O LogLevel=quiet -O UserKnownHostsFile=/dev/null -O StrictHostKeyChecking=no "maprcli table cf edit -path \"/drill/testdata/tpch_maprdb/sf0.01/partsupp_0.01\" -cfname \"data\"  -readperm \"u:root | u:mapr\" "
sshpass -p "mapr" pssh -t ${Timeout} -A -h $AUTO_HOME/scripts/dockerIP_control -O LogLevel=quiet -O UserKnownHostsFile=/dev/null -O StrictHostKeyChecking=no "maprcli table cf edit -path \"/drill/testdata/tpch_maprdb/sf0.01/region_0.01\" -cfname \"data\"  -readperm \"u:root | u:mapr\" "
sshpass -p "mapr" pssh -t ${Timeout} -A -h $AUTO_HOME/scripts/dockerIP_control -O LogLevel=quiet -O UserKnownHostsFile=/dev/null -O StrictHostKeyChecking=no "maprcli table cf edit -path \"/drill/testdata/tpch_maprdb/sf0.01/nation_0.01\" -cfname \"data\"  -readperm \"u:root | u:mapr\" "
sshpass -p "mapr" pssh -t ${Timeout} -A -h $AUTO_HOME/scripts/dockerIP_control -O LogLevel=quiet -O UserKnownHostsFile=/dev/null -O StrictHostKeyChecking=no "maprcli table cf edit -path \"/drill/testdata/tpch_maprdb/sf0.01/supplier_0.01\" -cfname \"data\"  -readperm \"u:root | u:mapr\" "
