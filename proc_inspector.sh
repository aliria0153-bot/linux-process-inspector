#!/usr/bin/env bash

#! proc_inspector.sh
# Inspector process state, file, descriptors, and basic rescource signals.


PID="$1"

if [[ -z "$PID" ]]; then
	echo "Usage: $0 <PID>"
	exit 1
fi

if [[ ! -d "/proc/$PID" ]]; then
	echo "Process $PID does not exist."
	exit 1

fi
echo "Inspecting PID: $PID"

STATE=$(ps -o state= -p "$PID")

case "$STATE" in
	R) 
		HUMAN_STATE="Running"
		;;

	S) 
		HUMAN_STATE="Sleeping"
		;;

	D)
		HUMAN_STATE="Uniterrupitable Sleep (I/O wait)"
		;;

	Z) HUMAN_STATE="Zombie"
		;;

	*) HUMAN_STATE="Unknown"
		;;

esac

echo "State: $HUMAN_STATE ($STATE)"

FD_COUNT=$(ls /proc/$PID/fd 2>/dev/null | wc -l)

echo "Open File Descriptors: $FD_COUNT"

LIMIT=$(ulimit -n)
THRESHOLD=$((LIMIT * 80 / 100))

echo "FD Limit: $LIMIT"

if [[ "FD_COUNT" -gt "$THRESHOLD" ]]; then
	echo "WARNING: File Descriptor usage above 80% of limit!"
fi
