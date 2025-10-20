#!/usr/bin/bash
#Author:Bhavana_System
#TASK_8
#cpu usage 
check_cpu() {
    local cpu_used=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 -$8}')
    echo "$cpu_used"
    if (( ${cpu_used%.*} > 90 ))
    then
    echo "Alert!!!CPU usage is high : $cpu_used"
     return 1
    else
    return 0
    fi
}

check_memory() {
    local memory_used=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100}')
    echo "$memory_used"
    if (( ${memory_used%.*} > 80 ))
    then
    echo "Alert!!! Memory Usage is high : $memory_used"
     return 1
    else
    return 0
    fi
}

check_disk() {
    local disk_used=$(df -h / | awk 'NR==2 {gsub("%",""); print $5}')
    echo "$disk_used"
    if (( $disk_used > 90 ))
    then 
    echo "Alert!!! Disk usage is high: $disk_used"
     return 1
    else
    return 0
    fi
}

check_cpu
if [ $? -eq 1 ]
then 
echo "Cpu check failed..Abort it"
exit 1
else
echo "Proceed to next function"
fi
check_memory
if [ $? -eq 1 ]
then 
echo "Memory check failed..Abort it"
exit 1
else
echo "Proceed to next function"
fi
check_disk
if [ $? -eq 1 ]
then 
echo "Disk Space check failed..Abort it"
exit 1
else
echo "Proceed to next function"
fi
echo "System Health Check Completed Successfully."
