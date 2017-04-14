#!/bin/sh 

AUTO_HOME="/root/drillAutomation"
cp -Rf $AUTO_HOME/tpch_maprdb/tests/tpch_maprdb $AUTO_HOME/drill-test-framework/framework/resources/Functional
cp -Rf $AUTO_HOME/tpch_maprdb/data/tpch_maprdb $AUTO_HOME/drill-test-framework/framework/resources/Datasources
cp -Rf $AUTO_HOME/tpch_maprdb/db-storage-plugin.template $AUTO_HOME/drill-test-framework/framework/src/main/resouces/plugin-templates
