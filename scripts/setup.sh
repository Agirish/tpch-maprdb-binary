#!/bin/sh
set -x
set -e

if [ -n $DRILL_USER ]
then
    user=$DRILL_USER
else
    user=`ps -aef | grep Drillbit | grep org.apache.drill | cut -d' ' -f1 | head -1`
fi
if [ "$user" == "root" ]
then
	resources/Datasources/tpch_maprdb/createTables.sh 0.01
	resources/Datasources/tpch_maprdb/loadTables.sh 0.01
	resources/Datasources/tpch_maprdb/createViews.sh
	resources/Datasources/tpch_maprdb/setPerm.sh
else
	su ${user} resources/Datasources/tpch_maprdb/createTables.sh 0.01
	su ${user} resources/Datasources/tpch_maprdb/loadTables.sh 0.01
	su ${user} resources/Datasources/tpch_maprdb/createViews.sh
	su ${user} resources/Datasources/tpch_maprdb/setPerm.sh
fi
set +x
