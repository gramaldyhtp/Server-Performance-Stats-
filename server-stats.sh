#!/bin/bash

echo "==== Server Performance Stats ===="
echo

# CPU usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "Digunakan:", 100 - $8, "%"}'
echo

# Memory usage
echo "Memory Usage:"
free -m | awk '/Mem:/ {
    total=$2
    used=$3
    free=$4
    percent=used*100/total
    printf("Total: %d MB\nDigunakan: %d MB\nTersedia: %d MB\nPersentase: %.2f%%\n", total, used, free, percent)
}'
echo

# Disk usage
echo "Disk Usage:"
df -h / | awk 'NR==2 {
    printf("Total: %s\nDigunakan: %s\nTersedia: %s\nPersentase: %s\n", $2, $3, $4, $5)
}'
echo

# Top 5 CPU processes
echo "Top 5 Proses berdasarkan CPU:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo

# Top 5 Memory processes
echo "Top 5 Proses berdasarkan Memori:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo

echo "==== Selesai ===="

