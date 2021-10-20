#!/bin/bash

# $1 = START|STOP|STATUS

function check_memory {
    while [ true ]
    do
    total_mem=$(cat /proc/meminfo | grep MemTotal | grep -oe [1-9]*)
    mem_free=$(cat /proc/meminfo | grep MemFree | grep -oe [1-9]*)
    per_usage=$((100 - (100*$mem_free)/$total_mem))
    echo "$(date +"%Y-%m-%d %T");$total_mem;$mem_free;$per_usage" >> memory_logs.csv
    sleep 600
    done
}

case "$1" in

 "START" )
 check_memory &
 child_pid=$! 
 echo $child_pid>child_pid
 echo $child_pid
 ;;

 "STATUS" )
 pid=$(cat child_pid)
 if [ $(ps aux | grep -c [${pid:0:1}]${pid:1}) -ge 1 ]; then
    echo "$pid is launched"
 else
    echo "$pid isn't launched"
 fi
 ;;

 "STOP" )
 pid=$(cat child_pid)
 kill $pid
 ;;
 
 esac
 