#!/bin/bash
###
# @Author       : chyh
# @Date         : 2021-04-09 12:07:27
 # @LastEditTime : 2021-04-09 13:23:46
# @Description  : Do not edit
###

xcall_result=$(xcall 'zkServer.sh status')

m01=$(echo $xcall_result | awk '{ gsub(/ /,""); print }' | awk -F "m0" '{print $2}')
m02=$(echo $xcall_result | awk '{ gsub(/ /,""); print }' | awk -F "m0" '{print $3}')
m03=$(echo $xcall_result | awk '{ gsub(/ /,""); print }' | awk -F "m0" '{print $4}')

echo $m01
echo $m02
echo $m03

follower_count=$(echo $xcall_result | grep -wo "follower" | wc -l)
leader_count=$(echo $xcall_result | grep -wo "leader" | wc -l)

echo 'follower count is '$follower_count
echo 'leader count is '$leader_count

if [ $follower_count -eq 2 ] && [ $leader_count -eq 1 ]
then
    echo 'zookeeper success'
    exit 0
else
    echo 'zookeeper failed'
    exit 1
fi


