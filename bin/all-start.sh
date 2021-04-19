#!/bin/bash
###
 # @Author       : chyh
 # @Date         : 2021-04-09 13:27:00
 # @LastEditTime : 2021-04-19 22:01:09
 # @Description  : 启动所有组件，可用于重启集群后使用
### 

./hadoop/hadoop.sh start
./zookeeper/zookeeper.sh start