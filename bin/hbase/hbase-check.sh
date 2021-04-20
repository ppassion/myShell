#!/bin/bash
###
 # @Author       : chyh
 # @Date         : 2021-04-19 22:07:24
 # @LastEditTime : 2021-04-19 22:26:21
 # @Description  : Do not edit
### 

m01_should_have=('HMaster' 'HRegionServer')
m02_should_have=('HMaster' 'HRegionServer')
m03_should_have=('HRegionServer')

xcall_result=$(xcall jps)

# 先去掉space，再根据'm0'做分割

m01_has=$(echo $xcall_result | awk '{ gsub(/ /,""); print }' | awk -F "m0" '{print $2}')
m02_has=$(echo $xcall_result | awk '{ gsub(/ /,""); print }' | awk -F "m0" '{print $3}')
m03_has=$(echo $xcall_result | awk '{ gsub(/ /,""); print }' | awk -F "m0" '{print $4}')


function printStatus() {
    server_name=$1
    server_should_have=$(eval echo '${'${server_name}_should_have'[@]}')
    server_has=$(eval echo '$'${server_name}_has)

    server_status=0

    for i in ${server_should_have[@]}; do
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