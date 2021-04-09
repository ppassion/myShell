#!/bin/bash
###
 # @Author       : chyh
 # @Date         : 2021-04-07 22:03:20
 # @LastEditTime : 2021-04-09 13:28:20
 # @Description  : 调用其他脚本，检查所有组件的启动情况
### 


# hadoop
./hadoop-check.sh > /dev/null
hadoop_result=$?
case "${hadoop_result}" in
    0)
        echo "hadoop success"
    ;;
    1)
        echo "hadoop failed"
    ;;
esac

# zookeeper
./zookeeper-check.sh > /dev/null
zookeeper_result=$?
case "${zookeeper_result}" in
    0)
        echo "zookeeper success"
    ;;
    1)
        echo "zookeeper failed"
    ;;
esac