#!/usr/bin/env bash
#开发人员上线之前，需执行打包js
root_dir=$(cd "$(dirname "$0")"; cd ..; pwd)

mkdir -p $root_dir/logs/pids
chmod 755 $root_dir/logs
