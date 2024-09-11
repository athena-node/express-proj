#!/bin/sh
# nodejs日志迁移脚本
# 1 0 * * * sh bin/app-log-cut.sh >> /dev/null 每天凌晨执行日志切割
root_dir=$(cd "$(dirname "$0")"; cd ..; pwd)

LOGPATH=$root_dir/logs  #log dir
appName=tiga #application name
out_log_name=${appName}-out.log         #out dir
error_log_name=${appName}-error.log     #error log
out_log_file=$LOGPATH/$out_log_name
error_log_file=$LOGPATH/$error_log_name

yesterday=`date  +"%Y%m%d" -d  "-1 days"`   #last day
out_target_log=$LOGPATH/$yesterday"_"$out_log_name
error_target_log=$LOGPATH/${yesterday}"_"$error_log_name

#开始迁移
if [ -f "$out_log_file" ] && [ -f "$error_log_file" ]; then
    echo "---------------The pm2 logs are migrated----------------------------"
    echo "logs output："$out_target_log
    mv $out_log_file $out_target_log
    touch $out_log_file
    echo "reload "$out_log_file" success"

    # mv $error_log_file $error_target_log
    # touch $error_log_file
    pm2 reloadLogs #init logs

    echo "---------------Log initialization success, migration complete!------------------"
else
    echo "没有任何日志迁移操作！"
fi