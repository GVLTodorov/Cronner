#!/bin/sh

echo "Starting ..."

crond -f -l 8 -d 8 -L /dev/stdout
