#!/bin/bash
###
 # @Author       : chyh
 # @Date         : 2021-04-09 13:27:00
 # @LastEditTime : 2021-04-16 22:51:49
 # @Description  : 关闭所有组件，可用于关闭集群之前
### 

./hadoop.sh stop
./zookeeper.sh stop