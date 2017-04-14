$DRILL_HOME/bin/sqlline -n root -p mapr -u "jdbc:drill:drillbit=${DRILL_STORAGE_PLUGIN_SERVER};schema=db.tpch_maprdb"  < dropViews.sql
$DRILL_HOME/bin/sqlline -n root -p mapr -u "jdbc:drill:drillbit=${DRILL_STORAGE_PLUGIN_SERVER};schema=db.tpch_maprdb"  < createViews.sql
