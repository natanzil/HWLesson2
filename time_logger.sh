#!/bin/bash

LOG_FILE="$HOME/time_logger.log"
STOP_FLAG="$HOME/stop.flag"

touch "$LOG_FILE"
chmod 664 "$LOG_FILE"

echo "Time Logger started. Writing to $LOG_FILE every 10 seconds..."

while true; do
    if [ -f "$STOP_FLAG" ]; then
        echo "Stop flag detected. Exiting Time Logger."
        exit 0
    fi

    CURRENT_TIME=$(date +"%H:%M:%S")
    echo "$CURRENT_TIME" >> "$LOG_FILE"
    sleep 10
done