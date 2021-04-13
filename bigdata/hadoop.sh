#!/bin/bash
###
 # @Author       : chyh
 # @Date         : 2021-03-16 23:34:53
 # @LastEditTime : 2021-04-14 01:01:04
 # @Description  : 启停hdfs/yarn并检查状态
### 

case $1 in
"start") {
    /home/hadoop/install/hadoop-3.1.4/sbin/start-dfs.sh
    /home/hadoop/install/hadoop-3.1.4/sbin/start-yarn.sh
    mapred --daemon start historyserver

} ;;
"stop") {

    /home/hadoop/install/hadoop-3.1.4/sbin/stop-dfs.sh
    /home/hadoop/install/hadoop-3.1.4/sbin/stop-yarn.sh
    mapred --daemon stop historyserver
} ;;
"restart") {

    /home/hadoop/install/hadoop-3.1.4/sbin/stop-dfs.sh
    /home/hadoop/install/hadoop-3.1.4/sbin/stop-yarn.sh
    mapred --daemon stop historyserver
    /home/hadoop/install/hadoop-3.1.4/sbin/start-dfs.sh
    /home/hadoop/install/hadoop-3.1.4/sbin/start-yarn.sh
    mapred --daemon start historyserver
} ;;
esac


./hadoop-check.sh

