# ReverseEngPRD.md

# Project Documentation for Time Logger and Log Reader

## Overview

This project consists of two main Bash scripts: `time_logger.sh` and `log_reader.sh`, along with a flag file named `stop.flag`. The purpose of these scripts is to log the current time at regular intervals and to read the logged entries, respectively. The `stop.flag` file serves as a control mechanism to gracefully stop the execution of both scripts.

## Components

### 1. stop.flag

- **Purpose**: This is a flag file used to signal both the time logger and log reader scripts to stop their execution.
- **Functionality**: The presence of this file is checked by both scripts in their execution loops. If the file exists, the scripts will terminate.

### 2. time_logger.sh

- **Functionality**: This Bash script logs the current time to a log file every 10 seconds.
- **Log File**: The log file is created in the user's home directory and is named `time_logger.log`.
- **Execution Flow**:
  - The script starts by creating the log file and setting appropriate permissions.
  - It enters an infinite loop where it:
    - Checks for the existence of `stop.flag`.
    - If the flag is detected, it exits the loop and terminates.
    - If not, it logs the current time to the log file and sleeps for 10 seconds before repeating the process.

### 3. log_reader.sh

- **Functionality**: This Bash script reads the last entry from the `time_logger.log` file every 7 seconds.
- **Execution Flow**:
  - The script first checks if the log file exists. If it does not, it outputs an error message and exits.
  - It enters an infinite loop where it:
    - Checks for the existence of `stop.flag`.
    - If the flag is detected, it exits the loop and terminates.
    - If not, it reads the last log entry from the log file and displays it, then sleeps for 7 seconds before repeating the process.

## Usage

1. **Starting the Time Logger**: Run `time_logger.sh` to begin logging the current time.
2. **Reading the Log**: Run `log_reader.sh` to start reading the last logged time entry.
3. **Stopping the Scripts**: To stop both scripts, create an empty file named `stop.flag` in the same directory. Both scripts will check for this file and exit gracefully upon its detection.

## Conclusion

This project provides a simple yet effective way to log and read time entries using Bash scripts. The use of a flag file allows for controlled termination of the scripts, ensuring that resources are managed properly.