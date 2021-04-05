#!/bin/bash

case $1 in
"start") {
    source /etc/profile
    /home/hadoop/install/hadoop-3.1.4/sbin/start-dfs.sh
    /home/hadoop/install/hadoop-3.1.4/sbin/start-yarn.sh
    /home/hadoop/install/hadoop-3.1.4/sbin/mr-jobhistory-daemon.sh start historyserver

} ;;
"stop") {

    /home/hadoop/install/hadoop-3.1.4/sbin/stop-dfs.sh
    /home/hadoop/install/hadoop-3.1.4/sbin/stop-yarn.sh
    /home/hadoop/install/hadoop-3.1.4/sbin/mr-jobhistory-daemon.sh stop historyserver
} ;;
esac


