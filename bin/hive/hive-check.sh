#!/bin/bash
###
 # @Author       : chyh
 # @Date         : 2021-04-15 22:41:27
 # @LastEditTime : 2021-04-15 22:45:15
 # @Description  : Do not edit
### 


hive_result=`ssh m03 'ps -ef | grep -i hiveserver2 | wc -l'`

case "${hive_result}" in
    3)
        echo "hive success"
        exit 0
    ;;
    *)
        echo "hive failed"
        exit 1
    ;;
esac