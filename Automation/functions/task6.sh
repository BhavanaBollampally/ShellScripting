#!/usr/bin/bash
# Author: Bhavana_System
# Purpose: Monitor CPU, Memory, and Disk usage, log results, and trigger alerts.

# ========== FUNCTIONS ========== #

system_cpu() {
    # Get CPU usage as a pure number
    local cpu_used=$(top -bn1 | awk '/%Cpu/ {print 100 - $8}')
    echo "$cpu_used"
}

system_memory() {
    # Get memory usage percentage
    local mem_used=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100}')
    echo "$mem_used"
}

system_disk() {
    # Get disk usage percentage (root partition)
    local disk_used=$(df -h / | awk 'NR==2 {gsub("%",""); print $5}')
    echo "$disk_used"
}

# ========== MAIN LOGIC ========== #

log_dir=~/Desktop/ShellScripting/Automation/functions
log_file="$log_dir/system_health.log"

mkdir -p "$log_dir"

cpu=$(system_cpu)
mem=$(system_memory)
disk=$(system_disk)

timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# Log all readings
{
    echo "$timestamp CPU Usage: ${cpu}%"
    echo "$timestamp Memory Usage: ${mem}%"
    echo "$timestamp Disk Usage: ${disk}%"
    echo "----------------------------------------"
} >> "$log_file"

# CPU Check
if (( $(echo "$cpu >= 90" | bc -l) )); then
    echo "ALERT!! CPU Usage is HIGH: ${cpu}%"
elif (( $(echo "$cpu >= 80" | bc -l) )); then
    echo "Warning! CPU Usage is ${cpu}%"
else
    echo "CPU Usage is Normal: ${cpu}%"
fi

# Memory Check
if (( $(echo "$mem >= 85" | bc -l) )); then
    echo "ALERT!! Memory Usage is HIGH: ${mem}%"
elif (( $(echo "$mem >= 75" | bc -l) )); then
    echo "Warning! Memory Usage is ${mem}%"
else
    echo "Memory Usage is Normal: ${mem}%"
fi

# Disk Check
if (( $(echo "$disk >= 80" | bc -l) )); then
    echo "ALERT!! Disk Usage is HIGH: ${disk}%"
elif (( $(echo "$disk >= 70" | bc -l) )); then
    echo "Warning! Disk Usage is ${disk}%"
else
    echo "Disk Usage is Normal: ${disk}%"
fi

