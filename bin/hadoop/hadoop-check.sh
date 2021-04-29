#!/bin/bash
###
# @Author       : chyh
# @Date         : 2021-04-05 13:08:26
 # @LastEditTime : 2021-04-29 22:45:39
# @Description  : 使用xcall获取3台机器上的进程信息，再检查该启动的是否都启动成功
###

m01_should_have=('DataNode' 'SecondaryNameNode' 'NameNode' 'ResourceManager' 'NodeManager' 'JobHistoryServer')
m02_should_have=('DataNode' 'NodeManager')
m03_should_have=('DataNode' 'NodeManager')

xcall_result=$(xcall jps)

# 先去掉space，再根据'm0'做分割

m01_has=$(echo $xcall_result | awk '{ gsub(/ /,""); print }' | awk -F "m0" '{print $2}')
m02_has=$(echo $xcall_result | awk '{ gsub(/ /,""); print }' | awk -F "m0" '{print $3}')
m03_has=$(echo $xcall_result | awk '{ gsub(/ /,""); print }' | awk -F "m0" '{print $4}')


function printStatus() {
    server_name=$1
    server_should_have=$(eval echo '${'${server_name}_should_have'[@]}')
    server_has=$(eval echo '$'${server_name}_has)
    echo $server_has

    server_status=0

    for i in ${server_should_have[@]}; do
        echo $i
        echo $server_status
        if [[ $server_has =~ $i ]];
        then
            echo "$server_name success "${i}
        else
            server_status=1
            echo "$server_name failed  "${i}
        fi
    done

    case "${server_status}" in
        0)
            echo "========$server_name success========="
        ;;
        1)
        echo "========$server_name failed========="
        ;;
    esac
    return ${server_status}
}

printStatus m01
m01_status=$?
printStatus m02
m02_status=$?
printStatus m03
m03_status=$?

# 1是成功，0是失败
if [ ${m01_status} = 0 ] && [ ${m02_status} = 0 ] && [ ${m03_status} = 0 ];
then
    exit 0
else
    exit 1
fi