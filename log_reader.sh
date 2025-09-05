#!/bin/bash

LOG_FILE="$HOME/time_logger.log"
STOP_FLAG="./stop.flag"

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found: $LOG_FILE"
    exit 1
fi

echo "Log Reader started. Reading from $LOG_FILE every 7 seconds..."

while true; do
    if [ -f "$STOP_FLAG" ]; then
        echo "Stop flag detected. Exiting Log Reader."
        exit 0
    fi

    LAST_LINE=$(tail -n 1 "$LOG_FILE")
    echo "Last log entry: $LAST_LINE"
    sleep 7
done