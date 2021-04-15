#!/bin/bash
###
# @Author       : chyh
# @Date         : 2021-04-07 22:03:20
 # @LastEditTime : 2021-04-15 22:45:42
# @Description  : 调用其他脚本，检查所有组件的启动情况
###

# hadoop
./hadoop-check.sh >/dev/null
hadoop_result=$?

#zookeeper
./zookeeper-check.sh > /dev/null
zookeeper_result=$?

#mysql
./mysql-check.sh > /dev/null
mysql_result=$?

#hive
./hive-check.sh > /dev/null
hive_result=$?

function printStatus() {
    component_name=$1
    component_result=$(eval echo '$'${component_name}_result)
    case "${component_result}" in
    0)
        echo "$component_name success"
    ;;
    1)
        echo "$component_name failed"
    ;;
    esac
}

echo '====================================='
printStatus hadoop
printStatus zookeeper
printStatus mysql
printStatus hive
