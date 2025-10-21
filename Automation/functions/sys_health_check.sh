#!/usr/bin/bash
# Author: Bhavana_System
# TASK_8 - System Health Check

# ---------- CPU CHECK ----------
check_cpu() {
    cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
    cpu=$(printf "%.0f" "$cpu_usage")

    if [ -z "$cpu" ] || [ "$cpu" -lt 0 ] || [ "$cpu" -gt 100 ]; then
        echo "Unable to detect CPU correctly, setting default value 10%"
        cpu=10
    fi

    if [ "$cpu" -ge 90 ]; then
        echo "ALERT: CPU usage high (${cpu}%)"
        return 1
    else
        echo "CPU Usage Normal: ${cpu}%"
        return 0
    fi
}


# ---------- MEMORY CHECK ----------
check_memory() {
    local memory_used=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100}')
    local mem_int=${memory_used%.*}

    if (( mem_int > 80 )); then
        echo "ALERT: Memory usage high (${memory_used}%)"
        return 1
    else
        echo "Memory Usage Normal: ${memory_used}%"
        return 0
    fi
}


# ---------- DISK CHECK ----------
check_disk() {
    local disk_used=$(df -h / | awk 'NR==2 {gsub("%",""); print $5}')
    local disk_int=${disk_used%.*}

    if (( disk_int > 90 )); then
        echo "ALERT: Disk usage high (${disk_used}%)"
        return 1
    else
        echo "Disk Usage Normal: ${disk_used}%"
        return 0
    fi
}


# ---------- EXECUTION FLOW ----------
check_cpu
if [ $? -eq 1 ]; then
    echo "Cpu check failed..Abort it"
    exit 1
else
    echo "Proceed to next function"
fi

check_memory
if [ $? -eq 1 ]; then
    echo "Memory check failed..Abort it"
    exit 1
else
    echo "Proceed to next function"
fi

check_disk
if [ $? -eq 1 ]; then
    echo "Disk Space check failed..Abort it"
    exit 1
else
    echo "Proceed to next function"
fi

echo "System Health Check Completed Successfully."

