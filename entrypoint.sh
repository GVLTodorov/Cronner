#!/bin/sh

echo "Starting ..."

cron -f -l 8 -d 8 -L /dev/stdout
