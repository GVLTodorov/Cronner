#!/bin/sh
echo "Create Directories..."
mkdir -p /etc/periodic/1min
mkdir -p /etc/periodic/15min
mkdir -p /etc/periodic/30min
mkdir -p /etc/periodic/hourly
mkdir -p /etc/periodic/12hour
mkdir -p /etc/periodic/daily
mkdir -p /etc/periodic/weekly
mkdir -p /etc/periodic/monthly
echo "End..."

echo "Starting ..."
cron -f -l 8
