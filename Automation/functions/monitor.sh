#!/usr/bin/bash
#Author: Bhavana_System

THRESHOLD_CPU=80
THRESHOLD_MEMORY=85
THRESHOLD_DISK=80


cpu_check() {
    cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
    cpu_used=$(printf "%0.f" "$cpu_usage")
    if [ "$cpu_used" -ge "$THRESHOLD_CPU" ]
    then
    echo "CPU usage is CRITICAL...."
    return 2
    elif (( $cpu_used < $THRESHOLD_CPU )) && (( $cpu_used > 60 ))
    then
    echo "Warning!! Cpu usage is high..."
    return 1
    else
    echo "CPU usage is Normal..."
    return 0
    fi
}
cpu_check
status_cpu=$?
if [ "$status_cpu" -eq 0 ]
then
status1=OK
elif [ "$status_cpu" -eq 1 ]
then
status1=WARN
else
status1=CRITICAL
fi

memory_check() {
    memory_usage=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100}')
    memory_used=${memory_usage%.*}

    if [ "$memory_used" -ge "$THRESHOLD_MEMORY" ]
    then
    echo "Memory usage is CRITICAL...."
    return 2
    elif (( "$memory_used < $THRESHOLD_MEMORY" )) && (( "$memory_used" > 60 ))
    then
    echo "Warning!! Memory usage is high..."
    return 1
    else
    echo "Memory usage is Normal..."
    return 0
    fi
}

memory_check
status_memory=$?
if [ "$status_memory" -eq 0 ]
then
status2=OK
elif [ "$status_memory" -eq 1 ]
then
status2=WARN
else
status2=CRITICAL
fi







disk_check() {
    disk_used=$(df -h / | awk 'NR==2 {gsub("%",""); print $5}')

    if [ "$disk_used" -ge "$THRESHOLD_DISK" ]
    then
    echo "disk usage is CRITICAL...."
    return 2
    elif (( "$disk_used < $THRESHOLD_DISK" )) && (( "$disk_used > 60" ))
    then
    echo "Warning!! disk usage is high..."
    return 1
    else
    echo "disk usage is Normal..."
    return 0
    fi
}
disk_check
status_disk=$?
if [ "$status_disk" -eq 0 ]
then
status3=OK
elif [ "$status_disk" -eq 1 ]
then
status3=WARN
else
status3=CRITICAL
fi



if [ "$status_cpu" -eq 2 -o "$status_memory" -eq 2 -o "$status_disk" -eq 2 ]
then
final=CRITICAL
elif [ "$status_cpu" -eq 1 -o "$status_memory" -eq 1 -o "$status_disk" -eq 1 ]
then
final=WARN
else
final=OK
fi
