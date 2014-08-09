#!/bin/bash
hadoop fs -rm -r -f rollup-by-session.dat
dmxjob /run sessionize-weblogs-job.dtl \
	/hadoop \
	/export APACHE_WEBLOGS_DIR=/apache2 HDFS_SERVER=`hostname` WORKSPACE_DIR=/tmp DMX_HADOOP_CACHE=combine-weblogs.dtl,sort-by-partition.dtl,sessionize-weblogs.dtl,rollup-by-session.dtl,sessionize-weblogs-job.dtl 
