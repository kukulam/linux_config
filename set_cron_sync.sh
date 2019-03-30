#!/bin/bash

set -e

DIR_SHORT=$(dirname "$0")
DIR=$(readlink -f "$DIR_SHORT")

CRON_TASK_SCRIPT="$DIR/sync_conf.sh"
CRON_TASK_COMMAND="*/15 * * * * $CRON_TASK_SCRIPT"

chmod 755 $CRON_TASK_SCRIPT

CRONTAB=$(crontab -l)
CRON_TASK_COMMAND_LIST=$(echo $CRONTAB | grep "$CRON_TASK_SCRIPT" | wc -l)
if [[ $CRON_TASK_COMMAND_LIST < 1 ]] ; then
	(crontab -l ; echo "$CRON_TASK_COMMAND") | crontab -
else
	echo 'Crontask already existis !'
fi
