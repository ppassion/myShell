#!/bin/bash
###
# @Author       : chyh
# @Date         : 2021-04-13 23:09:14
 # @LastEditTime : 2021-04-13 23:15:52
# @Description  : Do not edit
###

mysql_result=$(ssh m03 'systemctl status mysqld.service')
echo $mysql_result

if [[ $mysql_result =~ 'active' ]];
    then
        echo "mysql success"
        exit 0
    else
        echo "mysql failed"
        exit 1
    fi