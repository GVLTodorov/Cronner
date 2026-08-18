#!/bin/sh
/entrypoint.sh
cron
tail -f /var/log/cron.log
