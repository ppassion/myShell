#!/bin/bash
###
 # @Author       : chyh
 # @Date         : 2021-04-09 12:36:19
 # @LastEditTime : 2021-04-09 13:01:43
 # @Description  : Do not edit
### 

source setup.sh

case $1 in
"start") {
    xcall 'zkServer.sh start'

} ;;
"stop") {
    xcall 'zkServer.sh stop'
} ;;
esac