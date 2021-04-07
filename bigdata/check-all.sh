#!/bin/bash
###
 # @Author       : chyh
 # @Date         : 2021-04-07 22:03:20
 # @LastEditTime : 2021-04-07 23:45:43
 # @Description  : 调用其他脚本，检查所有组件的启动情况
### 

./check-hadoop.sh > /dev/null
hadoop_result=$?
case "${hadoop_result}" in
    0)
        echo "hadoop success"
    ;;
    1)
        echo "hadoop failed"
    ;;
esac
