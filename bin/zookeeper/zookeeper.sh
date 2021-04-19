#!/bin/bash
###
 # @Author       : chyh
 # @Date         : 2021-04-09 12:36:19
 # @LastEditTime : 2021-04-13 23:16:38
 # @Description  : Do not edit
### 

case $1 in
"start") {
    xcall 'zkServer.sh start'

} ;;
"stop") {
    xcall 'zkServer.sh stop'
} ;;
esac