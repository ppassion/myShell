#!/bin/bash
###
# @Author       : chyh
# @Date         : 2021-04-05 13:08:26
 # @LastEditTime : 2021-04-05 19:39:33
# @Description  : 使用xcall获取3台机器上的进程信息，再检查该启动的是否都启动成功
###

m01_should_have=('DataNode' 'SecondaryNameNode' 'NameNode' 'ResourceManager' 'NodeManager' 'JobHistoryServer')
m02_should_have=('DataNode' 'NodeManager')
m03_should_have=('DataNode' 'NodeManager')

xcall_result=$(xcall jps)

# 先去掉space，再根据'm0'做分割

m01=$(echo $xcall_result | awk '{ gsub(/ /,""); print }' | awk -F "m0" '{print $2}')
m02=$(echo $xcall_result | awk '{ gsub(/ /,""); print }' | awk -F "m0" '{print $3}')
m03=$(echo $xcall_result | awk '{ gsub(/ /,""); print }' | awk -F "m0" '{print $4}')

m01_success=1
for i in ${m01_should_have[@]}; do
    if [[ $m01 =~ $i ]];
    then
        echo "m01 success "${i}
    else
        m01_success=0
        echo "m01 failed  "${i}
    fi
done

case "${m01_success}" in
    1)
        echo "========m01 success========="
    ;;
    0)
        echo "========m01 failed========="
    ;;
esac

m02_success=1
for i in ${m02_should_have[@]}; do
    if [[ $m02 =~ $i ]];
    then
        echo "m02 success "${i}
    else
        m02_success=0
        echo "m02 failed  "${i}
    fi
done

case "${m02_success}" in
    1)
        echo "========m02 success========="
    ;;
    0)
        echo "========m02 failed========="
    ;;
esac

m03_success=1
for i in ${m03_should_have[@]}; do
    if [[ $m03 =~ $i ]];
    then
        echo "m03 success "${i}
    else
        m03_success=0
        echo "m03 failed  "${i}
    fi
done

case "${m03_success}" in
    1)
        echo "========m03 success========="
    ;;
    0)
        echo "========m03 failed========="
    ;;
esac